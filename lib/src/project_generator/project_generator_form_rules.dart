part of 'project_generator.dart';

List<_GeneratedFieldValidation> _matchFormRulesToColumns(
  ProjectGenerator generator,
  AnalysisTable table,
  AccessFormRuleSet ruleSet,
) {
  final byKey = <String, _GeneratedFieldValidation>{};
  for (final rule in ruleSet.fieldRules) {
    final column = _matchRuleToColumn(table, rule);
    if (column == null) {
      continue;
    }
    final runtimeKey = generator.columnRuntimeName(column);
    final existing = byKey[runtimeKey];
    if (existing == null) {
      byKey[runtimeKey] = _GeneratedFieldValidation(
        column: column,
        runtimeKey: runtimeKey,
        methodSuffix: _pascalizeKey(runtimeKey),
        kinds: {...rule.kinds},
        messages: [...rule.messages],
      );
      continue;
    }

    existing.kinds.addAll(rule.kinds);
    for (final message in rule.messages) {
      if (!existing.messages.contains(message)) {
        existing.messages.add(message);
      }
    }
  }
  return byKey.values.toList();
}

AnalysisColumn? _matchRuleToColumn(
  AnalysisTable table,
  AccessFormFieldRule rule,
) {
  final columnsByKey = <String, AnalysisColumn>{};
  for (final column in table.columns) {
    final key = _lookupFormKey(column.name);
    columnsByKey[key] = column;
    columnsByKey[_singularFormKey(key)] = column;
  }

  final candidates = <String>{
    rule.controlName,
    ...rule.referencedControls,
  };
  for (final candidate in candidates) {
    final stripped = _stripControlPrefix(candidate);
    final key = _lookupFormKey(stripped);
    final column = columnsByKey[key] ?? columnsByKey[_singularFormKey(key)];
    if (column != null) {
      return column;
    }
  }
  return null;
}

String _stripControlPrefix(String value) {
  const prefixes = <String>['txt', 'cbo', 'chk', 'cmd', 'btn', 'subfrm', 'frm'];
  final lower = value.toLowerCase();
  for (final prefix in prefixes) {
    if (lower.startsWith(prefix) && value.length > prefix.length) {
      return value.substring(prefix.length);
    }
  }
  return value;
}

String _lookupFormKey(String value) {
  final buffer = StringBuffer();
  for (final codeUnit in value.toLowerCase().codeUnits) {
    final isLetter = codeUnit >= 97 && codeUnit <= 122;
    final isDigit = codeUnit >= 48 && codeUnit <= 57;
    if (isLetter || isDigit) {
      buffer.writeCharCode(codeUnit);
    }
  }
  return buffer.toString();
}

String _singularFormKey(String value) {
  if (value.endsWith('s') && value.length > 3) {
    return value.substring(0, value.length - 1);
  }
  return value;
}

String _pascalizeKey(String value) {
  return ReCase(value).pascalCase;
}

class _GeneratedFieldValidation {
  final AnalysisColumn column;
  final String runtimeKey;
  final String methodSuffix;
  final Set<AccessFormFieldRuleKind> kinds;
  final List<String> messages;

  _GeneratedFieldValidation({
    required this.column,
    required this.runtimeKey,
    required this.methodSuffix,
    required this.kinds,
    required this.messages,
  });

  String messageForKind(
    AccessFormFieldRuleKind kind, {
    required String fallback,
  }) {
    if (messages.isEmpty) {
      return fallback;
    }
    switch (kind) {
      case AccessFormFieldRuleKind.required:
        return messages.firstWhere(
          (message) => message.toLowerCase().contains('informe'),
          orElse: () => messages.first,
        );
      case AccessFormFieldRuleKind.cpf:
        return messages.firstWhere(
          (message) => message.toLowerCase().contains('cpf'),
          orElse: () => messages.first,
        );
      case AccessFormFieldRuleKind.email:
        return messages.firstWhere(
          (message) => message.toLowerCase().contains('email'),
          orElse: () => messages.first,
        );
      case AccessFormFieldRuleKind.phone:
        return messages.firstWhere(
          (message) =>
              message.toLowerCase().contains('telefone') ||
              message.toLowerCase().contains('fone'),
          orElse: () => messages.first,
        );
      case AccessFormFieldRuleKind.custom:
        return messages.first;
    }
  }
}