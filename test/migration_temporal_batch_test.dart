import 'dart:collection';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:access_to_dart/src/migration_statement_builder.dart';
import 'package:test/test.dart';

class _ObservedRow extends MapBase<String, dynamic> {
  final Map<String, dynamic> data;
  int entryScans = 0;
  _ObservedRow(this.data);
  @override
  Iterable<MapEntry<String, dynamic>> get entries {
    entryScans++;
    return data.entries;
  }

  @override
  dynamic operator [](Object? key) => data[key];
  @override
  void operator []=(String key, dynamic value) => data[key] = value;
  @override
  Iterable<String> get keys => data.keys;
  @override
  dynamic remove(Object? key) => data.remove(key);
  @override
  void clear() => data.clear();
}

void main() {
  final table = AnalysisTable.fromJson({
    'name': 'Events',
    'columns': [
      {'name': 'EventDate', 'typeName': 'DateTime'}
    ],
  });
  test('insert temporal storage does not rescan rows per cell',
      () {
    final rows = List.generate(
        100, (_) => _ObservedRow({'EventDate': DateTime.utc(2026, 11, 21)}));
    final statements = MigrationStatementBuilder(
            identifierPolicy: const MigrationIdentifierPolicy(
                style: MigrationIdentifierStyle.snakeAscii))
        .buildInsertStatements(table, rows)
        .toList();
    expect(statements, hasLength(100));
    expect(statements.every((s) => s.contains("'2026-11-21T00:00:00.000Z'")), isTrue);
    // Bounds observations, not wall-clock time: quadratic rescanning fails.
    expect(rows.fold<int>(0, (n, row) => n + row.entryScans),
        lessThanOrEqualTo(300));
  });
  test('all batches and COPY preserve complete timestamps', () {
    final builder = MigrationStatementBuilder(
        identifierPolicy: const MigrationIdentifierPolicy(
            style: MigrationIdentifierStyle.snakeAscii));
    final rows = <Map<String, dynamic>>[
      {'EventDate': DateTime.utc(2026, 11, 21)}
    ];
    expect(builder.buildInsertStatements(table, rows).single,
        contains("'2026-11-21T00:00:00.000Z'"));
    rows.add({'EventDate': DateTime.utc(2026, 11, 21, 13, 45)});
    final inserts = builder.buildInsertStatements(table, rows).join('\n');
    expect(inserts, contains('2026-11-21T00:00:00.000Z'));
    expect(inserts, contains('2026-11-21T13:45:00.000Z'));
    final copy =
        builder.buildSeedStatementsInPreferredFormat(table, rows).join('\n');
    expect(copy, contains('2026-11-21T00:00:00.000Z'));
    expect(copy, contains('2026-11-21T13:45:00.000Z'));
  });
}
