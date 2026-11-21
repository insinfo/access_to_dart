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
}
