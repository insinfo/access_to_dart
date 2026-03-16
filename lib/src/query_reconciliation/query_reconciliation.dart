import 'package:jackcess_dart/jackcess_dart.dart';

import '../access_src_model.dart';
import 'sql_clause_parser.dart';
import 'sql_expression_parser.dart';
import 'sql_token.dart';
import 'sql_tokenizer.dart';

final class QueryReconciliationBuilder {
  QueryReconciliationBuilder({
    AccessSqlTokenizer? tokenizer,
    AccessSqlClauseParser? parser,
      AccessSqlExpressionParser? expressionParser,
  })  : _tokenizer = tokenizer ?? const AccessSqlTokenizer(),
      _parser = parser ?? const AccessSqlClauseParser(),
      _expressionParser = expressionParser ?? const AccessSqlExpressionParser();

  final AccessSqlTokenizer _tokenizer;
  final AccessSqlClauseParser _parser;
    final AccessSqlExpressionParser _expressionParser;

  Map<String, Object?> build(
    List<AccessQueryDef> binaryQueries,
    List<AccessSrcQuery> sourceQueries,
  ) {
    final binaryByName = <String, AccessQueryDef>{
      for (final query in binaryQueries) query.name.toLowerCase(): query,
    };
    final sourceByName = <String, AccessSrcQuery>{
      for (final query in sourceQueries) query.name.toLowerCase(): query,
    };

    final names = <String>{...binaryByName.keys, ...sourceByName.keys}.toList()
      ..sort();

    final entries = <Map<String, Object?>>[];
    var matchedNormalized = 0;
    var matchedRelaxed = 0;
    var matchedStructural = 0;
    var matchedOrderEquivalent = 0;
    var matchedJoinGraph = 0;
    var matchedFromOmitted = 0;
    var matchedSetOperation = 0;
    var mismatched = 0;
    var missingInBinary = 0;
    var missingInSource = 0;
    var missingBinarySql = 0;
    var missingSourceSql = 0;
    final binaryCoverage = _emptyFeatureCoverage();
    final sourceCoverage = _emptyFeatureCoverage();

    for (final key in names) {
      final binary = binaryByName[key];
      final source = sourceByName[key];
      final binaryParsed = _parse(binary?.sqlText);
      final sourceParsed = _parse(source?.semanticSql ?? source?.sql);
      final binaryFeatures = _describeBinaryFeatures(binary, binaryParsed);
      final sourceFeatures = _describeSourceFeatures(source, sourceParsed);

      final normalizedMatches = _normalized(binaryParsed) == _normalized(sourceParsed) &&
          _normalized(binaryParsed) != null;
      final relaxedMatches = _relaxed(binaryParsed) == _relaxed(sourceParsed) &&
          _relaxed(binaryParsed) != null;
      final structuralMatches = _structural(binaryParsed) == _structural(sourceParsed) &&
          _structural(binaryParsed) != null;
      final orderEquivalentMatches =
          _withoutOrder(binaryParsed) == _withoutOrder(sourceParsed) &&
              _withoutOrder(binaryParsed) != null;
      final joinGraphMatches = _matchesJoinGraph(binaryParsed, sourceParsed);
      final fromOmittedMatches =
          _withoutFrom(binaryParsed) == _withoutFrom(sourceParsed) &&
              _withoutFrom(binaryParsed) != null;
      final setOperationMatches =
          _matchesSetOperationFallback(binaryParsed, sourceParsed);

      String status;
      if (binary == null) {
        status = 'missing_in_binary';
        missingInBinary++;
      } else if (source == null) {
        status = 'missing_in_source';
        missingInSource++;
      } else if (!(binaryFeatures['hasSql'] as bool) &&
          (sourceFeatures['hasSql'] as bool)) {
        status = 'missing_binary_sql';
        missingBinarySql++;
      } else if ((binaryFeatures['hasSql'] as bool) &&
          !(sourceFeatures['hasSql'] as bool)) {
        status = 'missing_source_sql';
        missingSourceSql++;
      } else if (normalizedMatches) {
        status = 'matched_normalized';
        matchedNormalized++;
      } else if (relaxedMatches) {
        status = 'matched_relaxed';
        matchedRelaxed++;
      } else if (structuralMatches) {
        status = 'matched_structural';
        matchedStructural++;
      } else if (orderEquivalentMatches) {
        status = 'matched_order_equivalent';
        matchedOrderEquivalent++;
      } else if (joinGraphMatches) {
        status = 'matched_join_graph';
        matchedJoinGraph++;
      } else if (fromOmittedMatches) {
        status = 'matched_from_omitted';
        matchedFromOmitted++;
      } else if (setOperationMatches) {
        status = 'matched_set_operation';
        matchedSetOperation++;
      } else {
        status = 'mismatch';
        mismatched++;
      }

      _accumulateFeatureCoverage(binaryCoverage, binaryFeatures);
      _accumulateFeatureCoverage(sourceCoverage, sourceFeatures);

      entries.add(<String, Object?>{
        'name': binary?.name ?? source?.name ?? key,
        'status': status,
        'binaryQueryType': binary?.queryTypeName,
        'hasBinarySql': binaryFeatures['hasSql'],
        'hasSourceSql': sourceFeatures['hasSql'],
        'hasSourceBas': sourceFeatures['hasBas'],
        'normalizedSqlMatches': normalizedMatches,
        'relaxedSqlMatches': relaxedMatches,
        'structuralSqlMatches': structuralMatches,
        'orderEquivalentSqlMatches': orderEquivalentMatches,
        'joinGraphSqlMatches': joinGraphMatches,
        'fromOmittedSqlMatches': fromOmittedMatches,
        'setOperationSqlMatches': setOperationMatches,
        'binaryFeatures': binaryFeatures,
        'sourceFeatures': sourceFeatures,
        if (status == 'mismatch' || status == 'missing_in_binary')
          'sourceSql': source?.semanticSql ?? source?.sql,
        if (status == 'mismatch' ||
            status == 'missing_in_source' ||
            status == 'missing_binary_sql')
          'binarySql': binary?.sqlText,
        if (status == 'mismatch' || status == 'missing_binary_sql')
          'sourceBasText': source?.basText,
      });
    }

    return <String, Object?>{
      'summary': <String, Object?>{
        'binaryQueries': binaryQueries.length,
        'sourceQueries': sourceQueries.length,
        'matchedNormalized': matchedNormalized,
        'matchedRelaxed': matchedRelaxed,
        'matchedStructural': matchedStructural,
        'matchedOrderEquivalent': matchedOrderEquivalent,
        'matchedJoinGraph': matchedJoinGraph,
        'matchedFromOmitted': matchedFromOmitted,
        'matchedSetOperation': matchedSetOperation,
        'mismatched': mismatched,
        'missingInBinary': missingInBinary,
        'missingInSource': missingInSource,
        'missingBinarySql': missingBinarySql,
        'missingSourceSql': missingSourceSql,
      },
      'featureCoverage': <String, Object?>{
        'binary': binaryCoverage,
        'source': sourceCoverage,
      },
      'entries': entries,
    };
  }

