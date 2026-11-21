import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:crypto/crypto.dart';
import 'package:dpgsql/dpgsql.dart';
import 'audit_reader_value_hashes.dart' show digest, canonical;

// SQL ::text avoids lossy numeric driver conversions. No Access display Format
// is used here: timestamp components must still match the original DAO values.
String canonicalPostgresText(String? value, String accessType, String pgType) {
  if (value == null) return 'N';
  switch (accessType) {
    case 'Text':
    case 'Memo':
      return 'S$value';
    case 'Integer':
      return canonical(int.parse(value), 'Integer');
    case 'Double':
      if (pgType != 'double precision' ||
          !RegExp(r'^[0-9a-f]{16}$').hasMatch(value)) {
        throw StateError('IEEE64 audit requires float8send bytes');
      }
      return 'D$value';
    case 'OLE':
      if (pgType != 'bytea' || !RegExp(r'^(?:[0-9a-f]{2})*$').hasMatch(value)) {
        throw StateError('OLE audit requires exact bytea bytes');
      }
      return canonical([
        for (var i = 0; i < value.length; i += 2)
          int.parse(value.substring(i, i + 2), radix: 16)
      ], 'OLE');
    case 'Long':
      return 'I${BigInt.parse(value)}';
    case 'Boolean':
      if (value == 'true') return 'B1';
      if (value == 'false') return 'B0';
      throw StateError('Unexpected PostgreSQL boolean representation');
    case 'Money':
      final m = RegExp(r'^([+-]?)(\d+)(?:\.(\d+))?$').firstMatch(value);
      if (m == null) throw StateError('Currency is not an exact decimal');
      final fraction = m.group(3) ?? '';
      if (fraction.length > 4 &&
          fraction.substring(4).contains(RegExp('[1-9]'))) {
        throw StateError('Currency has nonzero digits beyond Access scale 4');
      }
      final scaled = BigInt.parse(m.group(2)!) * BigInt.from(10000) +
          BigInt.parse(('${fraction}0000').substring(0, 4));
      final sign = m.group(1) == '-' && scaled != BigInt.zero ? '-' : '';
      final magnitude = scaled.toString().padLeft(5, '0');
      return 'M$sign${magnitude.substring(0, magnitude.length - 4)}.${magnitude.substring(magnitude.length - 4)}';
    case 'DateTime':
      if (pgType == 'time without time zone' ||
          pgType == 'time with time zone') {
        // The original date component is gone. Do not invent an epoch/date.
        return 'T<missing-date>:$value';
      }
      if (pgType != 'date' && pgType != 'timestamp without time zone') {
        throw StateError(
            'Unsupported temporal storage type for civil comparison');
      }
      final m = RegExp(
              r'^(\d{4}-\d{2}-\d{2})(?:[ T](\d{2}:\d{2}:\d{2})(?:\.(\d{1,6}))?)?$')
          .firstMatch(value);
      if (m == null) {
        throw StateError('Temporal value has unsupported components');
      }
      // A date carries midnight only. Any nonzero source time still mismatches.
      return 'T${m.group(1)}T${m.group(2) ?? '00:00:00'}.${(m.group(3) ?? '').padRight(6, '0')}';
    default:
      throw StateError('Unsupported Access scalar type in value audit');
  }
}

String _primaryKey(Map table) => ((table['indexes'] as List)
        .cast<Map>()
        .firstWhere((i) => i['isPrimaryKey'] == true)['columns'] as List)
    .first['name'] as String;

