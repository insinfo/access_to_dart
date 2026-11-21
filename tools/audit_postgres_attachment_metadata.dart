import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';
import 'package:crypto/crypto.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'attachment_metadata_contract.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('analysis', mandatory: true)
    ..addOption('oracle', mandatory: true)
    ..addOption('database', mandatory: true)
    ..addOption('output', mandatory: true)
    ..addOption('host',
        defaultsTo:
            Platform.environment['ACCESS_TO_DART_TEST_PG_HOST'] ?? 'localhost')
    ..addOption('port',
        defaultsTo:
            Platform.environment['ACCESS_TO_DART_TEST_PG_PORT'] ?? '5432')
    ..addOption('identifier-style', defaultsTo: 'snake_ascii');
  try {
    final args = parser.parse(arguments);
    final analysis =
        jsonDecode(await File(args['analysis'] as String).readAsString())
            as Map;
    final oracle =
        jsonDecode(await File(args['oracle'] as String).readAsString()) as Map;
    if (oracle['contract'] != 'attachment-metadata-parent-v1' ||
        oracle['sourceUnchanged'] != true ||
        oracle['readOnly'] != true) {
      throw StateError('Invalid metadata oracle');
    }
    final tables = (analysis['tables'] as List).cast<Map>();
    final specs =
        tables.where((t) => t['syntheticKind'] == 'attachment').toList();
    final expectedCollections = (oracle['collections'] as List).cast<Map>();
    if (specs.length != expectedCollections.length) {
      throw StateError('Attachment inventory mismatch');
    }
    final ids = MigrationIdentifierPolicy(
        style:
            MigrationIdentifierStyle.parse(args['identifier-style'] as String));
    String column(String name) => ids.quotedColumnName(name);
    final user =
        Platform.environment['ACCESS_TO_DART_TEST_PG_USER'] ?? 'postgres';
    final password =
        Platform.environment['ACCESS_TO_DART_TEST_PG_PASSWORD'] ?? '';
    final connection = DpgsqlConnection(
        'Host=${args['host']};Port=${args['port']};Database=${args['database']};Username=$user;Password=$password;SSL Mode=Disable');
    await connection.open();
    final reports = <Map<String, Object?>>[];
    var allMatch = true;
    var total = 0;
    try {
      final transaction = await connection.beginTransaction();
      try {
        await connection
            .createCommand('SET TRANSACTION READ ONLY')
            .executeNonQuery();
        for (final spec in specs) {
          final parent = tables
              .singleWhere((t) => t['name'] == spec['attachmentParentTable']);
          final expected = expectedCollections.singleWhere((c) =>
              c['table'] == parent['name'] &&
              c['column'] == spec['attachmentParentColumn']);
          final pk = expected['primaryKey'] as String;
          const fields = [
            'FileName',
            'FileType',
            'FileTimeStamp',
            'FileFlags',
            'FileURL'
          ];
          final metadata = (expected['childSchema'] as List).cast<Map>();
          final selected = [
            for (var i = 0; i < fields.length; i++)
              'c.${column(fields[i])} AS m$i'
          ].join(',');
          final sql =
              'SELECT p.${column(pk)} AS parent_key,c.${column('FileData')} AS payload,$selected FROM ${ids.quotedTableName(spec['name'] as String)} c LEFT JOIN ${ids.quotedTableName(parent['name'] as String)} p ON c.${column(spec['attachmentLinkColumn'] as String)}=p.${column(spec['attachmentParentColumn'] as String)}';
          final actual = <Map<String, dynamic>>[];
          final reader = await connection.executeReader(sql);
          try {
            while (await reader.read()) {
              final key = reader.getValue(0);
              if (key == null) throw StateError('Orphan PostgreSQL attachment');
              final parentHash =
                  digest(canonical(key, expected['parentDaoType'] as int));
              final association = digest(
                  '${encoded(parent['name'] as String)}\n${encoded(spec['attachmentParentColumn'] as String)}\n$parentHash');
              final payload = reader.getValue(1);
              if (payload is! List<int>) {
                throw StateError('PostgreSQL attachment payload is not bytea');
              }
              final payloadHash = sha256.convert(payload).toString();
              final cells = <Map<String, Object?>>[];
              for (var i = 0; i < fields.length; i++) {
                final field =
                    metadata.singleWhere((f) => f['name'] == fields[i]);
                final text =
                    canonical(reader.getValue(i + 2), field['daoType'] as int);
                cells.add({
                  'name': fields[i],
                  'daoType': field['daoType'],
                  'isNull': text == 'N',
                  'valueSha256': digest(text)
                });
              }
              actual.add({
                'associationSha256': association,
                'payloadSha256': payloadHash,
                'payloadLength': payload.length,
                'metadata': cells,
                'recordSha256': digest(
                    '$association\n$payloadHash\n${cells.map((c) => c['valueSha256']).join('\n')}')
              });
            }
          } finally {
            await reader.close();
          }
          final countReader = await connection.executeReader(
              'SELECT COUNT(*) FROM ${ids.quotedTableName(parent['name'] as String)}');
          late Object? parentCount;
          try {
            if (!await countReader.read()) {
              throw StateError('Missing parent count');
            }
            parentCount = countReader.getValue(0);
          } finally {
            await countReader.close();
          }
          final expectedRows = (expected['records'] as List).cast<Map>();
          final associationMatch = multiset(actual.map((r) =>
                  '${r['associationSha256']}:${r['payloadSha256']}:${r['payloadLength']}')) ==
              multiset(expectedRows.map((r) =>
                  '${r['associationSha256']}:${r['payloadSha256']}:${r['payloadLength']}'));
          final fieldReports = <Map<String, Object?>>[];
          for (final name in fields) {
            String fieldRecord(Map row) {
              final cell = (row['metadata'] as List)
                  .cast<Map>()
                  .singleWhere((c) => c['name'] == name);
              return '${row['associationSha256']}:${row['payloadSha256']}:${cell['valueSha256']}';
            }

            fieldReports.add({
              'name': name,
              'match': multiset(actual.map(fieldRecord)) ==
                  multiset(expectedRows.map(fieldRecord)),
              'nullCount': actual
                  .where((r) =>
                      (r['metadata'] as List)
                          .cast<Map>()
                          .singleWhere((c) => c['name'] == name)['isNull'] ==
                      true)
                  .length,
              'daoNullCount': expectedRows
                  .where((r) =>
                      (r['metadata'] as List)
                          .cast<Map>()
                          .singleWhere((c) => c['name'] == name)['isNull'] ==
                      true)
                  .length
            });
          }
          final recordMatch = multiset(
                  actual.map((r) => r['recordSha256'] as String)) ==
              multiset(expectedRows.map((r) => r['recordSha256'] as String));
          final match = fieldReports.every((f) =>
                  f['match'] == true && f['nullCount'] == f['daoNullCount']) &&
              associationMatch &&
              recordMatch &&
              parentCount == expected['parentRows'] &&
              actual.length == expectedRows.length;
          allMatch = allMatch && match;
          total += actual.length;
          reports.add({
            'table': parent['name'],
            'column': spec['attachmentParentColumn'],
            'rows': actual.length,
            'daoRows': expectedRows.length,
            'parentRows': parentCount,
            'daoParentRows': expected['parentRows'],
            'associationAndPayloadMatch': associationMatch,
            'recordMultisetMatch': recordMatch,
            'fields': fieldReports,
            'match': match,
            'hiddenChildIdsCompared': false
          });
        }
      } finally {
        await transaction.rollback();
      }
    } finally {
      await connection.close();
    }
    final output = File(args['output'] as String);
    await output.parent.create(recursive: true);
    await output.writeAsString(const JsonEncoder.withIndent('  ').convert({
      'contract': 'attachment-metadata-parent-v1',
      'sourceSha256': oracle['sourceSha256'],
      'transactionReadOnly': true,
      'attachmentRecords': total,
      'allMatch': allMatch,
      'collections': reports
    }));
    stdout.writeln(
        'POSTGRES_ATTACHMENT_METADATA_RECORDS=$total COLLECTIONS=${reports.length} ALL_MATCH=$allMatch TRANSACTION_READ_ONLY=true');
    if (!allMatch) exitCode = 1;
  } catch (error) {
    stderr.writeln(
        'PostgreSQL attachment metadata audit failed: ${error.runtimeType}');
    exitCode = 65;
  }
}