  _ParsedSql? _parse(String? sql) {
    if (sql == null || sql.trim().isEmpty) {
      return null;
    }
    final tokens = _tokenizer.tokenize(sql);
    final statement = _parser.parse(tokens);
    return _ParsedSql(sql: sql, tokens: tokens, statement: statement);
  }

  Map<String, int> _emptyFeatureCoverage() => <String, int>{
        'hasSql': 0,
        'hasJoin': 0,
        'hasWhere': 0,
        'hasGroupBy': 0,
        'hasHaving': 0,
        'hasOrderBy': 0,
        'hasBas': 0,
      };

  void _accumulateFeatureCoverage(
    Map<String, int> target,
    Map<String, Object?> features,
  ) {
    for (final entry in target.entries.toList()) {
      if (features[entry.key] == true) {
        target[entry.key] = entry.value + 1;
      }
    }
  }

  Map<String, Object?> _describeBinaryFeatures(
    AccessQueryDef? query,
    _ParsedSql? parsed,
  ) {
    if (query == null) {
      return _emptyFeatureMap();
    }

    bool hasAttribute(int attribute) =>
        query.rows.any((row) => row.attribute == attribute);

    return <String, Object?>{
      'hasSql': parsed != null,
      'hasJoin': hasAttribute(7),
      'hasWhere': hasAttribute(8),
      'hasGroupBy': hasAttribute(9),
      'hasHaving': hasAttribute(10),
      'hasOrderBy': hasAttribute(11),
      'hasBas': false,
    };
  }

