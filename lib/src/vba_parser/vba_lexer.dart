import 'vba_token.dart';

/// O Analisador Léxico puro para código VBA. 
/// Converte uma stream de caracteres numa lista ordenada de Tokens, abstendo uso de RegEx.
class VbaLexer {
  final String _source;
  int _position = 0;
  int _line = 1;
  int _column = 1;
  final List<Token> _tokens = [];

  static const Map<String, TokenType> _keywords = {
    'sub': TokenType.kwSub,
    'function': TokenType.kwFunction,
    'end': TokenType.kwEnd,
    'if': TokenType.kwIf,
    'then': TokenType.kwThen,
    'else': TokenType.kwElse,
    'elseif': TokenType.kwElseIf,
    'dim': TokenType.kwDim,
    'as': TokenType.kwAs,
    'integer': TokenType.kwInteger,
    'string': TokenType.kwString,
    'boolean': TokenType.kwBoolean,
    'double': TokenType.kwDouble,
    'true': TokenType.kwTrue,
    'false': TokenType.kwFalse,
    'call': TokenType.kwCall,
    'set': TokenType.kwSet,
    'not': TokenType.kwNot,
    'and': TokenType.kwAnd,
    'or': TokenType.kwOr,
    'msgbox': TokenType.kwMsgBox,
    'for': TokenType.kwFor,
    'to': TokenType.kwTo,
    'step': TokenType.kwStep,
    'next': TokenType.kwNext,
    'do': TokenType.kwDo,
    'while': TokenType.kwWhile,
    'loop': TokenType.kwLoop,
    'on': TokenType.kwOn,
    'error': TokenType.kwError,
    'goto': TokenType.kwGoTo,
    'resume': TokenType.kwResume,
  };

  VbaLexer(this._source);

  List<Token> tokenize() {
    while (!_isAtEnd) {
      _scanToken();
    }
    _addToken(TokenType.eof, '');
    return _tokens;
  }

  bool get _isAtEnd => _position >= _source.length;
  
  String get _currentChar => _source[_position];

  void _scanToken() {
    final c = _advance();

    switch (c) {
      case ' ':
      case '\t':
        // Ignora espaços em branco (sem gerar tokens).
        break;
      case '\r':
        if (!_isAtEnd && _currentChar == '\n') _advance();
        _addToken(TokenType.newLine, '\\n');
        _line++;
        _column = 1;
        break;
      case '\n':
        _addToken(TokenType.newLine, '\\n');
        _line++;
        _column = 1;
        break;
      case '(':
        _addToken(TokenType.parenLeft, c);
        break;
      case ')':
        _addToken(TokenType.parenRight, c);
        break;
      case ',':
        _addToken(TokenType.comma, c);
        break;
      case '.':
        _addToken(TokenType.dot, c);
        break;
      case ':':
        _addToken(TokenType.colon, c);
        break;
      case '+':
        _addToken(TokenType.plus, c);
        break;
      case '-':
        _addToken(TokenType.minus, c);
        break;
      case '*':
        _addToken(TokenType.multiply, c);
        break;
      case '/':
        _addToken(TokenType.divide, c);
        break;
      case '&':
        _addToken(TokenType.ampersand, c);
        break;
      case '=':
        _addToken(TokenType.equal, c);
        break;
      case '<':
        if (_match('>')) {
          _addToken(TokenType.notEqual, '<>');
        } else if (_match('=')) {
          _addToken(TokenType.lessEqual, '<=');
        } else {
          _addToken(TokenType.less, '<');
        }
        break;
      case '>':
        if (_match('=')) {
          _addToken(TokenType.greaterEqual, '>=');
        } else {
          _addToken(TokenType.greater, '>');
        }
        break;
      case '\'':
        // Comentários: avança até a quebra de linha (sem gerar token útil por enquanto)
        while (!_isAtEnd && _currentChar != '\n' && _currentChar != '\r') {
          _advance();
        }
        break;
      case '"':
        _scanString();
        break;
      default:
        if (_isDigit(c)) {
          _scanNumber(c);
        } else if (_isAlpha(c)) {
          _scanIdentifierOrKeyword(c);
        } else {
          // Ignora caracteres desconhecidos em nome da robustez (ou poderia lançar exception).
        }
        break;
    }
  }

  String _advance() {
    final c = _source[_position];
    _position++;
    _column++;
    return c;
  }

  bool _match(String expected) {
    if (_isAtEnd) return false;
    if (_source[_position] != expected) return false;
    _position++;
    _column++;
    return true;
  }

  void _scanString() {
    int start = _position;
    while (!_isAtEnd) {
      if (_currentChar == '"') {
        // Verifica escapes VBA estilo ""
        if (_position + 1 < _source.length && _source[_position + 1] == '"') {
          _advance(); // Consome o primeiro
          _advance(); // Consome o segundo
          continue;
        } else {
          break; // Fim da string
        }
      }
      _advance();
    }
    
    if (_isAtEnd) {
      // String não terminada (resiliência)
      return;
    }

    final value = _source.substring(start, _position).replaceAll('""', '"');
    _advance(); // Consome a aspa final
    _addToken(TokenType.stringLiteral, value);
  }

  void _scanNumber(String firstChar) {
    int start = _position - 1;
    while (!_isAtEnd && (_isDigit(_currentChar) || _currentChar == '.')) {
      _advance();
    }
    _addToken(TokenType.numberLiteral, _source.substring(start, _position));
  }

  void _scanIdentifierOrKeyword(String firstChar) {
    int start = _position - 1;
    while (!_isAtEnd && (_isAlphaNumeric(_currentChar) || _currentChar == '_')) {
      _advance();
    }
    final text = _source.substring(start, _position);
    final lowerText = text.toLowerCase();
    
    if (_keywords.containsKey(lowerText)) {
      _addToken(_keywords[lowerText]!, lowerText);
    } else {
      _addToken(TokenType.identifier, text);
    }
  }

  bool _isDigit(String c) {
    if (c.isEmpty) return false;
    final code = c.codeUnitAt(0);
    return code >= 48 && code <= 57;
  }

  bool _isAlpha(String c) {
    if (c.isEmpty) return false;
    final code = c.codeUnitAt(0);
    return (code >= 65 && code <= 90) || (code >= 97 && code <= 122) || c == '_';
  }

  bool _isAlphaNumeric(String c) => _isAlpha(c) || _isDigit(c);

  void _addToken(TokenType type, String lexeme) {
    _tokens.add(Token(type, lexeme, _line, _column - lexeme.length));
  }
}
