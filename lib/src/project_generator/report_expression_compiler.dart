part of 'project_generator.dart';

class _ReportExprToken {
  final String kind;
  final String value;
  const _ReportExprToken(this.kind, this.value);
}

List<_ReportExprToken>? _tokenizeReportExpr(String input) {
  final out = <_ReportExprToken>[];
  var i = 0;
  while (i < input.length) {
    final ch = input[i];
    if (RegExp(r'\s').hasMatch(ch)) {
      i++;
      continue;
    }
    if (i + 1 < input.length) {
      final two = input.substring(i, i + 2);
      if (const {'<>', '<=', '>=', '!='}.contains(two)) {
        out.add(_ReportExprToken('op', two == '!=' ? '<>' : two));
        i += 2;
        continue;
      }
    }
    if ('(),.&+-*/=<>!'.contains(ch)) {
      out.add(_ReportExprToken('op', ch));
      i++;
      continue;
    }
    if (ch == '"' || ch == "'") {
      final q = ch;
      i++;
      final sb = StringBuffer();
      var closed = false;
      while (i < input.length) {
        if (input[i] == q) {
          i++;
          if (i < input.length && input[i] == q) {
            sb.write(q);
            i++;
            continue;
          }
          closed = true;
          break;
        }
        sb.write(input[i++]);
      }
      if (!closed) return null;
      out.add(_ReportExprToken('str', sb.toString()));
      continue;
    }
    if (ch == '[') {
      i++;
      final sb = StringBuffer();
      var closed = false;
      while (i < input.length) {
        if (input[i] == ']') {
          i++;
          closed = true;
          break;
        }
        sb.write(input[i++]);
      }
      if (!closed || sb.isEmpty) return null;
      out.add(_ReportExprToken('bracket', sb.toString()));
      continue;
    }
    if (ch == '#') {
      i++;
      final sb = StringBuffer();
      var closed = false;
      while (i < input.length) {
        if (input[i] == '#') {
          i++;
          closed = true;
          break;
        }
        sb.write(input[i++]);
      }
      if (!closed || sb.isEmpty) return null;
      out.add(_ReportExprToken('date', sb.toString()));
      continue;
    }
    if (RegExp(r'[0-9]').hasMatch(ch)) {
      final start = i++;
      var dot = false;
      while (i < input.length) {
        final n = input[i];
        if (RegExp(r'[0-9]').hasMatch(n)) {
          i++;
        } else if (n == '.' &&
            !dot &&
            i + 1 < input.length &&
            RegExp(r'[0-9]').hasMatch(input[i + 1])) {
          dot = true;
          i++;
        } else {
          break;
        }
      }
      out.add(_ReportExprToken('num', input.substring(start, i)));
      continue;
    }
    if (RegExp(r'[A-Za-z_\u0080-\uffff@]').hasMatch(ch)) {
      final start = i++;
      while (i < input.length &&
          RegExp(r'[A-Za-z_0-9\u0080-\uffff]').hasMatch(input[i])) {
        i++;
      }
      out.add(_ReportExprToken('word', input.substring(start, i)));
      continue;
    }
    return null;
  }
  out.add(const _ReportExprToken('end', ''));
  return out;
}

class _GeneralReportExprCompiler {
  static const _aggFunctions = {'SUM', 'COUNT', 'AVG', 'MIN', 'MAX'};
  static const _scalarFunctions = {
    'DATE',
    'NOW',
    'YEAR',
    'MONTH',
    'DAY',
    'MONTHNAME',
    'DATEDIFF',
    'FORMAT',
    'IIF',
    'NZ',
    'ISNULL',
    'UCASE',
    'LCASE',
    'TRIM',
    'LTRIM',
    'RTRIM',
    'LEFT',
    'RIGHT',
    'MID',
    'LEN',
    'REPLACE',
    'INT',
    'FIX',
    'ABS',
    'ROUND',
    'VAL',
    'CSTR',
    'CINT',
    'CLNG',
    'CDBL',
  };

  final Map<String, List<Map>> columnsByLower;
  final List<Map> queryColumns;
  final bool isBound;
  final Map<String, String> queryParamByLower;
  final Map<String, String> promptParamByLower;
  final List<Map<String, Object?>> reportPromptParams;
  final Set<String> knownControlNamesLower;
  final Map<String, String> subReportQueryKeyByCtrlLower;
  final Map<String, List<Map>> subReportColsByCtrlLower;
  final List<Map> Function(
    String rawArg,
    Map<String, List<Map>> columnsByLower,
    List<Map> queryColumns,
  ) resolveColumnFn;

  late List<_ReportExprToken> _tokens;
  int _pos = 0;

  _GeneralReportExprCompiler({
    required this.columnsByLower,
    required this.queryColumns,
    required this.isBound,
    required this.queryParamByLower,
    required this.promptParamByLower,
    required this.reportPromptParams,
    required this.knownControlNamesLower,
    required this.subReportQueryKeyByCtrlLower,
    required this.subReportColsByCtrlLower,
    required this.resolveColumnFn,
  });