  Map<String, Object?> _describeSourceFeatures(
    AccessSrcQuery? query,
    _ParsedSql? parsed,
  ) {
    final statement = parsed?.statement;
    return <String, Object?>{
      'hasSql': parsed != null,
      'hasJoin': statement != null && _containsWord(statement.fromTokens, 'JOIN'),
      'hasWhere': statement != null && statement.whereTokens.isNotEmpty,
      'hasGroupBy': statement != null && statement.groupByTokens.isNotEmpty,
      'hasHaving': statement != null && statement.havingTokens.isNotEmpty,
      'hasOrderBy': statement != null && statement.orderByTokens.isNotEmpty,
      'hasBas': query?.basText?.trim().isNotEmpty ?? false,
    };
  }

  Map<String, Object?> _emptyFeatureMap() => <String, Object?>{
        'hasSql': false,
        'hasJoin': false,
        'hasWhere': false,
        'hasGroupBy': false,
        'hasHaving': false,
        'hasOrderBy': false,
        'hasBas': false,
      };

  bool _containsWord(List<AccessSqlToken> tokens, String word) =>
      tokens.any((token) => token.isWord && token.lexeme == word);

  String? _normalized(_ParsedSql? parsed) =>
      parsed == null ? null : _serialize(parsed.tokens);

  String? _relaxed(_ParsedSql? parsed) {
    final statement = parsed?.statement;
    if (statement == null) {
      return null;
    }
    if (statement.isSetOrActionQuery) {
      return _serialize(statement.tokens);
    }

    final selectTokens = _stripDistinct(statement.selectTokens);
    return _serializeCanonicalStatementParts(
      selectSql: _canonicalizeSelectListForStatement(
        selectTokens,
        statement.groupByTokens,
      ),
      fromSql: _serialize(statement.fromTokens),
      whereSql: _canonicalizeExpression(_stripWrappingParens(statement.whereTokens)),
      groupBySql: _canonicalizeGroupBy(statement.groupByTokens),
      havingSql: _canonicalizeHaving(statement.havingTokens),
      orderBySql: _canonicalizeOrderBy(statement.orderByTokens),
    );
  }

  String? _structural(_ParsedSql? parsed) {
    final statement = parsed?.statement;
    if (statement == null || statement.isSetOrActionQuery) {
      return null;
    }
    return _serializeCanonicalStatementParts(
      selectSql: _canonicalizeSelectListForStatement(
        statement.selectTokens,
        statement.groupByTokens,
      ),
      whereSql: _canonicalizeExpression(_stripWrappingParens(statement.whereTokens)),
      groupBySql: _canonicalizeGroupBy(statement.groupByTokens),
      havingSql: _canonicalizeHaving(statement.havingTokens),
      orderBySql: _canonicalizeOrderBy(statement.orderByTokens),
    );
  }

  String? _withoutOrder(_ParsedSql? parsed) {
    final statement = parsed?.statement;
    if (statement == null || statement.isSetOrActionQuery) {
      return null;
    }
    return _serializeCanonicalStatementParts(
      selectSql: _canonicalizeSelectListForStatement(
        _stripDistinct(statement.selectTokens),
        statement.groupByTokens,
      ),
      fromSql: _serialize(statement.fromTokens),
      whereSql: _canonicalizeExpression(_stripWrappingParens(statement.whereTokens)),
      groupBySql: _canonicalizeGroupBy(statement.groupByTokens),
      havingSql: _canonicalizeHaving(statement.havingTokens),
    );
  }