Future<Map<String, Object?>> auditPostgresValueHashes({
  required DpgsqlConnection connection,
  required Map analysis,
  required Map oracle,
  required MigrationIdentifierPolicy identifiers,
  required String sourceSha256,
}) async {
  if (oracle['sourceSha256'] != sourceSha256 ||
      !['typed-column-pk-v1', 'typed-column-pk-v2']
          .contains(oracle['contract'])) {
    throw StateError('Value oracle source/contract mismatch');
  }
  await connection
      .createCommand("SET DateStyle = 'ISO, YMD'")
      .executeNonQuery();
  final tables = (analysis['tables'] as List).cast<Map>();
  final v2 = oracle['contract'] == 'typed-column-pk-v2';
  final expectedTables = (oracle['tables'] as List).cast<Map>();
  final physical = tables
      .where((t) => t['syntheticKind'] == null || t['syntheticKind'] == '')
      .toList();
  if (v2 &&
      (physical.length != expectedTables.length ||
          !physical.every(
              (t) => expectedTables.any((e) => e['table'] == t['name'])))) {
    throw StateError('V2 must cover every physical table');
  }
  final reports = <Map<String, Object?>>[];
  final payloads = <Map<String, Object?>>[];
  for (final expected in (oracle['tables'] as List).cast<Map>()) {
    final table = tables.singleWhere((t) => t['name'] == expected['table']);
    final cols = (expected['columns'] as List).cast<Map>();
    final schemaCols = (table['columns'] as List)
        .cast<Map>()
        .where((c) => !v2 || c['typeName'] != 'ComplexType')
        .toList();
    if (cols.length != schemaCols.length ||
        cols.map((c) => c['name']).toSet().length != cols.length ||
        !cols.every((c) => schemaCols.any(
            (s) => s['name'] == c['name'] && s['typeName'] == c['type']))) {
      throw StateError(
          'Value oracle must cover every column of audited tables');
    }
    final pk = _primaryKey(table);
    if (pk != expected['primaryKey']) {
      throw StateError('Oracle primary key differs');
    }
    final tableSql = identifiers.quotedTableName(table['name'] as String);
    final columnsSql = cols
        .map((c) => identifiers.quotedColumnName(c['name'] as String))
        .toList();
    final pgTypes = List<String>.filled(cols.length, 'unknown');
    var types = await connection.executeReader(
        'SELECT ${columnsSql.map((c) => 'pg_typeof($c)::text').join(',')} FROM $tableSql LIMIT 1');
    try {
      if (await types.read()) {
        for (var i = 0; i < cols.length; i++) {
          pgTypes[i] = types.getValue(i).toString();
        }
      }
    } finally {
      await types.close();
    }
    final buffers = List.generate(cols.length, (_) => StringBuffer());
    final nulls = List<int>.filled(cols.length, 0);
    final unsupported = List<int>.filled(cols.length, 0);
    final keyIndex = cols.indexWhere((c) => c['name'] == pk);
    final keyType = v2 ? cols[keyIndex]['type'] as String : 'Long';
    if (v2 && expected['primaryKeyType'] != keyType) {
      throw StateError('V2 oracle primary key type differs');
    }
    var count = 0;
    final keys = <String>{};
    final projections = [
      for (var i = 0; i < cols.length; i++)
        if (cols[i]['type'] == 'Double')
          "encode(float8send(${columnsSql[i]}), 'hex')"
        else if (cols[i]['type'] == 'OLE')
          "encode(${columnsSql[i]}, 'hex')"
        else
          '${columnsSql[i]}::text'
    ];
    final reader = await connection.executeReader(
        'SELECT ${projections.join(',')} FROM $tableSql AS audit_rows ORDER BY audit_rows.${identifiers.quotedColumnName(pk)}');
    try {
      while (await reader.read()) {
        final key = canonicalPostgresText(
            reader.getValue(keyIndex)?.toString(), keyType, pgTypes[keyIndex]);
        if (!keys.add(key)) throw StateError('Duplicate migrated primary key');
        for (var i = 0; i < cols.length; i++) {
          final raw = reader.getValue(i)?.toString();
          if (raw == null) nulls[i]++;
          String cell;
          try {
            cell = canonicalPostgresText(
                raw, cols[i]['type'] as String, pgTypes[i]);
          } on FormatException {
            unsupported[i]++;
            cell = '<unsupported-representation>';
          } on StateError {
            unsupported[i]++;
            cell = '<unsupported-representation>';
          }
          buffers[i].write('${key.length}:$key${cell.length}:$cell');
        }
        count++;
      }
    } finally {
      await reader.close();
    }
    final resultCols = <Map<String, Object?>>[];
    for (var i = 0; i < cols.length; i++) {
      final actual = digest(buffers[i].toString());
      resultCols.add({
        'name': cols[i]['name'],
        'type': cols[i]['type'],
        'postgresType': pgTypes[i],
        'sha256': actual,
        'daoSha256': cols[i]['sha256'],
        'nullCount': nulls[i],
        'daoNullCount': cols[i]['nullCount'],
        'unsupportedRepresentationCount': unsupported[i],
        'temporalComponentsMissing':
            cols[i]['type'] == 'DateTime' && pgTypes[i].startsWith('time '),
        'dateOnlyStorage':
            cols[i]['type'] == 'DateTime' && pgTypes[i] == 'date',
        'match': actual == cols[i]['sha256'] &&
            unsupported[i] == 0 &&
            cols[i]['submicrosecondCount'] == 0
      });
    }
    reports.add({
      'table': table['name'],
      'primaryKey': pk,
      'rows': count,
      'daoRows': expected['rows'],
      'columns': resultCols
    });
  }
  for (final table
      in tables.where((t) => !v2 && t['syntheticKind'] == 'attachment')) {
    final parent =
        tables.singleWhere((t) => t['name'] == table['attachmentParentTable']);
    final pk = _primaryKey(parent);
    final childCols = (table['columns'] as List).cast<Map>();
    final childIndexes = (table['indexes'] as List)
        .cast<Map>()
        .where((i) => i['isPrimaryKey'] == true)
        .toList();
    final orderColumn = childIndexes.isNotEmpty
        ? (childIndexes.first['columns'] as List).first['name'] as String
        : childCols.last['name'] as String;
    final q = identifiers.quotedColumnName;
    final sql =
        'SELECT p.${q(pk)}::text, encode(c.${q('FileData')}, \'hex\') FROM ${identifiers.quotedTableName(table['name'] as String)} c LEFT JOIN ${identifiers.quotedTableName(parent['name'] as String)} p ON c.${q(table['attachmentLinkColumn'] as String)}=p.${q(table['attachmentParentColumn'] as String)} ORDER BY p.${q(pk)}, c.${q(orderColumn)}';
    final reader = await connection.executeReader(sql);
    final ordinals = <String, int>{};
    try {
      while (await reader.read()) {
        final pkText = reader.getValue(0)?.toString();
        final key = pkText == null
            ? '<missing-parent>'
            : digest(canonicalPostgresText(pkText, 'Long', 'integer'));
        final ordinal = ordinals.update(key, (v) => v + 1, ifAbsent: () => 0);
        final hex = reader.getValue(1)?.toString();
        final bytes = hex == null
            ? null
            : List<int>.generate(hex.length ~/ 2,
                (i) => int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16));
        final hash = bytes == null ? null : sha256.convert(bytes).toString();
        final matches = (oracle['attachments'] as List)
            .cast<Map>()
            .where((a) =>
                a['table'] == table['name'] &&
                a['parentKeyHash'] == key &&
                a['ordinal'] == ordinal)
            .toList();
        payloads.add({
          'table': table['name'],
          'parentKeyHash': key,
          'ordinal': ordinal,
          'length': bytes?.length,
          'sha256': hash,
          'daoLength': matches.isEmpty ? null : matches.single['length'],
          'daoSha256': matches.isEmpty ? null : matches.single['sha256'],
          'match': matches.length == 1 && hash == matches.single['sha256']
        });
      }
    } finally {
      await reader.close();
    }
  }
  final scalarMatch = reports.isNotEmpty &&
      reports.every((t) =>
          t['rows'] == t['daoRows'] &&
          (t['columns'] as List).every((c) => c['match'] == true));
  final payloadMatch =
      payloads.length == (oracle['attachments'] as List).length &&
          payloads.every((p) => p['match'] == true);
  return {
    'scope': v2
        ? 'all_physical_scalar_columns_excluding_complex'
        : 'dao_postgres_full_values_for_oracle_tables_and_attachments',
    'attachmentsAudited': !v2,
    'contract': oracle['contract'],
    'sourceSha256': sourceSha256,
    'sqlRepresentation':
        'PostgreSQL ::text with ISO DateStyle; no Access display Format; no timezone conversion; exact decimal scale4',
    'tables': reports,
    'attachments': payloads,
    'allScalarColumnsMatch': scalarMatch,
    'allAttachmentPayloadsMatch': payloadMatch,
    'allValuesMatch': scalarMatch && payloadMatch
  };
}

