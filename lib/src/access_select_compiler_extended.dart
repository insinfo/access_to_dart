part of 'access_select_compiler.dart';

final _bindingMarkerPattern = RegExp(r'\u0000B([0-9]+)\u0000');

extension _ExtendedAccessSelectCompiler on _Compiler {
  CompiledAccessSelect _compileExtended(List<String>? outputNames) {
    final shared = _ExtSharedContext(
      parameterTypes: parameterTypes,
      asciiText: asciiText,
      namedSubqueries: namedSubqueries,
    );
    if (take('PARAMETERS')) {
      _parseParametersHeader(shared);
    }
    final parser = _ExtParser(tokens, pos, shared);
    final query = parser.parseQuery();
    pos = parser.pos;
    take(';');
    if (current.kind != 'end') {
      fail('trailing or unsupported clause ${current.value}');
    }

    final engine = _ExtSqlEngine(
      schema: schema,
      ids: ids,
      shared: shared,
      ordinalAliases: ordinalAliases,
    );
    final result = engine.compileQuery(
      query,
      outputNames: outputNames,
      outerUsed: const {},
      activeSubqueries: activeSubqueries,
      isRoot: true,
    );

    if (!inferParameterTypes &&
        (shared.referencedParameters.length != parameterTypes.length ||
            !shared.referencedParameters.containsAll(parameterTypes.keys))) {
      fail('unused parameter declarations');
    }

    final finalBindings = <_Binding>[];
    final sql = result.rawSql.replaceAllMapped(_bindingMarkerPattern, (match) {
      final id = int.parse(match.group(1)!);
      final binding = shared.markerBindings[id];
      finalBindings.add(binding);
      return questionMarks ? '?' : '\$${bindingOffset + finalBindings.length}';
    });

    return CompiledAccessSelect._(
      sql,
      result.outputs,
      finalBindings,
      shared.referencedParameters,
      shared.parameterOrder,
      shared.inferredParameters,
      result.hasExplicitOrdering,
      hasLimit: result.hasLimit,
      isUnion: result.isUnion,
      allowNonAsciiText: true,
    );
  }

  void _parseParametersHeader(_ExtSharedContext shared) {
    while (pos < tokens.length && !at(';') && current.kind != 'end') {
      final prev = pos;
      final parts = <String>[identifier()];
      while (take('!') || take('.')) {
        parts.add(identifier());
      }
      final canonicalName = parts.length > 1
          ? parts.map((p) => '[$p]').join('!')
          : '[${parts.single}]';
      final bareName = parts.join('.');

      final typeTokens = <String>[];
      while (pos < tokens.length &&
          !at(',') &&
          !at(';') &&
          current.kind != 'end') {
        final stepPrev = pos;
        if (take('(')) {
          var depth = 1;
          while (pos < tokens.length && depth > 0 && current.kind != 'end') {
            if (take('(')) {
              depth++;
            } else if (take(')')) {
              depth--;
            } else {
              pos++;
            }
          }
        } else {
          typeTokens.add(tokens[pos++].value.toUpperCase());
        }
        if (pos <= stepPrev) break;
      }
      final daoType = _mapDeclaredParamType(typeTokens.join(' '));
      shared.declaredParameters[canonicalName.toLowerCase()] = daoType;
      shared.declaredParameters[bareName.toLowerCase()] = daoType;
      if (take(';')) {
        return;
      }
      if (!take(',')) {
        fail('expected , or ; in PARAMETERS declaration');
      }
      if (pos <= prev) {
        fail('stalled in PARAMETERS declaration');
      }
    }
    need(';');
  }

  static int _mapDeclaredParamType(String typeSpec) {
    if (typeSpec.contains('BIT') || typeSpec.contains('YESNO')) return 1;
    if (typeSpec.contains('SHORT') ||
        typeSpec.contains('INTEGER') ||
        typeSpec.contains('BYTE')) {
      return 3;
    }
    if (typeSpec.contains('LONG') && !typeSpec.contains('TEXT')) return 4;
    if (typeSpec.contains('CURRENCY')) return 5;
    if (typeSpec.contains('DOUBLE') ||
        typeSpec.contains('SINGLE') ||
        typeSpec.contains('FLOAT')) {
      return 7;
    }
    if (typeSpec.contains('DATE') || typeSpec.contains('TIME')) return 8;
    if (typeSpec.contains('MEMO')) return 12;
    return 10;
  }
}

class _ExtSharedContext {
  final Map<String, int> parameterTypes;
  final bool asciiText;
  final Map<String, String> namedSubqueries;
  final Map<String, int> declaredParameters = {};
  final List<_Binding> markerBindings = [];
  final Set<String> referencedParameters = {};
  final List<String> parameterOrder = [];
  final Map<String, int> inferredParameters = {};

  _ExtSharedContext({
    required this.parameterTypes,
    required this.asciiText,
    required this.namedSubqueries,
  });

  String addBinding(_Binding binding) {
    final idx = markerBindings.length;
    markerBindings.add(binding);
    return '\u0000B$idx\u0000';
  }
}

sealed class _ExtQueryAst {}

class _ExtSelectAst extends _ExtQueryAst {
  final bool distinct;
  final int? topCount;
  final List<_ExtProj> projections;
  final _FromNode? fromTree;
  final _ExtExpr? where;
  final List<_ExtExpr> groupBy;
  final _ExtExpr? having;
  final List<_ExtOrderItem> orderBy;

  _ExtSelectAst({
    required this.distinct,
    required this.topCount,
    required this.projections,
    required this.fromTree,
    required this.where,
    required this.groupBy,
    required this.having,
    required this.orderBy,
  });
}

class _ExtUnionAst extends _ExtQueryAst {
  final List<_ExtSelectAst> branches;
  final List<bool> unionAllFlags;
  final List<_ExtOrderItem> trailingOrderBy;

  _ExtUnionAst(this.branches, this.unionAllFlags, this.trailingOrderBy);
}

class _ExtProj {
  final bool isWildcard;
  final String? tableAlias;
  final _ExtExpr? expr;
  final String? explicitAlias;

  _ExtProj.wildcard({this.tableAlias})
      : isWildcard = true,
        expr = null,
        explicitAlias = null;

  _ExtProj.expr(this.expr, this.explicitAlias)
      : isWildcard = false,
        tableAlias = null;
}

class _ExtOrderItem {
  final _ExtExpr expr;
  final bool descending;
  _ExtOrderItem(this.expr, this.descending);
}

sealed class _FromNode {}

class _FromTable extends _FromNode {
  final String name;
  final String? explicitAlias;
  final _ExtQueryAst? inlineSubquery;
  _FromTable(this.name, this.explicitAlias, {this.inlineSubquery});
}

class _FromJoin extends _FromNode {
  final _FromNode left;
  final String joinKeyword;
  final _FromNode right;
  final _ExtExpr? onExpr;
  _FromJoin(this.left, this.joinKeyword, this.right, this.onExpr);
}

class _ExtExpr {
  final String kind;
  final String? value;
  final String? extra;
  final bool negated;
  final _ExtExpr? left;
  final _ExtExpr? right;
  final _ExtExpr? third;
  final List<_ExtExpr> args;
  final _ExtQueryAst? subquery;

  _ExtExpr(
    this.kind, {
    this.value,
    this.extra,
    this.negated = false,
    this.left,
    this.right,
    this.third,
    this.args = const [],
    this.subquery,
  });
}

class _ExtParser {
  static const _reservedAfterAlias = {
    'FROM',
    'WHERE',
    'GROUP',
    'HAVING',
    'ORDER',
    'UNION',
    'ON',
    'INNER',
    'LEFT',
    'RIGHT',
    'OUTER',
    'JOIN',
  };

  final List<_Token> tokens;
  int pos;
  final _ExtSharedContext? shared;

  _ExtParser(this.tokens, this.pos, [this.shared]);

  _Token get current => tokens[pos];
  _Token? peek(int offset) =>
      pos + offset < tokens.length ? tokens[pos + offset] : null;

  bool at(String v) =>
      current.kind == 'symbol' && current.value == v ||
      current.kind == 'word' && current.value.toUpperCase() == v;

  bool _tokenIs(int offset, String v) {
    final t = peek(offset);
    if (t == null) return false;
    return (t.kind == 'symbol' && t.value == v) ||
        (t.kind == 'word' && t.value.toUpperCase() == v);
  }

  bool take(String v) {
    if (!at(v)) return false;
    pos++;
    return true;
  }

  void need(String v) {
    if (!take(v)) {
      throw FormatException('Unsupported Access SELECT: expected $v at token $pos');
    }
  }

  String identifier() {
    if (current.kind != 'word' && current.kind != 'identifier') {
      throw FormatException(
          'Unsupported Access SELECT: expected identifier at token $pos (${current.value})');
    }
    return tokens[pos++].value;
  }

  bool _looksLikeSelectAt(int offset) {
    var i = offset;
    var steps = 0;
    while (pos + i < tokens.length && steps < 32) {
      final t = tokens[pos + i];
      if (t.kind == 'word' && t.value.toUpperCase() == 'SELECT') return true;
      if (t.kind == 'symbol' && t.value == '(') {
        i++;
        steps++;
        continue;
      }
      return false;
    }
    return false;
  }

  _ExtQueryAst parseQuery() {
    final branches = <_ExtSelectAst>[];
    final unionAllFlags = <bool>[];
    branches.add(_parseSingleSelectOrParen());
    while (take('UNION')) {
      if (branches.length >= 200) {
        throw const FormatException('Unsupported Access SELECT: too many UNION branches');
      }
      final prev = pos;
      unionAllFlags.add(take('ALL'));
      branches.add(_parseSingleSelectOrParen());
      if (pos <= prev) {
        throw const FormatException('Unsupported Access SELECT: malformed UNION branch');
      }
    }
    if (branches.length == 1) {
      return branches.single;
    }
    final trailingOrder = <_ExtOrderItem>[];
    if (take('ORDER')) {
      need('BY');
      trailingOrder.addAll(_parseOrderByList());
    }
    return _ExtUnionAst(branches, unionAllFlags, trailingOrder);
  }

  _ExtSelectAst _parseSingleSelectOrParen() {
    if (at('(') && _looksLikeSelectAt(1)) {
      need('(');
      final inner = _parseSingleSelectOrParen();
      need(')');
      return inner;
    }
    return _parseSelectCore();
  }

