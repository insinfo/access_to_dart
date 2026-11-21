import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';

Future<Map<String, Object?>> auditPostgresComplexValues({
  required DpgsqlConnection connection,
  required Map analysis,
  required Map oracle,
  required MigrationIdentifierPolicy identifiers,
  required String sourceSha256,
}) async {
  if (oracle['sourceSha256'] != sourceSha256) {
    throw StateError('Complex oracle source hash mismatch');
  }
  final tables = (analysis['tables'] as List).cast<Map>();
  final collections =
      tables.where((t) => t['syntheticKind'] == 'multivalue').toList();
  final expected = (oracle['columns'] as List)
      .cast<Map>()
      .where((c) => c['valueSha256'] is String)
      .toList();
  if (collections.length != expected.length || collections.isEmpty) {
    throw StateError('Complex oracle must cover every text collection');
  }
  final reports = <Map<String, Object?>>[];
  for (final child in collections) {
    final source = expected.singleWhere((c) =>
        c['table'] == child['complexParentTable'] &&
        c['column'] == child['complexParentColumn']);
    if (source['valueContract'] != 'sorted-parent-pk-text-v1') {
      throw StateError('Unsupported complex oracle contract');
    }
    final parent =
        tables.singleWhere((t) => t['name'] == child['complexParentTable']);
    final primaryKeys = (parent['indexes'] as List)
        .cast<Map>()
        .where((i) => i['isPrimaryKey'] == true)
        .toList();
    if (primaryKeys.length != 1 ||
        (primaryKeys.single['columns'] as List).length != 1 ||
        (primaryKeys.single['columns'] as List).single['name'] !=
            source['primaryKey']) {
      throw StateError('Complex oracle parent primary key mismatch');
    }
    final q = identifiers.quotedColumnName;
    final query =
        'SELECT p.${q(source['primaryKey'] as String)}::text, c.${q(child['complexValueColumn'] as String)}::text '
        'FROM ${identifiers.quotedTableName(child['name'] as String)} c '
        'LEFT JOIN ${identifiers.quotedTableName(parent['name'] as String)} p '
        'ON c.${q(child['complexLinkColumn'] as String)}=p.${q(child['complexParentColumn'] as String)}';
    final reader = await connection.executeReader(query);
    final records = <String>[];
    var orphans = 0;
    try {
      while (await reader.read()) {
        final owner = reader.getValue(0);
        if (owner == null) {
          orphans++;
          continue;
        }
        final key = 'I${int.parse(owner.toString())}';
        final value = reader.getValue(1);
        final canonical = value == null ? 'N' : 'S$value';
        records.add('${key.length}:$key${canonical.length}:$canonical');
      }
    } finally {
      await reader.close();
    }
    records.sort();
    final hash = sha256.convert(utf8.encode(records.join())).toString();
    reports.add({
      'table': child['name'],
      'logicalRows': records.length,
      'daoRows': source['childRows'],
      'orphanRows': orphans,
      'sha256': hash,
      'daoSha256': source['valueSha256'],
      'match': orphans == 0 &&
          records.length == source['childRows'] &&
          hash == source['valueSha256'],
    });
  }
  return {
    'scope': 'all_analyzed_text_collections_dao_postgres_values',
    'contract': 'sorted-parent-pk-text-v1',
    'sourceSha256': sourceSha256,
    'collections': reports,
    'allValuesMatch': reports.every((r) => r['match'] == true)
  };
}
