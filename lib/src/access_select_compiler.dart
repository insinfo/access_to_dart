import 'dart:convert';
import 'analysis_model.dart';
import 'migration_identifier_style.dart';

/// Deliberately small, read-only Access SELECT compiler. Unsupported syntax is
/// rejected; no source SQL fragment is copied into the PostgreSQL statement.
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
  }) =>
      _Compiler(tables, identifiers, parameterTypes, asciiCaseInsensitiveText,
              questionMarkParameters, ordinalOutputAliases)
          .compile(source, outputNames);
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
  CompiledAccessSelect._(this.sql, List<AccessSelectOutput> outputs,
      List<_Binding> bindings, Set<String> parameters)
      : outputs = List.unmodifiable(outputs),
        _bindings = List.unmodifiable(bindings),
        _parameters = Set.unmodifiable(parameters);

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
      if (b.type == 4) {
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

class _Column {
  final AnalysisTable table;
  final AnalysisColumn column;
  _Column(this.table, this.column);
}

class _Compiler {
  final List<AnalysisTable> schema;
  final MigrationIdentifierPolicy ids;
  final Map<String, int> parameterTypes;
  final bool asciiText;
  final bool questionMarks;
  final bool ordinalAliases;
  final Map<String, AnalysisTable> used = {};
  final List<_Binding> bindings = [];
  final Set<String> referencedParameters = {};
  late List<_Token> tokens;
  int pos = 0;
  _Compiler(this.schema, this.ids, this.parameterTypes, this.asciiText,
      this.questionMarks, this.ordinalAliases);
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
    tokens = _lex(source);
    need('SELECT');
    final projections = <_Node>[];
    do {
      projections.add(columnRef());
    } while (take(','));
    need('FROM');
    final from = join();
    _Node? where;
    if (take('WHERE')) where = expression();
    take(';');
    if (current.kind != 'end') {
      fail('trailing or unsupported clause ${current.value}');
    }
    final columns = projections.map(resolve).toList();
    if (outputNames != null && outputNames.length != columns.length) {
      fail('output shape length');
    }
    final outputs = <AccessSelectOutput>[];
    final names = <String>{};
    for (var i = 0; i < columns.length; i++) {
      final c = columns[i];
      final duplicate = columns
              .where((v) =>
                  v.column.name.toLowerCase() == c.column.name.toLowerCase())
              .length >
          1;
      final natural =
          duplicate ? '${c.table.name}.${c.column.name}' : c.column.name;
      final name = outputNames?[i] ?? natural;
      if (name.toLowerCase() != natural.toLowerCase()) {
        fail('output shape mismatch at $i');
      }
      if (!names.add(name.toLowerCase())) fail('duplicate output name');
      if (![1, 4, 5, 8, 10].contains(c.column.typeCode) ||
          c.column.isCalculated) {
        fail('unsupported projected type');
      }
      outputs.add(AccessSelectOutput(
          name, c.table.name, c.column.name, c.column.typeCode));
    }
    final whereSql = where == null ? '' : ' WHERE ${predicate(where, false)}';
    if (referencedParameters.length != parameterTypes.length ||
        !referencedParameters.containsAll(parameterTypes.keys)) {
      fail('unused parameter declarations');
    }
    final selected = [
      for (var i = 0; i < columns.length; i++)
        '${columnSql(columns[i])} AS ${quote(ordinalAliases ? 'c$i' : outputs[i].name)}'
    ].join(', ');
    return CompiledAccessSelect._('SELECT $selected FROM $from$whereSql',
        outputs, bindings, referencedParameters);
  }

  _Node columnRef() {
    final table = identifier();
    need('.');
    return _Node('column', table, _Node('name', identifier()));
  }

  String join() {
    var result = tableAtom();
    while (take('INNER')) {
      need('JOIN');
      final right = tableAtom();
      need('ON');
      final on = expression();
      result = '($result INNER JOIN $right ON ${predicate(on, true)})';
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
    if (matches.length != 1) fail('unknown or ambiguous table $name');
    final table = matches.single;
    if (used.containsKey(table.name.toLowerCase())) {
      fail('repeated table requires unsupported alias');
    }
    if (schema
            .where((t) => ids.tableName(t.name) == ids.tableName(table.name))
            .length !=
        1) {
      fail('mapped table name collision');
    }
    used[table.name.toLowerCase()] = table;
    return '${quote(ids.tableName(table.name))} AS ${quote(table.name)}';
  }

  _Node expression([int minimum = 0]) {
    _Node left;
    if (take('(')) {
      left = expression();
      need(')');
    } else if (current.kind == 'text') {
      left = _Node('literal', tokens[pos++].value);
    } else {
      final name = identifier();
      if (take('!')) {
        final second = identifier();
        need('!');
        final third = identifier();
        left = _Node('parameter', '[$name]![$second]![$third]');
      } else {
        need('.');
        left = _Node('column', name, _Node('name', identifier()));
      }
    }
    while (true) {
      final precedence = at('AND')
          ? 1
          : at('=') || at('IS')
              ? 2
              : -1;
      if (precedence < minimum) break;
      if (take('IS')) {
        need('NULL');
        left = _Node('null', null, left);
      } else {
        final op = tokens[pos++].value.toUpperCase();
        left = _Node(op, null, left, expression(precedence + 1));
      }
    }
    return left;
  }

  _Column resolve(_Node node) {
    if (node.kind != 'column') fail('expected physical column');
    final table = used[node.value!.toLowerCase()];
    if (table == null) fail('column table outside FROM/JOIN scope');
    final found = table.columns
        .where((c) => c.name.toLowerCase() == node.left!.value!.toLowerCase())
        .toList();
    if (found.length != 1) fail('unknown or ambiguous column');
    final column = found.single;
    if (column.isCalculated ||
        table.columns
                .where((c) =>
                    ids.columnName(c.name) == ids.columnName(column.name))
                .length !=
            1) {
      fail('calculated column or mapped name collision');
    }
    return _Column(table, column);
  }

  String quote(String name) {
    if (name.contains('\u0000') || utf8.encode(name).length > 63) {
      fail('identifier exceeds supported PostgreSQL identifier constraints');
    }
    return ids.quoteIdentifier(name);
  }

  String columnSql(_Column c) =>
      '${quote(c.table.name)}.${quote(ids.columnName(c.column.name))}';
  String predicate(_Node n, bool inJoin) {
    if (n.kind == 'AND') {
      return '(${predicate(n.left!, inJoin)} AND ${predicate(n.right!, inJoin)})';
    }
    if (n.kind == 'null' && !inJoin) {
      return '(${columnSql(resolve(n.left!))} IS NULL)';
    }
    if (n.kind != '=') fail('predicate must be equality or IS NULL');
    final c = resolve(n.left!);
    final right = n.right!;
    if (right.kind == 'column') {
      final other = resolve(right);
      if (c.column.typeCode != 4 || other.column.typeCode != 4) {
        fail('only Long column joins supported');
      }
      return '(${columnSql(c)} = ${columnSql(other)})';
    }
    if (inJoin || !['literal', 'parameter'].contains(right.kind)) {
      fail('unsupported equality operands');
    }
    final type = c.column.typeCode;
    if (type != 4 && type != 10) fail('unsupported comparison type');
    if (type == 10 && !asciiText) {
      fail('text comparison requires explicit ASCII case policy');
    }
    if (right.kind == 'parameter') {
      if (parameterTypes[right.value] != 10) {
        fail('parameter must be declared DAO Text');
      }
      referencedParameters.add(right.value!);
    } else if (type == 10 && right.value!.codeUnits.any((v) => v > 127)) {
      fail('non-ASCII literal comparison');
    }
    bindings.add(_Binding(right.kind == 'parameter' ? right.value : null,
        right.kind == 'literal' ? right.value : null, type));
    final parameter = questionMarks ? '?' : '\$${bindings.length}';
    if (type == 4) return '(${columnSql(c)} = CAST($parameter AS INTEGER))';
    return '(lower(${columnSql(c)} COLLATE "C") = lower(CAST($parameter AS TEXT) COLLATE "C"))';
  }
}

List<_Token> _lex(String source) {
  final result = <_Token>[];
  var i = 0;
  while (i < source.length) {
    final char = source[i];
    if (RegExp(r'\s').hasMatch(char) || (i == 0 && char == '\ufeff')) {
      i++;
      continue;
    }
    if ('(),.=!;'.contains(char)) {
      result.add(_Token('symbol', char));
      i++;
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
