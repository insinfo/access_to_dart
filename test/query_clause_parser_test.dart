import 'package:access_to_dart/src/query_reconciliation/sql_clause_parser.dart';
import 'package:access_to_dart/src/query_reconciliation/sql_tokenizer.dart';
import 'package:test/test.dart';

void main() {
  const tokenizer = AccessSqlTokenizer();
  const parser = AccessSqlClauseParser();

  test('parses select clauses at top level without regex heuristics', () {
    final tokens = tokenizer.tokenize(
      'SELECT DISTINCT [TbPessoa].[Nome], Max(TbAtend.[Data]) '
      'FROM ([TbPessoa] INNER JOIN [TbAtend] ON TbPessoa.CodPessoa = TbAtend.Nome), [TbUnidade] '
      'WHERE (((TbPessoa.Nome) Like [DIGITE O NOME] + "*")) '
      'GROUP BY [TbPessoa].[Nome] '
      'HAVING (Max(TbAtend.[Data]) > #2024-01-01#) '
      'ORDER BY [TbPessoa].[Nome]',
    );

    final statement = parser.parse(tokens);

    expect(statement, isNotNull);
    expect(statement!.selectTokens, isNotEmpty);
    expect(statement.fromTokens, isNotEmpty);
    expect(statement.whereTokens, isNotEmpty);
    expect(statement.groupByTokens, isNotEmpty);
    expect(statement.havingTokens, isNotEmpty);
    expect(statement.orderByTokens, isNotEmpty);
    expect(statement.isSetOrActionQuery, isFalse);
  });

  test('detects union query as set operation', () {
    final tokens = tokenizer.tokenize(
      'SELECT CodPessoa FROM TbPessoa UNION SELECT CodPessoa FROM TbAtend',
    );

    final statement = parser.parse(tokens);

    expect(statement, isNotNull);
    expect(statement!.hasUnion, isTrue);
    expect(statement.isSetOrActionQuery, isTrue);
    expect(statement.selectTokens, isEmpty);
  });
}
