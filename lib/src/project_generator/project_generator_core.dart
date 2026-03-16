part of 'project_generator.dart';

extension _ProjectGeneratorCore on ProjectGenerator {
  Future<void> _writeCore(AnalysisProject project, Directory root) async {
    final coreDir = Directory('${root.path}${Platform.pathSeparator}core');
    final modelsDir = Directory(
      '${coreDir.path}${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}models',
    );
    final validationDir = Directory(
      '${coreDir.path}${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}validation',
    );
    await modelsDir.create(recursive: true);
    await validationDir.create(recursive: true);

    await File('${coreDir.path}${Platform.pathSeparator}pubspec.yaml')
        .writeAsString(_corePubspec(project));
    await File(
      '${coreDir.path}${Platform.pathSeparator}lib${Platform.pathSeparator}core.dart',
    ).writeAsString(_coreLibrary(project));
    await File(
      '${coreDir.path}${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}schema.dart',
    ).writeAsString(_coreSchema(project));
    await File(
      '${validationDir.path}${Platform.pathSeparator}validation_contract.dart',
    ).writeAsString(_coreValidationContract());

    for (final table in project.tables) {
      await File('${modelsDir.path}${Platform.pathSeparator}${table.fileName}')
          .writeAsString(_buildModel(table));
      await File(
        '${validationDir.path}${Platform.pathSeparator}${table.normalizedName}_validation.dart',
      ).writeAsString(_buildValidationModel(project, table));
    }
  }

  String _corePubspec(AnalysisProject project) =>
      '''name: ${project.dartPackageName}_core
description: Generated core models for ${project.source}
publish_to: none

environment:
  sdk: ^3.6.2
''';

  String _coreLibrary(AnalysisProject project) {
    final exports = <String>[
      "export 'src/schema.dart';",
      "export 'src/validation/validation_contract.dart';",
      for (final table in project.tables) "export 'src/models/${table.fileName}';",
      for (final table in project.tables)
        "export 'src/validation/${table.normalizedName}_validation.dart';",
    ];
    return '${exports.join('\n')}\n';
  }

  String _coreSchema(AnalysisProject project) {
    final tableEntries = project.tables
        .map(
          (table) =>
              "  '${tableRuntimeName(table)}': {'rows': ${table.rowCount}, 'columns': ${table.columns.length}},",
        )
        .join('\n');
    return 'const generatedSchema = <String, Map<String, Object>>{\n$tableEntries\n};\n';
  }

  String _buildModel(AnalysisTable table) {
    final constants = table.columns
        .map(
          (column) =>
              "  static const ${column.columnConstantName} = '${columnRuntimeName(column)}';",
        )
        .join('\n');
    final fields = table.columns
        .map((column) => '  final ${column.dartType} ${column.fieldName};')
        .join('\n');
    final constructorArgs = table.columns
        .map((column) => '    this.${column.fieldName},')
        .join('\n');
    final fromMapAssignments = table.columns
        .map((column) => '      ${column.fieldName}: ${_fromMapValue(column)},')
        .join('\n');
    final toMapEntries = table.columns
        .where((column) => !column.isAutoNumber)
        .map(
          (column) => '      ${column.columnConstantName}: ${column.fieldName},',
        )
        .join('\n');
    return '''class ${table.className} {
$constants

$fields

  const ${table.className}({
$constructorArgs
  });

  factory ${table.className}.fromMap(Map<String, dynamic> map) {
    return ${table.className}(
$fromMapAssignments
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
$toMapEntries
    };
${_idWriteBackBlock(table)}    return map;
  }
}
''';
  }

  String _coreValidationContract() => '''class ValidationIssue {
  final String field;
  final String message;

  const ValidationIssue({
    required this.field,
    required this.message,
  });

  Map<String, dynamic> toMap() => {
        'field': field,
        'message': message,
      };
}

class ValidationContract {
  final List<ValidationIssue> issues;

  const ValidationContract(this.issues);

  const ValidationContract.empty() : issues = const <ValidationIssue>[];

  bool get isValid => issues.isEmpty;

  Map<String, String> asFieldMap() {
    final errors = <String, String>{};
    for (final issue in issues) {
      errors.putIfAbsent(issue.field, () => issue.message);
    }
    return errors;
  }

  List<Map<String, dynamic>> toJsonList() {
    return issues.map((issue) => issue.toMap()).toList();
  }
}
''';

  String _buildValidationModel(AnalysisProject project, AnalysisTable table) {
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
      validatorInvocations.add(
        '_validate${validation.methodSuffix}(draft, issues);',
      );
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

    final hintsSource = uniqueHints.isEmpty
        ? 'const <String>[]'
        : '<String>[\n${uniqueHints.map((hint) => '    ${jsonEncode(hint)},').join('\n')}\n  ]';

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

    return '''import '../models/${table.fileName}';
import 'validation_contract.dart';

class ${table.className}ValidationContract {
  static final List<String> validationHints = $hintsSource;

  static ValidationContract validate(${table.className} entity) {
    return validateDraft(entity.toMap());
  }

  static ValidationContract validateDraft(Map<String, dynamic> draft) {
    final issues = <ValidationIssue>[];
    ${validatorInvocations.join('\n    ')}
    return ValidationContract(issues);
  }

${validatorMethods.join('\n\n')}

${helperMethods.join('\n')}
}
''';
  }

  List<_GeneratedFieldValidation> _buildValidationsForTable(
    AnalysisProject project,
    AnalysisTable table,
  ) {
    final form = project.canonicalFormForTable(table);
    final ruleSet = form == null || (form.rawVbaCode ?? '').trim().isEmpty
        ? const AccessFormRuleSet()
        : AccessFormRuleExtractor.extract(form.rawVbaCode!);
    return _matchFormRulesToColumns(table, ruleSet);
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
      '    final rawValue = _stringValue(draft[${jsonEncode(validation.runtimeKey)}]);',
    ];

    if (validation.kinds.contains(AccessFormFieldRuleKind.required)) {
      lines.addAll(<String>[
        '    if (rawValue.trim().isEmpty) {',
        '      issues.add(const ValidationIssue(field: ${jsonEncode(validation.runtimeKey)}, message: ${jsonEncode(requiredMessage)}));',
        '      return;',
        '    }',
      ]);
    }

    if (validation.kinds.contains(AccessFormFieldRuleKind.cpf)) {
      lines.addAll(<String>[
        '    final cpfDigits = _digitsOnly(rawValue);',
        '    if (cpfDigits.isNotEmpty && !_isValidCpf(cpfDigits)) {',
        '      issues.add(const ValidationIssue(field: ${jsonEncode(validation.runtimeKey)}, message: ${jsonEncode(cpfMessage)}));',
        '      return;',
        '    }',
      ]);
    }

    if (validation.kinds.contains(AccessFormFieldRuleKind.email)) {
      lines.addAll(<String>[
        '    if (rawValue.trim().isNotEmpty && !_isValidEmail(rawValue)) {',
        '      issues.add(const ValidationIssue(field: ${jsonEncode(validation.runtimeKey)}, message: ${jsonEncode(emailMessage)}));',
        '      return;',
        '    }',
      ]);
    }

    if (validation.kinds.contains(AccessFormFieldRuleKind.phone)) {
      lines.addAll(<String>[
        '    if (rawValue.trim().isNotEmpty && !_isValidPhone(rawValue)) {',
        '      issues.add(const ValidationIssue(field: ${jsonEncode(validation.runtimeKey)}, message: ${jsonEncode(phoneMessage)}));',
        '    }',
      ]);
    }

    lines.add('  }');
    return lines.join('\n');
  }
}
