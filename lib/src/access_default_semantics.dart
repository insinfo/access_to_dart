import 'dart:convert';

import 'package:jackcess_dart/jackcess_dart.dart';

import 'analysis_model.dart';
import 'identifier_utils.dart';

class AccessDefaultSemanticValue {
  final String rawValue;
  final String normalizedValue;
  final String? postgresExpression;
  final String? dartExpression;
  final Set<String> dartHelpers;
  final bool requiresPgcryptoExtension;

  const AccessDefaultSemanticValue({
    required this.rawValue,
    required this.normalizedValue,
    required this.postgresExpression,
    required this.dartExpression,
    required this.dartHelpers,
    required this.requiresPgcryptoExtension,
  });
}

class AccessDefaultSemanticTranslator {
  const AccessDefaultSemanticTranslator();

  AccessDefaultSemanticValue? translate(AnalysisColumn column) {
    final rawValue = column.defaultValue?.trim();
    if (rawValue == null || rawValue.isEmpty) {
      return null;
    }

    final normalizedValue = _stripAccessDefaultPrefix(rawValue);
    if (normalizedValue.isEmpty) {
      return null;
    }

    final dartHelpers = <String>{};
    final postgresExpression = _translateForPostgres(column, normalizedValue);
    final dartExpression = _translateForDart(
      column,
      normalizedValue,
      dartHelpers,
    );

    return AccessDefaultSemanticValue(
      rawValue: rawValue,
      normalizedValue: normalizedValue,
      postgresExpression: postgresExpression,
      dartExpression: dartExpression,
      dartHelpers: dartHelpers,
      requiresPgcryptoExtension:
          _isGuidType(column) && normalizedValue.toUpperCase() == 'GENGUID()',
    );
  }

  String _translateForPostgres(AnalysisColumn column, String normalizedValue) {
    final upper = normalizedValue.toUpperCase();
    if (_isGuidType(column) && upper == 'GENGUID()') {
      return 'gen_random_uuid()';
    }
    if (upper == 'NULL') {
      return 'NULL';
    }
    if (upper == 'NOW()') {
      return 'CURRENT_TIMESTAMP';
    }
    if (upper == 'DATE()') {
      return 'CURRENT_DATE';
    }
    if (upper == 'TIME()') {
      return _isDateTimeType(column)
          ? "(TIMESTAMP '1899-12-30 00:00:00' + (LOCALTIME - TIME '00:00:00'))"
          : 'LOCALTIME';
    }
    if (_isAccessDateLiteral(normalizedValue)) {
      return _singleQuotedLiteral(
        normalizedValue.substring(1, normalizedValue.length - 1).trim(),
      );
    }
    if (_isQuotedLiteral(normalizedValue)) {
      return _singleQuotedLiteral(
        normalizedValue.substring(1, normalizedValue.length - 1),
      );
    }

    if (_isBooleanType(column)) {
      if (upper == 'TRUE' || upper == 'YES' || normalizedValue == '-1') {
        return 'TRUE';
      }
      if (upper == 'FALSE' || upper == 'NO' || normalizedValue == '0') {
        return 'FALSE';
      }
    }

    if (num.tryParse(normalizedValue) != null) {
      return normalizedValue;
    }

    if (_isTextType(column) && _isBareTextLiteral(normalizedValue)) {
      return _singleQuotedLiteral(normalizedValue);
    }

    final parsed = AccessExpressionParser.tryParse(normalizedValue);
    if (parsed == null) {
      return _isTextType(column)
          ? _singleQuotedLiteral(normalizedValue)
          : normalizedValue;
    }
    return _translateNodeToPostgres(parsed, column) ??
        (_isTextType(column)
            ? _singleQuotedLiteral(normalizedValue)
            : normalizedValue);
  }