  _ExtSelectAst _parseSelectCore() {
    need('SELECT');
    var distinct = false;
    int? topCount;
    for (var i = 0; i < 3; i++) {
      if (take('DISTINCT') || take('DISTINCTROW')) {
        distinct = true;
      } else if (take('TOP')) {
        if (current.kind != 'number') {
          throw const FormatException('Unsupported Access SELECT: TOP expects integer');
        }
        topCount = int.tryParse(tokens[pos++].value);
        if (topCount == null || topCount < 0) {
          throw const FormatException('Unsupported Access SELECT: invalid TOP count');
        }
        if (take('PERCENT')) {
          throw const FormatException('Unsupported Access SELECT: TOP PERCENT unsupported');
        }
      } else {
        break;
      }
    }

    final projections = <_ExtProj>[];
    do {
      final prev = pos;
      if (take('*')) {
        projections.add(_ExtProj.wildcard());
      } else if ((current.kind == 'word' || current.kind == 'identifier') &&
          _tokenIs(1, '.') &&
          _tokenIs(2, '*')) {
        final alias = identifier();
        need('.');
        need('*');
        projections.add(_ExtProj.wildcard(tableAlias: alias));
      } else {
        final expr = _parseExpr();
        String? alias;
        if (take('AS')) {
          alias = identifier();
        } else if ((current.kind == 'word' || current.kind == 'identifier') &&
            !_reservedAfterAlias.contains(current.value.toUpperCase())) {
          alias = identifier();
        }
        projections.add(_ExtProj.expr(expr, alias));
      }
      if (pos <= prev) {
        throw const FormatException('Unsupported Access SELECT: stalled in SELECT list');
      }
    } while (take(','));

    _FromNode? fromTree;
    if (take('FROM')) {
      fromTree = _parseFromList();
    }

    _ExtExpr? where;
    if (take('WHERE')) {
      where = _parseExpr();
    }

    final groupBy = <_ExtExpr>[];
    if (take('GROUP')) {
      need('BY');
      do {
        groupBy.add(_parseExpr());
      } while (take(','));
    }

    _ExtExpr? having;
    if (take('HAVING')) {
      having = _parseExpr();
    }

    final orderBy = <_ExtOrderItem>[];
    if (take('ORDER')) {
      need('BY');
      orderBy.addAll(_parseOrderByList());
    }

    return _ExtSelectAst(
      distinct: distinct,
      topCount: topCount,
      projections: projections,
      fromTree: fromTree,
      where: where,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
    );
  }

  List<_ExtOrderItem> _parseOrderByList() {
    final items = <_ExtOrderItem>[];
    do {
      final expr = _parseExpr();
      var desc = false;
      if (take('DESC')) {
        desc = true;
      } else {
        take('ASC');
      }
      items.add(_ExtOrderItem(expr, desc));
    } while (take(','));
    return items;
  }

  _FromNode _parseFromList() {
    var result = _parseJoinChain();
    while (take(',')) {
      final prev = pos;
      final right = _parseJoinChain();
      result = _FromJoin(result, 'CROSS JOIN', right, null);
      if (pos <= prev) {
        throw const FormatException('Unsupported Access SELECT: stalled in FROM');
      }
    }
    return result;
  }

  _FromNode _parseJoinChain() {
    var result = _parseFromAtom();
    while (true) {
      final prev = pos;
      String? joinKw;
      if (take('INNER')) {
        need('JOIN');
        joinKw = 'INNER JOIN';
      } else if (take('LEFT')) {
        take('OUTER');
        need('JOIN');
        joinKw = 'LEFT JOIN';
      } else if (take('RIGHT')) {
        take('OUTER');
        need('JOIN');
        joinKw = 'RIGHT JOIN';
      }
      if (joinKw == null) break;
      final right = _parseFromAtom();
      need('ON');
      final on = _parseExpr();
      result = _FromJoin(result, joinKw, right, on);
      if (pos <= prev) {
        throw const FormatException('Unsupported Access SELECT: stalled in JOIN');
      }
    }
    return result;
  }

  _FromNode _parseFromAtom() {
    if (take('(')) {
      if (_looksLikeSelectAt(0)) {
        final subq = parseQuery();
        need(')');
        String? alias;
        if (take('AS')) {
          alias = identifier();
        } else if ((current.kind == 'word' || current.kind == 'identifier') &&
            !_reservedAfterAlias.contains(current.value.toUpperCase())) {
          alias = identifier();
        }
        return _FromTable('', alias, inlineSubquery: subq);
      }
      final node = _parseFromList();
      need(')');
      return node;
    }
    final name = identifier();
    String? alias;
    if (take('AS')) {
      alias = identifier();
    } else if ((current.kind == 'word' || current.kind == 'identifier') &&
        !_reservedAfterAlias.contains(current.value.toUpperCase())) {
      alias = identifier();
    }
    return _FromTable(name, alias);
  }

  _ExtExpr _parseExpr() => _parseOr();

  _ExtExpr _parseOr() {
    var left = _parseAnd();
    while (take('OR')) {
      final prev = pos;
      left = _ExtExpr('binary', value: 'OR', left: left, right: _parseAnd());
      if (pos <= prev) break;
    }
    return left;
  }

  _ExtExpr _parseAnd() {
    var left = _parseNot();
    while (take('AND')) {
      final prev = pos;
      left = _ExtExpr('binary', value: 'AND', left: left, right: _parseNot());
      if (pos <= prev) break;
    }
    return left;
  }

  _ExtExpr _parseNot() {
    if (take('NOT')) {
      return _ExtExpr('unary', value: 'NOT', left: _parseNot());
    }
    return _parseComparison();
  }

  _ExtExpr _parseComparison() {
    var left = _parseConcat();
    while (true) {
      final prev = pos;
      if (take('IS')) {
        final negated = take('NOT');
        need('NULL');
        left = _ExtExpr('is_null', negated: negated, left: left);
        continue;
      }
      if (at('NOT') &&
          (_tokenIs(1, 'IN') || _tokenIs(1, 'LIKE') || _tokenIs(1, 'BETWEEN'))) {
        take('NOT');
        if (take('LIKE')) {
          left = _ExtExpr('like', negated: true, left: left, right: _parseConcat());
          continue;
        }
        if (take('BETWEEN')) {
          final low = _parseConcat();
          need('AND');
          final high = _parseConcat();
          left = _ExtExpr('between',
              negated: true, left: left, right: low, third: high);
          continue;
        }
        if (take('IN')) {
          left = _parseInRhs(left, negated: true);
          continue;
        }
      }
      if (take('LIKE')) {
        left = _ExtExpr('like', left: left, right: _parseConcat());
        continue;
      }
      if (take('BETWEEN')) {
        final low = _parseConcat();
        need('AND');
        final high = _parseConcat();
        left = _ExtExpr('between', left: left, right: low, third: high);
        continue;
      }
      if (take('IN')) {
        left = _parseInRhs(left, negated: false);
        continue;
      }
      if (current.kind == 'symbol' &&
          const {'=', '<>', '!=', '<', '<=', '>', '>='}.contains(current.value)) {
        final op = tokens[pos++].value == '!=' ? '<>' : tokens[pos - 1].value;
        left = _ExtExpr('binary', value: op, left: left, right: _parseConcat());
        if (pos <= prev) break;
        continue;
      }
      break;
    }
    return left;
  }

  _ExtExpr _parseInRhs(_ExtExpr left, {required bool negated}) {
    need('(');
    if (_looksLikeSelectAt(0)) {
      final subq = parseQuery();
      need(')');
      return _ExtExpr('in_subquery', negated: negated, left: left, subquery: subq);
    }
    final items = <_ExtExpr>[];
    if (!at(')')) {
      do {
        items.add(_parseExpr());
      } while (take(','));
    }
    need(')');
    return _ExtExpr('in_list', negated: negated, left: left, args: items);
  }

  _ExtExpr _parseConcat() {
    var left = _parseAdditive();
    while (take('&')) {
      final prev = pos;
      left = _ExtExpr('binary', value: '&', left: left, right: _parseAdditive());
      if (pos <= prev) break;
    }
    return left;
  }

  _ExtExpr _parseAdditive() {
    var left = _parseMultiplicative();
    while (at('+') || at('-')) {
      final prev = pos;
      final op = tokens[pos++].value;
      left = _ExtExpr('binary',
          value: op, left: left, right: _parseMultiplicative());
      if (pos <= prev) break;
    }
    return left;
  }

  _ExtExpr _parseMultiplicative() {
    var left = _parseUnary();
    while (at('*') || at('/')) {
      final prev = pos;
      final op = tokens[pos++].value;
      left = _ExtExpr('binary', value: op, left: left, right: _parseUnary());
      if (pos <= prev) break;
    }
    return left;
  }

  _ExtExpr _parseUnary() {
    if (take('-')) {
      return _ExtExpr('unary', value: '-', left: _parseUnary());
    }
    if (take('+')) {
      return _ExtExpr('unary', value: '+', left: _parseUnary());
    }
    return _parsePrimary();
  }

  _ExtExpr _parsePrimary() {
    if (take('(')) {
      final inner = _parseExpr();
      need(')');
      return inner;
    }
    if (take('NULL')) {
      return _ExtExpr('null');
    }
    if (current.kind == 'word' &&
        const {'YES', 'NO', 'TRUE', 'FALSE'}
            .contains(current.value.toUpperCase())) {
      return _ExtExpr('bool', value: tokens[pos++].value.toUpperCase());
    }
    if (current.kind == 'text') {
      return _ExtExpr('text', value: tokens[pos++].value);
    }
    if (current.kind == 'number') {
      return _ExtExpr('number', value: tokens[pos++].value);
    }
    if (current.kind == 'date') {
      return _ExtExpr('date', value: tokens[pos++].value);
    }
    if (current.kind == 'word' && _tokenIs(1, '(')) {
      final fn = tokens[pos++].value;
      need('(');
      final args = <_ExtExpr>[];
      if (!at(')')) {
        do {
          if (take('*')) {
            args.add(_ExtExpr('star'));
          } else {
            args.add(_parseExpr());
          }
        } while (take(','));
      }
      need(')');
      return _ExtExpr('call', value: fn, args: args);
    }
    final first = identifier();
    if (at('!')) {
      final parts = <String>[first];
      while (take('!')) {
        parts.add(identifier());
      }
      return _ExtExpr('param', value: parts.map((p) => '[$p]').join('!'));
    }
    if (take('.')) {
      final colParts = <String>[identifier()];
      while (take('.')) {
        colParts.add(identifier());
      }
      return _ExtExpr('col', value: first, extra: colParts.join('.'));
    }
    return _ExtExpr('ident', value: first);
  }
}

class _CompiledExpr {
  final String sql;
  final int typeCode;
  final bool isAggregate;
  final bool referencesColumn;
  const _CompiledExpr(
    this.sql,
    this.typeCode, {
    this.isAggregate = false,
    this.referencesColumn = false,
  });
}

class _SelectCompileResult {
  final String rawSql;
  final List<AccessSelectOutput> outputs;
  final bool hasExplicitOrdering;
  final bool hasLimit;
  final bool isUnion;
  _SelectCompileResult({
    required this.rawSql,
    required this.outputs,
    required this.hasExplicitOrdering,
    this.hasLimit = false,
    this.isUnion = false,
  });
}

class _ExtResolvedCol {
  final AnalysisTable table;
  final String sqlAlias;
  final AnalysisColumn column;
  final bool isVirtualSubquery;
  final bool isFromOuterScope;
  _ExtResolvedCol(
    this.table,
    this.sqlAlias,
    this.column, {
    this.isVirtualSubquery = false,
    this.isFromOuterScope = false,
  });
}

class _ExtSqlEngine {
  static const _supportedTypes = [1, 3, 4, 5, 7, 8, 10, 11, 12, 18];

  final List<AnalysisTable> schema;
  final MigrationIdentifierPolicy ids;
  final _ExtSharedContext shared;
  final bool ordinalAliases;

  _ExtSqlEngine({
    required this.schema,
    required this.ids,
    required this.shared,
    required this.ordinalAliases,
  });

