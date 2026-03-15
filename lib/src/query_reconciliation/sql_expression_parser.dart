import 'sql_token.dart';

sealed class AccessSqlExpression {
  const AccessSqlExpression();

  String canonicalize();
}

final class AccessSqlIdentifierExpression extends AccessSqlExpression {
  const AccessSqlIdentifierExpression(this.parts);

  final List<String> parts;

  @override
  String canonicalize() => parts.join();
}

final class AccessSqlLiteralExpression extends AccessSqlExpression {
  const AccessSqlLiteralExpression(this.value);

  final String value;

  @override
  String canonicalize() => value;
}

final class AccessSqlRawExpression extends AccessSqlExpression {
  const AccessSqlRawExpression(this.sql);

  final String sql;

  @override
  String canonicalize() => sql;
}

final class AccessSqlWildcardExpression extends AccessSqlExpression {
  const AccessSqlWildcardExpression();

  @override
  String canonicalize() => '*';
}

final class AccessSqlUnaryExpression extends AccessSqlExpression {
  const AccessSqlUnaryExpression({required this.operatorLexeme, required this.operand});

  final String operatorLexeme;
  final AccessSqlExpression operand;

  @override
  String canonicalize() {
    if (operatorLexeme == 'NOT') {
      return 'NOT ${_wrapIfNeeded(operand)}';
    }
    return '$operatorLexeme${_wrapIfNeeded(operand)}';
  }
}

final class AccessSqlBinaryExpression extends AccessSqlExpression {
  const AccessSqlBinaryExpression({
    required this.operatorLexeme,
    required this.left,
    required this.right,
  });

  final String operatorLexeme;
  final AccessSqlExpression left;
  final AccessSqlExpression right;

  @override
  String canonicalize() {
    if (operatorLexeme == 'AND' || operatorLexeme == 'OR') {
      final flattened = <String>[];
      _collectFlattened(operatorLexeme, this, flattened);
      flattened.sort();
      return flattened.join(' $operatorLexeme ');
    }
    return '${_wrapBinarySide(left)} $operatorLexeme ${_wrapBinarySide(right)}';
  }

  void _collectFlattened(
    String operator,
    AccessSqlExpression expression,
    List<String> target,
  ) {
    if (expression is AccessSqlBinaryExpression &&
        expression.operatorLexeme == operator) {
      _collectFlattened(operator, expression.left, target);
      _collectFlattened(operator, expression.right, target);
      return;
    }
    target.add(_wrapLogicalBranch(operator, expression));
  }
}

final class AccessSqlBetweenExpression extends AccessSqlExpression {
  const AccessSqlBetweenExpression({
    required this.value,
    required this.lower,
    required this.upper,
    required this.negated,
  });

  final AccessSqlExpression value;
  final AccessSqlExpression lower;
  final AccessSqlExpression upper;
  final bool negated;

  @override
  String canonicalize() {
    final notKeyword = negated ? ' NOT' : '';
    return '${_wrapBinarySide(value)}$notKeyword BETWEEN ${lower.canonicalize()} AND ${upper.canonicalize()}';
  }
}

final class AccessSqlInExpression extends AccessSqlExpression {
  const AccessSqlInExpression({
    required this.value,
    required this.items,
    required this.negated,
    required this.isSubquery,
  });

  final AccessSqlExpression value;
  final List<AccessSqlExpression> items;
  final bool negated;
  final bool isSubquery;

  @override
  String canonicalize() {
    final itemSql = items.map((item) => item.canonicalize()).toList();
    if (!isSubquery) {
      itemSql.sort();
    }
    final notKeyword = negated ? ' NOT' : '';
    return '${_wrapBinarySide(value)}$notKeyword IN (${itemSql.join(', ')})';
  }
}

final class AccessSqlIsNullExpression extends AccessSqlExpression {
  const AccessSqlIsNullExpression({required this.value, required this.negated});

  final AccessSqlExpression value;
  final bool negated;

  @override
  String canonicalize() {
    final notKeyword = negated ? ' NOT' : '';
    return '${_wrapBinarySide(value)} IS$notKeyword NULL';
  }
}

final class AccessSqlLikeExpression extends AccessSqlExpression {
  const AccessSqlLikeExpression({
    required this.value,
    required this.pattern,
    required this.escape,
    required this.negated,
  });

