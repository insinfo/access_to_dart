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

  test('ignora terminador de instrucao ao normalizar SQL', () {
    final builder = QueryReconciliationBuilder();

    final binaryQueries = <AccessQueryDef>[
      const AccessQueryDef(
        name: 'Q_Semicolon',
        objectId: 4,
        sqlText:
            'SELECT [T].[ID] '
            'FROM [T] '
            'WHERE [T].[ATIVO] = Yes',
        queryType: 0,
        rows: <AccessQueryRow>[],
      ),
    ];

    final sourceQueries = <AccessSrcQuery>[
      const AccessSrcQuery(
        name: 'Q_Semicolon',
        sql:
            'SELECT [T].[ID] '
            'FROM [T] '
            'WHERE [T].[ATIVO] = Yes;',
        basText: null,
        semanticSql:
            'SELECT [T].[ID] '
            'FROM [T] '
            'WHERE [T].[ATIVO] = Yes;',
      ),
    ];

    final reconciliation = builder.build(binaryQueries, sourceQueries);
    final summary = reconciliation['summary'] as Map<String, Object?>;
    final entry = (reconciliation['entries'] as List<Object?>).single
        as Map<String, Object?>;

    expect(summary['matchedNormalized'], 1);
    expect(summary['mismatched'], 0);
    expect(entry['status'], 'matched_normalized');
  });

  test('reconhece join graph quando o source perde tabela no FROM mas a referencia em outras clausulas', () {
    final builder = QueryReconciliationBuilder();

    final binaryQueries = <AccessQueryDef>[
      const AccessQueryDef(
        name: 'Q_JoinGraphTruncado',
        objectId: 5,
        sqlText:
            'SELECT DISTINCT [CADRESIDENCIA].[CODFAM], [TBATEND].[VOLANTE], [TBUNIDADE].[NOME] '
            'FROM ([TBUNIDADE] INNER JOIN (([CADRESIDENCIA] INNER JOIN [TBPESSOA] ON CADRESIDENCIA.CODFAM = TBPESSOA.CODFAM) INNER JOIN [TBATEND] ON TBPESSOA.CODPESSOA = TBATEND.NOME) ON TBUNIDADE.CODUNIDADE = CADRESIDENCIA.[CRAS ORIGEM]) '
            'WHERE (((TBATEND.DATA) BETWEEN [DATA INICIAL] AND [DATA FINAL])) '
            'ORDER BY [TBUNIDADE].[NOME]',
        queryType: 0,
        rows: <AccessQueryRow>[],
      ),
    ];

    final sourceQueries = <AccessSrcQuery>[
      const AccessSrcQuery(
        name: 'Q_JoinGraphTruncado',
        sql:
            'SELECT CADRESIDENCIA.CODFAM, TBATEND.VOLANTE, TBUNIDADE.NOME '
            'FROM (TBUNIDADE INNER JOIN (CADRESIDENCIA INNER JOIN TBPESSOA ON CADRESIDENCIA.CODFAM = TBPESSOA.CODFAM) ON TBUNIDADE.CODUNIDADE = CADRESIDENCIA.[CRAS ORIGEM]) '
            'WHERE (((TBATEND.DATA) BETWEEN [DATA INICIAL] AND [DATA FINAL]))',
        basText: null,
        semanticSql:
            'SELECT CADRESIDENCIA.CODFAM, TBATEND.VOLANTE, TBUNIDADE.NOME '
            'FROM (TBUNIDADE INNER JOIN (CADRESIDENCIA INNER JOIN TBPESSOA ON CADRESIDENCIA.CODFAM = TBPESSOA.CODFAM) ON TBUNIDADE.CODUNIDADE = CADRESIDENCIA.[CRAS ORIGEM]) '
            'WHERE (((TBATEND.DATA) BETWEEN [DATA INICIAL] AND [DATA FINAL]))',
      ),
    ];

    final reconciliation = builder.build(binaryQueries, sourceQueries);
    final summary = reconciliation['summary'] as Map<String, Object?>;
    final entry = (reconciliation['entries'] as List<Object?>).single
        as Map<String, Object?>;

    expect(summary['matchedJoinGraph'], 1);
    expect(summary['mismatched'], 0);
    expect(entry['status'], 'matched_join_graph');
  });

  test('reconhece join implicito perdido no binario via tier estrutural', () {
    final builder = QueryReconciliationBuilder();

    final binaryQueries = <AccessQueryDef>[
      const AccessQueryDef(
        name: 'Q_JoinImplicito',
        objectId: 6,
        sqlText:
            'SELECT [TBPESSOA].[MUNICNASC], [TBPESSOA].[UFNASC], [CADRESIDENCIA].[VOLANTE] '
            'FROM [CADRESIDENCIA], [TBPESSOA] '
            'ORDER BY [TBPESSOA].[MUNICNASC]',
        queryType: 0,
        rows: <AccessQueryRow>[],
      ),
    ];

    final sourceQueries = <AccessSrcQuery>[
      const AccessSrcQuery(
        name: 'Q_JoinImplicito',
        sql:
            'SELECT TBPESSOA.MUNICNASC, TBPESSOA.UFNASC, CADRESIDENCIA.VOLANTE '
            'FROM (CADRESIDENCIA INNER JOIN TBPESSOA ON CADRESIDENCIA.CODFAM = TBPESSOA.CODFAM) '
            'ORDER BY TBPESSOA.MUNICNASC',
        basText: null,
        semanticSql:
            'SELECT TBPESSOA.MUNICNASC, TBPESSOA.UFNASC, CADRESIDENCIA.VOLANTE '
            'FROM (CADRESIDENCIA INNER JOIN TBPESSOA ON CADRESIDENCIA.CODFAM = TBPESSOA.CODFAM) '
            'ORDER BY TBPESSOA.MUNICNASC',
      ),
    ];

    final reconciliation = builder.build(binaryQueries, sourceQueries);
    final summary = reconciliation['summary'] as Map<String, Object?>;
    final entry = (reconciliation['entries'] as List<Object?>).single
        as Map<String, Object?>;

    expect(summary['matchedStructural'], 1);
    expect(summary['mismatched'], 0);
    expect(entry['status'], 'matched_structural');
  });

  test('trata select agrupado sem agregacao como conjunto quando so muda a ordem', () {
    final builder = QueryReconciliationBuilder();

    final binaryQueries = <AccessQueryDef>[
      const AccessQueryDef(
        name: 'Q_GroupByReordered',
        objectId: 7,
        sqlText:
            'SELECT [T].[B], [T].[A], [T].[C] '
            'FROM [T] '
            'GROUP BY [T].[A], [T].[B], [T].[C]',
        queryType: 0,
        rows: <AccessQueryRow>[],
      ),
    ];

    final sourceQueries = <AccessSrcQuery>[
      const AccessSrcQuery(
        name: 'Q_GroupByReordered',
        sql:
            'SELECT [T].[A], [T].[C], [T].[B] '
            'FROM [T] '
            'GROUP BY [T].[C], [T].[A], [T].[B]',
        basText: null,
        semanticSql:
            'SELECT [T].[A], [T].[C], [T].[B] '
            'FROM [T] '
            'GROUP BY [T].[C], [T].[A], [T].[B]',
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

  test('ignora wildcard standalone quando o restante da projecao coincide', () {
    final builder = QueryReconciliationBuilder();

    final binaryQueries = <AccessQueryDef>[
      const AccessQueryDef(
        name: 'Q_SelectStar',
        objectId: 8,
        sqlText:
            'SELECT *, [TBUNIDADE].[NOME], [TBPESSOA].[NOME] '
            'FROM [TBUNIDADE], [TBPESSOA] '
            'WHERE [TBUNIDADE].[CRAS] = YES',
        queryType: 0,
        rows: <AccessQueryRow>[],
      ),
    ];

    final sourceQueries = <AccessSrcQuery>[
      const AccessSrcQuery(
        name: 'Q_SelectStar',
        sql:
            'SELECT [TBUNIDADE].[NOME], [TBPESSOA].[NOME] '
            'FROM [TBUNIDADE], [TBPESSOA] '
            'WHERE [TBUNIDADE].[CRAS] = YES',
        basText: null,
        semanticSql:
            'SELECT [TBUNIDADE].[NOME], [TBPESSOA].[NOME] '
            'FROM [TBUNIDADE], [TBPESSOA] '
            'WHERE [TBUNIDADE].[CRAS] = YES',
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

  test('trata reordenacao de projecao simples como equivalente', () {
    final builder = QueryReconciliationBuilder();

    final binaryQueries = <AccessQueryDef>[
      const AccessQueryDef(
        name: 'Q_SelectReordered',
        objectId: 9,
        sqlText:
            'SELECT [T].[C], [T].[A], [T].[B] '
            'FROM [T] '
            'WHERE [T].[ATIVO] = Yes',
        queryType: 0,
        rows: <AccessQueryRow>[],
      ),
    ];

    final sourceQueries = <AccessSrcQuery>[
      const AccessSrcQuery(
        name: 'Q_SelectReordered',
        sql:
            'SELECT [T].[A], [T].[B], [T].[C] '
            'FROM [T] '
            'WHERE [T].[ATIVO] = Yes',
        basText: null,
        semanticSql:
            'SELECT [T].[A], [T].[B], [T].[C] '
            'FROM [T] '
            'WHERE [T].[ATIVO] = Yes',
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

  test('trata tabela wildcard como equivalente a wildcard puro', () {
    final builder = QueryReconciliationBuilder();

    final binaryQueries = <AccessQueryDef>[
      const AccessQueryDef(
        name: 'Q_TableWildcard',
        objectId: 10,
        sqlText: 'SELECT [TbAtend].* FROM [TbAtend] WHERE [TbAtend].[Ativo] = Yes',
        queryType: 0,
        rows: <AccessQueryRow>[],
      ),
    ];

    final sourceQueries = <AccessSrcQuery>[
      const AccessSrcQuery(
        name: 'Q_TableWildcard',
        sql: 'SELECT * FROM TbAtend WHERE TbAtend.Ativo = Yes',
        basText: null,
        semanticSql: 'SELECT * FROM TbAtend WHERE TbAtend.Ativo = Yes',
      ),
    ];

    final reconciliation = builder.build(binaryQueries, sourceQueries);
    final summary = reconciliation['summary'] as Map<String, Object?>;
    final entry = (reconciliation['entries'] as List<Object?>).single
        as Map<String, Object?>;

    expect(summary['matchedNormalized'], 0);
    expect(summary['matchedRelaxed'], 1);
    expect(summary['mismatched'], 0);
    expect(entry['status'], 'matched_relaxed');
  });

  test('ignora distinct quando a unica diferenca remanescente e order by', () {
    final builder = QueryReconciliationBuilder();

    final binaryQueries = <AccessQueryDef>[
      const AccessQueryDef(
        name: 'Q_DistinctOrderOnly',
        objectId: 11,
        sqlText:
            'SELECT DISTINCT [T].[ID], [T].[NOME] '
            'FROM [T] '
            'WHERE [T].[ATIVO] = Yes '
            'ORDER BY [T].[NOME]',
        queryType: 0,
        rows: <AccessQueryRow>[],
      ),
    ];

    final sourceQueries = <AccessSrcQuery>[
      const AccessSrcQuery(
        name: 'Q_DistinctOrderOnly',
        sql:
            'SELECT [T].[ID], [T].[NOME] '
            'FROM [T] '
            'WHERE [T].[ATIVO] = Yes',
        basText: null,
        semanticSql:
            'SELECT [T].[ID], [T].[NOME] '
            'FROM [T] '
            'WHERE [T].[ATIVO] = Yes',
      ),
    ];

    final reconciliation = builder.build(binaryQueries, sourceQueries);
    final summary = reconciliation['summary'] as Map<String, Object?>;
    final entry = (reconciliation['entries'] as List<Object?>).single
        as Map<String, Object?>;

    expect(summary['matchedOrderEquivalent'], 1);
    expect(summary['mismatched'], 0);
    expect(entry['status'], 'matched_order_equivalent');
  });
}