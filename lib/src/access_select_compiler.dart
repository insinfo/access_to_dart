import 'dart:convert';
import 'analysis_model.dart';
import 'migration_identifier_style.dart';

/// Read-only Access SELECT compiler. By default only the narrow contract subset
/// is permitted; callers compiling schema-verified report RecordSources may opt
/// into [allowExtendedSyntax] and [inferParameterTypes].
class AccessSelectCompiler {
  final List<AnalysisTable> tables;
  final MigrationIdentifierPolicy identifiers;
  const AccessSelectCompiler(this.tables,
      {this.identifiers = const MigrationIdentifierPolicy(
          style: MigrationIdentifierStyle.snakeAscii)});

  CompiledAccessSelect compile(
    String source, {
    Map<String, int> parameterTypes = const {},
    List<String>? outputNames,
    bool asciiCaseInsensitiveText = false,
    bool questionMarkParameters = false,
    bool ordinalOutputAliases = false,
    bool allowExtendedSyntax = false,
    bool inferParameterTypes = false,
    Map<String, String> namedSubqueries = const {},
  }) =>
      _Compiler(
        tables,
        identifiers,
        parameterTypes,
        asciiCaseInsensitiveText,
        questionMarkParameters,
        ordinalOutputAliases,
        allowExtendedSyntax,
        inferParameterTypes,
        namedSubqueries,
        const <String>{},
        0,
      ).compile(source, outputNames);
}

class AccessSelectOutput {
  final String name, sourceTable, sourceColumn;
  final int typeCode;
  const AccessSelectOutput(
      this.name, this.sourceTable, this.sourceColumn, this.typeCode);
}

class CompiledAccessSelect {
  final String sql;
  final List<AccessSelectOutput> outputs;
  final List<_Binding> _bindings;
  final Set<String> _parameters;
  final List<String> orderedParameters;
  final Map<String, int> inferredParameterTypes;
  final bool hasExplicitOrdering;

  CompiledAccessSelect._(
    this.sql,
    List<AccessSelectOutput> outputs,
    List<_Binding> bindings,
    Set<String> parameters,
    List<String> orderedParameters,
    Map<String, int> inferredParameterTypes,
    this.hasExplicitOrdering,
  )   : outputs = List.unmodifiable(outputs),
        _bindings = List.unmodifiable(bindings),
        _parameters = Set.unmodifiable(parameters),
        orderedParameters = List.unmodifiable(orderedParameters),
        inferredParameterTypes = Map.unmodifiable(inferredParameterTypes);

  List<Map<String, Object?>> get bindingDescriptors => List.unmodifiable([
        for (final binding in _bindings)
          Map<String, Object?>.unmodifiable({
            'parameter': binding.parameter,
            'literal': binding.literal,
            'typeCode': binding.type,
          }),
      ]);

  /// Positional values for PostgreSQL $1, $2... Never interpolate these values.
  List<Object?> bind(Map<String, Object?> parameters) {
    if (parameters.keys.toSet().difference(_parameters).isNotEmpty ||
        _parameters.difference(parameters.keys.toSet()).isNotEmpty) {
      throw FormatException('Parameter names must exactly match declarations');
    }
    return List.unmodifiable(_bindings.map((b) {
      final value = b.parameter == null ? b.literal : parameters[b.parameter];
      if (value == null) return null;
      if (b.parameter != null && value is! String) {
        throw FormatException('DAO Text parameter requires a string or null');
      }
      if (b.type == 4 || b.type == 3) {
        final text = value.toString();
        if (!RegExp(r'^[+-]?[0-9]+$').hasMatch(text)) {
          throw FormatException('Long comparison requires an integer value');
        }
        final number = int.tryParse(text);
        if (number == null || number < -2147483648 || number > 2147483647) {
          throw FormatException('Value outside Access Long range');
        }
        return number;
      }
      if (b.type == 1) {
        if (value is bool) return value;
        final lower = value.toString().trim().toLowerCase();
        if (lower == 'true' || lower == 'yes' || lower == 'sim' || lower == '1') {
          return true;
        }
        if (lower == 'false' || lower == 'no' || lower == 'nao' || lower == '0') {
          return false;
        }
        throw FormatException('Boolean comparison requires a boolean value');
      }
      if (b.type == 5 || b.type == 7) {
        if (value is num) return value;
        final number = num.tryParse(value.toString().trim().replaceAll(',', '.'));
        if (number == null) {
          throw FormatException('Numeric comparison requires a numeric value');
        }
        return number;
      }
      if (b.type == 8) {
        if (value is DateTime) return value.toIso8601String();
        return value.toString();
      }
      if (value is! String || value.codeUnits.any((c) => c > 127)) {
        throw FormatException('Only ASCII text comparisons are supported');
      }
      return value;
    }));
  }
}