  String? _withoutFrom(_ParsedSql? parsed) {
    final statement = parsed?.statement;
    if (statement == null || statement.isSetOrActionQuery) {
      return null;
    }
    return _serializeCanonicalStatementParts(
      selectSql: _canonicalizeSelectListForStatement(
        statement.selectTokens,
        statement.groupByTokens,
      ),
      fromPlaceholder: '<OMITTED>',
      whereSql: _canonicalizeExpression(_stripWrappingParens(statement.whereTokens)),
      groupBySql: _canonicalizeGroupBy(statement.groupByTokens),
      havingSql: _canonicalizeHaving(statement.havingTokens),
      orderBySql: _canonicalizeOrderBy(statement.orderByTokens),
    );
  }

  bool _matchesJoinGraph(_ParsedSql? binary, _ParsedSql? source) {
    final binaryStatement = binary?.statement;
    final sourceStatement = source?.statement;
    if (binaryStatement == null || sourceStatement == null) {
      return false;
    }
    if (binaryStatement.isSetOrActionQuery || sourceStatement.isSetOrActionQuery) {
      return false;
    }

    final binaryTables = _extractFromTables(binaryStatement.fromTokens);
    final sourceTables = _extractFromTables(sourceStatement.fromTokens);
    final knownTables = <String>{...binaryTables, ...sourceTables};
    final binaryReferencedTables =
        _extractKnownTableReferences(binaryStatement, knownTables);
    final sourceReferencedTables =
        _extractKnownTableReferences(sourceStatement, knownTables);

    final binaryWithoutFrom = _serializeCanonicalStatementParts(
      selectSql: _canonicalizeSelectListForStatement(
        _stripDistinct(binaryStatement.selectTokens),
        binaryStatement.groupByTokens,
      ),
      fromPlaceholder: '<JOIN_GRAPH>',
      whereSql: _canonicalizeExpression(
        _stripWrappingParens(binaryStatement.whereTokens),
      ),
      groupBySql: _canonicalizeGroupBy(binaryStatement.groupByTokens),
      havingSql: _canonicalizeHaving(binaryStatement.havingTokens),
    );
    final sourceWithoutFrom = _serializeCanonicalStatementParts(
      selectSql: _canonicalizeSelectListForStatement(
        _stripDistinct(sourceStatement.selectTokens),
        sourceStatement.groupByTokens,
      ),
      fromPlaceholder: '<JOIN_GRAPH>',
      whereSql: _canonicalizeExpression(
        _stripWrappingParens(sourceStatement.whereTokens),
      ),
      groupBySql: _canonicalizeGroupBy(sourceStatement.groupByTokens),
      havingSql: _canonicalizeHaving(sourceStatement.havingTokens),
    );
    if (binaryWithoutFrom != sourceWithoutFrom) {
      return false;
    }

    final binaryEffectiveTables = <String>{
      ...binaryTables,
      ...binaryReferencedTables,
    };
    final sourceEffectiveTables = <String>{
      ...sourceTables,
      ...sourceReferencedTables,
    };

    if (binaryEffectiveTables.isEmpty || sourceEffectiveTables.isEmpty) {
      return false;
    }

    if (!binaryEffectiveTables.containsAll(sourceEffectiveTables)) {
      return false;
    }

    if (sourceEffectiveTables.containsAll(binaryEffectiveTables)) {
      return true;
    }

    final sourceHasLostJoinContext =
        sourceReferencedTables.any((table) => !sourceTables.contains(table)) ||
            sourceTables.length < binaryTables.length;
    if (!sourceHasLostJoinContext) {
      return false;
    }

    return true;
  }

  Set<String> _extractKnownTableReferences(
    AccessSqlStatement statement,
    Set<String> knownTables,
  ) {
    final result = <String>{};
    final tokens = <AccessSqlToken>[
      ...statement.selectTokens,
      ...statement.whereTokens,
      ...statement.groupByTokens,
      ...statement.havingTokens,
      ...statement.orderByTokens,
    ];

    for (var index = 0; index + 2 < tokens.length; index++) {
      final current = tokens[index];
      final separator = tokens[index + 1];
      final next = tokens[index + 2];
      if (!current.isWord || !next.isWord) {
        continue;
      }
      if (separator.lexeme != '.' && separator.lexeme != '!') {
        continue;
      }
      if (knownTables.contains(current.lexeme)) {
        result.add(current.lexeme);
      }
    }

    return result;
  }