  final AccessSqlExpression value;
  final AccessSqlExpression pattern;
  final AccessSqlExpression? escape;
  final bool negated;

  @override
  String canonicalize() {
    final notKeyword = negated ? ' NOT' : '';
    final escapeSql = escape == null ? '' : ' ESCAPE ${escape!.canonicalize()}';
    return '${_wrapBinarySide(value)}$notKeyword LIKE ${pattern.canonicalize()}$escapeSql';
  }
}

final class AccessSqlFunctionCallExpression extends AccessSqlExpression {
  const AccessSqlFunctionCallExpression({
    required this.name,
    required this.arguments,
  });

  final String name;
  final List<AccessSqlExpression> arguments;

  @override
  String canonicalize() =>
      '$name(${arguments.map((argument) => argument.canonicalize()).join(', ')})';
}

final class AccessSqlExpressionParser {
  const AccessSqlExpressionParser();

  AccessSqlExpression? parse(List<AccessSqlToken> tokens) {
    if (tokens.isEmpty) {
      return null;
    }
    final parser = _AccessSqlExpressionParserState(tokens);
    final expression = parser.parseExpression();
    if (expression == null || !parser.isAtEnd) {
      return null;
    }
    return expression;
  }
}

final class _AccessSqlExpressionParserState {
  _AccessSqlExpressionParserState(this.tokens);

  final List<AccessSqlToken> tokens;
  int _index = 0;

  bool get isAtEnd => _index >= tokens.length;

  AccessSqlExpression? parseExpression([int minPrecedence = 0]) {
    final prefix = _parsePrefix();
    if (prefix == null) {
      return null;
    }
    AccessSqlExpression left = prefix;

    while (!isAtEnd) {
      final special = _peekSpecialOperator();
      if (special != null) {
        final precedence = _precedenceOf(special.operatorLexeme);
        if (precedence < minPrecedence) {
          break;
        }

        final parsed = _parseSpecialOperator(left, special);
        if (parsed == null) {
          return null;
        }
        left = parsed;
        continue;
      }

      final operator = _peekBinaryOperator();
      if (operator == null) {
        break;
      }
      final precedence = _precedenceOf(operator);
      if (precedence < minPrecedence) {
        break;
      }

      _index++;
      final right = parseExpression(precedence + 1);
      if (right == null) {
        return null;
      }
      left = AccessSqlBinaryExpression(
        operatorLexeme: operator,
        left: left,
        right: right,
      );
    }

    return left;
  }

  AccessSqlExpression? _parsePrefix() {
    if (isAtEnd) {
      return null;
    }

    final token = tokens[_index];
    if (token.isWord && token.lexeme == 'NOT') {
      _index++;
      final operand = parseExpression(70);
      return operand == null
          ? null
          : AccessSqlUnaryExpression(operatorLexeme: 'NOT', operand: operand);
    }
    if (token.lexeme == '+' || token.lexeme == '-') {
      _index++;
      final operand = parseExpression(70);
      return operand == null
          ? null
          : AccessSqlUnaryExpression(operatorLexeme: token.lexeme, operand: operand);
    }
    return _parsePrimary();
  }

  AccessSqlExpression? _parsePrimary() {
    if (isAtEnd) {
      return null;
    }

    final token = tokens[_index];
    if (token.lexeme == '(') {
      _index++;
      final expression = parseExpression();
      if (expression == null || !_matchLexeme(')')) {
        return null;
      }
      return expression;
    }

    if (token.lexeme == '*') {
      _index++;
      return const AccessSqlWildcardExpression();
    }

    if (token.kind == AccessSqlTokenKind.number ||
        token.kind == AccessSqlTokenKind.stringLiteral) {
      _index++;
      return AccessSqlLiteralExpression(token.lexeme);
    }

    if (token.isWord &&
        (token.lexeme == 'NULL' || token.lexeme == 'TRUE' || token.lexeme == 'FALSE')) {
      _index++;
      return AccessSqlLiteralExpression(token.lexeme);
    }

    if (token.isWord) {
      return _parseWordBasedPrimary();
    }

    return null;
  }