class _Binding {
  final String? parameter;
  final Object? literal;
  final int type;
  _Binding(this.parameter, this.literal, this.type);
}

class _Token {
  final String kind, value;
  _Token(this.kind, this.value);
}

class _Node {
  final String kind;
  final String? value;
  final _Node? left, right;
  _Node(this.kind, [this.value, this.left, this.right]);
}

class _TableBinding {
  final AnalysisTable table;
  final String sqlAlias;
  final bool isVirtualSubquery;
  _TableBinding(this.table, this.sqlAlias, {this.isVirtualSubquery = false});
}

class _ProjectionItem {
  final bool isWildcard;
  final String? tableAlias;
  final _Node? columnNode;
  final String? outputAlias;
  _ProjectionItem.wildcard({this.tableAlias})
      : isWildcard = true,
        columnNode = null,
        outputAlias = null;
  _ProjectionItem.column(this.columnNode, this.outputAlias)
      : isWildcard = false,
        tableAlias = null;
}

class _ResolvedProjection {
  final _Column column;
  final String? explicitAlias;
  _ResolvedProjection(this.column, this.explicitAlias);
}

class _OrderByItem {
  final _Node columnNode;
  final bool descending;
  _OrderByItem(this.columnNode, this.descending);
}

class _Column {
  final AnalysisTable table;
  final String sqlAlias;
  final AnalysisColumn column;
  final bool isVirtualSubquery;
  _Column(this.table, this.sqlAlias, this.column,
      {this.isVirtualSubquery = false});
}

class _Compiler {
  static const _strictTypeCodes = [1, 4, 5, 8, 10];
  static const _extendedTypeCodes = [1, 3, 4, 5, 7, 8, 10, 11, 12, 18];
  static const _reservedFollowWords = {
    'FROM',
    'WHERE',
    'ON',
    'INNER',
    'LEFT',
    'RIGHT',
    'OUTER',
    'JOIN',
    'ORDER',
    'GROUP',
    'HAVING',
    'UNION',
  };

  final List<AnalysisTable> schema;
  final MigrationIdentifierPolicy ids;
  final Map<String, int> parameterTypes;
  final bool asciiText;
  final bool questionMarks;
  final bool ordinalAliases;
  final bool allowExtendedSyntax;
  final bool inferParameterTypes;
  final Map<String, String> namedSubqueries;
  final Set<String> activeSubqueries;
  final int bindingOffset;
  final Map<String, _TableBinding> used = {};
  final List<_TableBinding> usedOrder = [];
  final List<_Binding> bindings = [];
  final Set<String> referencedParameters = {};
  final List<String> parameterOrder = [];
  final Map<String, int> inferredParameters = {};
  late List<_Token> tokens;
  int pos = 0;

  _Compiler(
    this.schema,
    this.ids,
    this.parameterTypes,
    this.asciiText,
    this.questionMarks,
    this.ordinalAliases,
    this.allowExtendedSyntax,
    this.inferParameterTypes,
    this.namedSubqueries,
    this.activeSubqueries,
    this.bindingOffset,
  );

