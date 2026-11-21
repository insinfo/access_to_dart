import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:access_to_dart/src/complex_collection_rows.dart';

Object? sorted(Object? value) {
  if (value is Map) {
    final keys = value.keys.cast<String>().toList()..sort();
    return {for (final key in keys) key: sorted(value[key])};
  }
  if (value is List) return value.map(sorted).toList();
  return value;
}

Future<void> main(List<String> args) async {
  if (args.length != 3) {
    throw ArgumentError(
        'analysis.json dao-count-oracle.json migration-directory');
  }
  final analysis = jsonDecode(await File(args[0]).readAsString()) as Map;
  final oracle = jsonDecode(await File(args[1]).readAsString()) as Map;
  final source =
      (analysis['backend_analysis'] as Map?)?['source'] ?? analysis['source'];
  Future<String> sourceHash() async =>
      (await sha256.bind(File(source as String).openRead()).first).toString();
  final hash = await sourceHash();
  if (hash != (oracle['source'] as Map)['sha256']) {
    throw StateError('Source hash mismatch');
  }
  final db = await AccessDatabase.openPath(source as String,
      password: Platform.environment['ACCESS_TO_DART_TEST_ACCESS_PASSWORD']);
  final expected = <String, List<Map<String, dynamic>>>{};
  try {
    final tables = (analysis['tables'] as List).cast<Map>();
    final reader = TableReader(format: db.format, pageChannel: db.pageChannel);
    for (final child
        in tables.where((t) => t['syntheticKind'] == 'multivalue')) {
      final parent =
          tables.singleWhere((t) => t['name'] == child['complexParentTable']);
      final parents = await reader.readAllRows(parent['tdefPage'] as int);
      final raw = await reader.readAllRows(child['tdefPage'] as int);
      final schema = await reader.readSchema(
          child['name'] as String, child['tdefPage'] as int);
      final materialized = raw
          .map((row) => <String, dynamic>{
                for (final column in schema.columns)
                  column.name: row[column.name]
              })
          .toList();
      final partition = partitionComplexCollectionRows(
          parentRows: parents,
          childRows: materialized,
          parentColumn: child['complexParentColumn'] as String,
          linkColumn: child['complexLinkColumn'] as String);
      if (partition.orphanRows.isNotEmpty) {
        expected[child['name'] as String] = partition.orphanRows;
      }
    }
  } finally {
    await db.close();
  }
  final manifest = jsonDecode(
      await File('${args[2]}/migration_manifest.json').readAsString()) as Map;
  final count = expected.values.fold<int>(0, (n, rows) => n + rows.length);
  if (manifest['quarantinedRowCount'] != count) {
    throw StateError('Quarantine count mismatch');
  }
  if (count > 0) {
    if (manifest['fullDataIncluded'] != false ||
        manifest['logicalDataIncluded'] != true) {
      throw StateError('Quarantine not disclosed in manifest');
    }
    final preserved = jsonDecode(
            await File('${args[2]}/orphaned_complex_rows.json').readAsString())
        as Map;
    if (jsonEncode(sorted(preserved['tables'])) != jsonEncode(sorted(expected))) {
      throw StateError('Quarantined storage changed');
    }
  }
  if (await sourceHash() != hash) {
    throw StateError('Source changed during audit');
  }
  final report = {
    'sourceSha256': hash,
    'quarantinedRows': count,
    'allRowsPreserved': true,
    'canonicalRowsSha256':
        sha256.convert(utf8.encode(jsonEncode(sorted(expected)))).toString()
  };
  await File('${args[2]}/quarantine-integrity-audit.json')
      .writeAsString(jsonEncode(report));
  stdout.writeln(
      'Quarantined physical rows preserved exactly: $count; source unchanged.');
}
