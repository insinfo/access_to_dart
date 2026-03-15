import 'vba_token.dart';
import 'ast/vba_ast.dart';

/// O Analisador Sintático descendente recursivo puro.
/// Evita uso de RegEx, mantendo controle preciso do cursor de tokens.
class VbaParser {
  final List<Token> _tokens;
  int _current = 0;

  VbaParser(this._tokens);

  VbaModule parse() {
    final subs = <VbaSubDeclaration>[];
    while (!_isAtEnd) {
      _skipNewLines();
      if (_isAtEnd) break;

      if (_match([TokenType.kwSub, TokenType.kwFunction])) {
        subs.add(_parseSubDeclaration());
      } else {
        // Fallback progressivo
        _advance();
      }
    }
    return VbaModule(subs);
  }

  VbaSubDeclaration _parseSubDeclaration() {
    final kind = _previous();
    final isFunction = kind.type == TokenType.kwFunction;
    
    final nameToken = _consume(TokenType.identifier, 'Expected Sub/Function name.');
    
    // Suporte a argumentos vazios por hora (TODO: adicionar param parser)
    if (_match([TokenType.parenLeft])) {
       while(!_check(TokenType.parenRight) && !_isAtEnd) {
         _advance(); // swallow params for now
       }
       _consume(TokenType.parenRight, 'Expected ")" after arguments.');
    }
    
    String? retType;
    if (isFunction && _match([TokenType.kwAs])) {
       // Type parse
       if (_match([TokenType.kwString, TokenType.kwInteger, TokenType.kwBoolean, TokenType.kwDouble])) {
         retType = _previous().lexeme;
       } else if (_match([TokenType.identifier])) {
         retType = _previous().lexeme;
       }
    }
    
    _skipNewLines();
    
    final body = <VbaStatement>[];
    while (!_isAtEnd && !_check(TokenType.kwEnd)) {
      body.add(_parseStatement());
      _skipNewLines();
    }
    
    _consume(TokenType.kwEnd, 'Expected "End" to close Sub/Function.');
    _consume(isFunction ? TokenType.kwFunction : TokenType.kwSub, 'Expected Sub/Function keyword after End.');

    return VbaSubDeclaration(
      name: nameToken.lexeme, 
      isFunction: isFunction, 
      returnType: retType, 
      body: body
    );
  }

  VbaStatement _parseStatement() {
    if (_match([TokenType.kwDim])) {
      return _parseDim();
    }
    if (_match([TokenType.kwIf])) {
      return _parseIf();
    }
    if (_match([TokenType.kwCall])) {
      return _parseCallStmt();
    }
    if (_match([TokenType.kwMsgBox])) {
      final expr = _parseExpression();
      return VbaCallStatement('MsgBox', [expr]);
    }
    if (_match([TokenType.kwFor])) {
      return _parseFor();
    }
    if (_match([TokenType.kwDo])) {
      return _parseDoWhile();
    }
    if (_match([TokenType.kwOn])) {
      return _parseOnError();
    }

    // Assignment or Call without keyword
    if (_check(TokenType.identifier)) {
       final idToken = _advance();
       if (_match([TokenType.equal])) {
          return VbaAssignment(idToken.lexeme, _parseExpression());
       } else {
          // It's a procedural call
          return _parseCallWithoutKeyword(idToken.lexeme);
       }
    }
    
    // Lidar com linha em branco ou errada caindo no parser.
    _advance();
    return VbaCallStatement('ParseError', []);
  }

  VbaStatement _parseDim() {
    final nameToken = _consume(TokenType.identifier, 'Expected variable name.');
    String typeName = 'Variant';
    if (_match([TokenType.kwAs])) {
       if (_match([TokenType.kwString, TokenType.kwInteger, TokenType.kwBoolean, TokenType.kwDouble, TokenType.identifier])) {
         typeName = _previous().lexeme;
       }
    }
    return VbaDimStatement(nameToken.lexeme, typeName);
  }

  VbaStatement _parseIf() {
    final condition = _parseExpression();
    _consume(TokenType.kwThen, 'Expected "Then" after If condition.');
    _skipNewLines();

    final thenBranch = <VbaStatement>[];
    while (!_isAtEnd && !_check(TokenType.kwEnd) && !_check(TokenType.kwElse) && !_check(TokenType.kwElseIf)) {
       thenBranch.add(_parseStatement());
       _skipNewLines();
    }

    final elseBranch = <VbaStatement>[];
    if (_match([TokenType.kwElse])) {
       _skipNewLines();
       while (!_isAtEnd && !_check(TokenType.kwEnd)) {
          elseBranch.add(_parseStatement());
          _skipNewLines();
       }
    }

    _consume(TokenType.kwEnd, 'Expected "End".');
    _consume(TokenType.kwIf, 'Expected "If" after End.');

    return VbaIfStatement(condition, thenBranch, elseBranch);
  }

  VbaStatement _parseFor() {
    final loopVar = _consume(TokenType.identifier, 'Expected variable after For.');
    _consume(TokenType.equal, 'Expected "=" after For variable.');
    final startVal = _parseExpression();
    _consume(TokenType.kwTo, 'Expected "To" in For loop.');
    final endVal = _parseExpression();
    
    VbaExpression? stepVal;
    if (_match([TokenType.kwStep])) {
      stepVal = _parseExpression();
    }
    
    _skipNewLines();
    
    final body = <VbaStatement>[];
    while (!_isAtEnd && !_check(TokenType.kwNext)) {
       body.add(_parseStatement());
       _skipNewLines();
    }
    _consume(TokenType.kwNext, 'Expected "Next" to close For loop.');
    // Optional variable name after Next
    if (_match([TokenType.identifier])) {}
    
    return VbaForStatement(loopVar.lexeme, startVal, endVal, stepVal, body);
  }