  _ReportExprToken get _cur => _tokens[_pos];
  bool _atOp(String op) => _cur.kind == 'op' && _cur.value == op;
  bool _atWord(String w) =>
      _cur.kind == 'word' && _cur.value.toUpperCase() == w;

  bool _takeOp(String op) {
    if (!_atOp(op)) return false;
    _pos++;
    return true;
  }

  bool _takeWord(String w) {
    if (!_atWord(w)) return false;
    _pos++;
    return true;
  }

  Map<String, Object?>? compile(String body) {
    final toks = _tokenizeReportExpr(body);
    if (toks == null || toks.isEmpty) return null;
    _tokens = toks;
    _pos = 0;
    final node = _parseOr(insideAggregate: false);
    if (node == null || _cur.kind != 'end') return null;
    return {'op': 'expr', 'node': node};
  }

  Map<String, Object?>? _parseOr({required bool insideAggregate}) {
    var left = _parseAnd(insideAggregate: insideAggregate);
    if (left == null) return null;
    while (_takeWord('OR')) {
      final prev = _pos;
      final right = _parseAnd(insideAggregate: insideAggregate);
      if (right == null || _pos <= prev) return null;
      left = {'k': 'bin', 'op': 'OR', 'l': left, 'r': right};
    }
    return left;
  }

  Map<String, Object?>? _parseAnd({required bool insideAggregate}) {
    var left = _parseNot(insideAggregate: insideAggregate);
    if (left == null) return null;
    while (_takeWord('AND')) {
      final prev = _pos;
      final right = _parseNot(insideAggregate: insideAggregate);
      if (right == null || _pos <= prev) return null;
      left = {'k': 'bin', 'op': 'AND', 'l': left, 'r': right};
    }
    return left;
  }

  Map<String, Object?>? _parseNot({required bool insideAggregate}) {
    if (_takeWord('NOT')) {
      final inner = _parseNot(insideAggregate: insideAggregate);
      return inner == null ? null : {'k': 'un', 'op': 'NOT', 'x': inner};
    }
    return _parseCompare(insideAggregate: insideAggregate);
  }

  Map<String, Object?>? _parseCompare({required bool insideAggregate}) {
    var left = _parseConcat(insideAggregate: insideAggregate);
    if (left == null) return null;
    while (_cur.kind == 'op' &&
        const {'=', '<>', '<', '<=', '>', '>='}.contains(_cur.value)) {
      final prev = _pos;
      final op = _tokens[_pos++].value;
      final right = _parseConcat(insideAggregate: insideAggregate);
      if (right == null || _pos <= prev) return null;
      left = {'k': 'bin', 'op': op, 'l': left, 'r': right};
    }
    return left;
  }

  Map<String, Object?>? _parseConcat({required bool insideAggregate}) {
    var left = _parseAdd(insideAggregate: insideAggregate);
    if (left == null) return null;
    while (_takeOp('&')) {
      final prev = _pos;
      final right = _parseAdd(insideAggregate: insideAggregate);
      if (right == null || _pos <= prev) return null;
      left = {'k': 'bin', 'op': '&', 'l': left, 'r': right};
    }
    return left;
  }

  Map<String, Object?>? _parseAdd({required bool insideAggregate}) {
    var left = _parseMul(insideAggregate: insideAggregate);
    if (left == null) return null;
    while (_atOp('+') || _atOp('-')) {
      final prev = _pos;
      final op = _tokens[_pos++].value;
      final right = _parseMul(insideAggregate: insideAggregate);
      if (right == null || _pos <= prev) return null;
      left = {'k': 'bin', 'op': op, 'l': left, 'r': right};
    }
    return left;
  }

  Map<String, Object?>? _parseMul({required bool insideAggregate}) {
    var left = _parseUnary(insideAggregate: insideAggregate);
    if (left == null) return null;
    while (_atOp('*') || _atOp('/')) {
      final prev = _pos;
      final op = _tokens[_pos++].value;
      final right = _parseUnary(insideAggregate: insideAggregate);
      if (right == null || _pos <= prev) return null;
      left = {'k': 'bin', 'op': op, 'l': left, 'r': right};
    }
    return left;
  }

  Map<String, Object?>? _parseUnary({required bool insideAggregate}) {
    if (_takeOp('-')) {
      final inner = _parseUnary(insideAggregate: insideAggregate);
      return inner == null ? null : {'k': 'un', 'op': '-', 'x': inner};
    }
    if (_takeOp('+')) {
      return _parseUnary(insideAggregate: insideAggregate);
    }
    return _parsePrimary(insideAggregate: insideAggregate);
  }

