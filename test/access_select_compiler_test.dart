import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/src/access_select_compiler.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:test/test.dart';

AnalysisTable table(String name) => AnalysisTable.fromJson({
      'name': name,
      'columns': [
        {'name': 'Id', 'typeCode': 4},
        {'name': 'Name', 'typeCode': 10},
        {'name': 'Ended', 'typeCode': 8},
      ]
    });
void main() {
  final compiler = AccessSelectCompiler([table('People'), table('Homes')]);
  const parameter = '[Forms]![Search]![Key]';
  const source = 'SELECT People.Id, People.Name FROM People WHERE '
      '((People.Id)=$parameter) AND People.Ended IS NULL AND People.Name="John";';
  test('bindings preserve literal case; DAO text coerces only strict Long', () {
    final plan = compiler.compile(source,
        parameterTypes: {parameter: 10}, asciiCaseInsensitiveText: true);
    expect(plan.bind({parameter: '42'}), [42, 'John']);
    expect(plan.bind({parameter: null}), [null, 'John']);
    expect(plan.sql, isNot(contains('John')));
    expect(plan.sql, contains(r'CAST($1 AS INTEGER)'));
    for (final value in ['1 OR 1=1', '1,2', '1.5', '2147483648', ' 42 ', '']) {
      expect(() => plan.bind({parameter: value}), throwsFormatException);
    }
    expect(() => plan.bind({parameter: 42}), throwsFormatException);
    expect(() => plan.bind({}), throwsFormatException);
    expect(() => plan.bind({parameter: '42', 'extra': 'x'}),
        throwsFormatException);
  });
  test('quoted text remains a bound value even when it resembles SQL', () {
    final plan = compiler.compile(
        "SELECT People.Name FROM People WHERE People.Name='O''Brien; DROP TABLE People'",
        asciiCaseInsensitiveText: true);
    expect(plan.bind({}), ["O'Brien; DROP TABLE People"]);
    expect(plan.sql, isNot(contains('DROP TABLE')));
  });
  test('nested joins and DAO duplicate output labels', () {
    final plan = compiler.compile(
        'SELECT People.Name, Homes.Name FROM '
        '(Homes INNER JOIN People ON Homes.Id=People.Id)',
        outputNames: ['People.NAME', 'Homes.NAME']);
    expect(plan.outputs.map((o) => o.name), ['People.NAME', 'Homes.NAME']);
    expect(plan.sql, contains('"People.NAME"'));
    expect(
        () => compiler
            .compile('SELECT People.Name FROM People', outputNames: ['evil']),
        throwsFormatException);
  });
  test('rejects unsupported or incomplete syntax without passing fragments',
      () {
    for (final sql in [
      'SELECT * FROM People',
      'SELECT People.Id FROM People; DELETE FROM People',
      'SELECT People.Id FROM People WHERE People.Id=',
      'SELECT People.Id FROM People WHERE People.Id=1,2',
      'SELECT People.Id FROM People WHERE People.Id=1',
      'SELECT People.Id FROM People ORDER BY People.Id',
      'SELECT People.Id FROM People WHERE People.Name="John" OR People.Id=People.Id',
      'SELECT People.Id FROM People WHERE People.Name="unterminated',
      'SELECT People.Id FROM People --comment',
      'SELECT Missing.Id FROM People',
      'SELECT People.Missing FROM People',
      'SELECT People.Id FROM Unknown',
      'SELECT DISTINCT People.Id FROM People',
      'SELECT People.Id FROM People LEFT JOIN Homes ON People.Id=Homes.Id',
      'SELECT People.Id FROM People WHERE People.Ended IS NOT NULL',
      'SELECT People.Id FROM People WHERE People.Name="João"',
      'SELECT People.Id FROM People WHERE People.Id=[Forms]![Search]![Key]',
      'SELECT People.Id FROM People WHERE People.Id=People.Id=People.Id',
      'SELECT People.Id FROM People INNER JOIN Homes ON Missing.Id=Homes.Id',
    ]) {
      expect(() => compiler.compile(sql, asciiCaseInsensitiveText: true),
          throwsFormatException,
          reason: sql);
    }
    expect(() => compiler.compile(source, parameterTypes: {parameter: 10}),
        throwsFormatException);
  });
  test('rejects PostgreSQL identifier truncation and NUL', () {
    final longName = List.filled(64, 'a').join();
    for (final name in [longName, 'bad\u0000name']) {
      expect(
          () => AccessSelectCompiler([table(name)])
              .compile('SELECT [$name].Id FROM [$name]'),
          throwsFormatException);
    }
  });
  test('schema normalization collisions are rejected', () {
    expect(
        () => AccessSelectCompiler([table('People'), table('people')])
            .compile('SELECT People.Id FROM People'),
        throwsFormatException);
    final schema = table('People');
    schema.columns.add(AnalysisColumn.fromJson({'name': 'ID', 'typeCode': 4}));
    expect(
        () => AccessSelectCompiler([schema])
            .compile('SELECT People.Id FROM People'),
        throwsFormatException);
  });
  test(
      'allowExtendedSyntax supports SELECT *, DISTINCT, LEFT JOIN, CROSS JOIN, ORDER BY, OR, IS NOT NULL, aliases, inferred parameters and namedSubqueries',
      () {
    final starPlan = compiler.compile(
      'SELECT DISTINCT * FROM People ORDER BY People.Name DESC',
      allowExtendedSyntax: true,
    );
    expect(starPlan.sql, startsWith('SELECT DISTINCT '));
    expect(starPlan.sql, contains('ORDER BY "People"."name" DESC'));
    expect(starPlan.outputs.map((o) => o.name), ['Id', 'Name', 'Ended']);

    final aliasPlan = compiler.compile(
      'SELECT People.Name AS PessoaNome, Homes.Name FROM People '
      'LEFT JOIN Homes ON People.Id = Homes.Id '
      'WHERE People.Ended IS NOT NULL OR People.Name = [Digite Nome]',
      asciiCaseInsensitiveText: true,
      allowExtendedSyntax: true,
      inferParameterTypes: true,
    );
    expect(aliasPlan.outputs.map((o) => o.name), ['PessoaNome', 'Name']);
    expect(aliasPlan.sql, contains('LEFT JOIN'));
    expect(aliasPlan.sql, contains('IS NOT NULL) OR'));
    expect(aliasPlan.inferredParameterTypes, {'[Digite Nome]': 10});
    expect(aliasPlan.bind({'[Digite Nome]': 'Ana'}), ['Ana']);

    final crossPlan = compiler.compile(
      'SELECT People.Id, Homes.Id FROM Homes, People WHERE People.Id = Homes.Id',
      allowExtendedSyntax: true,
    );
    expect(crossPlan.sql, contains('CROSS JOIN'));
    expect(crossPlan.outputs.map((o) => o.name), ['People.Id', 'Homes.Id']);

    final subPlan = compiler.compile(
      'SELECT SubQ.Id, SubQ.Name AS NomePessoa, Homes.Name FROM SubQ, Homes WHERE SubQ.Id = 7',
      allowExtendedSyntax: true,
      asciiCaseInsensitiveText: true,
      namedSubqueries: {
        'SubQ': 'SELECT People.Id, People.Name FROM People WHERE People.Ended IS NULL',
      },
    );
    expect(subPlan.outputs.map((o) => o.name), ['Id', 'NomePessoa', 'Name']);
    expect(subPlan.sql, contains('CROSS JOIN'));
    expect(subPlan.bind({}), [7]);
  });

  test('real CSPRONT1: all 134 projections and DAO ordinal names/types', () {
    final analysis = jsonDecode(
        File('build/codex-sigasul-goal/analysis-complex-complete/analysis.json')
            .readAsStringSync()) as Map;
    final shape = jsonDecode(
        File('build/codex-sigasul-goal/query-audit/cspront1-shape.json')
            .readAsStringSync()) as Map;
    final tables = (analysis['tables'] as List)
        .map((v) => AnalysisTable.fromJson((v as Map).cast<String, dynamic>()))
        .toList();
    final columns = shape['columns'] as List;
    final params = shape['parameters'] as List;
    final plan = AccessSelectCompiler(tables).compile(
        File('fixtures/SIGAsul.accdb.src/queries/CSPRONT1.sql')
            .readAsStringSync(),
        parameterTypes: {
          for (final p in params) p['name'] as String: p['daoType'] as int
        },
        outputNames: columns.map((v) => v['name'] as String).toList(),
        asciiCaseInsensitiveText: true);
    expect(plan.outputs.length, 134);
    expect(
        plan.outputs.map((v) => v.typeCode), columns.map((v) => v['daoType']));
    expect(plan.bind({params.single['name'] as String: '1'}),
        [1, 'Pessoa de Referencia']);
  },
      skip:
          !File('build/codex-sigasul-goal/analysis-complex-complete/analysis.json')
                  .existsSync()
              ? 'requires real local analysis and DAO shape'
              : false);

  test('extended syntax supports UNION ALL, TOP, DISTINCTROW, PARAMETERS, GROUP BY, HAVING and Jet functions', () {
    final tExt = AnalysisTable.fromJson({
      'name': 'Atendimentos',
      'columns': [
        {'name': 'Id', 'typeCode': 4},
        {'name': 'PessoaId', 'typeCode': 4},
        {'name': 'Nome', 'typeCode': 10},
        {'name': 'DataNasc', 'typeCode': 8},
        {'name': 'DataAtend', 'typeCode': 8},
        {'name': 'Ativo', 'typeCode': 1},
        {'name': 'Valor', 'typeCode': 5},
        {'name': 'Logo', 'typeCode': 18},
      ]
    });
    final extCompiler = AccessSelectCompiler([tExt]);

    // Strict mode still rejects extended constructs
    for (final sql in [
      'SELECT TOP 10 Atendimentos.Id FROM Atendimentos',
      'SELECT COUNT(*) FROM Atendimentos',
      'SELECT Atendimentos.Id FROM Atendimentos UNION ALL SELECT Atendimentos.Id FROM Atendimentos',
      'SELECT Atendimentos.Id FROM Atendimentos WHERE Atendimentos.DataAtend BETWEEN #01/01/2024# AND #12/31/2024#',
    ]) {
      expect(
        () => extCompiler.compile(sql, asciiCaseInsensitiveText: true),
        throwsFormatException,
        reason: 'strict rejects: $sql',
      );
    }

    // PARAMETERS + DISTINCTROW + BETWEEN + DateDiff + Int + MonthName + Year + GROUP BY + HAVING + ungrouped Logo
    final grouped = extCompiler.compile(
      '\ufeffPARAMETERS [DataIni] DateTime, [DataFim] DateTime;\n'
      'SELECT Atendimentos.Logo, MonthName(Month([DataAtend])) AS MesRef, '
      'Int(DateDiff("d", [DataNasc], Date()) / 365.25) AS Idade, '
      'Sum(Atendimentos.Ativo) AS SomaBool, Count(*) AS Qtd, First(Atendimentos.Nome) AS PrimeiroNome '
      'FROM Atendimentos '
      'WHERE Atendimentos.DataAtend BETWEEN [DataIni] AND [DataFim] '
      'AND Atendimentos.DataAtend >= #01/15/2020# '
      'AND Atendimentos.Nome LIKE [FiltroNome] + "*" '
      'GROUP BY Int(DateDiff("d", [DataNasc], Date()) / 365.25), MonthName(Month([DataAtend])) '
      'HAVING Count(*) > 1 '
      'ORDER BY Int(DateDiff("d", [DataNasc], Date()) / 365.25) DESC;',
      allowExtendedSyntax: true,
      inferParameterTypes: true,
      asciiCaseInsensitiveText: true,
    );
    expect(grouped.outputs.map((o) => o.name),
        ['Logo', 'MesRef', 'Idade', 'SomaBool', 'Qtd', 'PrimeiroNome']);
    expect(grouped.sql, contains('ARRAY_AGG("Atendimentos"."logo")'));
    expect(grouped.sql, contains('SUM(CASE WHEN ("Atendimentos"."ativo") THEN -1 ELSE 0 END)'));
    expect(grouped.sql, contains('BETWEEN CAST(\$'));
    expect(grouped.sql, contains('ILIKE replace(replace'));
    expect(grouped.sql, contains('HAVING (COUNT(*) >'));
    expect(grouped.inferredParameterTypes['[DataIni]'], 8);
    expect(grouped.inferredParameterTypes['[DataFim]'], 8);
    final bound = grouped.bind({
      '[DataIni]': '2024-01-01',
      '[DataFim]': '2024-12-31',
      '[FiltroNome]': 'João',
    });
    expect(bound, contains('2020-01-15'));
    expect(bound, contains('João'));

    // UNION ALL + digit-leading identifiers + hasLimit + correlated IN (SELECT ...)
    final unionPlan = extCompiler.compile(
      '(SELECT TOP 5 Atendimentos.Nome AS 0a5inc, 0 AS 6a11inc FROM Atendimentos WHERE Atendimentos.Ativo = Yes) '
      'UNION ALL '
      '(SELECT Atendimentos.Nome AS 0a5inc, Count(*) AS 6a11inc FROM Atendimentos GROUP BY Atendimentos.Nome) '
      'ORDER BY 0a5inc DESC;',
      allowExtendedSyntax: true,
      inferParameterTypes: true,
      asciiCaseInsensitiveText: true,
      ordinalOutputAliases: true,
    );
    expect(unionPlan.isUnion, isTrue);
    expect(unionPlan.sql, contains('UNION ALL'));
    expect(unionPlan.sql, contains('LIMIT 5'));
    expect(unionPlan.sql, contains('ORDER BY "c0" DESC'));
    expect(unionPlan.outputs.map((o) => o.name), ['0a5inc', '6a11inc']);

    // Correlated Find-Duplicates IN (SELECT ...) + duplicate projection auto-disambiguation
    final corrPlan = extCompiler.compile(
      'SELECT Atendimentos.Nome, Atendimentos.Nome, Atendimentos.Valor & " pts" AS Label '
      'FROM Atendimentos '
      'WHERE Atendimentos.Nome IN ('
      '  SELECT Tmp.Nome FROM Atendimentos AS Tmp '
      '  GROUP BY Tmp.Nome, Tmp.DataNasc '
      '  HAVING Count(*) > 1 AND Tmp.DataNasc = Atendimentos.DataNasc'
      ');',
      allowExtendedSyntax: true,
      asciiCaseInsensitiveText: true,
    );
    expect(corrPlan.outputs.map((o) => o.name), ['Nome', 'Nome_2', 'Label']);
    expect(corrPlan.sql, contains('"Tmp"."data_nasc" = "Atendimentos"."data_nasc"'));

    // Deep namedSubqueries chain (> 4 levels)
    var nested = {'Q1': 'SELECT Atendimentos.Id, Atendimentos.Nome FROM Atendimentos'};
    for (var k = 2; k <= 6; k++) {
      nested['Q$k'] = 'SELECT Q${k - 1}.Id, Q${k - 1}.Nome FROM Q${k - 1}';
    }
    final deep = AccessSelectCompiler([tExt]).compile(
      'SELECT DISTINCTROW TOP 3 Q6.Id, IIf(Q6.Nome IS NULL, Nz(Q6.Nome, "N/D"), UCase(Trim(Q6.Nome))) AS CleanName FROM Q6',
      allowExtendedSyntax: true,
      asciiCaseInsensitiveText: true,
      namedSubqueries: nested,
    );
    expect(deep.hasLimit, isTrue);
    expect(deep.sql, startsWith('SELECT DISTINCT '));
    expect(deep.sql, endsWith('LIMIT 3'));
  });

  test('extended mode allows materialized calculated columns and reverse virtual 3-part lookup while strict mode rejects calculated columns', () {
    final calcTable = AnalysisTable.fromJson({
      'name': 'Items',
      'columns': [
        {'name': 'Id', 'typeCode': 4},
        {'name': 'Total', 'typeCode': 5, 'isCalculated': true, 'calculatedExpression': '[Qty]*[Price]'},
      ]
    });
    final extraTable = AnalysisTable.fromJson({
      'name': 'Categories',
      'columns': [
        {'name': 'Id', 'typeCode': 4},
        {'name': 'Code', 'typeCode': 10},
      ]
    });
    final c = AccessSelectCompiler([calcTable, extraTable]);
    expect(
      () => c.compile('SELECT Items.Total FROM Items'),
      throwsFormatException,
    );
    final extCalc = c.compile(
      'SELECT Items.Id, Items.Total FROM Items',
      allowExtendedSyntax: true,
    );
    expect(extCalc.outputs.map((o) => o.name), ['Id', 'Total']);

    final revPlan = c.compile(
      'SELECT OuterQ.Code FROM OuterQ',
      allowExtendedSyntax: true,
      namedSubqueries: {
        'InnerQ': 'SELECT Items.Id, Categories.Id, Categories.Code FROM Items INNER JOIN Categories ON Items.Id = Categories.Id',
        'OuterQ': 'SELECT InnerQ.Categories.Code FROM InnerQ',
      },
    );
    expect(revPlan.outputs.single.name, 'Code');
  });
}