Future<void> main(List<String> args) async {
  if (args.length != 4) {
    throw ArgumentError(
        'analysis.json dao-value-oracle.json database output.json');
  }
  final env = Platform.environment;
  final user = env['ACCESS_TO_DART_TEST_PG_USER'];
  final password = env['ACCESS_TO_DART_TEST_PG_PASSWORD'];
  if (user == null || password == null) {
    throw StateError('Session PG credentials required');
  }
  final analysis = jsonDecode(await File(args[0]).readAsString()) as Map;
  final oracle = jsonDecode(await File(args[1]).readAsString()) as Map;
  final source =
      (analysis['backend_analysis'] as Map?)?['source'] ?? analysis['source'];
  final sourceHash =
      (await sha256.bind(File(source as String).openRead()).first).toString();
  final pg = DpgsqlConnection(
      'Host=${env['ACCESS_TO_DART_TEST_PG_HOST'] ?? 'localhost'};Port=${env['ACCESS_TO_DART_TEST_PG_PORT'] ?? '5432'};Database=${args[2]};Username=$user;Password=$password;SSL Mode=Disable');
  await pg.open();
  try {
    final result = await auditPostgresValueHashes(
        connection: pg,
        analysis: analysis,
        oracle: oracle,
        identifiers: const MigrationIdentifierPolicy(
            style: MigrationIdentifierStyle.snakeAscii),
        sourceSha256: sourceHash);
    await File(args[3])
        .writeAsString(const JsonEncoder.withIndent('  ').convert(result));
    stdout.writeln('PG_VALUE_HASHES_MATCH=${result['allValuesMatch']}');
    exitCode = result['allValuesMatch'] == true ? 0 : 1;
  } finally {
    await pg.close();
  }
}