  Map<String, Object?>? _parsePrimary({required bool insideAggregate}) {
    if (_takeOp('(')) {
      final inner = _parseOr(insideAggregate: insideAggregate);
      if (inner == null || !_takeOp(')')) return null;
      return inner;
    }
    if (_cur.kind == 'str') {
      return {'k': 'lit', 'v': _tokens[_pos++].value};
    }
    if (_cur.kind == 'num') {
      final raw = _tokens[_pos++].value;
      final parsed = num.tryParse(raw);
      return parsed == null ? null : {'k': 'num', 'v': parsed};
    }
    if (_cur.kind == 'date') {
      return {'k': 'date_lit', 'v': _tokens[_pos++].value};
    }
    if (_cur.kind == 'word') {
      final upper = _cur.value.toUpperCase();
      if (upper == 'TRUE' || upper == 'YES') {
        _pos++;
        return const {'k': 'bool', 'v': true};
      }
      if (upper == 'FALSE' || upper == 'NO') {
        _pos++;
        return const {'k': 'bool', 'v': false};
      }
      if (upper == 'NULL') {
        _pos++;
        return const {'k': 'null'};
      }
      if (_pos + 1 < _tokens.length &&
          _tokens[_pos + 1].kind == 'op' &&
          _tokens[_pos + 1].value == '(') {
        final fnName = _tokens[_pos++].value.toUpperCase();
        _pos++; // consume '('
        final isAgg = _aggFunctions.contains(fnName);
        if (!isAgg && !_scalarFunctions.contains(fnName)) {
          return null;
        }
        if (isAgg && !isBound) {
          return null;
        }
        final args = <Map<String, Object?>>[];
        if (!_atOp(')')) {
          while (true) {
            final prev = _pos;
            if (isAgg && fnName == 'COUNT' && _takeOp('*')) {
              args.add(const {'k': 'star'});
            } else {
              final arg = _parseOr(insideAggregate: insideAggregate || isAgg);
              if (arg == null) return null;
              args.add(arg);
            }
            if (_pos <= prev) return null;
            if (!_takeOp(',')) break;
          }
        }
        if (!_takeOp(')')) return null;
        return {'k': 'fn', 'fn': fnName, 'args': args};
      }
    }

    if (_cur.kind == 'word' || _cur.kind == 'bracket') {
      final parts = <({bool isBracket, String name})>[
        (isBracket: _cur.kind == 'bracket', name: _tokens[_pos++].value),
      ];
      while ((_atOp('.') || _atOp('!')) && _pos + 1 < _tokens.length) {
        final next = _tokens[_pos + 1];
        if (next.kind != 'word' && next.kind != 'bracket') break;
        _pos++; // consume '.' or '!'
        parts.add(
            (isBracket: _cur.kind == 'bracket', name: _tokens[_pos++].value));
      }
      return _resolveRefParts(parts, insideAggregate: insideAggregate);
    }
    return null;
  }

  Map<String, Object?>? _resolveRefParts(
    List<({bool isBracket, String name})> parts, {
    required bool insideAggregate,
  }) {
    if (parts.length == 1) {
      final lower = parts.single.name.trim().toLowerCase();
      if (lower == 'page') return const {'k': 'var', 'v': 'page'};
      if (lower == 'pages') return const {'k': 'var', 'v': 'pages'};
    }

    // Check [Sub].[Report]![Ctrl] or [Sub].[Report].[Ctrl]
    if (parts.length == 3 &&
        (parts[1].name.toLowerCase() == 'report' ||
            parts[1].name.toLowerCase() == 'relatorio')) {
      final subLower = parts[0].name.trim().toLowerCase();
      final subCols = subReportColsByCtrlLower[subLower];
      if (subCols != null) {
        final ctrlLower = parts[2].name.trim().toLowerCase();
        final match = subCols
            .where((c) =>
                (c['name']?.toString().toLowerCase() ?? '') == ctrlLower)
            .toList();
        if (match.length == 1) {
          return {
            'k': 'sub',
            'sub': subLower,
            'ord': match.single['ordinal'] as int,
            'daoType': match.single['daoType'] as int,
          };
        }
      }
    }

    final joined = parts.map((p) => p.name.trim()).join('.');
    if (isBound) {
      final cols = resolveColumnFn(joined, columnsByLower, queryColumns);
      if (cols.length == 1) {
        return {
          'k': 'col',
          'ord': cols.single['ordinal'] as int,
          'daoType': cols.single['daoType'] as int,
        };
      }
    }

    if (parts.length == 1 && !insideAggregate) {
      final singleName = parts.single.name.trim();
      final lower = singleName.toLowerCase();
      final qParam = queryParamByLower[lower];
      if (qParam != null) {
        return {'k': 'param', 'name': qParam};
      }
      if (knownControlNamesLower.contains(lower)) {
        return {'k': 'ctrl', 'name': singleName};
      }
      final existingPrompt = promptParamByLower[lower];
      if (existingPrompt != null) {
        return {'k': 'param', 'name': existingPrompt};
      }
      if (parts.single.isBracket && !singleName.contains('.')) {
        promptParamByLower[lower] = singleName;
        reportPromptParams.add({
          'key': 'rp${reportPromptParams.length}',
          'sourceName': singleName,
          'daoType': 10,
          'optional': true,
        });
        return {'k': 'param', 'name': singleName};
      }
    }
    return null;
  }
}