  VbaStatement _parseDoWhile() {
    _consume(TokenType.kwWhile, 'Expected "While" after Do.');
    final condition = _parseExpression();
    _skipNewLines();
    
    final body = <VbaStatement>[];
    while (!_isAtEnd && !_check(TokenType.kwLoop)) {
       body.add(_parseStatement());
       _skipNewLines();
    }
    _consume(TokenType.kwLoop, 'Expected "Loop" to close Do While.');
    
    return VbaDoWhileStatement(condition, body);
  }

  VbaStatement _parseOnError() {
    _consume(TokenType.kwError, 'Expected "Error" after On.');
    if (_match([TokenType.kwResume])) {
      _consume(TokenType.kwNext, 'Expected "Next" after On Error Resume.'); // Fix TokenType.kwNext
      return VbaOnErrorStatement("Resume Next");
    } else if (_match([TokenType.kwGoTo])) {
      if (_match([TokenType.numberLiteral])) {
         return VbaOnErrorStatement(_previous().lexeme); // e.g., On Error GoTo 0
      } else {
         final lbl = _consume(TokenType.identifier, 'Expected error label.');
         return VbaOnErrorStatement(lbl.lexeme);
      }
    }
    throw Exception('Unsupported On Error syntax at line ${_peek().line}');
  }

  VbaStatement _parseCallStmt() {
    final name = _consume(TokenType.identifier, 'Expected subroutine name.');
    final args = <VbaExpression>[];
    while (!_isAtEnd && !_check(TokenType.newLine)) {
       args.add(_parseExpression());
       if (!_match([TokenType.comma])) break;
    }
    return VbaCallStatement(name.lexeme, args);
  }
  
  VbaStatement _parseCallWithoutKeyword(String name) {
    final args = <VbaExpression>[];
    while (!_isAtEnd && !_check(TokenType.newLine)) {
       args.add(_parseExpression());
       if (!_match([TokenType.comma])) break;
    }
    return VbaCallStatement(name, args);
  }

  VbaExpression _parseExpression() {
    return _parseEquality();
  }

  VbaExpression _parseEquality() {
    var expr = _parseComparison();
    while (_match([TokenType.equal, TokenType.notEqual])) {
      final op = _previous().lexeme;
      final right = _parseComparison();
      expr = VbaBinaryOp(expr, op, right);
    }
    return expr;
  }

  VbaExpression _parseComparison() {
    var expr = _parseTerm();
    while (_match([TokenType.greater, TokenType.less, TokenType.greaterEqual, TokenType.lessEqual])) {
       final op = _previous().lexeme;
       final right = _parseTerm();
       expr = VbaBinaryOp(expr, op, right);
    }
    return expr;
  }

  VbaExpression _parseTerm() {
    var expr = _parseFactor();
    while (_match([TokenType.plus, TokenType.minus, TokenType.ampersand])) {
       final op = _previous().lexeme;
       final right = _parseFactor();
       expr = VbaBinaryOp(expr, op, right);
    }
    return expr;
  }

  VbaExpression _parseFactor() {
    var expr = _parsePrimary();
    while (_match([TokenType.multiply, TokenType.divide])) {
       final op = _previous().lexeme;
       final right = _parsePrimary();
       expr = VbaBinaryOp(expr, op, right);
    }
    return expr;
  }

  VbaExpression _parsePrimary() {
    if (_match([TokenType.stringLiteral])) return VbaLiteral(_previous().lexeme);
    if (_match([TokenType.numberLiteral])) {
      final lexeme = _previous().lexeme;
      return VbaLiteral(int.tryParse(lexeme) ?? double.tryParse(lexeme) ?? lexeme);
    }
    if (_match([TokenType.kwTrue])) return VbaLiteral(true);
    if (_match([TokenType.kwFalse])) return VbaLiteral(false);
    
    if (_match([TokenType.identifier])) {
       return VbaIdentifier(_previous().lexeme);
    }

    if (_match([TokenType.parenLeft])) {
       final expr = _parseExpression();
       _consume(TokenType.parenRight, 'Expected ")" after expression.');
       return expr;
    }

    throw Exception('Parse error: Unexpected token at ${_peek().line}:${_peek().column} (${_peek().lexeme})');
  }

  /* UTILS */
  bool _match(List<TokenType> types) {
    for (final type in types) {
      if (_check(type)) {
        _advance();
        return true;
      }
    }
    return false;
  }

  bool _check(TokenType type) {
    if (_isAtEnd) return false;
    return _peek().type == type;
  }

  Token _advance() {
    if (!_isAtEnd) _current++;
    return _previous();
  }

  bool get _isAtEnd => _peek().type == TokenType.eof;

  Token _peek() => _tokens[_current];
  Token _previous() => _tokens[_current - 1];

  Token _consume(TokenType type, String message) {
    if (_check(type)) return _advance();
    throw Exception('$message at line ${_peek().line}');
  }

  void _skipNewLines() {
    while (_match([TokenType.newLine, TokenType.colon])) {}
  }
}