  Never fail(String message) =>
      throw FormatException('Unsupported Access SELECT: $message');

  String quote(String name) {
    if (name.contains('\u0000') || utf8.encode(name).length > 63) {
      fail('identifier exceeds supported PostgreSQL identifier constraints');
    }
    return ids.quoteIdentifier(name);
  }

  _SelectCompileResult compileQuery(
    _ExtQueryAst ast, {
    List<String>? outputNames,
    required Map<String, _TableBinding> outerUsed,
    required Set<String> activeSubqueries,
    required bool isRoot,
  }) {
    if (ast is _ExtSelectAst) {
      return _compileSelect(
        ast,
        outputNames: outputNames,
        outerUsed: outerUsed,
        activeSubqueries: activeSubqueries,
      );
    }
    final unionAst = ast as _ExtUnionAst;
    final branchResults = <_SelectCompileResult>[];
    for (var i = 0; i < unionAst.branches.length; i++) {
      final branch = _compileSelect(
        unionAst.branches[i],
        outputNames: outputNames,
        outerUsed: outerUsed,
        activeSubqueries: activeSubqueries,
        forceOrdinalAliases: ordinalAliases,
      );
      if (i > 0 && branch.outputs.length != branchResults.first.outputs.length) {
        fail('UNION branches must have identical column count');
      }
      branchResults.add(branch);
    }
    final firstOuts = branchResults.first.outputs;
    final mergedOutputs = <AccessSelectOutput>[];
    for (var c = 0; c < firstOuts.length; c++) {
      var widenedType = firstOuts[c].typeCode;
      for (var b = 1; b < branchResults.length; b++) {
        widenedType = _widenType(widenedType, branchResults[b].outputs[c].typeCode);
      }
      final o = firstOuts[c];
      mergedOutputs.add(
          AccessSelectOutput(o.name, o.sourceTable, o.sourceColumn, widenedType));
    }

    final sqlBuf = StringBuffer();
    for (var i = 0; i < branchResults.length; i++) {
      if (i > 0) {
        sqlBuf.write(unionAst.unionAllFlags[i - 1] ? ' UNION ALL ' : ' UNION ');
      }
      final bSql = branchResults[i].rawSql;
      if (branchResults[i].hasExplicitOrdering || branchResults[i].hasLimit) {
        sqlBuf.write('($bSql)');
      } else {
        sqlBuf.write(bSql);
      }
    }

    var hasOrder = false;
    if (unionAst.trailingOrderBy.isNotEmpty) {
      hasOrder = true;
      final outOrderTerms = <String>[];
      for (final item in unionAst.trailingOrderBy) {
        final colName = item.expr.kind == 'ident'
            ? item.expr.value!
            : (item.expr.kind == 'col' ? item.expr.extra! : null);
        if (colName == null) {
          fail('unsupported UNION ORDER BY expression');
        }
        final idx = mergedOutputs.indexWhere(
            (o) => o.name.toLowerCase() == colName.toLowerCase());
        if (idx < 0) fail('UNION ORDER BY column $colName not found in outputs');
        final orderIdent = ordinalAliases ? quote('c$idx') : quote(mergedOutputs[idx].name);
        outOrderTerms.add('$orderIdent ${item.descending ? 'DESC' : 'ASC'}');
      }
      sqlBuf.write(' ORDER BY ${outOrderTerms.join(', ')}');
    }

    return _SelectCompileResult(
      rawSql: sqlBuf.toString(),
      outputs: mergedOutputs,
      hasExplicitOrdering: hasOrder,
      isUnion: true,
    );
  }

  int _widenType(int a, int b) {
    if (a == b) return a;
    const ints = {3, 4};
    const nums = {1, 3, 4, 5, 7};
    if (ints.contains(a) && ints.contains(b)) return 4;
    if (nums.contains(a) && nums.contains(b)) {
      if (a == 7 || b == 7) return 7;
      if (a == 5 || b == 5) return 5;
      return 4;
    }
    return 10;
  }

  _SelectCompileResult _compileSelect(
    _ExtSelectAst ast, {
    List<String>? outputNames,
    required Map<String, _TableBinding> outerUsed,
    required Set<String> activeSubqueries,
    bool? forceOrdinalAliases,
  }) {
    final useOrdinal = forceOrdinalAliases ?? ordinalAliases;
    final used = <String, _TableBinding>{};
    final usedOrder = <_TableBinding>[];
    final inlineAliases = <String>{};

    final fromSql = ast.fromTree == null
        ? ''
        : _compileFrom(
            ast.fromTree!,
            used: used,
            usedOrder: usedOrder,
            outerUsed: outerUsed,
            activeSubqueries: activeSubqueries,
            inlineAliases: inlineAliases,
          );

    // Compile GROUP BY first so SELECT / HAVING / ORDER BY know grouped expressions
    final groupBySqlList = <String>[];
    final groupBySqlSet = <String>{};
    for (final g in ast.groupBy) {
      final compiled = _compileExpr(
        g,
        used: used,
        usedOrder: usedOrder,
        outerUsed: outerUsed,
        activeSubqueries: activeSubqueries,
        inlineLiterals: true,
      );
      groupBySqlList.add(compiled.sql);
      groupBySqlSet.add(compiled.sql);
    }

    final hasGrouping =
        ast.groupBy.isNotEmpty || ast.projections.any(_projContainsAggregate);
    final inlineLiterals = ast.groupBy.isNotEmpty;

    // Expand projections
    final compiledProjections = <_CompiledProjEntry>[];
    for (var pIdx = 0; pIdx < ast.projections.length; pIdx++) {
      final item = ast.projections[pIdx];
      if (item.isWildcard) {
        final targets = <_TableBinding>[];
        if (item.tableAlias != null) {
          final found = used[item.tableAlias!.toLowerCase()];
          if (found == null) fail('wildcard table outside FROM/JOIN scope');
          targets.add(found);
        } else {
          targets.addAll(usedOrder);
        }
        for (final target in targets) {
          for (final col in target.table.columns) {
            if (!_supportedTypes.contains(col.typeCode)) {
              continue;
            }
            if (!target.isVirtualSubquery &&
                target.table.columns
                        .where((c) => ids.columnName(c.name) == ids.columnName(col.name))
                        .length !=
                    1) {
              fail('calculated column or mapped name collision');
            }
            final rawColSql = target.isVirtualSubquery
                ? '${quote(target.sqlAlias)}.${quote(col.name)}'
                : '${quote(target.sqlAlias)}.${quote(ids.columnName(col.name))}';
            final finalSql = (hasGrouping && !groupBySqlSet.contains(rawColSql))
                ? '(ARRAY_AGG($rawColSql) FILTER (WHERE ($rawColSql) IS NOT NULL))[1]'
                : rawColSql;
            compiledProjections.add(_CompiledProjEntry(
              expr: _CompiledExpr(finalSql, col.typeCode,
                  referencesColumn: true),
              naturalColName: col.name,
              tableName: target.table.name,
              sqlAlias: target.sqlAlias,
              isWildcardCol: true,
            ));
          }
        }
      } else {
        final e = item.expr!;
        final compiled = _compileExpr(
          e,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          groupBySqlSet: groupBySqlSet,
          inlineLiterals: inlineLiterals,
        );
        String naturalName;
        var sourceTable = '';
        var sourceCol = '';
        var sqlAlias = '';
        if (item.explicitAlias != null) {
          naturalName = item.explicitAlias!;
          if (e.kind == 'col' || e.kind == 'ident') {
            final res = _tryResolveExprCol(e, used, usedOrder, const {});
            if (res != null) {
              sourceTable = res.table.name;
              sourceCol = res.column.name;
              sqlAlias = res.sqlAlias;
            }
          }
        } else if (e.kind == 'col' || e.kind == 'ident') {
          final res = _resolveColExpr(e, used, usedOrder, const {});
          naturalName = res.column.name;
          sourceTable = res.table.name;
          sourceCol = res.column.name;
          sqlAlias = res.sqlAlias;
        } else {
          naturalName = 'Expr${pIdx + 1}';
        }
        compiledProjections.add(_CompiledProjEntry(
          expr: compiled,
          explicitAlias: item.explicitAlias,
          naturalColName: naturalName,
          tableName: sourceTable,
          sourceColumnName: sourceCol,
          sqlAlias: sqlAlias,
        ));
      }
    }

    if (compiledProjections.isEmpty) {
      fail('empty projection list');
    }
    if (outputNames != null &&
        outputNames.length != compiledProjections.length) {
      fail('output shape length');
    }

    final outputs = <AccessSelectOutput>[];
    final aliasToProjectionSql = <String, String>{};
    final aliasToOrdinalIdx = <String, int>{};
    final usedNames = <String>{};

    for (var i = 0; i < compiledProjections.length; i++) {
      final p = compiledProjections[i];
      var candidate = p.explicitAlias;
      if (candidate == null) {
        final baseLower = p.naturalColName.toLowerCase();
        final dupSimple = p.sqlAlias.isNotEmpty &&
            compiledProjections.any((v) =>
                v.explicitAlias == null &&
                v.naturalColName.toLowerCase() == baseLower &&
                v.sqlAlias.toLowerCase() != p.sqlAlias.toLowerCase());
        candidate = dupSimple ? '${p.sqlAlias}.${p.naturalColName}' : p.naturalColName;
      }
      var finalName = outputNames?[i] ?? candidate;
      if (outputNames != null &&
          finalName.toLowerCase() != candidate.toLowerCase()) {
        fail('output shape mismatch at $i');
      }
      if (!usedNames.add(finalName.toLowerCase())) {
        if (outputNames != null) {
          fail('duplicate output name');
        }
        var suffix = 2;
        while (!usedNames.add('${finalName}_$suffix'.toLowerCase())) {
          suffix++;
        }
        finalName = '${finalName}_$suffix';
      }
      outputs.add(AccessSelectOutput(
          finalName, p.tableName, p.sourceColumnName, p.expr.typeCode));
      if (p.explicitAlias != null) {
        aliasToProjectionSql[p.explicitAlias!.toLowerCase()] = p.expr.sql;
        aliasToOrdinalIdx[p.explicitAlias!.toLowerCase()] = i;
      }
    }

    final whereSql = ast.where == null
        ? ''
        : ' WHERE ${_compilePredicate(ast.where!, used: used, usedOrder: usedOrder, outerUsed: outerUsed, activeSubqueries: activeSubqueries)}';
    final groupSql = groupBySqlList.isEmpty
        ? ''
        : ' GROUP BY ${groupBySqlList.join(', ')}';
    final havingSql = ast.having == null
        ? ''
        : ' HAVING ${_compilePredicate(ast.having!, used: used, usedOrder: usedOrder, outerUsed: outerUsed, activeSubqueries: activeSubqueries, hasGrouping: hasGrouping, groupBySqlSet: groupBySqlSet, inlineLiterals: inlineLiterals)}';

    final orderTerms = <String>[];
    for (final item in ast.orderBy) {
      String? exprSql;
      if (item.expr.kind == 'ident') {
        final key = item.expr.value!.toLowerCase();
        if (aliasToProjectionSql.containsKey(key) &&
            _tryResolveUnqualified(item.expr.value!, usedOrder, const {}) ==
                null) {
          exprSql = aliasToProjectionSql[key];
        } else if (aliasToProjectionSql.containsKey(key) && ast.distinct) {
          exprSql = useOrdinal
              ? quote('c${aliasToOrdinalIdx[key]!}')
              : aliasToProjectionSql[key];
        }
      }
      exprSql ??= _compileExpr(
        item.expr,
        used: used,
        usedOrder: usedOrder,
        outerUsed: outerUsed,
        activeSubqueries: activeSubqueries,
        hasGrouping: hasGrouping,
        groupBySqlSet: groupBySqlSet,
        inlineLiterals: inlineLiterals,
      ).sql;
      orderTerms.add('$exprSql ${item.descending ? 'DESC' : 'ASC'}');
    }
    final orderSql =
        orderTerms.isEmpty ? '' : ' ORDER BY ${orderTerms.join(', ')}';

    final selected = [
      for (var i = 0; i < compiledProjections.length; i++)
        '${compiledProjections[i].expr.sql} AS ${quote(useOrdinal ? 'c$i' : outputs[i].name)}'
    ].join(', ');
    final distinctPrefix = ast.distinct ? 'DISTINCT ' : '';
    final fromClause = fromSql.isEmpty ? '' : ' FROM $fromSql';
    final limitSql = ast.topCount == null ? '' : ' LIMIT ${ast.topCount}';

    return _SelectCompileResult(
      rawSql:
          'SELECT $distinctPrefix$selected$fromClause$whereSql$groupSql$havingSql$orderSql$limitSql',
      outputs: outputs,
      hasExplicitOrdering: ast.orderBy.isNotEmpty,
      hasLimit: ast.topCount != null,
    );
  }

