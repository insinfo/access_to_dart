enum AccessSqlTokenKind {
  word,
  number,
  stringLiteral,
  symbol,
}

final class AccessSqlToken {
  const AccessSqlToken(this.kind, this.lexeme);

  final AccessSqlTokenKind kind;
  final String lexeme;

  bool get isWord => kind == AccessSqlTokenKind.word;
  bool get isSymbol => kind == AccessSqlTokenKind.symbol;

  @override
  String toString() => '$kind($lexeme)';
}