  bool _matchesSetOperationFallback(_ParsedSql? binary, _ParsedSql? source) {
    if (binary == null || source == null) {
      return false;
    }
    final sourceStatement = source.statement;
    if (sourceStatement == null || !sourceStatement.isSetOrActionQuery) {
      return false;
    }
    final tokens = binary.tokens;
    return tokens.length == 2 &&
        tokens[0].isWord &&
        tokens[0].lexeme == 'SELECT' &&
        tokens[1].lexeme == '*';
  }

  List<AccessSqlToken> _stripDistinct(List<AccessSqlToken> tokens) {
    if (tokens.isEmpty) {
      return tokens;
    }
    if (tokens.first.isWord &&
        (tokens.first.lexeme == 'DISTINCT' ||
            tokens.first.lexeme == 'DISTINCTROW')) {
      return tokens.sublist(1);
    }
    return tokens;
  }

  List<AccessSqlToken> _stripWrappingParens(List<AccessSqlToken> tokens) {
    var current = List<AccessSqlToken>.from(tokens);
    while (current.length >= 2 &&
        current.first.lexeme == '(' &&
        current.last.lexeme == ')' &&
        _isWrappedBySinglePair(current)) {
      current = current.sublist(1, current.length - 1);
    }
    return current;
  }

  bool _isWrappedBySinglePair(List<AccessSqlToken> tokens) {
    var depth = 0;
    for (var index = 0; index < tokens.length; index++) {
      final token = tokens[index];
      if (token.lexeme == '(') {
        depth++;
      } else if (token.lexeme == ')') {
        depth--;
        if (depth == 0 && index != tokens.length - 1) {
          return false;
        }
      }
    }
    return depth == 0;
  }

  String _serializeCanonicalStatementParts({
    required String selectSql,
    String? fromSql,
    String? fromPlaceholder,
    String? whereSql,
    String? groupBySql,
    String? havingSql,
    String? orderBySql,
  }) {
    final parts = <String>[
      'SELECT $selectSql',
      if (fromPlaceholder != null) 'FROM $fromPlaceholder',
      if (fromPlaceholder == null && fromSql != null && fromSql.isNotEmpty)
        'FROM $fromSql',
      if (whereSql != null && whereSql.isNotEmpty) 'WHERE $whereSql',
      if (groupBySql != null && groupBySql.isNotEmpty) 'GROUP BY $groupBySql',
      if (havingSql != null && havingSql.isNotEmpty) 'HAVING $havingSql',
      if (orderBySql != null && orderBySql.isNotEmpty) 'ORDER BY $orderBySql',
    ];
    return parts.join(' ');
  }

  String _canonicalizeSelectListForStatement(
    List<AccessSqlToken> selectTokens,
    List<AccessSqlToken> groupByTokens,
  ) {
    final expressions = _selectExpressions(selectTokens);
    if (expressions.isEmpty) {
      return '';
    }

    final canonical = expressions
        .map(_canonicalizeSelectExpression)
        .where((expression) => expression.isNotEmpty)
        .toList();

    if (_selectExpressionsOnlyGroupKeys(expressions, groupByTokens) ||
        _selectExpressionsAreSimpleProjectionSet(expressions)) {
      canonical.sort();
    }

    return canonical.join(', ');
  }

  List<List<AccessSqlToken>> _selectExpressions(List<AccessSqlToken> tokens) {
    final expressions = _splitTopLevel(tokens, separatorLexeme: ',');
    if (expressions.length <= 1) {
      return expressions;
    }

    final filtered = expressions.where((expression) {
      final stripped = _stripWrappingParens(expression);
      return !(stripped.length == 1 && stripped.first.lexeme == '*');
    }).toList();

    return filtered.isEmpty ? expressions : filtered;
  }