  static bool _projContainsAggregate(_ExtProj proj) =>
      !proj.isWildcard && _exprContainsAggregate(proj.expr!);

  static bool _exprContainsAggregate(_ExtExpr expr) {
    if (expr.kind == 'call') {
      final upper = expr.value!.toUpperCase();
      if (const {'SUM', 'COUNT', 'AVG', 'MIN', 'MAX', 'FIRST', 'LAST'}
          .contains(upper)) {
        return true;
      }
    }
    if (expr.left != null && _exprContainsAggregate(expr.left!)) return true;
    if (expr.right != null && _exprContainsAggregate(expr.right!)) return true;
    if (expr.third != null && _exprContainsAggregate(expr.third!)) return true;
    for (final a in expr.args) {
      if (_exprContainsAggregate(a)) return true;
    }
    return false;
  }

  String _compileFrom(
    _FromNode node, {
    required Map<String, _TableBinding> used,
    required List<_TableBinding> usedOrder,
    required Map<String, _TableBinding> outerUsed,
    required Set<String> activeSubqueries,
    required Set<String> inlineAliases,
  }) {
    if (node is _FromJoin) {
      final leftSql = _compileFrom(
        node.left,
        used: used,
        usedOrder: usedOrder,
        outerUsed: outerUsed,
        activeSubqueries: activeSubqueries,
        inlineAliases: inlineAliases,
      );
      final rightSql = _compileFrom(
        node.right,
        used: used,
        usedOrder: usedOrder,
        outerUsed: outerUsed,
        activeSubqueries: activeSubqueries,
        inlineAliases: inlineAliases,
      );
      if (node.onExpr == null) {
        return '($leftSql ${node.joinKeyword} $rightSql)';
      }
      final onSql = _compilePredicate(
        node.onExpr!,
        used: used,
        usedOrder: usedOrder,
        outerUsed: outerUsed,
        activeSubqueries: activeSubqueries,
      );
      return '($leftSql ${node.joinKeyword} $rightSql ON $onSql)';
    }

    final tableNode = node as _FromTable;
    if (tableNode.inlineSubquery != null) {
      final subRes = compileQuery(
        tableNode.inlineSubquery!,
        outerUsed: const {},
        activeSubqueries: activeSubqueries,
        isRoot: false,
      );
      final alias = tableNode.explicitAlias ?? '_sub${inlineAliases.length + 1}';
      final safeAlias = _safeVirtualAlias(alias, inlineAliases);
      final vTable = _virtualTable(alias, subRes.outputs);
      final binding = _TableBinding(vTable, safeAlias, isVirtualSubquery: true);
      final key = alias.toLowerCase();
      if (used.containsKey(key)) fail('duplicate FROM alias $alias');
      used[key] = binding;
      usedOrder.add(binding);
      return '(${subRes.rawSql}) AS ${quote(safeAlias)}';
    }

    final name = tableNode.name;
    final matches = schema
        .where((t) =>
            t.name.toLowerCase() == name.toLowerCase() &&
            t.syntheticKind == null)
        .toList();
    if (matches.length == 1) {
      final table = matches.single;
      final sqlAlias = tableNode.explicitAlias ?? table.name;
      final aliasKey = sqlAlias.toLowerCase();
      if (used.containsKey(aliasKey)) {
        fail('repeated table requires alias: $sqlAlias');
      }
      if (schema
              .where((t) => ids.tableName(t.name) == ids.tableName(table.name))
              .length !=
          1) {
        fail('mapped table name collision');
      }
      final binding = _TableBinding(table, sqlAlias);
      used[aliasKey] = binding;
      usedOrder.add(binding);
      return '${quote(ids.tableName(table.name))} AS ${quote(sqlAlias)}';
    }

    if (matches.isEmpty) {
      final lower = name.toLowerCase();
      String? subName;
      String? subSql;
      for (final entry in shared.namedSubqueries.entries) {
        if (entry.key.toLowerCase() == lower) {
          subName = entry.key;
          subSql = entry.value;
          break;
        }
      }
      if (subName != null && subSql != null) {
        if (activeSubqueries.length >= 10) {
          fail('subquery nesting exceeds limit');
        }
        if (activeSubqueries.contains(lower)) {
          fail('recursive query reference $subName');
        }
        final subTokens = _lex(subSql, allowExtendedSyntax: true);
        final subParser = _ExtParser(subTokens, 0, shared);
        var subPos = 0;
        if (subParser.take('PARAMETERS')) {
          final tmp = _Compiler(schema, ids, const {}, true, false, false, true,
              true, shared.namedSubqueries, const {}, 0);
          tmp.tokens = subTokens;
          tmp.pos = subParser.pos;
          tmp._parseParametersHeader(shared);
          subPos = tmp.pos;
        }
        final bodyParser = _ExtParser(subTokens, subPos, shared);
        final subAst = bodyParser.parseQuery();
        bodyParser.take(';');
        if (bodyParser.current.kind != 'end') {
          fail('trailing tokens in subquery $subName');
        }
        final subRes = compileQuery(
          subAst,
          outerUsed: const {},
          activeSubqueries: {...activeSubqueries, lower},
          isRoot: false,
        );
        final userAlias = tableNode.explicitAlias ?? subName;
        final aliasKey = userAlias.toLowerCase();
        if (used.containsKey(aliasKey)) {
          fail('repeated subquery requires alias: $userAlias');
        }
        final safeSqlAlias = _safeVirtualAlias(userAlias, inlineAliases);
        final vTable = _virtualTable(subName, subRes.outputs);
        final binding =
            _TableBinding(vTable, safeSqlAlias, isVirtualSubquery: true);
        used[aliasKey] = binding;
        usedOrder.add(binding);
        return '(${subRes.rawSql}) AS ${quote(safeSqlAlias)}';
      }
    }
    fail('unknown or ambiguous table $name');
  }

  String _safeVirtualAlias(String rawAlias, Set<String> usedAliases) {
    if (utf8.encode(rawAlias).length <= 63 &&
        !rawAlias.contains('\u0000') &&
        usedAliases.add(rawAlias.toLowerCase())) {
      return rawAlias;
    }
    final sanitized = rawAlias
        .replaceAll(RegExp(r'[^A-Za-z0-9_]+'), '_')
        .replaceAll(RegExp(r'^_+|_+$'), '');
    final prefix = sanitized.isEmpty
        ? 'sq'
        : sanitized.substring(0, sanitized.length > 48 ? 48 : sanitized.length);
    var candidate = '${prefix}_${usedAliases.length + 1}';
    while (!usedAliases.add(candidate.toLowerCase())) {
      candidate = '${prefix}_${usedAliases.length + 1}';
    }
    return candidate;
  }

  AnalysisTable _virtualTable(String name, List<AccessSelectOutput> outputs) {
    return AnalysisTable(
      name: name,
      rowCount: 0,
      postgresDdl: null,
      dartClassName: null,
      columns: [
        for (final out in outputs)
          AnalysisColumn(
            name: out.name,
            typeName: '',
            typeCode: out.typeCode,
            isAutoNumber: false,
            isCalculated: false,
            isRequired: false,
            caption: out.sourceTable.isEmpty ? null : out.sourceTable,
            defaultValue: null,
            maxLength: null,
            calculatedExpression: null,
            validationRule: null,
            validationText: null,
            description: null,
            decimalPlaces: null,
            displayControl: null,
            textFormat: null,
            imeMode: null,
            imeSentenceMode: null,
            resultType: null,
            propertyGuid: null,
            allowMultipleValues: null,
            rowSourceType: null,
            rowSource: null,
            wssFieldId: null,
            formatString: null,
            inputMask: null,
            allowZeroLength: null,
            precision: null,
            scale: null,
          ),
      ],
      indexes: const [],
      sampleRows: const [],
    );
  }

  String _compilePredicate(
    _ExtExpr expr, {
    required Map<String, _TableBinding> used,
    required List<_TableBinding> usedOrder,
    required Map<String, _TableBinding> outerUsed,
    required Set<String> activeSubqueries,
    bool hasGrouping = false,
    Set<String> groupBySqlSet = const {},
    bool inlineLiterals = false,
  }) {
    final res = _compileExpr(
      expr,
      used: used,
      usedOrder: usedOrder,
      outerUsed: outerUsed,
      activeSubqueries: activeSubqueries,
      hasGrouping: hasGrouping,
      groupBySqlSet: groupBySqlSet,
      expectedType: 1,
      inlineLiterals: inlineLiterals,
    );
    if (res.typeCode == 1 || expr.kind == 'col' || expr.kind == 'ident') {
      return res.sql;
    }
    return res.sql;
  }

  String _rawColSql(_ExtResolvedCol c) => c.isVirtualSubquery
      ? '${quote(c.sqlAlias)}.${quote(c.column.name)}'
      : '${quote(c.sqlAlias)}.${quote(ids.columnName(c.column.name))}';

  _ExtResolvedCol? _tryResolveUnqualified(
    String colName,
    List<_TableBinding> usedOrder,
    Map<String, _TableBinding> outerUsed,
  ) {
    final lower = colName.toLowerCase();
    final hits = <_ExtResolvedCol>[];
    for (final b in usedOrder) {
      for (final c in b.table.columns) {
        if (c.name.toLowerCase() == lower) {
          hits.add(_ExtResolvedCol(b.table, b.sqlAlias, c,
              isVirtualSubquery: b.isVirtualSubquery));
        }
      }
    }
    if (hits.isEmpty && outerUsed.isNotEmpty) {
      for (final b in outerUsed.values) {
        for (final c in b.table.columns) {
          if (c.name.toLowerCase() == lower) {
            hits.add(_ExtResolvedCol(b.table, b.sqlAlias, c,
                isVirtualSubquery: b.isVirtualSubquery,
                isFromOuterScope: true));
          }
        }
      }
    }
    if (hits.length != 1) return null;
    final hit = hits.single;
    if (!_supportedTypes.contains(hit.column.typeCode)) {
      return null;
    }
    if (!hit.isVirtualSubquery &&
        hit.table.columns
                .where((c) => ids.columnName(c.name) == ids.columnName(hit.column.name))
                .length !=
            1) {
      return null;
    }
    return hit;
  }