  List<int> get _supportedTypeCodes =>
      allowExtendedSyntax ? _extendedTypeCodes : _strictTypeCodes;

  Never fail(String message) =>
      throw FormatException('Unsupported Access SELECT: $message');
  _Token get current => tokens[pos];
  bool at(String value) =>
      current.kind == 'symbol' && current.value == value ||
      current.kind == 'word' && current.value.toUpperCase() == value;
  bool take(String value) {
    if (!at(value)) return false;
    pos++;
    return true;
  }

  void need(String value) {
    if (!take(value)) fail('expected $value at token $pos');
  }

  String identifier() {
    if (current.kind != 'word' && current.kind != 'identifier') {
      fail('expected identifier');
    }
    return tokens[pos++].value;
  }

  CompiledAccessSelect compile(String source, List<String>? outputNames) {
    tokens = _lex(source, allowExtendedSyntax: allowExtendedSyntax);
    need('SELECT');
    final isDistinct = allowExtendedSyntax && take('DISTINCT');
    final projectionItems = <_ProjectionItem>[];
    do {
      projectionItems.add(parseProjectionItem());
    } while (take(','));

    need('FROM');
    final from = join();
    _Node? where;
    if (take('WHERE')) where = expression();

    final orderByItems = <_OrderByItem>[];
    if (allowExtendedSyntax && take('ORDER')) {
      need('BY');
      do {
        final col = columnRef();
        var descending = false;
        if (take('DESC')) {
          descending = true;
        } else {
          take('ASC');
        }
        orderByItems.add(_OrderByItem(col, descending));
      } while (take(','));
    }

    take(';');
    if (current.kind != 'end') {
      fail('trailing or unsupported clause ${current.value}');
    }

    final resolvedProjections = _resolveProjections(projectionItems);
    if (outputNames != null &&
        outputNames.length != resolvedProjections.length) {
      fail('output shape length');
    }

    final outputs = <AccessSelectOutput>[];
    final names = <String>{};
    for (var i = 0; i < resolvedProjections.length; i++) {
      final item = resolvedProjections[i];
      final c = item.column;
      final duplicate = item.explicitAlias == null &&
          resolvedProjections
                  .where((v) =>
                      v.explicitAlias == null &&
                      v.column.column.name.toLowerCase() ==
                          c.column.name.toLowerCase())
                  .length >
              1;
      final natural = item.explicitAlias ??
          (duplicate ? '${c.sqlAlias}.${c.column.name}' : c.column.name);
      final name = outputNames?[i] ?? natural;
      if (name.toLowerCase() != natural.toLowerCase()) {
        fail('output shape mismatch at $i');
      }
      if (!names.add(name.toLowerCase())) fail('duplicate output name');
      if (!_supportedTypeCodes.contains(c.column.typeCode) ||
          c.column.isCalculated) {
        fail('unsupported projected type');
      }
      outputs.add(AccessSelectOutput(
          name, c.table.name, c.column.name, c.column.typeCode));
    }

    final whereSql = where == null ? '' : ' WHERE ${predicate(where, false)}';
    final orderSql = orderByItems.isEmpty
        ? ''
        : ' ORDER BY ${orderByItems.map((item) => '${columnSql(resolve(item.columnNode))} ${item.descending ? 'DESC' : 'ASC'}').join(', ')}';

    if (!inferParameterTypes &&
        (referencedParameters.length != parameterTypes.length ||
            !referencedParameters.containsAll(parameterTypes.keys))) {
      fail('unused parameter declarations');
    }

    final selected = [
      for (var i = 0; i < resolvedProjections.length; i++)
        '${columnSql(resolvedProjections[i].column)} AS ${quote(ordinalAliases ? 'c$i' : outputs[i].name)}'
    ].join(', ');
    final distinctPrefix = isDistinct ? 'DISTINCT ' : '';
    return CompiledAccessSelect._(
      'SELECT $distinctPrefix$selected FROM $from$whereSql$orderSql',
      outputs,
      bindings,
      referencedParameters,
      parameterOrder,
      inferredParameters,
      orderByItems.isNotEmpty,
    );
  }

