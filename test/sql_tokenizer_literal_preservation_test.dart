import 'package:access_to_dart/src/query_reconciliation/sql_tokenizer.dart';
import 'package:access_to_dart/src/query_reconciliation/sql_token.dart';
import 'package:test/test.dart';

void main() {
  test('literal preservation is opt-in without changing reconciliation', () {
    const tokenizer = AccessSqlTokenizer();
    const sql = "SELECT Nome FROM Pessoas WHERE Nome='O''Brien'";
    expect(
        tokenizer
            .tokenize(sql)
            .where((t) => t.kind == AccessSqlTokenKind.stringLiteral)
            .single
            .lexeme,
        "'O''BRIEN'");
    expect(
        tokenizer
            .tokenize(sql, preserveStringLiterals: true)
            .where((t) => t.kind == AccessSqlTokenKind.stringLiteral)
            .single
            .lexeme,
        "'O''Brien'");
  });
}