  _ExtResolvedCol? _tryResolveExprCol(
    _ExtExpr expr,
    Map<String, _TableBinding> used,
    List<_TableBinding> usedOrder,
    Map<String, _TableBinding> outerUsed,
  ) {
    if (expr.kind == 'ident') {
      return _tryResolveUnqualified(expr.value!, usedOrder, outerUsed);
    }
    if (expr.kind != 'col') return null;
    var isOuter = false;
    var binding = used[expr.value!.toLowerCase()];
    if (binding == null && outerUsed.isNotEmpty) {
      binding = outerUsed[expr.value!.toLowerCase()];
      isOuter = binding != null;
    }
    if (binding == null) return null;
    var matches = binding.table.columns
        .where((c) => c.name.toLowerCase() == expr.extra!.toLowerCase())
        .toList();
    if (matches.isEmpty && binding.isVirtualSubquery) {
      if (expr.extra!.contains('.')) {
        final dot = expr.extra!.lastIndexOf('.');
        final srcTbl = expr.extra!.substring(0, dot).toLowerCase();
        final bareCol = expr.extra!.substring(dot + 1).toLowerCase();
        final bySourceAndCol = binding.table.columns
            .where((c) =>
                c.name.toLowerCase() == bareCol &&
                (c.caption?.toLowerCase() == srcTbl))
            .toList();
        if (bySourceAndCol.length == 1) {
          matches = bySourceAndCol;
        } else {
          final byColOnly = binding.table.columns
              .where((c) => c.name.toLowerCase() == bareCol)
              .toList();
          if (byColOnly.length == 1) matches = byColOnly;
        }
      } else {
        final suffix = '.${expr.extra!.toLowerCase()}';
        final bySuffix = binding.table.columns
            .where((c) => c.name.toLowerCase().endsWith(suffix))
            .toList();
        if (bySuffix.length == 1) matches = bySuffix;
      }
    }
    if (matches.length != 1) return null;
    final col = matches.single;
    if (!_supportedTypes.contains(col.typeCode)) return null;
    if (!binding.isVirtualSubquery &&
        binding.table.columns
                .where((c) => ids.columnName(c.name) == ids.columnName(col.name))
                .length !=
            1) {
      return null;
    }
    return _ExtResolvedCol(binding.table, binding.sqlAlias, col,
        isVirtualSubquery: binding.isVirtualSubquery, isFromOuterScope: isOuter);
  }

  _ExtResolvedCol _resolveColExpr(
    _ExtExpr expr,
    Map<String, _TableBinding> used,
    List<_TableBinding> usedOrder,
    Map<String, _TableBinding> outerUsed,
  ) {
    final hit = _tryResolveExprCol(expr, used, usedOrder, outerUsed);
    if (hit != null) return hit;
    fail('unknown or ambiguous column ${expr.kind == 'col' ? '${expr.value}.${expr.extra}' : expr.value}');
  }

  _CompiledExpr _compileExpr(
    _ExtExpr expr, {
    required Map<String, _TableBinding> used,
    required List<_TableBinding> usedOrder,
    required Map<String, _TableBinding> outerUsed,
    required Set<String> activeSubqueries,
    bool hasGrouping = false,
    bool insideAggregate = false,
    Set<String> groupBySqlSet = const {},
    int? expectedType,
    bool inlineLiterals = false,
    bool forceTextConcat = false,
  }) {
    // Check if full subtree matches an exact GROUP BY expression
    if (hasGrouping && !insideAggregate && groupBySqlSet.isNotEmpty &&
        expr.kind != 'col' && expr.kind != 'ident' && expr.kind != 'null' &&
        expr.kind != 'number' && expr.kind != 'text' && expr.kind != 'bool') {
      final startBindingLen = shared.markerBindings.length;
      final candidate = _compileExpr(
        expr,
        used: used,
        usedOrder: usedOrder,
        outerUsed: outerUsed,
        activeSubqueries: activeSubqueries,
        hasGrouping: false,
        insideAggregate: false,
        groupBySqlSet: const {},
        expectedType: expectedType,
        inlineLiterals: true,
        forceTextConcat: forceTextConcat,
      );
      if (groupBySqlSet.contains(candidate.sql)) {
        return candidate;
      }
      // Restore marker count if didn't match so we don't leak unused markers
      if (shared.markerBindings.length > startBindingLen) {
        shared.markerBindings.length = startBindingLen;
      }
    }

    switch (expr.kind) {
      case 'null':
        return _CompiledExpr('NULL', expectedType ?? 10);

      case 'bool':
        final b = expr.value == 'YES' || expr.value == 'TRUE';
        if (inlineLiterals) {
          return _CompiledExpr(b ? 'TRUE' : 'FALSE', 1);
        }
        final m = shared.addBinding(_Binding(null, b, 1));
        return _CompiledExpr('CAST($m AS BOOLEAN)', 1);

      case 'number':
        final raw = expr.value!;
        if (inlineLiterals) {
          final isDec = raw.contains('.');
          return _CompiledExpr(raw, isDec ? 7 : 4);
        }
        final numType = (expectedType == 5)
            ? 5
            : (raw.contains('.') || expectedType == 7 ? 7 : 4);
        final Object? val = numType == 4
            ? int.tryParse(raw)
            : (numType == 7 ? double.tryParse(raw) : raw);
        if (val == null) fail('invalid numeric literal $raw');
        final m = shared.addBinding(_Binding(null, val, numType));
        return _CompiledExpr('CAST($m AS ${_pgType(numType)})', numType);

      case 'text':
        final val = expr.value!;
        final m = shared.addBinding(_Binding(null, val, 10));
        return _CompiledExpr('CAST($m AS TEXT)', 10);

      case 'date':
        final iso = _parseAccessDateLiteral(expr.value!);
        final m = shared.addBinding(_Binding(null, iso, 8));
        return _CompiledExpr('CAST($m AS TIMESTAMP)', 8);

      case 'param':
        return _bindParameter(expr.value!, expectedType);

      case 'col':
        final res = _resolveColExpr(expr, used, usedOrder, outerUsed);
        final rawSql = _rawColSql(res);
        final sql = (hasGrouping &&
                !insideAggregate &&
                !res.isFromOuterScope &&
                !groupBySqlSet.contains(rawSql))
            ? '(ARRAY_AGG($rawSql) FILTER (WHERE ($rawSql) IS NOT NULL))[1]'
            : rawSql;
        return _CompiledExpr(sql, res.column.typeCode,
            referencesColumn: !res.isFromOuterScope);

      case 'ident':
        final resolved = _tryResolveUnqualified(expr.value!, usedOrder, outerUsed);
        if (resolved != null) {
          final rawSql = _rawColSql(resolved);
          final sql = (hasGrouping &&
                  !insideAggregate &&
                  !resolved.isFromOuterScope &&
                  !groupBySqlSet.contains(rawSql))
              ? '(ARRAY_AGG($rawSql) FILTER (WHERE ($rawSql) IS NOT NULL))[1]'
              : rawSql;
          return _CompiledExpr(sql, resolved.column.typeCode,
              referencesColumn: !resolved.isFromOuterScope);
        }
        return _bindParameter('[${expr.value!}]', expectedType);

      case 'unary':
        final op = expr.value!;
        final inner = _compileExpr(
          expr.left!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          expectedType: op == 'NOT' ? 1 : expectedType,
          inlineLiterals: inlineLiterals,
        );
        if (op == 'NOT') {
          return _CompiledExpr('(NOT (${inner.sql}))', 1,
              isAggregate: inner.isAggregate,
              referencesColumn: inner.referencesColumn);
        }
        if (op == '+') return inner;
        final numInner = _asNumericSql(inner);
        return _CompiledExpr('(-(${numInner.sql}))', numInner.typeCode,
            isAggregate: inner.isAggregate,
            referencesColumn: inner.referencesColumn);

      case 'is_null':
        final inner = _compileExpr(
          expr.left!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          inlineLiterals: inlineLiterals,
        );
        final kw = expr.negated ? 'IS NOT NULL' : 'IS NULL';
        return _CompiledExpr('(${inner.sql} $kw)', 1,
            isAggregate: inner.isAggregate,
            referencesColumn: inner.referencesColumn);

      case 'like':
        return _compileLike(
          expr,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          inlineLiterals: inlineLiterals,
        );

      case 'between':
        final lhs = _compileExpr(
          expr.left!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          inlineLiterals: inlineLiterals,
        );
        final low = _compileExpr(
          expr.right!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          expectedType: lhs.typeCode,
          inlineLiterals: inlineLiterals,
        );
        final high = _compileExpr(
          expr.third!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          expectedType: lhs.typeCode,
          inlineLiterals: inlineLiterals,
        );
        final op = expr.negated ? 'NOT BETWEEN' : 'BETWEEN';
        if (lhs.typeCode == 10 || lhs.typeCode == 12) {
          return _CompiledExpr(
            '(lower(${lhs.sql} COLLATE "C") $op lower(${low.sql} COLLATE "C") AND lower(${high.sql} COLLATE "C"))',
            1,
            isAggregate: lhs.isAggregate,
            referencesColumn:
                lhs.referencesColumn || low.referencesColumn || high.referencesColumn,
          );
        }
        return _CompiledExpr(
          '(${lhs.sql} $op ${low.sql} AND ${high.sql})',
          1,
          isAggregate: lhs.isAggregate,
          referencesColumn:
              lhs.referencesColumn || low.referencesColumn || high.referencesColumn,
        );

      case 'in_list':
        final lhs = _compileExpr(
          expr.left!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          inlineLiterals: inlineLiterals,
        );
        if (expr.args.isEmpty) {
          return _CompiledExpr(expr.negated ? 'TRUE' : 'FALSE', 1);
        }
        final isText = lhs.typeCode == 10 || lhs.typeCode == 12;
        final items = expr.args.map((a) {
          final c = _compileExpr(
            a,
            used: used,
            usedOrder: usedOrder,
            outerUsed: outerUsed,
            activeSubqueries: activeSubqueries,
            hasGrouping: hasGrouping,
            insideAggregate: insideAggregate,
            groupBySqlSet: groupBySqlSet,
            expectedType: lhs.typeCode,
            inlineLiterals: inlineLiterals,
          );
          return isText ? 'lower(${c.sql} COLLATE "C")' : c.sql;
        }).join(', ');
        final lhsSql = isText ? 'lower(${lhs.sql} COLLATE "C")' : lhs.sql;
        final op = expr.negated ? 'NOT IN' : 'IN';
        return _CompiledExpr('($lhsSql $op ($items))', 1,
            isAggregate: lhs.isAggregate,
            referencesColumn: lhs.referencesColumn);

      case 'in_subquery':
        final lhs = _compileExpr(
          expr.left!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          inlineLiterals: inlineLiterals,
        );
        final subRes = compileQuery(
          expr.subquery!,
          outerUsed: {...outerUsed, ...used},
          activeSubqueries: activeSubqueries,
          isRoot: false,
        );
        if (subRes.outputs.length != 1) {
          fail('IN subquery must return a single column');
        }
        final isText = lhs.typeCode == 10 || lhs.typeCode == 12;
        final lhsSql = isText ? 'lower(${lhs.sql} COLLATE "C")' : lhs.sql;
        final op = expr.negated ? 'NOT IN' : 'IN';
        return _CompiledExpr('($lhsSql $op (${subRes.rawSql}))', 1,
            isAggregate: lhs.isAggregate,
            referencesColumn: lhs.referencesColumn);

      case 'binary':
        return _compileBinary(
          expr,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          expectedType: expectedType,
          inlineLiterals: inlineLiterals,
          forceTextConcat: forceTextConcat,
        );

      case 'call':
        return _compileFunctionCall(
          expr,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          inlineLiterals: inlineLiterals,
        );

      default:
        fail('unsupported expression node ${expr.kind}');
    }
  }