  _ProjectionItem parseProjectionItem() {
    if (allowExtendedSyntax && take('*')) {
      return _ProjectionItem.wildcard();
    }
    final first = identifier();
    if (take('.')) {
      if (allowExtendedSyntax && take('*')) {
        return _ProjectionItem.wildcard(tableAlias: first);
      }
      final colNode = _Node('column', first, _Node('name', identifier()));
      String? alias;
      if (allowExtendedSyntax && take('AS')) {
        alias = identifier();
      }
      return _ProjectionItem.column(colNode, alias);
    }
    if (!allowExtendedSyntax) {
      fail('expected . at token $pos');
    }
    final colNode = _Node('unqualified', first);
    String? alias;
    if (take('AS')) {
      alias = identifier();
    }
    return _ProjectionItem.column(colNode, alias);
  }

  List<_ResolvedProjection> _resolveProjections(List<_ProjectionItem> items) {
    final result = <_ResolvedProjection>[];
    for (final item in items) {
      if (item.isWildcard) {
        final targets = <_TableBinding>[];
        if (item.tableAlias != null) {
          final found = used[item.tableAlias!.toLowerCase()];
          if (found == null) {
            fail('wildcard table outside FROM/JOIN scope');
          }
          targets.add(found);
        } else {
          targets.addAll(usedOrder);
        }
        for (final target in targets) {
          for (final col in target.table.columns) {
            if (col.isCalculated || !_supportedTypeCodes.contains(col.typeCode)) {
              continue;
            }
            if (target.table.columns
                    .where((c) => ids.columnName(c.name) == ids.columnName(col.name))
                    .length !=
                1) {
              fail('calculated column or mapped name collision');
            }
            result.add(
              _ResolvedProjection(
                _Column(target.table, target.sqlAlias, col,
                    isVirtualSubquery: target.isVirtualSubquery),
                null,
              ),
            );
          }
        }
      } else {
        result.add(
          _ResolvedProjection(resolve(item.columnNode!), item.outputAlias),
        );
      }
    }
    return result;
  }

  _Node columnRef() {
    final first = identifier();
    if (take('.')) {
      return _Node('column', first, _Node('name', identifier()));
    }
    if (!allowExtendedSyntax) {
      fail('expected . at token $pos');
    }
    return _Node('unqualified', first);
  }

  String join() {
    var result = joinChain();
    if (allowExtendedSyntax) {
      while (take(',')) {
        final right = joinChain();
        result = '($result CROSS JOIN $right)';
      }
    }
    return result;
  }

  String joinChain() {
    var result = tableAtom();
    while (true) {
      String? joinKeyword;
      if (take('INNER')) {
        need('JOIN');
        joinKeyword = 'INNER JOIN';
      } else if (allowExtendedSyntax && take('LEFT')) {
        take('OUTER');
        need('JOIN');
        joinKeyword = 'LEFT JOIN';
      } else if (allowExtendedSyntax && take('RIGHT')) {
        take('OUTER');
        need('JOIN');
        joinKeyword = 'RIGHT JOIN';
      }
      if (joinKeyword == null) break;
      final right = tableAtom();
      need('ON');
      final on = expression();
      result = '($result $joinKeyword $right ON ${predicate(on, true)})';
    }
    return result;
  }

