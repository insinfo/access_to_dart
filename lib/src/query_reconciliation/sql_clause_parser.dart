import 'sql_token.dart';

final class AccessSqlStatement {
  AccessSqlStatement({
    required this.tokens,
    required this.selectTokens,
    required this.fromTokens,
    required this.whereTokens,
    required this.groupByTokens,
    required this.havingTokens,
    required this.orderByTokens,
    required this.hasUnion,
    required this.isTransform,
    required this.isActionQuery,
  });

  final List<AccessSqlToken> tokens;
  final List<AccessSqlToken> selectTokens;
  final List<AccessSqlToken> fromTokens;
  final List<AccessSqlToken> whereTokens;
  final List<AccessSqlToken> groupByTokens;
  final List<AccessSqlToken> havingTokens;
  final List<AccessSqlToken> orderByTokens;
  final bool hasUnion;
  final bool isTransform;
  final bool isActionQuery;

  bool get isSetOrActionQuery => hasUnion || isTransform || isActionQuery;
}

final class AccessSqlClauseParser {
  const AccessSqlClauseParser();

  AccessSqlStatement? parse(List<AccessSqlToken> tokens) {
    if (tokens.isEmpty) {
      return null;
    }

    final firstWord = _firstWord(tokens);
    final isTransform = firstWord == 'TRANSFORM';
    final isActionQuery = firstWord == 'INSERT' ||
        firstWord == 'UPDATE' ||
        firstWord == 'DELETE' ||
        firstWord == 'PARAMETERS';
    final hasUnion = _containsTopLevelSetOperator(tokens);

    if (isTransform || hasUnion || isActionQuery) {
      return AccessSqlStatement(
        tokens: tokens,
        selectTokens: const [],
        fromTokens: const [],
        whereTokens: const [],
        groupByTokens: const [],
        havingTokens: const [],
        orderByTokens: const [],
        hasUnion: hasUnion,
        isTransform: isTransform,
        isActionQuery: isActionQuery,
      );
    }

    final selectIndex = _findTopLevelWord(tokens, 'SELECT');
    final fromIndex = _findTopLevelWord(tokens, 'FROM');
    if (selectIndex == -1 || fromIndex == -1 || fromIndex <= selectIndex) {
      return null;
    }

    final whereIndex = _findTopLevelWord(tokens, 'WHERE');
    final groupByIndex = _findTopLevelPhrase(tokens, const ['GROUP', 'BY']);
    final havingIndex = _findTopLevelWord(tokens, 'HAVING');
    final orderByIndex = _findTopLevelPhrase(tokens, const ['ORDER', 'BY']);

    int nextBoundary(List<int> indexes, int fallback) {
      final valid = indexes.where((index) => index >= 0).toList()..sort();
      return valid.isEmpty ? fallback : valid.first;
    }

    List<AccessSqlToken> slice(int start, int end, int offset) =>
        List.unmodifiable(tokens.sublist(start + offset, end));

    return AccessSqlStatement(
      tokens: tokens,
      selectTokens: slice(selectIndex, fromIndex, 1),
      fromTokens: slice(
        fromIndex,
        nextBoundary(
          [whereIndex, groupByIndex, havingIndex, orderByIndex],
          tokens.length,
        ),
        1,
      ),
      whereTokens: whereIndex == -1
          ? const []
          : slice(
              whereIndex,
              nextBoundary([groupByIndex, havingIndex, orderByIndex], tokens.length),
              1,
            ),
      groupByTokens: groupByIndex == -1
          ? const []
          : slice(
              groupByIndex,
              nextBoundary([havingIndex, orderByIndex], tokens.length),
              2,
            ),
      havingTokens: havingIndex == -1
          ? const []
          : slice(
              havingIndex,
              nextBoundary([orderByIndex], tokens.length),
              1,
            ),
      orderByTokens:
          orderByIndex == -1 ? const [] : slice(orderByIndex, tokens.length, 2),
      hasUnion: false,
      isTransform: false,
      isActionQuery: false,
    );
  }

  String? _firstWord(List<AccessSqlToken> tokens) {
    for (final token in tokens) {
      if (token.isWord) {
        return token.lexeme;
      }
    }
    return null;
  }

  bool _containsTopLevelSetOperator(List<AccessSqlToken> tokens) {
    var depth = 0;
    for (var index = 0; index < tokens.length; index++) {
      final token = tokens[index];
      if (token.lexeme == '(') {
        depth++;
        continue;
      }
      if (token.lexeme == ')') {
        depth = depth > 0 ? depth - 1 : 0;
        continue;
      }
      if (depth != 0 || !token.isWord || token.lexeme != 'UNION') {
        continue;
      }

      var nextIndex = _nextTopLevelWordIndex(tokens, index + 1);
      if (nextIndex == -1) {
        continue;
      }

      final nextWord = tokens[nextIndex].lexeme;
      if (nextWord == 'ALL' || nextWord == 'DISTINCT') {
        nextIndex = _nextTopLevelWordIndex(tokens, nextIndex + 1);
      }

      if (nextIndex != -1 && tokens[nextIndex].lexeme == 'SELECT') {
        return true;
      }
    }
    return false;
  }

  int _nextTopLevelWordIndex(List<AccessSqlToken> tokens, int start) {
    var depth = 0;
    for (var index = start; index < tokens.length; index++) {
      final token = tokens[index];
      if (token.lexeme == '(') {
        depth++;
        continue;
      }
      if (token.lexeme == ')') {
        depth = depth > 0 ? depth - 1 : 0;
        continue;
      }
      if (depth == 0 && token.isWord) {
        return index;
      }
    }
    return -1;
  }

  int _findTopLevelWord(List<AccessSqlToken> tokens, String word) {
    var depth = 0;
    for (var index = 0; index < tokens.length; index++) {
      final token = tokens[index];
      if (token.lexeme == '(') {
        depth++;
      } else if (token.lexeme == ')') {
        depth = depth > 0 ? depth - 1 : 0;
      } else if (depth == 0 && token.isWord && token.lexeme == word) {
        return index;
      }
    }
    return -1;
  }

  int _findTopLevelPhrase(List<AccessSqlToken> tokens, List<String> phrase) {
    var depth = 0;
    for (var index = 0; index < tokens.length - phrase.length + 1; index++) {
      final token = tokens[index];
      if (token.lexeme == '(') {
        depth++;
        continue;
      }
      if (token.lexeme == ')') {
        depth = depth > 0 ? depth - 1 : 0;
        continue;
      }
      if (depth != 0) {
        continue;
      }
      var matched = true;
      for (var offset = 0; offset < phrase.length; offset++) {
        final current = tokens[index + offset];
        if (!current.isWord || current.lexeme != phrase[offset]) {
          matched = false;
          break;
        }
      }
      if (matched) {
        return index;
      }
    }
    return -1;
  }
}