  AccessSqlExpression? _parseWordBasedPrimary() {
    final identifier = _consumeQualifiedIdentifier();
    if (identifier == null) {
      return null;
    }

    if (_matchLexeme('(')) {
      final arguments = <AccessSqlExpression>[];
      if (!_checkLexeme(')')) {
        while (true) {
          final argument = parseExpression();
          if (argument == null) {
            return null;
          }
          arguments.add(argument);
          if (_matchLexeme(',')) {
            continue;
          }
          break;
        }
      }
      if (!_matchLexeme(')')) {
        return null;
      }
      return AccessSqlFunctionCallExpression(
        name: identifier.canonicalize(),
        arguments: arguments,
      );
    }

    return identifier;
  }

  AccessSqlIdentifierExpression? _consumeQualifiedIdentifier() {
    if (isAtEnd || !tokens[_index].isWord) {
      return null;
    }

    final parts = <String>[tokens[_index].lexeme];
    _index++;
    while (!isAtEnd) {
      final separator = tokens[_index].lexeme;
      if ((separator != '.' && separator != '!') || _index + 1 >= tokens.length) {
        break;
      }
      final next = tokens[_index + 1];
      if (!next.isWord && next.lexeme != '*') {
        break;
      }
      parts.add(separator);
      parts.add(next.lexeme);
      _index += 2;
    }
    return AccessSqlIdentifierExpression(parts);
  }

  String? _peekBinaryOperator() {
    if (isAtEnd) {
      return null;
    }
    final token = tokens[_index];
    switch (token.lexeme) {
      case 'OR':
      case 'AND':
      case '=':
      case '<':
      case '>':
      case '<=':
      case '>=':
      case '<>':
      case '!=':
      case '&':
      case '+':
      case '-':
      case '*':
      case '/':
        return token.lexeme;
      default:
        return null;
    }
  }

  int _precedenceOf(String operatorLexeme) {
    switch (operatorLexeme) {
      case 'OR':
        return 10;
      case 'AND':
        return 20;
      case 'BETWEEN':
      case 'IN':
      case 'IS':
      case 'LIKE':
      case '=':
      case '<':
      case '>':
      case '<=':
      case '>=':
      case '<>':
      case '!=':
        return 30;
      case '&':
        return 40;
      case '+':
      case '-':
        return 50;
      case '*':
      case '/':
        return 60;
      default:
        return -1;
    }
  }

  bool _matchLexeme(String lexeme) {
    if (_checkLexeme(lexeme)) {
      _index++;
      return true;
    }
    return false;
  }

  bool _checkLexeme(String lexeme) => !isAtEnd && tokens[_index].lexeme == lexeme;

  _SpecialOperator? _peekSpecialOperator() {
    if (isAtEnd) {
      return null;
    }

    final current = tokens[_index];
    if (!current.isWord) {
      return null;
    }

    switch (current.lexeme) {
      case 'IS':
        return const _SpecialOperator('IS');
      case 'BETWEEN':
        return const _SpecialOperator('BETWEEN');
      case 'IN':
        return const _SpecialOperator('IN');
      case 'LIKE':
        return const _SpecialOperator('LIKE');
      case 'NOT':
        final next = _peekLexeme(1);
        if (next == 'BETWEEN' || next == 'IN' || next == 'LIKE') {
          return _SpecialOperator(next!, negated: true);
        }
    }

    return null;
  }

  AccessSqlExpression? _parseSpecialOperator(
    AccessSqlExpression left,
    _SpecialOperator special,
  ) {
    if (special.negated) {
      _index++;
    }

    switch (special.operatorLexeme) {
      case 'IS':
        _index++;
        final negated = _matchLexeme('NOT');
        if (!_matchLexeme('NULL')) {
          return null;
        }
        return AccessSqlIsNullExpression(value: left, negated: negated);
      case 'BETWEEN':
        _index++;
        final lower = parseExpression(_precedenceOf('BETWEEN') + 1);
        if (lower == null || !_matchLexeme('AND')) {
          return null;
        }
        final upper = parseExpression(_precedenceOf('BETWEEN') + 1);
        if (upper == null) {
          return null;
        }
        return AccessSqlBetweenExpression(
          value: left,
          lower: lower,
          upper: upper,
          negated: special.negated,
        );
      case 'IN':
        _index++;
        return _parseInExpression(left, special.negated);
      case 'LIKE':
        _index++;
        final pattern = parseExpression(_precedenceOf('LIKE') + 1);
        if (pattern == null) {
          return null;
        }
        AccessSqlExpression? escape;
        if (_matchLexeme('ESCAPE')) {
          escape = parseExpression(_precedenceOf('LIKE') + 1);
          if (escape == null) {
            return null;
          }
        }
        return AccessSqlLikeExpression(
          value: left,
          pattern: pattern,
          escape: escape,
          negated: special.negated,
        );
    }

    return null;
  }