  _CompiledExpr _compileLike(
    _ExtExpr expr, {
    required Map<String, _TableBinding> used,
    required List<_TableBinding> usedOrder,
    required Map<String, _TableBinding> outerUsed,
    required Set<String> activeSubqueries,
    required bool hasGrouping,
    required bool insideAggregate,
    required Set<String> groupBySqlSet,
    required bool inlineLiterals,
  }) {
    final lhs = _compileExpr(
      expr.left!,
      used: used,
      usedOrder: usedOrder,
      outerUsed: outerUsed,
      activeSubqueries: activeSubqueries,
      hasGrouping: hasGrouping,
      insideAggregate: insideAggregate,
      groupBySqlSet: groupBySqlSet,
      inlineLiterals: inlineLiterals,
    );
    final lhsSql = (lhs.typeCode == 10 || lhs.typeCode == 12)
        ? lhs.sql
        : 'CAST(${lhs.sql} AS TEXT)';
    final op = expr.negated ? 'NOT ILIKE' : 'ILIKE';
    final rhsNode = expr.right!;
    if (rhsNode.kind == 'text') {
      final converted =
          rhsNode.value!.replaceAll('*', '%').replaceAll('?', '_');
      final m = shared.addBinding(_Binding(null, converted, 10));
      return _CompiledExpr('($lhsSql $op CAST($m AS TEXT))', 1,
          isAggregate: lhs.isAggregate,
          referencesColumn: lhs.referencesColumn);
    }
    final rhs = _compileExpr(
      rhsNode,
      used: used,
      usedOrder: usedOrder,
      outerUsed: outerUsed,
      activeSubqueries: activeSubqueries,
      hasGrouping: hasGrouping,
      insideAggregate: insideAggregate,
      groupBySqlSet: groupBySqlSet,
      expectedType: 10,
      inlineLiterals: inlineLiterals,
      forceTextConcat: true,
    );
    return _CompiledExpr(
      "($lhsSql $op replace(replace(CAST(${rhs.sql} AS TEXT), '*', '%'), '?', '_'))",
      1,
      isAggregate: lhs.isAggregate || rhs.isAggregate,
      referencesColumn: lhs.referencesColumn || rhs.referencesColumn,
    );
  }

  _CompiledExpr _compileBinary(
    _ExtExpr expr, {
    required Map<String, _TableBinding> used,
    required List<_TableBinding> usedOrder,
    required Map<String, _TableBinding> outerUsed,
    required Set<String> activeSubqueries,
    required bool hasGrouping,
    required bool insideAggregate,
    required Set<String> groupBySqlSet,
    int? expectedType,
    required bool inlineLiterals,
    required bool forceTextConcat,
  }) {
    final op = expr.value!;
    if (op == 'AND' || op == 'OR') {
      final l = _compileExpr(expr.left!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          expectedType: 1,
          inlineLiterals: inlineLiterals);
      final r = _compileExpr(expr.right!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          expectedType: 1,
          inlineLiterals: inlineLiterals);
      return _CompiledExpr('(${l.sql} $op ${r.sql})', 1,
          isAggregate: l.isAggregate || r.isAggregate,
          referencesColumn: l.referencesColumn || r.referencesColumn);
    }

    if (op == '&') {
      final l = _compileExpr(expr.left!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          expectedType: 10,
          inlineLiterals: inlineLiterals,
          forceTextConcat: true);
      final r = _compileExpr(expr.right!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          expectedType: 10,
          inlineLiterals: inlineLiterals,
          forceTextConcat: true);
      return _CompiledExpr(
        "(COALESCE(CAST(${l.sql} AS TEXT), '') || COALESCE(CAST(${r.sql} AS TEXT), ''))",
        10,
        isAggregate: l.isAggregate || r.isAggregate,
        referencesColumn: l.referencesColumn || r.referencesColumn,
      );
    }

    if (op == '+' || op == '-' || op == '*' || op == '/') {
      final lIsParamOrNull = _isUntypedParamOrNull(expr.left!, usedOrder, outerUsed);
      final rIsParamOrNull = _isUntypedParamOrNull(expr.right!, usedOrder, outerUsed);
      _CompiledExpr l;
      _CompiledExpr r;
      if (lIsParamOrNull && !rIsParamOrNull) {
        r = _compileExpr(expr.right!,
            used: used,
            usedOrder: usedOrder,
            outerUsed: outerUsed,
            activeSubqueries: activeSubqueries,
            hasGrouping: hasGrouping,
            insideAggregate: insideAggregate,
            groupBySqlSet: groupBySqlSet,
            expectedType: expectedType,
            inlineLiterals: inlineLiterals,
            forceTextConcat: forceTextConcat);
        l = _compileExpr(expr.left!,
            used: used,
            usedOrder: usedOrder,
            outerUsed: outerUsed,
            activeSubqueries: activeSubqueries,
            hasGrouping: hasGrouping,
            insideAggregate: insideAggregate,
            groupBySqlSet: groupBySqlSet,
            expectedType: r.typeCode,
            inlineLiterals: inlineLiterals,
            forceTextConcat: forceTextConcat);
      } else {
        l = _compileExpr(expr.left!,
            used: used,
            usedOrder: usedOrder,
            outerUsed: outerUsed,
            activeSubqueries: activeSubqueries,
            hasGrouping: hasGrouping,
            insideAggregate: insideAggregate,
            groupBySqlSet: groupBySqlSet,
            expectedType: expectedType,
            inlineLiterals: inlineLiterals,
            forceTextConcat: forceTextConcat);
        r = _compileExpr(expr.right!,
            used: used,
            usedOrder: usedOrder,
            outerUsed: outerUsed,
            activeSubqueries: activeSubqueries,
            hasGrouping: hasGrouping,
            insideAggregate: insideAggregate,
            groupBySqlSet: groupBySqlSet,
            expectedType: (op == '+' && (l.typeCode == 10 || l.typeCode == 12))
                ? 10
                : l.typeCode,
            inlineLiterals: inlineLiterals,
            forceTextConcat: forceTextConcat);
      }
      if (op == '+' &&
          (forceTextConcat ||
              l.typeCode == 10 ||
              l.typeCode == 12 ||
              r.typeCode == 10 ||
              r.typeCode == 12)) {
        return _CompiledExpr(
          "(COALESCE(CAST(${l.sql} AS TEXT), '') || COALESCE(CAST(${r.sql} AS TEXT), ''))",
          10,
          isAggregate: l.isAggregate || r.isAggregate,
          referencesColumn: l.referencesColumn || r.referencesColumn,
        );
      }
      final nl = _asNumericSql(l);
      final nr = _asNumericSql(r);
      if (op == '/') {
        return _CompiledExpr(
          '(CAST(${nl.sql} AS DOUBLE PRECISION) / NULLIF(CAST(${nr.sql} AS DOUBLE PRECISION), 0))',
          7,
          isAggregate: l.isAggregate || r.isAggregate,
          referencesColumn: l.referencesColumn || r.referencesColumn,
        );
      }
      final resType = _widenType(nl.typeCode, nr.typeCode);
      return _CompiledExpr('(${nl.sql} $op ${nr.sql})', resType,
          isAggregate: l.isAggregate || r.isAggregate,
          referencesColumn: l.referencesColumn || r.referencesColumn);
    }

    // Comparison: =, <>, <, <=, >, >=
    final lUntyped = _isUntypedParamOrNull(expr.left!, usedOrder, outerUsed);
    final rUntyped = _isUntypedParamOrNull(expr.right!, usedOrder, outerUsed);
    late final _CompiledExpr l;
    late final _CompiledExpr r;
    if (lUntyped && !rUntyped) {
      r = _compileExpr(expr.right!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          inlineLiterals: inlineLiterals);
      l = _compileExpr(expr.left!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          expectedType: r.typeCode,
          inlineLiterals: inlineLiterals);
    } else {
      l = _compileExpr(expr.left!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          inlineLiterals: inlineLiterals);
      r = _compileExpr(expr.right!,
          used: used,
          usedOrder: usedOrder,
          outerUsed: outerUsed,
          activeSubqueries: activeSubqueries,
          hasGrouping: hasGrouping,
          insideAggregate: insideAggregate,
          groupBySqlSet: groupBySqlSet,
          expectedType: l.typeCode,
          inlineLiterals: inlineLiterals);
    }

    final isText = (l.typeCode == 10 || l.typeCode == 12) &&
        (r.typeCode == 10 || r.typeCode == 12);
    if (isText) {
      return _CompiledExpr(
        '(lower(CAST(${l.sql} AS TEXT) COLLATE "C") $op lower(CAST(${r.sql} AS TEXT) COLLATE "C"))',
        1,
        isAggregate: l.isAggregate || r.isAggregate,
        referencesColumn: l.referencesColumn || r.referencesColumn,
      );
    }
    return _CompiledExpr(
      '(${l.sql} $op ${r.sql})',
      1,
      isAggregate: l.isAggregate || r.isAggregate,
      referencesColumn: l.referencesColumn || r.referencesColumn,
    );
  }

