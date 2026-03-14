abstract class AccessExpressionNode {
  const AccessExpressionNode();

  Map<String, dynamic> toJson();
}

class AccessIdentifierNode extends AccessExpressionNode {
  final List<String> parts;

  const AccessIdentifierNode(this.parts);

  @override
  Map<String, dynamic> toJson() => {
        'type': 'identifier',
        'parts': parts,
      };
}

class AccessStringNode extends AccessExpressionNode {
  final String value;

  const AccessStringNode(this.value);

  @override
  Map<String, dynamic> toJson() => {
        'type': 'string',
        'value': value,
      };
}

class AccessNumberNode extends AccessExpressionNode {
  final String value;

  const AccessNumberNode(this.value);

  @override
  Map<String, dynamic> toJson() => {
        'type': 'number',
        'value': value,
      };
}

class AccessUnaryNode extends AccessExpressionNode {
  final String operatorName;
  final AccessExpressionNode operand;

  const AccessUnaryNode(this.operatorName, this.operand);

  @override
  Map<String, dynamic> toJson() => {
        'type': 'unary',
        'operator': operatorName,
        'operand': operand.toJson(),
      };
}

class AccessBinaryNode extends AccessExpressionNode {
  final String operatorName;
  final AccessExpressionNode left;
  final AccessExpressionNode right;

  const AccessBinaryNode(this.operatorName, this.left, this.right);

  @override
  Map<String, dynamic> toJson() => {
        'type': 'binary',
        'operator': operatorName,
        'left': left.toJson(),
        'right': right.toJson(),
      };
}

class AccessFunctionCallNode extends AccessExpressionNode {
  final String name;
  final List<AccessExpressionNode> arguments;

  const AccessFunctionCallNode(this.name, this.arguments);

  @override
  Map<String, dynamic> toJson() => {
        'type': 'function_call',
        'name': name,
        'arguments': arguments.map((argument) => argument.toJson()).toList(),
      };
}

class AccessExpressionParser {
  static AccessExpressionNode? tryParse(String? input) {
    if (input == null || input.trim().isEmpty) {
      return null;
    }

    try {
      final parser = _AccessExpressionParser(input);
      final node = parser.parseExpression();
      parser.expectEnd();
      return node;
    } catch (_) {
      return null;
    }
  }
}

class _AccessExpressionParser {
  final String input;
  int index = 0;

  _AccessExpressionParser(this.input);

  AccessExpressionNode parseExpression([int minPrecedence = 0]) {
    skipWhitespace();
    var left = parsePrefix();

    while (true) {
      skipWhitespace();
      final operatorName = _peekOperator();
      if (operatorName == null) {
        break;
      }

      final precedence = _precedence(operatorName);
      if (precedence < minPrecedence) {
        break;
      }

      _consumeOperator(operatorName);
      final right = parseExpression(precedence + 1);
      left = AccessBinaryNode(operatorName, left, right);
    }

    return left;
  }

  AccessExpressionNode parsePrefix() {
    skipWhitespace();

    final unary = _peekUnaryOperator();
    if (unary != null) {
      _consumeOperator(unary);
      return AccessUnaryNode(unary, parseExpression(100));
    }

    if (_match('(')) {
      final expr = parseExpression();
      _expect(')');
      return expr;
    }

    if (_peek() == '"' || _peek() == '\'') {
      return AccessStringNode(_parseQuotedString());
    }

    if (_isNumberStart(_peek())) {
      return AccessNumberNode(_parseNumber());
    }

    return _parseIdentifierOrCall();
  }

  AccessExpressionNode _parseIdentifierOrCall() {
    final parts = <String>[];
    parts.add(_parseIdentifierPart());
    while (true) {
      skipWhitespace();
      if (!_match('.')) {
        break;
      }
      skipWhitespace();
      parts.add(_parseIdentifierPart(allowStar: true));
    }

    skipWhitespace();
    if (_match('(')) {
      final args = <AccessExpressionNode>[];
      skipWhitespace();
      if (!_match(')')) {
        do {
          args.add(parseExpression());
          skipWhitespace();
        } while (_match(','));
        _expect(')');
      }
      return AccessFunctionCallNode(parts.join('.'), args);
    }

    return AccessIdentifierNode(parts);
  }