  String? _translateNodeToPostgres(
    AccessExpressionNode node,
    AnalysisColumn column,
  ) {
    if (node is AccessStringNode) {
      return _singleQuotedLiteral(node.value);
    }
    if (node is AccessNumberNode) {
      return node.value;
    }
    if (node is AccessIdentifierNode) {
      if (node.parts.isEmpty) {
        return null;
      }
      final joined = node.parts.join('.');
      final upper = joined.toUpperCase();
      if (upper == 'TRUE' || upper == 'YES') {
        return 'TRUE';
      }
      if (upper == 'FALSE' || upper == 'NO') {
        return 'FALSE';
      }
      if (upper == 'NULL') {
        return 'NULL';
      }
      return _isTextType(column) ? _singleQuotedLiteral(joined) : null;
    }
    if (node is AccessUnaryNode) {
      final operand = _translateNodeToPostgres(node.operand, column);
      if (operand == null) {
        return null;
      }
      final op = node.operatorName.toUpperCase() == 'NOT'
          ? 'NOT '
          : node.operatorName;
      return '($op$operand)';
    }
    if (node is AccessBinaryNode) {
      final left = _translateNodeToPostgres(node.left, column);
      final right = _translateNodeToPostgres(node.right, column);
      if (left == null || right == null) {
        return null;
      }
      final op = switch (node.operatorName.toUpperCase()) {
        '&' => '||',
        '=' => '=',
        '<>' => '!=',
        'AND' => 'AND',
        'OR' => 'OR',
        '+' => '+',
        '-' => '-',
        '*' => '*',
        '/' => '/',
        '>' => '>',
        '<' => '<',
        '>=' => '>=',
        '<=' => '<=',
        _ => '',
      };
      if (op.isEmpty) {
        return null;
      }
      return '($left $op $right)';
    }
    if (node is AccessFunctionCallNode) {
      final name = foldToAscii(node.name).toUpperCase();
      final translatedArgs = node.arguments
          .map((argument) => _translateNodeToPostgres(argument, column))
          .toList(growable: false);
      if (translatedArgs.any((argument) => argument == null)) {
        return null;
      }
      final args = translatedArgs.cast<String>();
      switch (name) {
        case 'INT':
          if (args.length != 1) {
            return null;
          }
          return 'FLOOR(${args[0]})';
        case 'ABS':
          if (args.length != 1) {
            return null;
          }
          return 'ABS(${args[0]})';
        case 'ROUND':
          if (args.isEmpty || args.length > 2) {
            return null;
          }
          return 'ROUND(${args.join(', ')})';
        case 'UCASE':
          if (args.length != 1) {
            return null;
          }
          return 'UPPER(${args[0]})';
        case 'LCASE':
          if (args.length != 1) {
            return null;
          }
          return 'LOWER(${args[0]})';
        case 'TRIM':
          if (args.length != 1) {
            return null;
          }
          return 'BTRIM(${args[0]})';
        case 'LTRIM':
          if (args.length != 1) {
            return null;
          }
          return 'LTRIM(${args[0]})';
        case 'RTRIM':
          if (args.length != 1) {
            return null;
          }
          return 'RTRIM(${args[0]})';
        case 'LEN':
          if (args.length != 1) {
            return null;
          }
          return 'CHAR_LENGTH(${args[0]})';
        case 'LEFT':
          if (args.length != 2) {
            return null;
          }
          return 'LEFT(${args[0]}, ${args[1]})';
        case 'RIGHT':
          if (args.length != 2) {
            return null;
          }
          return 'RIGHT(${args[0]}, ${args[1]})';
        case 'MID':
          if (args.length != 2 && args.length != 3) {
            return null;
          }
          if (args.length == 2) {
            return 'SUBSTRING(${args[0]} FROM ${args[1]})';
          }
          return 'SUBSTRING(${args[0]} FROM ${args[1]} FOR ${args[2]})';
        case 'DATE()':
        case 'NOW()':
        case 'TIME()':
          return _translateForPostgres(column, name);
        case 'DATESERIAL':
          if (args.length != 3) {
            return null;
          }
          return _buildPostgresDateSerial(args, column);
        case 'TIMESERIAL':
          if (args.length != 3) {
            return null;
          }
          return _buildPostgresTimeSerial(args, column);
        case 'NZ':
          if (args.length == 1) {
            return 'COALESCE(${args[0]}, \'\')';
          }
          if (args.length == 2) {
            return 'COALESCE(${args[0]}, ${args[1]})';
          }
          return null;
        default:
          return null;
      }
    }
    return null;
  }

  String? _translateForDart(
    AnalysisColumn column,
    String normalizedValue,
    Set<String> dartHelpers,
  ) {
    final upper = normalizedValue.toUpperCase();
    if (_isGuidType(column) && upper == 'GENGUID()') {
      dartHelpers.add('uuidV4');
      return '_accessUuidV4()';
    }
    if (upper == 'NULL') {
      return 'null';
    }
    if (upper == 'NOW()') {
      return 'DateTime.now()';
    }
    if (upper == 'DATE()') {
      dartHelpers.add('today');
      return '_accessToday()';
    }
    if (upper == 'TIME()') {
      dartHelpers.add('timeNow');
      return '_accessTimeNow()';
    }
    if (_isAccessDateLiteral(normalizedValue)) {
      if (_isDateTimeType(column)) {
        dartHelpers.add('dateLiteral');
        return '_accessDateLiteral(${_dartStringLiteral(normalizedValue.substring(1, normalizedValue.length - 1).trim())})';
      }
      return _dartStringLiteral(
        normalizedValue.substring(1, normalizedValue.length - 1).trim(),
      );
    }
    if (_isQuotedLiteral(normalizedValue)) {
      return _dartStringLiteral(
        normalizedValue.substring(1, normalizedValue.length - 1),
      );
    }
    if (_isBooleanType(column)) {
      if (upper == 'TRUE' || upper == 'YES' || normalizedValue == '-1') {
        return 'true';
      }
      if (upper == 'FALSE' || upper == 'NO' || normalizedValue == '0') {
        return 'false';
      }
    }
    if (num.tryParse(normalizedValue) != null) {
      return normalizedValue;
    }
    if (_isTextType(column) && _isBareTextLiteral(normalizedValue)) {
      return _dartStringLiteral(normalizedValue);
    }

    final parsed = AccessExpressionParser.tryParse(normalizedValue);
    if (parsed == null) {
      return _isTextType(column) ? _dartStringLiteral(normalizedValue) : null;
    }
    return _translateNodeToDart(parsed, column, dartHelpers) ??
        (_isTextType(column) ? _dartStringLiteral(normalizedValue) : null);
  }