  _CompiledExpr _compileFunctionCall(
    _ExtExpr expr, {
    required Map<String, _TableBinding> used,
    required List<_TableBinding> usedOrder,
    required Map<String, _TableBinding> outerUsed,
    required Set<String> activeSubqueries,
    required bool hasGrouping,
    required bool insideAggregate,
    required Set<String> groupBySqlSet,
    required bool inlineLiterals,
  }) {
    final name = expr.value!.toUpperCase();
    final args = expr.args;

    _CompiledExpr compileArg(int idx, {int? expectedType, bool inAgg = false}) {
      if (idx >= args.length) fail('$name missing argument $idx');
      return _compileExpr(
        args[idx],
        used: used,
        usedOrder: usedOrder,
        outerUsed: outerUsed,
        activeSubqueries: activeSubqueries,
        hasGrouping: hasGrouping,
        insideAggregate: insideAggregate || inAgg,
        groupBySqlSet: groupBySqlSet,
        expectedType: expectedType,
        inlineLiterals: inlineLiterals,
      );
    }

    switch (name) {
      case 'COUNT':
        if (args.length != 1) fail('COUNT expects 1 argument');
        if (args.single.kind == 'star') {
          return const _CompiledExpr('COUNT(*)', 4, isAggregate: true);
        }
        final x = compileArg(0, inAgg: true);
        return _CompiledExpr('COUNT(${x.sql})', 4, isAggregate: true);

      case 'SUM':
        if (args.length != 1) fail('SUM expects 1 argument');
        final x = compileArg(0, inAgg: true);
        if (x.typeCode == 1) {
          return _CompiledExpr(
              'SUM(CASE WHEN (${x.sql}) THEN -1 ELSE 0 END)', 4,
              isAggregate: true);
        }
        final outType = (x.typeCode == 3 || x.typeCode == 4) ? 4 : x.typeCode;
        return _CompiledExpr('SUM(${x.sql})', outType, isAggregate: true);

      case 'AVG':
        if (args.length != 1) fail('AVG expects 1 argument');
        final x = _asNumericSql(compileArg(0, inAgg: true));
        return _CompiledExpr(
            'AVG(CAST(${x.sql} AS DOUBLE PRECISION))', 7,
            isAggregate: true);

      case 'MIN':
      case 'MAX':
        if (args.length != 1) fail('$name expects 1 argument');
        final x = compileArg(0, inAgg: true);
        return _CompiledExpr('$name(${x.sql})', x.typeCode, isAggregate: true);

      case 'FIRST':
        if (args.length != 1) fail('FIRST expects 1 argument');
        final x = compileArg(0, inAgg: true);
        return _CompiledExpr(
            '(ARRAY_AGG(${x.sql}) FILTER (WHERE (${x.sql}) IS NOT NULL))[1]',
            x.typeCode,
            isAggregate: true);

      case 'LAST':
        if (args.length != 1) fail('LAST expects 1 argument');
        final x = compileArg(0, inAgg: true);
        return _CompiledExpr(
            '(ARRAY_AGG(${x.sql}) FILTER (WHERE (${x.sql}) IS NOT NULL))[COALESCE(ARRAY_LENGTH(ARRAY_AGG(${x.sql}) FILTER (WHERE (${x.sql}) IS NOT NULL), 1), 1)]',
            x.typeCode,
            isAggregate: true);

      case 'DATE':
        if (args.isNotEmpty) fail('DATE() takes no arguments');
        return const _CompiledExpr('CURRENT_DATE', 8);

      case 'NOW':
        if (args.isNotEmpty) fail('NOW() takes no arguments');
        return const _CompiledExpr('CURRENT_TIMESTAMP', 8);

      case 'INT':
        if (args.length != 1) fail('INT expects 1 argument');
        final x = _asNumericSql(compileArg(0));
        return _CompiledExpr(
          'FLOOR(CAST(${x.sql} AS DOUBLE PRECISION))::INTEGER',
          4,
          isAggregate: x.isAggregate,
          referencesColumn: x.referencesColumn,
        );

      case 'FIX':
        if (args.length != 1) fail('FIX expects 1 argument');
        final x = _asNumericSql(compileArg(0));
        return _CompiledExpr(
          'TRUNC(CAST(${x.sql} AS DOUBLE PRECISION))::INTEGER',
          4,
          isAggregate: x.isAggregate,
          referencesColumn: x.referencesColumn,
        );

      case 'ABS':
        if (args.length != 1) fail('ABS expects 1 argument');
        final x = _asNumericSql(compileArg(0));
        return _CompiledExpr('ABS(${x.sql})', x.typeCode,
            isAggregate: x.isAggregate,
            referencesColumn: x.referencesColumn);

      case 'ROUND':
        if (args.isEmpty || args.length > 2) fail('ROUND expects 1 or 2 args');
        final x = _asNumericSql(compileArg(0));
        if (args.length == 1) {
          return _CompiledExpr(
            'ROUND(CAST(${x.sql} AS NUMERIC))::DOUBLE PRECISION',
            7,
            isAggregate: x.isAggregate,
            referencesColumn: x.referencesColumn,
          );
        }
        final digits = compileArg(1, expectedType: 4);
        return _CompiledExpr(
          'ROUND(CAST(${x.sql} AS NUMERIC), CAST(${digits.sql} AS INTEGER))::DOUBLE PRECISION',
          7,
          isAggregate: x.isAggregate || digits.isAggregate,
          referencesColumn: x.referencesColumn || digits.referencesColumn,
        );

      case 'DATEDIFF':
        if (args.length != 3 || args[0].kind != 'text') {
          fail('DATEDIFF expects (intervalLiteral, d1, d2)');
        }
        final interval = args[0].value!.trim().toLowerCase();
        final d1 = compileArg(1, expectedType: 8);
        final d2 = compileArg(2, expectedType: 8);
        final refs = d1.referencesColumn || d2.referencesColumn;
        final isAgg = d1.isAggregate || d2.isAggregate;
        String sql;
        switch (interval) {
          case 'd':
          case 'y':
            sql = '(CAST(${d2.sql} AS DATE) - CAST(${d1.sql} AS DATE))';
          case 'yyyy':
            sql =
                '((EXTRACT(YEAR FROM CAST(${d2.sql} AS TIMESTAMP)) - EXTRACT(YEAR FROM CAST(${d1.sql} AS TIMESTAMP)))::INTEGER)';
          case 'm':
            sql =
                '((((EXTRACT(YEAR FROM CAST(${d2.sql} AS TIMESTAMP)) - EXTRACT(YEAR FROM CAST(${d1.sql} AS TIMESTAMP))) * 12) + (EXTRACT(MONTH FROM CAST(${d2.sql} AS TIMESTAMP)) - EXTRACT(MONTH FROM CAST(${d1.sql} AS TIMESTAMP))))::INTEGER)';
          case 'q':
            sql =
                '((((EXTRACT(YEAR FROM CAST(${d2.sql} AS TIMESTAMP)) - EXTRACT(YEAR FROM CAST(${d1.sql} AS TIMESTAMP))) * 4) + (EXTRACT(QUARTER FROM CAST(${d2.sql} AS TIMESTAMP)) - EXTRACT(QUARTER FROM CAST(${d1.sql} AS TIMESTAMP))))::INTEGER)';
          case 'w':
          case 'ww':
            sql =
                '(((CAST(${d2.sql} AS DATE) - CAST(${d1.sql} AS DATE)) / 7)::INTEGER)';
          case 'h':
            sql =
                '((EXTRACT(EPOCH FROM (CAST(${d2.sql} AS TIMESTAMP) - CAST(${d1.sql} AS TIMESTAMP))) / 3600)::INTEGER)';
          case 'n':
            sql =
                '((EXTRACT(EPOCH FROM (CAST(${d2.sql} AS TIMESTAMP) - CAST(${d1.sql} AS TIMESTAMP))) / 60)::INTEGER)';
          case 's':
            sql =
                '(EXTRACT(EPOCH FROM (CAST(${d2.sql} AS TIMESTAMP) - CAST(${d1.sql} AS TIMESTAMP)))::INTEGER)';
          default:
            fail('unsupported DateDiff interval $interval');
        }
        return _CompiledExpr(sql, 4, isAggregate: isAgg, referencesColumn: refs);

      case 'YEAR':
      case 'MONTH':
      case 'DAY':
        if (args.length != 1) fail('$name expects 1 argument');
        final d = compileArg(0, expectedType: 8);
        return _CompiledExpr(
          'EXTRACT($name FROM CAST(${d.sql} AS TIMESTAMP))::INTEGER',
          4,
          isAggregate: d.isAggregate,
          referencesColumn: d.referencesColumn,
        );

      case 'DATEPART':
        if (args.length != 2 || args[0].kind != 'text') {
          fail('DATEPART expects (intervalLiteral, date)');
        }
        final interval = args[0].value!.trim().toLowerCase();
        final d = compileArg(1, expectedType: 8);
        final field = switch (interval) {
          'yyyy' => 'YEAR',
          'q' => 'QUARTER',
          'm' => 'MONTH',
          'y' => 'DOY',
          'd' => 'DAY',
          'w' => 'DOW',
          'ww' => 'WEEK',
          'h' => 'HOUR',
          'n' => 'MINUTE',
          's' => 'SECOND',
          _ => fail('unsupported DatePart interval $interval'),
        };
        return _CompiledExpr(
          'EXTRACT($field FROM CAST(${d.sql} AS TIMESTAMP))::INTEGER',
          4,
          isAggregate: d.isAggregate,
          referencesColumn: d.referencesColumn,
        );

      case 'MONTHNAME':
        if (args.isEmpty || args.length > 2) {
          fail('MONTHNAME expects 1 or 2 arguments');
        }
        final m = compileArg(0, expectedType: 4);
        var abbrev = false;
        if (args.length == 2 && args[1].kind == 'bool') {
          abbrev = args[1].value == 'TRUE' || args[1].value == 'YES';
        }
        final fmt = abbrev ? 'FMMon' : 'FMMonth';
        return _CompiledExpr(
          "(CASE WHEN (${m.sql}) IS NULL THEN NULL ELSE TO_CHAR(MAKE_DATE(2000, GREATEST(1, LEAST(12, CAST(${m.sql} AS INTEGER))), 1), '$fmt') END)",
          10,
          isAggregate: m.isAggregate,
          referencesColumn: m.referencesColumn,
        );

      case 'DATESERIAL':
        if (args.length != 3) fail('DATESERIAL expects 3 arguments');
        final y = compileArg(0, expectedType: 4);
        final m = compileArg(1, expectedType: 4);
        final d = compileArg(2, expectedType: 4);
        return _CompiledExpr(
          'MAKE_DATE(CAST(${y.sql} AS INTEGER), CAST(${m.sql} AS INTEGER), CAST(${d.sql} AS INTEGER))::TIMESTAMP',
          8,
          isAggregate: y.isAggregate || m.isAggregate || d.isAggregate,
          referencesColumn:
              y.referencesColumn || m.referencesColumn || d.referencesColumn,
        );

      case 'IIF':
        if (args.length != 3) fail('IIF expects 3 arguments');
        final cond = compileArg(0, expectedType: 1);
        final tVal = compileArg(1);
        final fVal = compileArg(2, expectedType: tVal.typeCode);
        return _CompiledExpr(
          '(CASE WHEN (${cond.sql}) THEN ${tVal.sql} ELSE ${fVal.sql} END)',
          _widenType(tVal.typeCode, fVal.typeCode),
          isAggregate:
              cond.isAggregate || tVal.isAggregate || fVal.isAggregate,
          referencesColumn: cond.referencesColumn ||
              tVal.referencesColumn ||
              fVal.referencesColumn,
        );

      case 'NZ':
        if (args.isEmpty || args.length > 2) fail('NZ expects 1 or 2 arguments');
        final x = compileArg(0);
        if (args.length == 2) {
          final fb = compileArg(1, expectedType: x.typeCode);
          return _CompiledExpr(
            'COALESCE(${x.sql}, ${fb.sql})',
            _widenType(x.typeCode, fb.typeCode),
            isAggregate: x.isAggregate || fb.isAggregate,
            referencesColumn: x.referencesColumn || fb.referencesColumn,
          );
        }
        final isNum = const {3, 4, 5, 7}.contains(x.typeCode);
        return _CompiledExpr(
          isNum ? 'COALESCE(${x.sql}, 0)' : "COALESCE(CAST(${x.sql} AS TEXT), '')",
          isNum ? x.typeCode : 10,
          isAggregate: x.isAggregate,
          referencesColumn: x.referencesColumn,
        );

      case 'ISNULL':
        if (args.length != 1) fail('ISNULL expects 1 argument');
        final x = compileArg(0);
        return _CompiledExpr('((${x.sql}) IS NULL)', 1,
            isAggregate: x.isAggregate, referencesColumn: x.referencesColumn);

      case 'LEFT':
      case 'RIGHT':
        if (args.length != 2) fail('$name expects 2 arguments');
        final s = compileArg(0, expectedType: 10);
        final n = compileArg(1, expectedType: 4);
        return _CompiledExpr(
          '$name(CAST(${s.sql} AS TEXT), CAST(${n.sql} AS INTEGER))',
          10,
          isAggregate: s.isAggregate || n.isAggregate,
          referencesColumn: s.referencesColumn || n.referencesColumn,
        );

      case 'MID':
        if (args.length < 2 || args.length > 3) fail('MID expects 2 or 3 args');
        final s = compileArg(0, expectedType: 10);
        final st = compileArg(1, expectedType: 4);
        if (args.length == 2) {
          return _CompiledExpr(
            'SUBSTRING(CAST(${s.sql} AS TEXT) FROM CAST(${st.sql} AS INTEGER))',
            10,
            isAggregate: s.isAggregate || st.isAggregate,
            referencesColumn: s.referencesColumn || st.referencesColumn,
          );
        }
        final len = compileArg(2, expectedType: 4);
        return _CompiledExpr(
          'SUBSTRING(CAST(${s.sql} AS TEXT) FROM CAST(${st.sql} AS INTEGER) FOR CAST(${len.sql} AS INTEGER))',
          10,
          isAggregate: s.isAggregate || st.isAggregate || len.isAggregate,
          referencesColumn:
              s.referencesColumn || st.referencesColumn || len.referencesColumn,
        );

      case 'LEN':
        if (args.length != 1) fail('LEN expects 1 argument');
        final s = compileArg(0, expectedType: 10);
        return _CompiledExpr(
          'CHAR_LENGTH(CAST(${s.sql} AS TEXT))',
          4,
          isAggregate: s.isAggregate,
          referencesColumn: s.referencesColumn,
        );

      case 'TRIM':
      case 'LTRIM':
      case 'RTRIM':
      case 'UCASE':
      case 'LCASE':
        if (args.length != 1) fail('$name expects 1 argument');
        final s = compileArg(0, expectedType: 10);
        final pgFn = switch (name) {
          'TRIM' => 'BTRIM',
          'UCASE' => 'UPPER',
          'LCASE' => 'LOWER',
          _ => name,
        };
        return _CompiledExpr(
          '$pgFn(CAST(${s.sql} AS TEXT))',
          10,
          isAggregate: s.isAggregate,
          referencesColumn: s.referencesColumn,
        );

      case 'INSTR':
        if (args.length == 2) {
          final s = compileArg(0, expectedType: 10);
          final sub = compileArg(1, expectedType: 10);
          return _CompiledExpr(
            'STRPOS(CAST(${s.sql} AS TEXT), CAST(${sub.sql} AS TEXT))',
            4,
            isAggregate: s.isAggregate || sub.isAggregate,
            referencesColumn: s.referencesColumn || sub.referencesColumn,
          );
        }
        if (args.length == 3) {
          final st = compileArg(0, expectedType: 4);
          final s = compileArg(1, expectedType: 10);
          final sub = compileArg(2, expectedType: 10);
          return _CompiledExpr(
            '(CASE WHEN STRPOS(SUBSTRING(CAST(${s.sql} AS TEXT) FROM CAST(${st.sql} AS INTEGER)), CAST(${sub.sql} AS TEXT)) > 0 THEN STRPOS(SUBSTRING(CAST(${s.sql} AS TEXT) FROM CAST(${st.sql} AS INTEGER)), CAST(${sub.sql} AS TEXT)) + CAST(${st.sql} AS INTEGER) - 1 ELSE 0 END)',
            4,
            isAggregate: st.isAggregate || s.isAggregate || sub.isAggregate,
            referencesColumn:
                st.referencesColumn || s.referencesColumn || sub.referencesColumn,
          );
        }
        fail('INSTR expects 2 or 3 arguments');

      case 'REPLACE':
        if (args.length != 3) fail('REPLACE expects 3 arguments');
        final s = compileArg(0, expectedType: 10);
        final f = compileArg(1, expectedType: 10);
        final r = compileArg(2, expectedType: 10);
        return _CompiledExpr(
          'REPLACE(CAST(${s.sql} AS TEXT), CAST(${f.sql} AS TEXT), CAST(${r.sql} AS TEXT))',
          10,
          isAggregate: s.isAggregate || f.isAggregate || r.isAggregate,
          referencesColumn:
              s.referencesColumn || f.referencesColumn || r.referencesColumn,
        );

      case 'FORMAT':
        if (args.isEmpty || args.length > 2) fail('FORMAT expects 1 or 2 args');
        final x = compileArg(0);
        return _CompiledExpr(
          'CAST(${x.sql} AS TEXT)',
          10,
          isAggregate: x.isAggregate,
          referencesColumn: x.referencesColumn,
        );

      case 'CINT':
      case 'CLNG':
        if (args.length != 1) fail('$name expects 1 argument');
        final x = compileArg(0);
        return _CompiledExpr('CAST(${x.sql} AS INTEGER)', 4,
            isAggregate: x.isAggregate, referencesColumn: x.referencesColumn);

      case 'CDBL':
      case 'CSNG':
      case 'VAL':
        if (args.length != 1) fail('$name expects 1 argument');
        final x = compileArg(0);
        return _CompiledExpr('CAST(${x.sql} AS DOUBLE PRECISION)', 7,
            isAggregate: x.isAggregate, referencesColumn: x.referencesColumn);

      case 'CSTR':
        if (args.length != 1) fail('CSTR expects 1 argument');
        final x = compileArg(0);
        return _CompiledExpr('CAST(${x.sql} AS TEXT)', 10,
            isAggregate: x.isAggregate, referencesColumn: x.referencesColumn);

      case 'CDATE':
        if (args.length != 1) fail('CDATE expects 1 argument');
        final x = compileArg(0);
        return _CompiledExpr('CAST(${x.sql} AS TIMESTAMP)', 8,
            isAggregate: x.isAggregate, referencesColumn: x.referencesColumn);

      case 'CBOOL':
        if (args.length != 1) fail('CBOOL expects 1 argument');
        final x = compileArg(0);
        return _CompiledExpr('CAST(${x.sql} AS BOOLEAN)', 1,
            isAggregate: x.isAggregate, referencesColumn: x.referencesColumn);

      default:
        fail('unsupported Access SQL function $name');
    }
  }