  String _parseIdentifierPart({bool allowStar = false}) {
    skipWhitespace();
    if (_match('[')) {
      final start = index;
      while (!isAtEnd && _peek() != ']') {
        index++;
      }
      final value = input.substring(start, index);
      _expect(']');
      return value;
    }

    if (allowStar && _match('*')) {
      return '*';
    }

    final start = index;
    while (!isAtEnd && _isIdentifierChar(_peek())) {
      index++;
    }
    if (start == index) {
      throw StateError('Expected identifier at $index');
    }
    return input.substring(start, index);
  }

  String _parseQuotedString() {
    final quote = _peek();
    index++;
    final buffer = StringBuffer();
    while (!isAtEnd) {
      final ch = _peek();
      index++;
      if (ch == quote) {
        if (!isAtEnd && _peek() == quote) {
          buffer.write(quote);
          index++;
          continue;
        }
        return buffer.toString();
      }
      buffer.write(ch);
    }
    throw StateError('Unterminated string literal');
  }

  String _parseNumber() {
    final start = index;
    if (_peek() == '-') {
      index++;
    }
    while (!isAtEnd && _isDigit(_peek())) {
      index++;
    }
    if (!isAtEnd && _peek() == '.') {
      index++;
      while (!isAtEnd && _isDigit(_peek())) {
        index++;
      }
    }
    return input.substring(start, index);
  }

  void expectEnd() {
    skipWhitespace();
    if (!isAtEnd) {
      throw StateError('Unexpected token at $index');
    }
  }

  void skipWhitespace() {
    while (!isAtEnd && _isWhitespace(_peek())) {
      index++;
    }
  }

  bool get isAtEnd => index >= input.length;

  String _peek() => input[index];

  bool _match(String value) {
    if (input.startsWith(value, index)) {
      index += value.length;
      return true;
    }
    return false;
  }

  void _expect(String value) {
    if (!_match(value)) {
      throw StateError('Expected $value at $index');
    }
  }

  String? _peekUnaryOperator() {
    for (final operatorName in const ['NOT', '-', '+']) {
      if (_matchesOperator(operatorName)) {
        return operatorName;
      }
    }
    return null;
  }

  String? _peekOperator() {
    for (final operatorName in const [
      'OR',
      'AND',
      '<=',
      '>=',
      '<>',
      '=',
      '<',
      '>',
      '&',
      '+',
      '-',
      '*',
      '/',
    ]) {
      if (_matchesOperator(operatorName)) {
        return operatorName;
      }
    }
    return null;
  }

  bool _matchesOperator(String operatorName) {
    if (!input.startsWith(operatorName, index)) {
      return false;
    }
    if (_isAlpha(operatorName.codeUnitAt(0))) {
      final end = index + operatorName.length;
      if (end < input.length && _isIdentifierChar(input[end])) {
        return false;
      }
    }
    return true;
  }

  void _consumeOperator(String operatorName) {
    index += operatorName.length;
  }

  int _precedence(String operatorName) {
    switch (operatorName) {
      case 'OR':
        return 1;
      case 'AND':
        return 2;
      case '=':
      case '<>':
      case '<':
      case '>':
      case '<=':
      case '>=':
        return 3;
      case '&':
        return 4;
      case '+':
      case '-':
        return 5;
      case '*':
      case '/':
        return 6;
    }
    return 0;
  }

  bool _isNumberStart(String ch) => _isDigit(ch) || ch == '-';
  bool _isDigit(String ch) => ch.codeUnitAt(0) >= 48 && ch.codeUnitAt(0) <= 57;
  bool _isAlpha(int codeUnit) =>
      (codeUnit >= 65 && codeUnit <= 90) ||
      (codeUnit >= 97 && codeUnit <= 122);
  bool _isIdentifierChar(String ch) =>
      _isAlpha(ch.codeUnitAt(0)) ||
      _isDigit(ch) ||
      ch == '_' ||
      ch == r'$';
  bool _isWhitespace(String ch) => ch.trim().isEmpty;
}