  bool _selectExpressionsOnlyGroupKeys(
    List<List<AccessSqlToken>> selectExpressions,
    List<AccessSqlToken> groupByTokens,
  ) {
    if (groupByTokens.isEmpty || selectExpressions.isEmpty) {
      return false;
    }

    final groupBySet = _splitTopLevel(groupByTokens, separatorLexeme: ',')
        .map(_canonicalizeExpression)
        .where((expression) => expression.isNotEmpty)
        .toSet();
    if (groupBySet.isEmpty) {
      return false;
    }

    for (final expression in selectExpressions) {
      final canonical = _canonicalizeSelectExpression(expression);
      if (canonical.isEmpty || canonical.contains(' AS ')) {
        return false;
      }
      if (!groupBySet.contains(canonical)) {
        return false;
      }
    }

    return true;
  }

  bool _selectExpressionsAreSimpleProjectionSet(
    List<List<AccessSqlToken>> selectExpressions,
  ) {
    if (selectExpressions.length <= 1) {
      return false;
    }

    final seen = <String>{};
    for (final expression in selectExpressions) {
      final stripped = _stripWrappingParens(expression);
      if (!_isSimpleProjectionExpression(stripped)) {
        return false;
      }

      final canonical = _canonicalizeSelectExpression(stripped);
      if (canonical.isEmpty || canonical.contains(' AS ') || !seen.add(canonical)) {
        return false;
      }
    }

    return true;
  }

  bool _isSimpleProjectionExpression(List<AccessSqlToken> tokens) {
    if (tokens.isEmpty) {
      return false;
    }
    if (tokens.length == 1) {
      return tokens.first.lexeme == '*' || tokens.first.isWord;
    }
    if (tokens.length == 3 &&
        tokens.first.isWord &&
        (tokens[1].lexeme == '.' || tokens[1].lexeme == '!') &&
        (tokens[2].isWord || tokens[2].lexeme == '*')) {
      return true;
    }
    return false;
  }

  String _canonicalizeGroupBy(List<AccessSqlToken> tokens) {
    final expressions = _splitTopLevel(tokens, separatorLexeme: ',')
        .map(_canonicalizeExpression)
        .where((expression) => expression.isNotEmpty)
        .toList()
      ..sort();
    return expressions.join(', ');
  }

  String _canonicalizeHaving(List<AccessSqlToken> tokens) {
    return _canonicalizeExpression(tokens);
  }

  String _canonicalizeOrderBy(List<AccessSqlToken> tokens) {
    final expressions = _splitTopLevel(tokens, separatorLexeme: ',');
    return expressions
        .map((expression) {
          if (expression.isEmpty) {
            return '';
          }

          final last = expression.last;
          if (last.isWord && (last.lexeme == 'ASC' || last.lexeme == 'DESC')) {
            final base = _canonicalizeExpression(expression.sublist(0, expression.length - 1));
            return '$base ${last.lexeme}';
          }
          return _canonicalizeExpression(expression);
        })
        .where((expression) => expression.isNotEmpty)
        .join(', ');
  }

  String _canonicalizeSelectExpression(List<AccessSqlToken> tokens) {
    final stripped = _stripWrappingParens(tokens);
    if (stripped.isEmpty) {
      return '';
    }

    if (stripped.length == 3 &&
        stripped.first.isWord &&
        (stripped[1].lexeme == '.' || stripped[1].lexeme == '!') &&
        stripped[2].lexeme == '*') {
      return '*';
    }

    final asIndex = _findTopLevelWordIndex(stripped, 'AS');
    if (asIndex > 0 && asIndex < stripped.length - 1) {
      final expression = _canonicalizeExpression(stripped.sublist(0, asIndex));
      final alias = _serialize(stripped.sublist(asIndex + 1));
      return '$expression AS $alias';
    }

    if (stripped.length >= 2 &&
        stripped.last.isWord &&
        stripped[stripped.length - 2].lexeme != '.' &&
        stripped[stripped.length - 2].lexeme != '!' &&
        !_isKeyword(stripped.last.lexeme)) {
      final expressionTokens = stripped.sublist(0, stripped.length - 1);
      final expression = _canonicalizeExpression(expressionTokens);
      if (expression.isNotEmpty) {
        return '$expression AS ${stripped.last.lexeme}';
      }
    }

    return _canonicalizeExpression(stripped);
  }

