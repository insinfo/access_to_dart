part of '../project_generator.dart';

extension _ProjectGeneratorCoreValidation on ProjectGenerator {
  String _coreValidationContract() => _buildCoreValidationContractSource();

  String _buildValidationModel(AnalysisProject project, AnalysisTable table) {
    final model = _buildCoreModelIr(table);
    final validations = _buildValidationsForTable(project, table);
    final uniqueHints = <String>[];
    final seenHints = <String>{};
    final validatorInvocations = <String>[];
    final validatorMethods = <String>[];
    var needsStringHelper = false;
    var needsDigitsHelper = false;
    var needsCpfHelper = false;
    var needsEmailHelper = false;
    var needsPhoneHelper = false;

    for (final validation in validations) {
      for (final message in validation.messages) {
        if (seenHints.add(message)) {
          uniqueHints.add(message);
        }
      }
      validatorInvocations.add('_validate${validation.methodSuffix}(draft, issues);');
      validatorMethods.add(_buildValidationContractMethod(validation));
      needsStringHelper = true;
      if (validation.kinds.contains(AccessFormFieldRuleKind.cpf)) {
        needsDigitsHelper = true;
        needsCpfHelper = true;
      }
      if (validation.kinds.contains(AccessFormFieldRuleKind.email)) {
        needsEmailHelper = true;
      }
      if (validation.kinds.contains(AccessFormFieldRuleKind.phone)) {
        needsDigitsHelper = true;
        needsPhoneHelper = true;
      }
    }

    for (final column in table.columns) {
      final metadataHints = _metadataHintsForColumn(column);
      for (final hint in metadataHints) {
        if (seenHints.add(hint)) {
          uniqueHints.add(hint);
        }
      }
    }

    final hintsSource = uniqueHints.isEmpty
        ? 'const <String>[]'
        : '<String>[\n${uniqueHints.map((hint) => '    ${_dartStringLiteral(hint)},').join('\n')}\n  ]';

    final helperMethods = <String>[];
    if (needsStringHelper) {
      helperMethods.add('''
  static String _stringValue(Object? value) {
    if (value == null) {
      return '';
    }
    return value.toString();
  }
''');
    }
    if (needsDigitsHelper) {
      helperMethods.add('''
  static String _digitsOnly(String value) {
    final buffer = StringBuffer();
    for (final codeUnit in value.codeUnits) {
      if (codeUnit >= 48 && codeUnit <= 57) {
        buffer.writeCharCode(codeUnit);
      }
    }
    return buffer.toString();
  }
''');
    }
    if (needsCpfHelper) {
      helperMethods.add('''
  static bool _isValidCpf(String value) {
    final digits = _digitsOnly(value);
    if (digits.length != 11) {
      return false;
    }
    var repeated = true;
    for (var index = 1; index < digits.length; index++) {
      if (digits[index] != digits[0]) {
        repeated = false;
        break;
      }
    }
    if (repeated) {
      return false;
    }

    var sum = 0;
    for (var index = 0; index < 9; index++) {
      sum += int.parse(digits[index]) * (10 - index);
    }
    var firstDigit = (sum * 10) % 11;
    if (firstDigit == 10) {
      firstDigit = 0;
    }

    sum = 0;
    for (var index = 0; index < 10; index++) {
      sum += int.parse(digits[index]) * (11 - index);
    }
    var secondDigit = (sum * 10) % 11;
    if (secondDigit == 10) {
      secondDigit = 0;
    }

    return digits[9] == firstDigit.toString() &&
        digits[10] == secondDigit.toString();
  }
''');
    }
    if (needsEmailHelper) {
      helperMethods.add('''
  static bool _isValidEmail(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return true;
    }
    final atIndex = trimmed.indexOf('@');
    if (atIndex <= 0 || atIndex == trimmed.length - 1) {
      return false;
    }
    return trimmed.indexOf('.', atIndex) > atIndex + 1;
  }
''');
    }
    if (needsPhoneHelper) {
      helperMethods.add('''
  static bool _isValidPhone(String value) {
    final digits = _digitsOnly(value);
    return digits.length == 10 || digits.length == 11;
  }
''');
    }

    return _buildCoreValidationModelSource(
      descriptor: GeneratedCoreValidationDescriptor(
        className: model.className,
        fileName: model.fileName,
        hintsSource: hintsSource,
        validatorInvocations: validatorInvocations,
        validatorMethods: validatorMethods,
        helperMethods: helperMethods,
      ),
    );
  }

  List<_GeneratedFieldValidation> _buildValidationsForTable(
    AnalysisProject project,
    AnalysisTable table,
  ) {
    final form = project.canonicalFormForTable(table);
    final ruleSet = form == null || (form.rawVbaCode ?? '').trim().isEmpty
        ? const AccessFormRuleSet()
        : AccessFormRuleExtractor.extract(form.rawVbaCode!);
    return _mergeRequiredColumnValidations(
      table,
      _matchFormRulesToColumns(this, table, ruleSet),
    );
  }