  String? _translateNodeToDart(
    AccessExpressionNode node,
    AnalysisColumn column,
    Set<String> dartHelpers,
  ) {
    if (node is AccessStringNode) {
      return _dartStringLiteral(node.value);
    }
    if (node is AccessNumberNode) {
      return node.value;
    }
    if (node is AccessIdentifierNode) {
      if (node.parts.isEmpty) {
        return null;
      }
      final joined = node.parts.join('.');
      final upper = joined.toUpperCase();
      if (upper == 'TRUE' || upper == 'YES') {
        return 'true';
      }
      if (upper == 'FALSE' || upper == 'NO') {
        return 'false';
      }
      if (upper == 'NULL') {
        return 'null';
      }
      return _isTextType(column) ? _dartStringLiteral(joined) : null;
    }
    if (node is AccessUnaryNode) {
      final operand = _translateNodeToDart(node.operand, column, dartHelpers);
      if (operand == null) {
        return null;
      }
      final op = node.operatorName.toUpperCase() == 'NOT'
          ? '!'
          : node.operatorName;
      return '($op$operand)';
    }
    if (node is AccessBinaryNode) {
      final left = _translateNodeToDart(node.left, column, dartHelpers);
      final right = _translateNodeToDart(node.right, column, dartHelpers);
      if (left == null || right == null) {
        return null;
      }
      final op = switch (node.operatorName.toUpperCase()) {
        '&' => '+',
        '=' => '==',
        '<>' => '!=',
        'AND' => '&&',
        'OR' => '||',
        '+' => '+',
        '-' => '-',
        '*' => '*',
        '/' => '/',
        '>' => '>',
        '<' => '<',
        '>=' => '>=',
        '<=' => '<=',
        _ => '',
      };
      if (op.isEmpty) {
        return null;
      }
      return '($left $op $right)';
    }
    if (node is AccessFunctionCallNode) {
      final name = foldToAscii(node.name).toUpperCase();
      final translatedArgs = node.arguments
          .map((argument) => _translateNodeToDart(argument, column, dartHelpers))
          .toList(growable: false);
      if (translatedArgs.any((argument) => argument == null)) {
        return null;
      }
      final args = translatedArgs.cast<String>();
      switch (name) {
        case 'INT':
          if (args.length != 1) {
            return null;
          }
          return '(${args[0]}).floor()';
        case 'ABS':
          if (args.length != 1) {
            return null;
          }
          return '(${args[0]}).abs()';
        case 'ROUND':
          if (args.length == 1) {
            return '(${args[0]}).round()';
          }
          if (args.length == 2) {
            return '(${args[0]}).toStringAsFixed(${args[1]} as int)';
          }
          return null;
        case 'UCASE':
          if (args.length != 1) {
            return null;
          }
          return '(${args[0]}).toUpperCase()';
        case 'LCASE':
          if (args.length != 1) {
            return null;
          }
          return '(${args[0]}).toLowerCase()';
        case 'TRIM':
          if (args.length != 1) {
            return null;
          }
          return '(${args[0]}).trim()';
        case 'LTRIM':
          if (args.length != 1) {
            return null;
          }
          return '(${args[0]}).trimLeft()';
        case 'RTRIM':
          if (args.length != 1) {
            return null;
          }
          return '(${args[0]}).trimRight()';
        case 'LEFT':
          if (args.length != 2) {
            return null;
          }
          dartHelpers.add('left');
          return '_accessLeft(${args[0]}, ${args[1]})';
        case 'RIGHT':
          if (args.length != 2) {
            return null;
          }
          dartHelpers.add('right');
          return '_accessRight(${args[0]}, ${args[1]})';
        case 'MID':
          if (args.length != 2 && args.length != 3) {
            return null;
          }
          dartHelpers.add('mid');
          final thirdArg = args.length == 3 ? ', ${args[2]}' : '';
          return '_accessMid(${args[0]}, ${args[1]}$thirdArg)';
        case 'DATESERIAL':
          if (args.length != 3) {
            return null;
          }
          dartHelpers.add('dateSerial');
          return '_accessDateSerial(${args.join(', ')})';
        case 'TIMESERIAL':
          if (args.length != 3) {
            return null;
          }
          dartHelpers.add('timeSerial');
          return '_accessTimeSerial(${args.join(', ')})';
        case 'NOW':
          return 'DateTime.now()';
        case 'DATE':
          dartHelpers.add('today');
          return '_accessToday()';
        case 'TIME':
          dartHelpers.add('timeNow');
          return '_accessTimeNow()';
        case 'GENGUID':
          dartHelpers.add('uuidV4');
          return '_accessUuidV4()';
        default:
          return null;
      }
    }
    return null;
  }

