import 'sql_token.dart';

final class AccessSqlTokenizer {
  const AccessSqlTokenizer();

  List<AccessSqlToken> tokenize(String sql) {
    final tokens = <AccessSqlToken>[];
    var index = 0;

    while (index < sql.length) {
      final char = sql[index];

      if (_isWhitespace(char)) {
        index++;
        continue;
      }

      if (char == ';') {
        index++;
        continue;
      }

      if (char == '[') {
        final buffer = StringBuffer();
        index++;
        while (index < sql.length) {
          final current = sql[index];
          if (current == ']') {
            if (index + 1 < sql.length && sql[index + 1] == ']') {
              buffer.write(']');
              index += 2;
              continue;
            }
            index++;
            break;
          }
          buffer.write(current);
          index++;
        }
        tokens.add(AccessSqlToken(
          AccessSqlTokenKind.word,
          buffer.toString().toUpperCase(),
        ));
        continue;
      }

      if (char == '"' || char == '\'') {
        final quote = char;
        final buffer = StringBuffer()..write(quote);
        index++;
        while (index < sql.length) {
          final current = sql[index];
          buffer.write(current);
          index++;
          if (current == quote) {
            if (index < sql.length && sql[index] == quote) {
              buffer.write(sql[index]);
              index++;
              continue;
            }
            break;
          }
        }
        tokens.add(AccessSqlToken(
          AccessSqlTokenKind.stringLiteral,
          buffer.toString().toUpperCase(),
        ));
        continue;
      }

      if (_isDigit(char)) {
        final start = index;
        index++;
        var sawDecimalSeparator = false;
        while (index < sql.length) {
          final current = sql[index];
          if (_isDigit(current)) {
            index++;
            continue;
          }
          if (!sawDecimalSeparator &&
              (current == '.' || current == ',') &&
              index + 1 < sql.length &&
              _isDigit(sql[index + 1])) {
            sawDecimalSeparator = true;
            index++;
            continue;
          }
          break;
        }
        tokens.add(AccessSqlToken(
          AccessSqlTokenKind.number,
          sql.substring(start, index).toUpperCase(),
        ));
        continue;
      }

      if (_isWordStart(char)) {
        final start = index;
        index++;
        while (index < sql.length && _isWordPart(sql[index])) {
          index++;
        }
        tokens.add(AccessSqlToken(
          AccessSqlTokenKind.word,
          sql.substring(start, index).toUpperCase(),
        ));
        continue;
      }

      if (index + 1 < sql.length) {
        final compound = sql.substring(index, index + 2);
        if (compound == '<=' ||
            compound == '>=' ||
            compound == '<>' ||
            compound == '!=') {
          tokens.add(AccessSqlToken(AccessSqlTokenKind.symbol, compound));
          index += 2;
          continue;
        }
      }

      tokens.add(AccessSqlToken(AccessSqlTokenKind.symbol, char));
      index++;
    }

    return tokens;
  }

  bool _isWhitespace(String char) =>
      char == ' ' || char == '\n' || char == '\r' || char == '\t';

  bool _isDigit(String char) {
    final code = char.codeUnitAt(0);
    return code >= 48 && code <= 57;
  }
  bool _isWordStart(String char) {
    final code = char.codeUnitAt(0);
    return (code >= 65 && code <= 90) ||
        (code >= 97 && code <= 122) ||
        char == '_' ||
        char == '@' ||
        char == '#' ||
        code > 127;
  }

  bool _isWordPart(String char) =>
      _isWordStart(char) || _isDigit(char) || char == r'$';
}