  String _canonicalizeExpression(List<AccessSqlToken> tokens) {
    final stripped = _stripWrappingParens(tokens);
    if (stripped.isEmpty) {
      return '';
    }
    final expression = _expressionParser.parse(stripped);
    return expression?.canonicalize() ?? _serialize(stripped);
  }

  List<List<AccessSqlToken>> _splitTopLevel(
    List<AccessSqlToken> tokens, {
    String? separatorLexeme,
    String? separatorWord,
  }) {
    final parts = <List<AccessSqlToken>>[];
    final current = <AccessSqlToken>[];
    var depth = 0;

    for (final token in tokens) {
      if (token.lexeme == '(') {
        depth++;
        current.add(token);
        continue;
      }
      if (token.lexeme == ')') {
        depth = depth > 0 ? depth - 1 : 0;
        current.add(token);
        continue;
      }

      final isSeparator = depth == 0 &&
          ((separatorLexeme != null && token.lexeme == separatorLexeme) ||
              (separatorWord != null && token.isWord && token.lexeme == separatorWord));
      if (isSeparator) {
        parts.add(List<AccessSqlToken>.unmodifiable(current.toList()));
        current.clear();
        continue;
      }

      current.add(token);
    }

    if (current.isNotEmpty) {
      parts.add(List<AccessSqlToken>.unmodifiable(current.toList()));
    }

    return parts;
  }

  int _findTopLevelWordIndex(List<AccessSqlToken> tokens, String word) {
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
      if (depth == 0 && token.isWord && token.lexeme == word) {
        return index;
      }
    }
    return -1;
  }

  bool _isKeyword(String lexeme) {
    switch (lexeme) {
      case 'FROM':
      case 'WHERE':
      case 'GROUP':
      case 'BY':
      case 'HAVING':
      case 'ORDER':
      case 'AND':
      case 'OR':
      case 'ASC':
      case 'DESC':
      case 'INNER':
      case 'LEFT':
      case 'RIGHT':
      case 'FULL':
      case 'OUTER':
      case 'JOIN':
      case 'ON':
        return true;
      default:
        return false;
    }
  }

  List<String> _extractFromTables(List<AccessSqlToken> tokens) {
    final tables = <String>{};
    var expectTable = true;

    for (var index = 0; index < tokens.length; index++) {
      final token = tokens[index];
      if (token.lexeme == ',') {
        expectTable = true;
        continue;
      }
      if (token.isWord && token.lexeme == 'JOIN') {
        expectTable = true;
        continue;
      }
      if (token.isWord &&
          (token.lexeme == 'INNER' ||
              token.lexeme == 'LEFT' ||
              token.lexeme == 'RIGHT' ||
              token.lexeme == 'FULL' ||
              token.lexeme == 'OUTER' ||
              token.lexeme == 'CROSS')) {
        continue;
      }
      if (!expectTable || !token.isWord) {
        continue;
      }

      final buffer = <String>[token.lexeme];
      var cursor = index + 1;
      while (cursor + 1 < tokens.length &&
          tokens[cursor].lexeme == '.' &&
          tokens[cursor + 1].isWord) {
        buffer.add(tokens[cursor].lexeme);
        buffer.add(tokens[cursor + 1].lexeme);
        cursor += 2;
      }
      tables.add(buffer.join());
      expectTable = false;
    }

    final sorted = tables.toList()..sort();
    return sorted;
  }

  String _serialize(List<AccessSqlToken> tokens) {
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
}

final class _ParsedSql {
  _ParsedSql({
    required this.sql,
    required this.tokens,
    required this.statement,
  });

  final String sql;
  final List<AccessSqlToken> tokens;
  final AccessSqlStatement? statement;
}
