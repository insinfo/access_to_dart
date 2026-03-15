import 'package:access_to_dart/src/access_src_model.dart';
import 'package:access_to_dart/src/query_reconciliation/query_reconciliation.dart';
import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';

void main() {
  test('canoniza agregacoes em select group by e having', () {
    final builder = QueryReconciliationBuilder();

    final binaryQueries = <AccessQueryDef>[
      const AccessQueryDef(
        name: 'Q_Agregada',
        objectId: 1,
        sqlText:
            'SELECT Max(([T].[VAL])) TOTAL, [T].[CAT], [T].[TIPO] '
            'FROM [T] '
            'GROUP BY [T].[CAT], [T].[TIPO] '
            'HAVING ((Sum(([T].[VAL])) > 10) AND (Count(*) > 1))',
        queryType: 0,
        rows: <AccessQueryRow>[],
      ),
    ];

    final sourceQueries = <AccessSrcQuery>[
      const AccessSrcQuery(
        name: 'Q_Agregada',
        sql:
            'SELECT Max([T].[VAL]) AS TOTAL, [T].[CAT], [T].[TIPO] '
            'FROM [T] '
            'GROUP BY [T].[TIPO], [T].[CAT] '
            'HAVING (Count(*) > 1) And (Sum([T].[VAL]) > 10)',
        basText: null,
        semanticSql:
            'SELECT Max([T].[VAL]) AS TOTAL, [T].[CAT], [T].[TIPO] '
            'FROM [T] '
            'GROUP BY [T].[TIPO], [T].[CAT] '
            'HAVING (Count(*) > 1) And (Sum([T].[VAL]) > 10)',
      ),
    ];

    final reconciliation = builder.build(binaryQueries, sourceQueries);
    final summary = reconciliation['summary'] as Map<String, Object?>;
    final entries = reconciliation['entries'] as List<Object?>;
    final firstEntry = entries.single as Map<String, Object?>;

    expect(summary['matchedNormalized'], 0);
    expect(summary['matchedRelaxed'], 1);
    expect(summary['mismatched'], 0);
    expect(firstEntry['status'], 'matched_relaxed');
  });

  test('mantem mismatch quando select agregado muda semanticamente', () {
    final builder = QueryReconciliationBuilder();

    final binaryQueries = <AccessQueryDef>[
      const AccessQueryDef(
        name: 'Q_Total',
        objectId: 2,
        sqlText:
            'SELECT Sum([T].[VAL]) AS TOTAL, [T].[CAT] '
            'FROM [T] '
            'GROUP BY [T].[CAT]',
        queryType: 0,
        rows: <AccessQueryRow>[],
      ),
    ];

    final sourceQueries = <AccessSrcQuery>[
      const AccessSrcQuery(
        name: 'Q_Total',
        sql:
            'SELECT Max([T].[VAL]) AS TOTAL, [T].[CAT] '
            'FROM [T] '
            'GROUP BY [T].[CAT]',
        basText: null,
        semanticSql:
            'SELECT Max([T].[VAL]) AS TOTAL, [T].[CAT] '
            'FROM [T] '
            'GROUP BY [T].[CAT]',
      ),
    ];

    final reconciliation = builder.build(binaryQueries, sourceQueries);
    final summary = reconciliation['summary'] as Map<String, Object?>;
    final entries = reconciliation['entries'] as List<Object?>;
    final firstEntry = entries.single as Map<String, Object?>;

    expect(summary['matchedRelaxed'], 0);
    expect(summary['matchedStructural'], 0);
    expect(summary['mismatched'], 1);
    expect(firstEntry['status'], 'mismatch');
  });

  test('canoniza where com between in is null e like escape', () {
    final builder = QueryReconciliationBuilder();

    final binaryQueries = <AccessQueryDef>[
      const AccessQueryDef(
        name: 'Q_Filtros',
        objectId: 3,
        sqlText:
            'SELECT [T].[ID] '
            'FROM [T] '
            'WHERE ([T].[IDADE] BETWEEN 18 AND 60) '
            'AND ([T].[CODIGO] IN (3, 1, 2)) '
            'AND ([T].[EXCLUSAO] IS NULL) '
            'AND ([T].[NOME] LIKE "A#_%" ESCAPE "#")',
        queryType: 0,
        rows: <AccessQueryRow>[],
      ),
    ];

    final sourceQueries = <AccessSrcQuery>[
      const AccessSrcQuery(
        name: 'Q_Filtros',
        sql:
            'SELECT [T].[ID] '
            'FROM [T] '
            'WHERE ([T].[NOME] LIKE "A#_%" ESCAPE "#") '
            'AND ([T].[EXCLUSAO] IS NULL) '
            'AND ([T].[CODIGO] IN (2, 3, 1)) '
            'AND ([T].[IDADE] BETWEEN 18 AND 60)',
        basText: null,
        semanticSql:
            'SELECT [T].[ID] '
            'FROM [T] '
            'WHERE ([T].[NOME] LIKE "A#_%" ESCAPE "#") '
            'AND ([T].[EXCLUSAO] IS NULL) '
            'AND ([T].[CODIGO] IN (2, 3, 1)) '
            'AND ([T].[IDADE] BETWEEN 18 AND 60)',
      ),
    ];

    final reconciliation = builder.build(binaryQueries, sourceQueries);
    final summary = reconciliation['summary'] as Map<String, Object?>;
    final entry = (reconciliation['entries'] as List<Object?>).single
        as Map<String, Object?>;

    expect(summary['matchedRelaxed'], 1);
    expect(summary['mismatched'], 0);
    expect(entry['status'], 'matched_relaxed');
  });
}