  String _buildPostgresDateSerial(
    List<String> args,
    AnalysisColumn column,
  ) {
    final year = _normalizeAccessYearExpression(args[0]);
    final expression =
        "(MAKE_DATE($year, 1, 1) + ((${args[1]}) - 1) * INTERVAL '1 month' + ((${args[2]}) - 1) * INTERVAL '1 day')";
    if (_isDateTimeType(column)) {
      return '($expression)::timestamp';
    }
    return '($expression)::date';
  }

  String _buildPostgresTimeSerial(
    List<String> args,
    AnalysisColumn column,
  ) {
    if (_isDateTimeType(column)) {
      return "(TIMESTAMP '1899-12-30 00:00:00' + (${args[0]}) * INTERVAL '1 hour' + (${args[1]}) * INTERVAL '1 minute' + (${args[2]}) * INTERVAL '1 second')";
    }
    return "((TIME '00:00:00' + (${args[0]}) * INTERVAL '1 hour' + (${args[1]}) * INTERVAL '1 minute' + (${args[2]}) * INTERVAL '1 second'))::time";
  }

  String _normalizeAccessYearExpression(String expression) {
    return 'CASE '
        'WHEN ($expression) BETWEEN 0 AND 29 THEN 2000 + ($expression) '
        'WHEN ($expression) BETWEEN 30 AND 99 THEN 1900 + ($expression) '
        'ELSE ($expression) END';
  }

  bool _isBooleanType(AnalysisColumn column) {
    final normalized = foldToAscii(column.typeName).toLowerCase();
    return normalized == 'yesno' || normalized == 'boolean' || normalized == 'bit';
  }

  bool _isTextType(AnalysisColumn column) {
    final normalized = foldToAscii(column.typeName).toLowerCase();
    return normalized == 'memo' ||
        normalized == 'longtext' ||
        normalized == 'ntext' ||
        normalized == 'text' ||
        normalized == 'char' ||
        normalized == 'nchar' ||
        normalized == 'nvarchar';
  }

  bool _isGuidType(AnalysisColumn column) {
    final normalized = foldToAscii(column.typeName).toLowerCase();
    return normalized == 'uniqueidentifier' || normalized == 'guid';
  }

  bool _isDateTimeType(AnalysisColumn column) {
    final normalized = foldToAscii(column.typeName).toLowerCase();
    return normalized == 'datetime';
  }

  bool _isAccessDateLiteral(String value) {
    return value.length >= 2 && value.startsWith('#') && value.endsWith('#');
  }

  String _stripAccessDefaultPrefix(String value) {
    if (value.startsWith('=')) {
      return value.substring(1).trimLeft();
    }
    return value;
  }

  bool _isQuotedLiteral(String value) {
    if (value.length < 2) {
      return false;
    }
    final first = value[0];
    final last = value[value.length - 1];
    return (first == '"' && last == '"') || (first == '\'' && last == '\'');
  }

  bool _isBareTextLiteral(String value) {
    if (value.isEmpty) {
      return false;
    }
    for (final codeUnit in value.codeUnits) {
      final isLetter = (codeUnit >= 65 && codeUnit <= 90) ||
          (codeUnit >= 97 && codeUnit <= 122);
      final isDigit = codeUnit >= 48 && codeUnit <= 57;
      final isAllowedPunctuation = codeUnit == 95 || codeUnit == 45 || codeUnit == 32;
      if (!isLetter && !isDigit && !isAllowedPunctuation) {
        return false;
      }
    }
    return true;
  }

  String _singleQuotedLiteral(String value) {
    final escaped = value.replaceAll("'", "''");
    return "'$escaped'";
  }

  String _dartStringLiteral(String value) {
    return jsonEncode(value).replaceAll(r'$', r'\$');
  }
}