  AccessSqlExpression? _parseInExpression(AccessSqlExpression left, bool negated) {
    if (!_matchLexeme('(')) {
      return null;
    }

    if (_startsSubquery()) {
      final rawSql = _consumeBalancedGroupSql();
      if (rawSql == null) {
        return null;
      }
      return AccessSqlInExpression(
        value: left,
        items: <AccessSqlExpression>[AccessSqlRawExpression(rawSql)],
        negated: negated,
        isSubquery: true,
      );
    }

    final items = <AccessSqlExpression>[];
    if (!_checkLexeme(')')) {
      while (true) {
        final item = parseExpression();
        if (item == null) {
          return null;
        }
        items.add(item);
        if (_matchLexeme(',')) {
          continue;
        }
        break;
      }
    }

    if (!_matchLexeme(')')) {
      return null;
    }

    return AccessSqlInExpression(
      value: left,
      items: items,
      negated: negated,
      isSubquery: false,
    );
  }

  bool _startsSubquery() {
    final current = _peekLexeme(0);
    return current == 'SELECT' || current == 'TRANSFORM' || current == 'PARAMETERS';
  }

  String? _consumeBalancedGroupSql() {
    final innerTokens = <AccessSqlToken>[];
    var depth = 1;
    while (!isAtEnd) {
      final token = tokens[_index];
      if (token.lexeme == '(') {
        depth++;
      } else if (token.lexeme == ')') {
        depth--;
        if (depth == 0) {
          _index++;
          return _serializeTokens(innerTokens);
        }
      }

      if (depth > 0) {
        innerTokens.add(token);
      }
      _index++;
    }
    return null;
  }

  String? _peekLexeme(int offset) {
    final index = _index + offset;
    if (index < 0 || index >= tokens.length) {
      return null;
    }
    return tokens[index].lexeme;
  }
}

final class _SpecialOperator {
  const _SpecialOperator(this.operatorLexeme, {this.negated = false});

  final String operatorLexeme;
  final bool negated;
}

String _serializeTokens(List<AccessSqlToken> tokens) {
  final buffer = StringBuffer();
  AccessSqlToken? previous;
  for (final token in tokens) {
    if (_needsSpace(previous, token)) {
      buffer.write(' ');
    }
    buffer.write(token.lexeme);
    previous = token;
  }
  return buffer.toString().trim();
}

bool _needsSpace(AccessSqlToken? previous, AccessSqlToken current) {
  if (previous == null) {
    return false;
  }
  if (current.lexeme == ')' || current.lexeme == ',' || current.lexeme == '.') {
    return false;
  }
  if (previous.lexeme == '(' || previous.lexeme == '.' || previous.lexeme == '!') {
    return false;
  }
  if (_isOperator(previous.lexeme) || _isOperator(current.lexeme)) {
    return false;
  }
  return true;
}

bool _isOperator(String lexeme) {
  switch (lexeme) {
    case '=':
    case '<':
    case '>':
    case '<=':
    case '>=':
    case '<>':
    case '!=':
    case '+':
    case '-':
    case '*':
    case '/':
    case '&':
    case ':':
      return true;
    default:
      return false;
  }
}

String _wrapIfNeeded(AccessSqlExpression expression) {
  if (expression is AccessSqlBinaryExpression) {
    return '(${expression.canonicalize()})';
  }
  return expression.canonicalize();
}

String _wrapBinarySide(AccessSqlExpression expression) {
  if (expression is AccessSqlBinaryExpression &&
      (expression.operatorLexeme == 'AND' || expression.operatorLexeme == 'OR')) {
    return '(${expression.canonicalize()})';
  }
  return expression.canonicalize();
}

String _wrapLogicalBranch(String parentOperator, AccessSqlExpression expression) {
  if (parentOperator == 'OR' &&
      expression is AccessSqlBinaryExpression &&
      expression.operatorLexeme == 'AND') {
    return '(${expression.canonicalize()})';
  }
  return expression.canonicalize();
}