  String _buildValidationContractMethod(_GeneratedFieldValidation validation) {
    final requiredMessage = validation.messageForKind(
      AccessFormFieldRuleKind.required,
      fallback: 'Informe ${validation.column.name}.',
    );
    final cpfMessage = validation.messageForKind(
      AccessFormFieldRuleKind.cpf,
      fallback: 'CPF invalido.',
    );
    final emailMessage = validation.messageForKind(
      AccessFormFieldRuleKind.email,
      fallback: 'Email invalido.',
    );
    final phoneMessage = validation.messageForKind(
      AccessFormFieldRuleKind.phone,
      fallback: 'Telefone invalido.',
    );

    final lines = <String>[
      '  static void _validate${validation.methodSuffix}(',
      '    Map<String, dynamic> draft,',
      '    List<ValidationIssue> issues,',
      '  ) {',
      '    final rawValue = _stringValue(draft[${_dartStringLiteral(validation.runtimeKey)}]);',
    ];

    if (validation.kinds.contains(AccessFormFieldRuleKind.required)) {
      lines.addAll(<String>[
        '    if (rawValue.trim().isEmpty) {',
        '      issues.add(const ValidationIssue(field: ${_dartStringLiteral(validation.runtimeKey)}, message: ${_dartStringLiteral(requiredMessage)}));',
        '      return;',
        '    }',
      ]);
    }

    if (validation.kinds.contains(AccessFormFieldRuleKind.cpf)) {
      lines.addAll(<String>[
        '    final cpfDigits = _digitsOnly(rawValue);',
        '    if (cpfDigits.isNotEmpty && !_isValidCpf(cpfDigits)) {',
        '      issues.add(const ValidationIssue(field: ${_dartStringLiteral(validation.runtimeKey)}, message: ${_dartStringLiteral(cpfMessage)}));',
        '      return;',
        '    }',
      ]);
    }

    if (validation.kinds.contains(AccessFormFieldRuleKind.email)) {
      lines.addAll(<String>[
        '    if (rawValue.trim().isNotEmpty && !_isValidEmail(rawValue)) {',
        '      issues.add(const ValidationIssue(field: ${_dartStringLiteral(validation.runtimeKey)}, message: ${_dartStringLiteral(emailMessage)}));',
        '      return;',
        '    }',
      ]);
    }

    if (validation.kinds.contains(AccessFormFieldRuleKind.phone)) {
      lines.addAll(<String>[
        '    if (rawValue.trim().isNotEmpty && !_isValidPhone(rawValue)) {',
        '      issues.add(const ValidationIssue(field: ${_dartStringLiteral(validation.runtimeKey)}, message: ${_dartStringLiteral(phoneMessage)}));',
        '    }',
      ]);
    }

    lines.add('  }');
    return lines.join('\n');
  }
}

List<_GeneratedFieldValidation> _mergeRequiredColumnValidations(
  AnalysisTable table,
  List<_GeneratedFieldValidation> validations,
) {
  final byRuntimeKey = <String, _GeneratedFieldValidation>{
    for (final validation in validations) validation.runtimeKey: validation,
  };

  for (final column in table.columns) {
    final requiresNonBlank = column.isRequired ||
        (_isTextColumn(column) && column.allowZeroLength == false);
    if (!requiresNonBlank || column.isAutoNumber) {
      continue;
    }
    final runtimeKey = column.normalizedName;
    final message = (column.validationText != null &&
            column.validationText!.trim().isNotEmpty)
        ? column.validationText!.trim()
        : (column.allowZeroLength == false && !column.isRequired)
            ? 'Nao deixe ${column.label} vazio.'
            : 'Informe ${column.label}.';
    final existing = byRuntimeKey[runtimeKey];
    if (existing == null) {
      byRuntimeKey[runtimeKey] = _GeneratedFieldValidation(
        column: column,
        runtimeKey: runtimeKey,
        methodSuffix: _pascalizeKey(runtimeKey),
        kinds: <AccessFormFieldRuleKind>{AccessFormFieldRuleKind.required},
        messages: <String>[message],
      );
      continue;
    }

    if (existing.kinds.add(AccessFormFieldRuleKind.required) &&
        existing.messages.isEmpty) {
      existing.messages.add(message);
    }
  }

  return byRuntimeKey.values.toList(growable: false);
}

List<String> _metadataHintsForColumn(AnalysisColumn column) {
  final hints = <String>[];
  if (column.validationRule != null && column.validationRule!.trim().isNotEmpty) {
    final suffix = (column.validationText != null && column.validationText!.trim().isNotEmpty)
        ? ' -> ${column.validationText!.trim()}'
        : '';
    hints.add('Regra Access em ${column.label}: ${column.validationRule!.trim()}$suffix');
  }
  if (column.formatString != null && column.formatString!.trim().isNotEmpty) {
    hints.add('Formato Access em ${column.label}: ${column.formatString!.trim()}');
  }
  if (column.inputMask != null && column.inputMask!.trim().isNotEmpty) {
    hints.add('Mascara Access em ${column.label}: ${column.inputMask!.trim()}');
  }
  if (_isTextColumn(column) && column.allowZeroLength == false) {
    hints.add('${column.label} nao aceita string vazia no Access.');
  }
  return hints;
}

bool _isTextColumn(AnalysisColumn column) {
  final normalized = foldToAscii(column.typeName).toLowerCase();
  return normalized.contains('text') || normalized.contains('memo');
}