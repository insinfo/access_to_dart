import 'package:access_to_dart/src/query_reconciliation/sql_expression_parser.dart';
import 'package:access_to_dart/src/query_reconciliation/sql_tokenizer.dart';
import 'package:test/test.dart';

void main() {
  const tokenizer = AccessSqlTokenizer();
  const parser = AccessSqlExpressionParser();

  test('parseia precedencia de AND e OR com serializacao canonica', () {
    final expression = parser.parse(
      tokenizer.tokenize('(B = 2 AND A = 1) OR (D = 4 AND C = 3)'),
    );

    expect(expression, isNotNull);
    expect(
      expression!.canonicalize(),
      '(A = 1 AND B = 2) OR (C = 3 AND D = 4)',
    );
  });

  test('parseia funcoes aninhadas e identificadores qualificados', () {
    final expression = parser.parse(
      tokenizer.tokenize('Max(([T].[VAL] + Nz([T].[EXTRA], 0)))'),
    );

    expect(expression, isNotNull);
    expect(
      expression!.canonicalize(),
      'MAX(T.VAL + NZ(T.EXTRA, 0))',
    );
  });

  test('parseia wildcard e funcoes de agregacao', () {
    final expression = parser.parse(tokenizer.tokenize('Count(*)'));

    expect(expression, isNotNull);
    expect(expression!.canonicalize(), 'COUNT(*)');
  });

  test('parseia between e not between', () {
    final between = parser.parse(tokenizer.tokenize('idade between 18 and 60'));
    final notBetween = parser.parse(
      tokenizer.tokenize('idade not between 18 and 60'),
    );

    expect(between, isNotNull);
    expect(between!.canonicalize(), 'IDADE BETWEEN 18 AND 60');
    expect(notBetween, isNotNull);
    expect(notBetween!.canonicalize(), 'IDADE NOT BETWEEN 18 AND 60');
  });

  test('parseia in e not in com lista canonica', () {
    final inside = parser.parse(tokenizer.tokenize('codigo in (3, 1, 2)'));
    final notInside = parser.parse(tokenizer.tokenize('codigo not in (3, 1, 2)'));

    expect(inside, isNotNull);
    expect(inside!.canonicalize(), 'CODIGO IN (1, 2, 3)');
    expect(notInside, isNotNull);
    expect(notInside!.canonicalize(), 'CODIGO NOT IN (1, 2, 3)');
  });

  test('parseia is null e is not null', () {
    final isNull = parser.parse(tokenizer.tokenize('campo is null'));
    final notNull = parser.parse(tokenizer.tokenize('campo is not null'));

    expect(isNull, isNotNull);
    expect(isNull!.canonicalize(), 'CAMPO IS NULL');
    expect(notNull, isNotNull);
    expect(notNull!.canonicalize(), 'CAMPO IS NOT NULL');
  });

  test('parseia like com escape e not like', () {
    final like = parser.parse(
      tokenizer.tokenize(r'nome like "A#_%" escape "#"'),
    );
    final notLike = parser.parse(
      tokenizer.tokenize(r'nome not like "A#_%" escape "#"'),
    );

    expect(like, isNotNull);
    expect(like!.canonicalize(), r'NOME LIKE "A#_%" ESCAPE "#"');
    expect(notLike, isNotNull);
    expect(notLike!.canonicalize(), r'NOME NOT LIKE "A#_%" ESCAPE "#"');
  });
}