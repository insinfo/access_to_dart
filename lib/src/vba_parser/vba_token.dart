/// Define os tipos de tokens da linguagem VBA.
enum TokenType {
  // Palavras-chave
  kwSub,
  kwFunction,
  kwEnd,
  kwIf,
  kwThen,
  kwElse,
  kwElseIf,
  kwDim,
  kwAs,
  kwInteger,
  kwString,
  kwBoolean,
  kwDouble,
  kwTrue,
  kwFalse,
  kwCall,
  kwSet,
  kwNot,
  kwAnd,
  kwOr,
  kwMsgBox,
  kwFor,
  kwTo,
  kwStep,
  kwNext,
  kwDo,
  kwWhile,
  kwLoop,
  kwOn,
  kwError,
  kwGoTo,
  kwResume,

  // Literais
  identifier,
  stringLiteral,
  numberLiteral,

  // Símbolos e Operadores
  plus,       // +
  minus,      // -
  multiply,   // *
  divide,     // /
  equal,      // =
  notEqual,   // <>
  greater,    // >
  less,       // <
  greaterEqual, // >=
  lessEqual,  // <=
  ampersand,  // &
  parenLeft,  // (
  parenRight, // )
  comma,      // ,
  dot,        // .
  colon,      // :

  // Estrutura
  newLine,    // Quebra de linha (separador de instrução VBA)
  eof         // Fim do arquivo
}

class Token {
  final TokenType type;
  final String lexeme;
  final int line;
  final int column;

  const Token(this.type, this.lexeme, this.line, this.column);

  @override
  String toString() => 'Token($type, "$lexeme", linha: $line, col: $column)';
}