  String tableAtom() {
    if (take('(')) {
      final sql = join();
      need(')');
      return sql;
    }
    final name = identifier();
    final matches = schema
        .where((t) =>
            t.name.toLowerCase() == name.toLowerCase() &&
            t.syntheticKind == null)
        .toList();
    if (matches.length == 1) {
      final table = matches.single;
      var sqlAlias = table.name;
      if (allowExtendedSyntax) {
        if (take('AS')) {
          sqlAlias = identifier();
        } else if ((current.kind == 'word' || current.kind == 'identifier') &&
            !_reservedFollowWords.contains(current.value.toUpperCase())) {
          sqlAlias = identifier();
        }
      }
      final aliasKey = sqlAlias.toLowerCase();
      if (used.containsKey(aliasKey)) {
        fail('repeated table requires unsupported alias');
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
    if (matches.isEmpty && allowExtendedSyntax) {
      final lower = name.toLowerCase();
      String? subName;
      String? subSql;
      for (final entry in namedSubqueries.entries) {
        if (entry.key.toLowerCase() == lower) {
          subName = entry.key;
          subSql = entry.value;
          break;
        }
      }
      if (subName != null &&
          subSql != null &&
          activeSubqueries.length < 4 &&
          !activeSubqueries.contains(lower)) {
        final subCompiler = _Compiler(
          schema,
          ids,
          parameterTypes,
          asciiText,
          questionMarks,
          false,
          true,
          inferParameterTypes,
          namedSubqueries,
          {...activeSubqueries, lower},
          bindingOffset + bindings.length,
        );
        final subPlan = subCompiler.compile(subSql, null);
        bindings.addAll(subCompiler.bindings);
        inferredParameters.addAll(subCompiler.inferredParameters);
        for (final p in subCompiler.parameterOrder) {
          if (referencedParameters.add(p)) {
            parameterOrder.add(p);
          }
        }
        var sqlAlias = subName;
        if (take('AS')) {
          sqlAlias = identifier();
        } else if ((current.kind == 'word' || current.kind == 'identifier') &&
            !_reservedFollowWords.contains(current.value.toUpperCase())) {
          sqlAlias = identifier();
        }
        final aliasKey = sqlAlias.toLowerCase();
        if (used.containsKey(aliasKey)) {
          fail('repeated table requires unsupported alias');
        }
        final virtualTable = AnalysisTable(
          name: subName,
          rowCount: 0,
          postgresDdl: null,
          dartClassName: null,
          columns: [
            for (final out in subPlan.outputs)
              AnalysisColumn(
                name: out.name,
                typeName: '',
                typeCode: out.typeCode,
                isAutoNumber: false,
                isCalculated: false,
                isRequired: false,
                caption: null,
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
        final binding =
            _TableBinding(virtualTable, sqlAlias, isVirtualSubquery: true);
        used[aliasKey] = binding;
        usedOrder.add(binding);
        return '(${subPlan.sql}) AS ${quote(sqlAlias)}';
      }
    }
    fail('unknown or ambiguous table $name');
  }

  _Node expression([int minimum = 0]) {
    _Node left;
    if (take('(')) {
      left = expression();
      need(')');
    } else if (current.kind == 'text') {
      left = _Node('literal', tokens[pos++].value);
    } else if (allowExtendedSyntax && current.kind == 'number') {
      left = _Node('number', tokens[pos++].value);
    } else if (allowExtendedSyntax && current.kind == 'word' &&
        const {'YES', 'NO', 'TRUE', 'FALSE'}
            .contains(current.value.toUpperCase())) {
      left = _Node('bool', tokens[pos++].value.toUpperCase());
    } else {
      final name = identifier();
      if (take('!')) {
        final second = identifier();
        need('!');
        final third = identifier();
        left = _Node('parameter', '[$name]![$second]![$third]');
      } else if (take('.')) {
        left = _Node('column', name, _Node('name', identifier()));
      } else if (allowExtendedSyntax) {
        left = _Node('unqualified', name);
      } else {
        fail('expected . at token $pos');
      }
    }
    while (true) {
      final upperWord =
          current.kind == 'word' ? current.value.toUpperCase() : '';
      final sym = current.kind == 'symbol' ? current.value : '';
      final precedence = allowExtendedSyntax
          ? (upperWord == 'OR'
              ? 1
              : upperWord == 'AND'
                  ? 2
                  : (const {'=', '<>', '!=', '<', '<=', '>', '>='}
                              .contains(sym) ||
                          const {'IS', 'LIKE'}.contains(upperWord))
                      ? 3
                      : -1)
          : (upperWord == 'AND'
              ? 1
              : (sym == '=' || upperWord == 'IS')
                  ? 2
                  : -1);
      if (precedence < minimum) break;
      if (take('IS')) {
        if (allowExtendedSyntax && take('NOT')) {
          need('NULL');
          left = _Node('not_null', null, left);
        } else {
          need('NULL');
          left = _Node('null', null, left);
        }
      } else {
        final op = tokens[pos++].value.toUpperCase();
        left = _Node(op, null, left, expression(precedence + 1));
      }
    }
    return left;
  }

  _Column? _tryResolveUnqualified(String colName) {
    final lower = colName.toLowerCase();
    final hits = <_Column>[];
    for (final binding in usedOrder) {
      for (final col in binding.table.columns) {
        if (col.name.toLowerCase() == lower) {
          hits.add(_Column(binding.table, binding.sqlAlias, col,
              isVirtualSubquery: binding.isVirtualSubquery));
        }
      }
    }
    if (hits.length != 1) return null;
    final hit = hits.single;
    if (hit.column.isCalculated ||
        (!hit.isVirtualSubquery &&
            hit.table.columns
                    .where((c) =>
                        ids.columnName(c.name) ==
                        ids.columnName(hit.column.name))
                    .length !=
                1)) {
      return null;
    }
    return hit;
  }

  _Column resolve(_Node node) {
    if (node.kind == 'unqualified') {
      if (!allowExtendedSyntax) fail('expected physical column');
      final resolved = _tryResolveUnqualified(node.value!);
      if (resolved == null) {
        fail('unknown or ambiguous column ${node.value}');
      }
      return resolved;
    }
    if (node.kind != 'column') fail('expected physical column');
    final binding = used[node.value!.toLowerCase()];
    if (binding == null) fail('column table outside FROM/JOIN scope');
    final found = binding.table.columns
        .where((c) => c.name.toLowerCase() == node.left!.value!.toLowerCase())
        .toList();
    if (found.length != 1) fail('unknown or ambiguous column');
    final column = found.single;
    if (column.isCalculated ||
        (!binding.isVirtualSubquery &&
            binding.table.columns
                    .where((c) =>
                        ids.columnName(c.name) == ids.columnName(column.name))
                    .length !=
                1)) {
      fail('calculated column or mapped name collision');
    }
    return _Column(binding.table, binding.sqlAlias, column,
        isVirtualSubquery: binding.isVirtualSubquery);
  }

  String quote(String name) {
    if (name.contains('\u0000') || utf8.encode(name).length > 63) {
      fail('identifier exceeds supported PostgreSQL identifier constraints');
    }
    return ids.quoteIdentifier(name);
  }

  String columnSql(_Column c) => c.isVirtualSubquery
      ? '${quote(c.sqlAlias)}.${quote(c.column.name)}'
      : '${quote(c.sqlAlias)}.${quote(ids.columnName(c.column.name))}';

  String predicate(_Node n, bool inJoin) {
    if (n.kind == 'AND') {
      return '(${predicate(n.left!, inJoin)} AND ${predicate(n.right!, inJoin)})';
    }
    if (allowExtendedSyntax && n.kind == 'OR') {
      return '(${predicate(n.left!, inJoin)} OR ${predicate(n.right!, inJoin)})';
    }
    if (n.kind == 'null' && (!inJoin || allowExtendedSyntax)) {
      return '(${columnSql(resolve(n.left!))} IS NULL)';
    }
    if (allowExtendedSyntax && n.kind == 'not_null') {
      return '(${columnSql(resolve(n.left!))} IS NOT NULL)';
    }

    const extendedOps = {'=', '<>', '!=', '<', '<=', '>', '>=', 'LIKE'};
    final isAllowedOp =
        allowExtendedSyntax ? extendedOps.contains(n.kind) : n.kind == '=';
    if (!isAllowedOp) fail('predicate must be equality or IS NULL');

    final c = resolve(n.left!);
    final right = n.right!;
    final sqlOp = switch (n.kind) {
      '!=' => '<>',
      'LIKE' => 'ILIKE',
      _ => n.kind,
    };

    if (right.kind == 'column' ||
        (allowExtendedSyntax &&
            right.kind == 'unqualified' &&
            _tryResolveUnqualified(right.value!) != null)) {
      if (n.kind == 'LIKE') fail('LIKE requires text pattern operand');
      final other = resolve(right);
      if (!allowExtendedSyntax) {
        if (c.column.typeCode != 4 || other.column.typeCode != 4) {
          fail('only Long column joins supported');
        }
      } else {
        final t1 = c.column.typeCode;
        final t2 = other.column.typeCode;
        final bothInt = const {3, 4}.contains(t1) && const {3, 4}.contains(t2);
        if (t1 != t2 && !bothInt) {
          fail('incompatible column comparison types $t1 and $t2');
        }
      }
      return '(${columnSql(c)} $sqlOp ${columnSql(other)})';
    }

    final rightAsParam = (allowExtendedSyntax &&
            right.kind == 'unqualified' &&
            _tryResolveUnqualified(right.value!) == null)
        ? '[${right.value!}]'
        : (right.kind == 'parameter' ? right.value! : null);
    final isValueLiteral = right.kind == 'literal' ||
        (allowExtendedSyntax &&
            (right.kind == 'number' || right.kind == 'bool'));
    if ((inJoin && !allowExtendedSyntax) ||
        (rightAsParam == null && !isValueLiteral)) {
      fail('unsupported equality operands');
    }

    final type = c.column.typeCode;
    final allowedCompareTypes = allowExtendedSyntax
        ? const [1, 3, 4, 5, 7, 8, 10, 12]
        : const [4, 10];
    if (!allowedCompareTypes.contains(type)) {
      fail('unsupported comparison type');
    }
    if ((type == 10 || type == 12) && !asciiText) {
      fail('text comparison requires explicit ASCII case policy');
    }
    if (n.kind == 'LIKE' && type != 10 && type != 12) {
      fail('LIKE requires text column');
    }

    if (rightAsParam != null) {
      if (!parameterTypes.containsKey(rightAsParam)) {
        if (!allowExtendedSyntax || !inferParameterTypes) {
          fail('parameter must be declared DAO Text');
        }
        inferredParameters[rightAsParam] = 10;
      } else if (parameterTypes[rightAsParam] != 10) {
        fail('parameter must be declared DAO Text');
      }
      if (referencedParameters.add(rightAsParam)) {
        parameterOrder.add(rightAsParam);
      }
      var paramTypeForBinding = type;
      bindings.add(_Binding(rightAsParam, null, paramTypeForBinding));
    } else if (right.kind == 'literal') {
      if (!allowExtendedSyntax &&
          type == 10 &&
          right.value!.codeUnits.any((v) => v > 127)) {
        fail('non-ASCII literal comparison');
      }
      var literalValue = right.value!;
      if (n.kind == 'LIKE') {
        literalValue = _accessLikeToSql(literalValue);
      }
      bindings.add(_Binding(null, literalValue, type));
    } else if (right.kind == 'number') {
      if (!const [3, 4, 5, 7].contains(type)) {
        fail('numeric literal mismatch with column type $type');
      }
      final Object? numVal = (type == 3 || type == 4)
          ? int.tryParse(right.value!)
          : double.tryParse(right.value!);
      if (numVal == null) fail('invalid numeric literal ${right.value}');
      bindings.add(_Binding(null, numVal, type));
    } else if (right.kind == 'bool') {
      if (type != 1) fail('boolean literal mismatch with column type $type');
      final boolVal = right.value == 'YES' || right.value == 'TRUE';
      bindings.add(_Binding(null, boolVal, 1));
    }

    final parameter = questionMarks ? '?' : '\$${bindingOffset + bindings.length}';
    if (type == 3 || type == 4) {
      return '(${columnSql(c)} $sqlOp CAST($parameter AS INTEGER))';
    }
    if (type == 5 || type == 7) {
      final pgCast = type == 5 ? 'NUMERIC' : 'DOUBLE PRECISION';
      return '(${columnSql(c)} $sqlOp CAST($parameter AS $pgCast))';
    }
    if (type == 1) {
      return '(${columnSql(c)} $sqlOp CAST($parameter AS BOOLEAN))';
    }
    if (type == 8) {
      return '(${columnSql(c)} $sqlOp CAST($parameter AS TIMESTAMP))';
    }
    if (n.kind == 'LIKE') {
      return '(${columnSql(c)} ILIKE CAST($parameter AS TEXT))';
    }
    return '(lower(${columnSql(c)} COLLATE "C") $sqlOp lower(CAST($parameter AS TEXT) COLLATE "C"))';
  }

  static String _accessLikeToSql(String pattern) =>
      pattern.replaceAll('*', '%').replaceAll('?', '_');
}

List<_Token> _lex(String source, {bool allowExtendedSyntax = false}) {
  final result = <_Token>[];
  var i = 0;
  while (i < source.length) {
    final char = source[i];
    if (RegExp(r'\s').hasMatch(char) || (i == 0 && char == '\ufeff')) {
      i++;
      continue;
    }
    if (allowExtendedSyntax && i + 1 < source.length) {
      final two = source.substring(i, i + 2);
      if (const {'<>', '<=', '>=', '!='}.contains(two)) {
        result.add(_Token('symbol', two));
        i += 2;
        continue;
      }
    }
    final singleSymbols = allowExtendedSyntax ? '(),.=!;*<>' : '(),.=!;';
    if (singleSymbols.contains(char)) {
      result.add(_Token('symbol', char));
      i++;
      continue;
    }
    if (allowExtendedSyntax && RegExp(r'[0-9]').hasMatch(char)) {
      final start = i++;
      var sawDot = false;
      while (i < source.length) {
        final next = source[i];
        if (RegExp(r'[0-9]').hasMatch(next)) {
          i++;
        } else if (next == '.' &&
            !sawDot &&
            i + 1 < source.length &&
            RegExp(r'[0-9]').hasMatch(source[i + 1])) {
          sawDot = true;
          i++;
        } else {
          break;
        }
      }
      result.add(_Token('number', source.substring(start, i)));
      continue;
    }
    if (char == '[' || char == '"' || char == "'") {
      final end = char == '[' ? ']' : char;
      final buffer = StringBuffer();
      i++;
      var closed = false;
      while (i < source.length) {
        if (source[i] == end) {
          i++;
          if (i < source.length && source[i] == end) {
            buffer.write(end);
            i++;
            continue;
          }
          closed = true;
          break;
        }
        buffer.write(source[i++]);
      }
      if (!closed || buffer.isEmpty && char == '[') {
        throw FormatException('Unterminated/empty quoted identifier');
      }
      result
          .add(_Token(char == '[' ? 'identifier' : 'text', buffer.toString()));
      continue;
    }
    if (RegExp(r'[A-Za-z_\u0080-\uffff]').hasMatch(char)) {
      final start = i++;
      while (i < source.length &&
          RegExp(r'[A-Za-z_0-9\u0080-\uffff]').hasMatch(source[i])) {
        i++;
      }
      result.add(_Token('word', source.substring(start, i)));
      continue;
    }
    throw FormatException('Unsupported SELECT character at offset $i');
  }
  result.add(_Token('end', ''));
  return result;
}