  _CompiledExpr _asNumericSql(_CompiledExpr e) {
    if (e.typeCode == 1) {
      return _CompiledExpr(
        '(CASE WHEN (${e.sql}) THEN -1 ELSE 0 END)',
        4,
        isAggregate: e.isAggregate,
        referencesColumn: e.referencesColumn,
      );
    }
    return e;
  }

  bool _isUntypedParamOrNull(
    _ExtExpr expr,
    List<_TableBinding> usedOrder,
    Map<String, _TableBinding> outerUsed,
  ) {
    if (expr.kind == 'null' || expr.kind == 'param') return true;
    if (expr.kind == 'ident') {
      return _tryResolveUnqualified(expr.value!, usedOrder, outerUsed) == null;
    }
    return false;
  }

  _CompiledExpr _bindParameter(String name, int? expectedType) {
    final lowerKey = name.toLowerCase();
    final bareLower = name.startsWith('[') && name.endsWith(']') && !name.contains('!')
        ? name.substring(1, name.length - 1).toLowerCase()
        : lowerKey;
    final bType = shared.declaredParameters[lowerKey] ??
        shared.declaredParameters[bareLower] ??
        shared.parameterTypes[name] ??
        expectedType ??
        10;
    if (!shared.inferredParameters.containsKey(name)) {
      shared.inferredParameters[name] = bType;
    }
    if (shared.referencedParameters.add(name)) {
      shared.parameterOrder.add(name);
    }
    final m = shared.addBinding(_Binding(name, null, bType));
    return _CompiledExpr('CAST($m AS ${_pgType(bType)})', bType);
  }

  static String _pgType(int typeCode) {
    switch (typeCode) {
      case 1:
        return 'BOOLEAN';
      case 3:
      case 4:
      case 18:
        return 'INTEGER';
      case 5:
        return 'NUMERIC';
      case 7:
        return 'DOUBLE PRECISION';
      case 8:
        return 'TIMESTAMP';
      case 11:
        return 'BYTEA';
      default:
        return 'TEXT';
    }
  }

  static String _parseAccessDateLiteral(String raw) {
    final trimmed = raw.trim();
    final isoMatch = RegExp(
            r'^(\d{4})[-/](\d{1,2})[-/](\d{1,2})(?:\s+(\d{1,2}):(\d{2})(?::(\d{2}))?)?$')
        .firstMatch(trimmed);
    if (isoMatch != null) {
      final y = isoMatch.group(1)!;
      final m = isoMatch.group(2)!.padLeft(2, '0');
      final d = isoMatch.group(3)!.padLeft(2, '0');
      if (isoMatch.group(4) == null) return '$y-$m-$d';
      final hh = isoMatch.group(4)!.padLeft(2, '0');
      final mm = isoMatch.group(5)!;
      final ss = isoMatch.group(6) ?? '00';
      return '$y-$m-${d}T$hh:$mm:$ss';
    }
    final usMatch = RegExp(
            r'^(\d{1,2})/(\d{1,2})/(\d{4})(?:\s+(\d{1,2}):(\d{2})(?::(\d{2}))?\s*(AM|PM)?)?$',
            caseSensitive: false)
        .firstMatch(trimmed);
    if (usMatch != null) {
      final m = usMatch.group(1)!.padLeft(2, '0');
      final d = usMatch.group(2)!.padLeft(2, '0');
      final y = usMatch.group(3)!;
      if (usMatch.group(4) == null) return '$y-$m-$d';
      var hh = int.parse(usMatch.group(4)!);
      final mm = usMatch.group(5)!;
      final ss = usMatch.group(6) ?? '00';
      final ampm = usMatch.group(7)?.toUpperCase();
      if (ampm == 'PM' && hh < 12) hh += 12;
      if (ampm == 'AM' && hh == 12) hh = 0;
      return '$y-$m-${d}T${hh.toString().padLeft(2, '0')}:$mm:$ss';
    }
    throw FormatException('Unsupported Access SELECT: invalid date literal #$raw#');
  }
}

class _CompiledProjEntry {
  final _CompiledExpr expr;
  final String? explicitAlias;
  final String naturalColName;
  final String tableName;
  final String sourceColumnName;
  final String sqlAlias;
  final bool isWildcardCol;

  _CompiledProjEntry({
    required this.expr,
    this.explicitAlias,
    required this.naturalColName,
    required this.tableName,
    String? sourceColumnName,
    required this.sqlAlias,
    this.isWildcardCol = false,
  }) : sourceColumnName = sourceColumnName ?? naturalColName;
}
