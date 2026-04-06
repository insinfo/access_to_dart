part of 'project_generator.dart';

class GeneratedFieldDescriptor {
  final String runtimeName;
  final String columnConstantName;
  final String fieldName;
  final String dartType;
  final String accessTypeName;
  final String label;
  final bool isRequired;
  final bool? allowZeroLength;
  final int? maxLength;
  final String? validationRule;
  final String? validationText;
  final String? description;
  final String? formatString;
  final String? inputMask;
  final bool isAutoNumber;
  final bool isCalculated;
  final int? displayControl;
  final int? textFormat;
  final int? imeMode;
  final int? imeSentenceMode;
  final bool? allowMultipleValues;
  final String? rowSourceType;
  final String? rowSource;
  final String? accessControlType;
  final String? wssFieldId;
  final String? complexTypeClassification;
  final String? attachmentTableName;
  final String? attachmentLinkColumn;
  final AccessTemporalSemantic temporalSemantic;
  final String? accessDefaultValue;
  final String? semanticDefaultExpression;
  final List<String> semanticDefaultHelpers;
  final String? fromMapExpression;
  final String? toMapExpression;
  final GeneratedLookupDescriptor? lookup;

  const GeneratedFieldDescriptor({
    required this.runtimeName,
    required this.columnConstantName,
    required this.fieldName,
    required this.dartType,
    required this.accessTypeName,
    required this.label,
    required this.isRequired,
    required this.allowZeroLength,
    required this.maxLength,
    required this.validationRule,
    required this.validationText,
    required this.description,
    required this.formatString,
    required this.inputMask,
    required this.isAutoNumber,
    required this.isCalculated,
    required this.displayControl,
    required this.textFormat,
    required this.imeMode,
    required this.imeSentenceMode,
    required this.allowMultipleValues,
    required this.rowSourceType,
    required this.rowSource,
    required this.accessControlType,
    required this.wssFieldId,
    required this.complexTypeClassification,
    required this.attachmentTableName,
    required this.attachmentLinkColumn,
    required this.temporalSemantic,
    required this.accessDefaultValue,
    required this.semanticDefaultExpression,
    required this.semanticDefaultHelpers,
    this.fromMapExpression,
    this.toMapExpression,
    this.lookup,
  });

  bool get isAttachmentField =>
      complexTypeClassification == 'attachment' &&
      attachmentTableName != null &&
      attachmentTableName!.trim().isNotEmpty;

  bool get isReadOnly => isAutoNumber || isCalculated || isAttachmentField;

    bool get hasSemanticDefault => semanticDefaultExpression != null;

    String get nonNullableDartType => dartType.endsWith('?')
      ? dartType.substring(0, dartType.length - 1)
      : dartType;

    bool get isUuidSuggested =>
      normalizedAccessTypeName == 'guid' ||
      normalizedAccessTypeName == 'uniqueidentifier';

  bool get isDropdownSuggested {
    if (isComboBoxControl || isListBoxControl) {
      return true;
    }
    final normalized = foldToAscii(rowSourceType ?? '').toLowerCase().trim();
    return normalized == 'value list' || normalized == 'table/query';
  }

  List<String> get dropdownOptions {
    final normalized = foldToAscii(rowSourceType ?? '').toLowerCase().trim();
    if (normalized != 'value list') {
      return const <String>[];
    }
    return _parseAccessValueList(rowSource);
  }

  bool get hasDynamicLookup => lookup != null;

  bool get isMultiValueSuggested =>
      allowMultipleValues == true && isDropdownSuggested;

  String get normalizedAccessControlType =>
      foldToAscii(accessControlType ?? '').toLowerCase().trim();

  String get normalizedAccessTypeName =>
      foldToAscii(accessTypeName).toLowerCase().replaceAll(' ', '');

  bool get isCheckboxControl =>
      normalizedAccessControlType == 'checkbox' ||
      foldToAscii(dartType).toLowerCase() == 'bool?';

  bool get isComboBoxControl => normalizedAccessControlType == 'combobox';

  bool get isListBoxControl => normalizedAccessControlType == 'listbox';

  bool get isTextAreaControl {
    if (isAttachmentField) {
      return false;
    }
    if (normalizedAccessControlType != 'textbox') {
      return false;
    }
    return normalizedAccessTypeName == 'longtext' ||
        normalizedAccessTypeName == 'memo' ||
        normalizedAccessTypeName == 'longchar';
  }

  int? get selectSize => isListBoxControl && !isMultiValueSuggested ? 6 : null;

  String get inputType {
    if (isAttachmentField) return 'attachment';
    if (isCheckboxControl) return 'checkbox';
    if (isDropdownSuggested) return 'select';
    if (dartType == 'DateTime?') {
      return switch (temporalSemantic) {
        AccessTemporalSemantic.dateOnly => 'date',
        AccessTemporalSemantic.timeOnly => 'time',
        _ => 'datetime-local',
      };
    }
    if (inputMask != null && inputMask!.trim().isNotEmpty) return 'text';
    if (dartType == 'int?' || dartType == 'double?') return 'number';
    return 'text';
  }

  String? get inputMode {
    final mask = inputMask?.trim() ?? '';
    if (mask.isNotEmpty) {
      final numericPlaceholders = RegExp(r'[09]').allMatches(mask).length;
      final letterPlaceholders = RegExp(r'[LAa?&C]').allMatches(mask).length;
      if (numericPlaceholders > 0 && letterPlaceholders == 0) {
        return 'numeric';
      }
    }
    if (inputType == 'date' || inputType == 'time') return 'numeric';
    if (inputType == 'number') return 'decimal';
    return null;
  }

  bool get isTemporalField => dartType == 'DateTime?';
}

class GeneratedLookupDescriptor {
  final String fieldRuntimeName;
  final String fieldFieldName;
  final String sourceTableRuntimeName;
  final String sourceRouteSegment;
  final String valueColumnRuntimeName;
  final String labelColumnRuntimeName;
  final String? orderByColumnRuntimeName;
  final String rowSourceSql;

  const GeneratedLookupDescriptor({
    required this.fieldRuntimeName,
    required this.fieldFieldName,
    required this.sourceTableRuntimeName,
    required this.sourceRouteSegment,
    required this.valueColumnRuntimeName,
    required this.labelColumnRuntimeName,
    required this.orderByColumnRuntimeName,
    required this.rowSourceSql,
  });
}

class GeneratedAttachmentColumnDescriptor {
  final String runtimeName;
  final String label;
  final bool isBinary;

  const GeneratedAttachmentColumnDescriptor({
    required this.runtimeName,
    required this.label,
    required this.isBinary,
  });
}

class GeneratedAttachmentSubresource {
  final String fieldRuntimeName;
  final String fieldLabel;
  final String attachmentTableName;
  final String attachmentTableRuntimeName;
  final String attachmentLinkColumnName;
  final String attachmentLinkColumnRuntimeName;
  final List<GeneratedAttachmentColumnDescriptor> columns;

  const GeneratedAttachmentSubresource({
    required this.fieldRuntimeName,
    required this.fieldLabel,
    required this.attachmentTableName,
    required this.attachmentTableRuntimeName,
    required this.attachmentLinkColumnName,
    required this.attachmentLinkColumnRuntimeName,
    required this.columns,
  });
}

List<String> _parseAccessValueList(String? source) {
  if (source == null) {
    return const <String>[];
  }

  final text = source.trim();
  if (text.isEmpty) {
    return const <String>[];
  }

  final values = <String>[];
  final current = StringBuffer();
  var inQuotes = false;

  for (var index = 0; index < text.length; index++) {
    final char = text[index];
    if (char == '"') {
      if (inQuotes && index + 1 < text.length && text[index + 1] == '"') {
        current.write('"');
        index++;
        continue;
      }
      inQuotes = !inQuotes;
      continue;
    }
    if (char == ';' && !inQuotes) {
      final value = current.toString().trim();
      if (value.isNotEmpty) {
        values.add(value);
      }
      current.clear();
      continue;
    }
    current.write(char);
  }

  final value = current.toString().trim();
  if (value.isNotEmpty) {
    values.add(value);
  }

  return values;
}

class GeneratedBackendModule {
  final String packageName;
  final String className;
  final String normalizedName;
  final String routeName;
  final String tableRuntimeName;
  final String primaryKeyRuntimeName;
  final String primaryKeyFieldName;
  final String primaryKeyParamType;
  final String primaryKeyRouteParseExpression;
  final bool primaryKeyIsAutoNumber;
  final List<GeneratedLookupDescriptor> lookups;
  final List<GeneratedFieldDescriptor> fields;
  final List<GeneratedAttachmentSubresource> attachments;

  const GeneratedBackendModule({
    required this.packageName,
    required this.className,
    required this.normalizedName,
    required this.routeName,
    required this.tableRuntimeName,
    required this.primaryKeyRuntimeName,
    required this.primaryKeyFieldName,
    required this.primaryKeyParamType,
    required this.primaryKeyRouteParseExpression,
    required this.primaryKeyIsAutoNumber,
    required this.lookups,
    required this.fields,
    required this.attachments,
  });
}

class GeneratedFrontendModule {
  final String packageName;
  final String className;
  final String nameSnake;
  final String moduleNameKebab;
  final String formLogicClassName;
  final String primaryKeyField;
  final String primaryKeyParamType;
  final List<GeneratedFieldDescriptor> fields;
  final List<GeneratedAttachmentSubresource> attachments;

  const GeneratedFrontendModule({
    required this.packageName,
    required this.className,
    required this.nameSnake,
    required this.moduleNameKebab,
    required this.formLogicClassName,
    required this.primaryKeyField,
    required this.primaryKeyParamType,
    required this.fields,
    required this.attachments,
  });
}

class GeneratedCoreModelDescriptor {
  final String className;
  final String fileName;
  final String idWriteBackBlock;
  final List<GeneratedFieldDescriptor> fields;
  final List<String> defaultHelperMethods;

  const GeneratedCoreModelDescriptor({
    required this.className,
    required this.fileName,
    required this.idWriteBackBlock,
    required this.fields,
    required this.defaultHelperMethods,
  });
}

class GeneratedCoreValidationDescriptor {
  final String className;
  final String fileName;
  final String hintsSource;
  final List<String> validatorInvocations;
  final List<String> validatorMethods;
  final List<String> helperMethods;

  const GeneratedCoreValidationDescriptor({
    required this.className,
    required this.fileName,
    required this.hintsSource,
    required this.validatorInvocations,
    required this.validatorMethods,
    required this.helperMethods,
  });
}

extension _ProjectGeneratorIrBuilder on ProjectGenerator {
  GeneratedBackendModule _buildBackendModuleIr(
    AnalysisProject project,
    AnalysisTable table,
  ) {
    final primaryKeyColumn = _getPrimaryKey(table);
    final attachments = _resolveAttachmentSubresources(project, table);
    final fields = table.columns
        .map(
          (column) => GeneratedFieldDescriptor(
            runtimeName: columnRuntimeName(column),
            columnConstantName: column.columnConstantName,
            fieldName: column.fieldName,
            dartType: column.dartType,
            accessTypeName: column.typeName,
            label: column.label,
            isRequired: column.isRequired,
            allowZeroLength: column.allowZeroLength,
            maxLength: column.maxLength,
            validationRule: column.validationRule,
            validationText: column.validationText,
            description: column.description,
            formatString: column.formatString,
            inputMask: column.inputMask,
            isAutoNumber: column.isAutoNumber,
            isCalculated: column.isCalculated,
            displayControl: column.displayControl,
            textFormat: column.textFormat,
            imeMode: column.imeMode,
            imeSentenceMode: column.imeSentenceMode,
            allowMultipleValues: column.allowMultipleValues,
            rowSourceType: column.rowSourceType,
            rowSource: column.rowSource,
            accessControlType: null,
            wssFieldId: column.wssFieldId,
            complexTypeClassification: column.complexTypeClassification,
            attachmentTableName: column.attachmentTableName,
            attachmentLinkColumn: column.attachmentLinkColumn,
            temporalSemantic: inferAccessTemporalSemanticWithRows(
              column,
              rows: table.sampleRows,
            ),
            accessDefaultValue: column.defaultValue,
            semanticDefaultExpression: null,
            semanticDefaultHelpers: const <String>[],
            fromMapExpression: _fromMapValue(column, rows: table.sampleRows),
            toMapExpression: _toMapValue(column, rows: table.sampleRows),
            lookup: _resolveLookupDescriptor(project, column),
          ),
        )
        .toList(growable: false);
    return GeneratedBackendModule(
      packageName: project.dartPackageName,
      className: table.className,
      normalizedName: table.normalizedName,
      routeName: tableRouteName(table),
      tableRuntimeName: tableRuntimeName(table),
      primaryKeyRuntimeName: primaryKeyRuntimeName(table),
      primaryKeyFieldName: primaryKeyColumn.fieldName,
      primaryKeyParamType: _routeParameterType(primaryKeyColumn),
        primaryKeyRouteParseExpression:
          _routeParameterParseExpression(primaryKeyColumn),
      primaryKeyIsAutoNumber: primaryKeyColumn.isAutoNumber,
          fields: fields,
      attachments: attachments,
      lookups: table.columns
          .map((column) => _resolveLookupDescriptor(project, column))
          .whereType<GeneratedLookupDescriptor>()
          .toList(growable: false),
    );
  }

  GeneratedFrontendModule _buildFrontendModuleIr(
    AnalysisProject project,
    AnalysisTable table,
  ) {
    final matchedForm = _resolveFrontendForm(project, table);
    final orderedColumns = _orderFrontendColumns(table, matchedForm);
    final primaryKeyColumn = _getPrimaryKey(table);
    final attachments = _resolveAttachmentSubresources(project, table);

    return GeneratedFrontendModule(
      packageName: project.dartPackageName,
      className: table.className,
      nameSnake: table.normalizedName,
      moduleNameKebab: tableRouteSegment(table),
      formLogicClassName: '${table.className}FormLogic',
      primaryKeyField: primaryKeyColumn.fieldName,
      primaryKeyParamType: _routeParameterType(primaryKeyColumn),
      attachments: attachments,
      fields: orderedColumns
          .map(
            (column) {
              final matchedControl = _resolveBoundControl(matchedForm, column);
              final defaultSemantics =
                  ProjectGenerator.defaultSemanticTranslator.translate(
                column,
                rows: table.sampleRows,
              );
              return GeneratedFieldDescriptor(
              runtimeName: columnRuntimeName(column),
              columnConstantName: column.columnConstantName,
              fieldName: column.fieldName,
              dartType: column.dartType,
              accessTypeName: column.typeName,
              label: _frontendFieldLabel(column, matchedControl),
              isRequired: column.isRequired,
              allowZeroLength: column.allowZeroLength,
              maxLength: column.maxLength,
              validationRule: column.validationRule,
              validationText: column.validationText,
              description: column.description,
              formatString: column.formatString,
              inputMask: column.inputMask,
              isAutoNumber: column.isAutoNumber,
              isCalculated: column.isCalculated,
              displayControl: column.displayControl,
              textFormat: column.textFormat,
              imeMode: column.imeMode,
              imeSentenceMode: column.imeSentenceMode,
              allowMultipleValues: column.allowMultipleValues,
              rowSourceType: column.rowSourceType,
              rowSource: column.rowSource,
              accessControlType: matchedControl?.type,
              wssFieldId: column.wssFieldId,
              complexTypeClassification: column.complexTypeClassification,
              attachmentTableName: column.attachmentTableName,
              attachmentLinkColumn: column.attachmentLinkColumn,
              temporalSemantic: inferAccessTemporalSemanticWithRows(
                column,
                rows: table.sampleRows,
              ),
              accessDefaultValue: column.defaultValue,
              semanticDefaultExpression: defaultSemantics?.dartExpression,
              semanticDefaultHelpers: defaultSemantics == null
                  ? const <String>[]
                  : defaultSemantics.dartHelpers.toList(growable: false),
              fromMapExpression: _fromMapValue(column, rows: table.sampleRows),
                toMapExpression: _toMapValue(column, rows: table.sampleRows),
              lookup: _resolveLookupDescriptor(project, column),
              );
            },
          )
          .toList(growable: false),
    );
  }

  List<GeneratedAttachmentSubresource> _resolveAttachmentSubresources(
    AnalysisProject project,
    AnalysisTable table,
  ) {
    final attachments = <GeneratedAttachmentSubresource>[];
    for (final column in table.columns) {
      if (column.complexTypeClassification != 'attachment') {
        continue;
      }
      final attachmentTableName = column.attachmentTableName;
      final attachmentLinkColumnName = column.attachmentLinkColumn;
      if (attachmentTableName == null ||
          attachmentLinkColumnName == null ||
          attachmentTableName.trim().isEmpty ||
          attachmentLinkColumnName.trim().isEmpty) {
        continue;
      }
      AnalysisTable? attachmentTable;
      for (final candidate in project.tables) {
        if (candidate.name == attachmentTableName &&
            candidate.isSyntheticAttachmentTable) {
          attachmentTable = candidate;
          break;
        }
      }
      if (attachmentTable == null) {
        continue;
      }
      attachments.add(
        GeneratedAttachmentSubresource(
          fieldRuntimeName: columnRuntimeName(column),
          fieldLabel: column.label,
          attachmentTableName: attachmentTableName,
          attachmentTableRuntimeName: tableRuntimeName(attachmentTable),
          attachmentLinkColumnName: attachmentLinkColumnName,
          attachmentLinkColumnRuntimeName:
              identifierPolicy.columnName(attachmentLinkColumnName),
          columns: attachmentTable.columns
              .where(
                (attachmentColumn) =>
                    attachmentColumn.name != attachmentLinkColumnName,
              )
              .map(
                (attachmentColumn) => GeneratedAttachmentColumnDescriptor(
                  runtimeName: columnRuntimeName(attachmentColumn),
                  label: attachmentColumn.label,
                  isBinary: _isBinaryAttachmentColumn(attachmentColumn),
                ),
              )
              .toList(growable: false),
        ),
      );
    }
    return attachments;
  }

  bool _isBinaryAttachmentColumn(AnalysisColumn column) {
    final normalized = foldToAscii(column.typeName).toLowerCase();
    return normalized == 'binary' ||
        normalized == 'longbinary' ||
        normalized == 'ole';
  }

  AnalysisForm? _resolveFrontendForm(
    AnalysisProject project,
    AnalysisTable table,
  ) {
    final candidates = project.forms.where((form) {
      final recordSource = form.recordSource;
      return recordSource != null &&
          AnalysisProject.lookupKey(recordSource) ==
              AnalysisProject.lookupKey(table.name);
    }).toList(growable: false);

    if (candidates.isEmpty) {
      return null;
    }
    if (candidates.length == 1) {
      return candidates.first;
    }

    AnalysisForm? bestForm;
    var bestScore = -1;
    for (final form in candidates) {
      final score = form.controls
          .where((control) => _resolveColumnForControl(table, control) != null)
          .length;
      if (score > bestScore) {
        bestScore = score;
        bestForm = form;
      }
    }
    return bestForm ?? candidates.first;
  }

  List<AnalysisColumn> _orderFrontendColumns(
    AnalysisTable table,
    AnalysisForm? form,
  ) {
    if (form == null || form.controls.isEmpty) {
      return table.columns.toList(growable: false);
    }

    final ordered = <AnalysisColumn>[];
    final seen = <String>{};

    for (final control in form.controls) {
      final column = _resolveColumnForControl(table, control);
      if (column == null) {
        continue;
      }
      if (seen.add(column.fieldName)) {
        ordered.add(column);
      }
    }

    for (final column in table.columns) {
      if (seen.add(column.fieldName)) {
        ordered.add(column);
      }
    }

    return ordered;
  }

  AnalysisColumn? _resolveColumnForControl(
    AnalysisTable table,
    AnalysisFormControl control,
  ) {
    final candidates = <String>{
      if (control.controlSource != null && control.controlSource!.trim().isNotEmpty)
        AnalysisProject.lookupKey(control.controlSource!),
      AnalysisProject.lookupKey(control.name),
    }..removeWhere((value) => value.isEmpty);

    if (candidates.isEmpty) {
      return null;
    }

    for (final column in table.columns) {
      final columnKeys = <String>{
        AnalysisProject.lookupKey(column.name),
        AnalysisProject.lookupKey(column.fieldName),
        AnalysisProject.lookupKey(column.normalizedName),
      };
      if (candidates.any(columnKeys.contains)) {
        return column;
      }
    }
    return null;
  }

  AnalysisFormControl? _resolveBoundControl(
    AnalysisForm? form,
    AnalysisColumn column,
  ) {
    if (form == null) {
      return null;
    }

    final columnKeys = <String>{
      AnalysisProject.lookupKey(column.name),
      AnalysisProject.lookupKey(column.fieldName),
      AnalysisProject.lookupKey(column.normalizedName),
    };

    for (final control in form.controls) {
      final controlSource = control.controlSource;
      if (controlSource == null || controlSource.trim().isEmpty) {
        continue;
      }
      final controlKey = AnalysisProject.lookupKey(controlSource);
      if (columnKeys.contains(controlKey)) {
        return control;
      }
    }
    return null;
  }

  String _frontendFieldLabel(
    AnalysisColumn column,
    AnalysisFormControl? matchedControl,
  ) {
    final controlCaption = matchedControl?.caption?.trim();
    if (controlCaption != null && controlCaption.isNotEmpty) {
      return controlCaption;
    }
    return column.label;
  }

  GeneratedCoreModelDescriptor _buildCoreModelIr(AnalysisTable table) {
    final helperNames = <String>{};
    final fields = table.columns
        .map(
          (column) {
            final defaultSemantics =
                ProjectGenerator.defaultSemanticTranslator.translate(
              column,
              rows: table.sampleRows,
            );
            if (defaultSemantics != null) {
              helperNames.addAll(defaultSemantics.dartHelpers);
            }
            if (column.dartType == 'DateTime?') {
              helperNames
                ..add('temporalParse')
                ..add('temporalFormat');
            }
            return GeneratedFieldDescriptor(
              runtimeName: columnRuntimeName(column),
              columnConstantName: column.columnConstantName,
              fieldName: column.fieldName,
              dartType: column.dartType,
              accessTypeName: column.typeName,
              label: column.label,
              isRequired: column.isRequired,
              allowZeroLength: column.allowZeroLength,
              maxLength: column.maxLength,
              validationRule: column.validationRule,
              validationText: column.validationText,
              description: column.description,
              formatString: column.formatString,
              inputMask: column.inputMask,
              isAutoNumber: column.isAutoNumber,
              isCalculated: column.isCalculated,
              displayControl: column.displayControl,
              textFormat: column.textFormat,
              imeMode: column.imeMode,
              imeSentenceMode: column.imeSentenceMode,
              allowMultipleValues: column.allowMultipleValues,
              rowSourceType: column.rowSourceType,
              rowSource: column.rowSource,
              accessControlType: null,
              wssFieldId: column.wssFieldId,
              complexTypeClassification: column.complexTypeClassification,
              attachmentTableName: column.attachmentTableName,
              attachmentLinkColumn: column.attachmentLinkColumn,
              temporalSemantic: inferAccessTemporalSemanticWithRows(
                column,
                rows: table.sampleRows,
              ),
              accessDefaultValue: column.defaultValue,
              semanticDefaultExpression: defaultSemantics?.dartExpression,
              semanticDefaultHelpers: defaultSemantics == null
                  ? const <String>[]
                  : defaultSemantics.dartHelpers.toList(growable: false),
              fromMapExpression: _fromMapValue(column, rows: table.sampleRows),
              toMapExpression: _toMapValue(column, rows: table.sampleRows),
              lookup: null,
            );
          },
        )
        .toList(growable: false);

    return GeneratedCoreModelDescriptor(
      className: table.className,
      fileName: table.fileName,
      idWriteBackBlock: _idWriteBackBlock(table),
      fields: fields,
      defaultHelperMethods: _buildDefaultHelperMethods(helperNames),
    );
  }

  String _routeParameterType(AnalysisColumn column) {
    final nonNullable = column.dartType.endsWith('?')
        ? column.dartType.substring(0, column.dartType.length - 1)
        : column.dartType;
    if (nonNullable == 'String' || nonNullable == 'DateTime') {
      return 'String';
    }
    if (nonNullable == 'double') {
      return 'double';
    }
    return 'int';
  }

  String _routeParameterParseExpression(AnalysisColumn column) {
    final type = _routeParameterType(column);
    switch (type) {
      case 'String':
        return 'idRaw';
      case 'double':
        return 'double.parse(idRaw)';
      default:
        return 'int.parse(idRaw)';
    }
  }

  GeneratedLookupDescriptor? _resolveLookupDescriptor(
    AnalysisProject project,
    AnalysisColumn column,
  ) {
    final normalizedType = foldToAscii(column.rowSourceType ?? '')
        .toLowerCase()
        .trim();
    if (normalizedType != 'table/query') {
      return null;
    }

    final rowSource = column.rowSource?.trim();
    if (rowSource == null || rowSource.isEmpty) {
      return null;
    }

    final resolved = _resolveLookupSource(project, rowSource);
    if (resolved == null) {
      return null;
    }

    return GeneratedLookupDescriptor(
      fieldRuntimeName: columnRuntimeName(column),
      fieldFieldName: column.fieldName,
      sourceTableRuntimeName: tableRuntimeName(resolved.table),
      sourceRouteSegment: tableRouteSegment(resolved.table),
      valueColumnRuntimeName: columnRuntimeName(resolved.valueColumn),
      labelColumnRuntimeName: columnRuntimeName(resolved.labelColumn),
      orderByColumnRuntimeName: resolved.orderByColumn == null
          ? null
          : columnRuntimeName(resolved.orderByColumn!),
      rowSourceSql: rowSource,
    );
  }

  _ResolvedLookupSource? _resolveLookupSource(
    AnalysisProject project,
    String rowSource,
  ) {
    final trimmed = rowSource.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    if (!trimmed.toUpperCase().startsWith('SELECT ')) {
      final table = _findTableBySqlName(project, trimmed);
      if (table == null) {
        return null;
      }
      final valueColumn = _findPrimaryOrFirstColumn(table);
      final labelColumn = _findPreferredLabelColumn(table) ?? valueColumn;
      return _ResolvedLookupSource(
        table: table,
        valueColumn: valueColumn,
        labelColumn: labelColumn,
        orderByColumn: labelColumn,
      );
    }

    final tokens = const AccessSqlTokenizer().tokenize(trimmed);
    final statement = const AccessSqlClauseParser().parse(tokens);
    if (statement == null || statement.isSetOrActionQuery) {
      return null;
    }

    final sourceTableName = _extractPrimaryFromTableName(statement.fromTokens);
    if (sourceTableName == null) {
      return null;
    }
    final table = _findTableBySqlName(project, sourceTableName);
    if (table == null) {
      return null;
    }

    final selectExpressions = _splitTopLevelExpressions(statement.selectTokens);
    if (selectExpressions.isEmpty) {
      return null;
    }

    final valueProjection = _extractProjectedColumnName(selectExpressions.first);
    if (valueProjection == null) {
      return null;
    }
    final valueColumn = _findColumnBySqlName(table, valueProjection);
    if (valueColumn == null) {
      return null;
    }

    final labelProjection = selectExpressions.length > 1
        ? _extractProjectedColumnName(selectExpressions[1])
        : null;
    final labelColumn = labelProjection == null
        ? (_findPreferredLabelColumn(table) ?? valueColumn)
        : (_findColumnBySqlName(table, labelProjection) ??
            _findPreferredLabelColumn(table) ??
            valueColumn);

    final orderExpressions = _splitTopLevelExpressions(statement.orderByTokens);
    final orderProjection = orderExpressions.isEmpty
        ? null
        : _extractProjectedColumnName(orderExpressions.first);
    final orderByColumn = orderProjection == null
        ? null
        : _findColumnBySqlName(table, orderProjection);

    return _ResolvedLookupSource(
      table: table,
      valueColumn: valueColumn,
      labelColumn: labelColumn,
      orderByColumn: orderByColumn,
    );
  }

  AnalysisTable? _findTableBySqlName(AnalysisProject project, String rawName) {
    final target = _normalizeSqlLookupName(rawName);
    for (final table in project.tables) {
      final candidates = <String>{
        _normalizeSqlLookupName(table.name),
        _normalizeSqlLookupName(table.normalizedName),
        _normalizeSqlLookupName(tableRuntimeName(table)),
        _normalizeSqlLookupName(tableRouteName(table)),
      };
      if (candidates.contains(target)) {
        return table;
      }
    }
    return null;
  }

  AnalysisColumn? _findColumnBySqlName(AnalysisTable table, String rawName) {
    final target = _normalizeSqlLookupName(rawName);
    for (final column in table.columns) {
      final candidates = <String>{
        _normalizeSqlLookupName(column.name),
        _normalizeSqlLookupName(columnRuntimeName(column)),
        _normalizeSqlLookupName(column.fieldName),
      };
      if (candidates.contains(target)) {
        return column;
      }
    }
    return null;
  }

  AnalysisColumn _findPrimaryOrFirstColumn(AnalysisTable table) {
    final primaryKey = table.primaryKey;
    if (primaryKey != null && primaryKey.columns.isNotEmpty) {
      final primaryName = primaryKey.columns.first.name;
      for (final column in table.columns) {
        if (column.name == primaryName) {
          return column;
        }
      }
    }
    return table.columns.first;
  }

  AnalysisColumn? _findPreferredLabelColumn(AnalysisTable table) {
    final primaryName = table.primaryKey?.columns.isNotEmpty == true
        ? table.primaryKey!.columns.first.name
        : null;
    for (final column in table.columns) {
      if (column.name == primaryName) {
        continue;
      }
      final normalized = foldToAscii(column.typeName).toLowerCase();
      if (normalized == 'text' ||
          normalized == 'memo' ||
          normalized == 'longtext' ||
          normalized == 'char' ||
          normalized == 'nvarchar') {
        return column;
      }
    }
    if (table.columns.length > 1) {
      return table.columns[1];
    }
    return table.columns.isEmpty ? null : table.columns.first;
  }

  String? _extractPrimaryFromTableName(List<AccessSqlToken> tokens) {
    final current = <AccessSqlToken>[];
    for (final token in tokens) {
      if (token.lexeme == ',' ||
          (token.isWord &&
              (token.lexeme == 'INNER' ||
                  token.lexeme == 'LEFT' ||
                  token.lexeme == 'RIGHT' ||
                  token.lexeme == 'FULL' ||
                  token.lexeme == 'JOIN' ||
                  token.lexeme == 'ON'))) {
        break;
      }
      current.add(token);
    }
    return _extractProjectedColumnName(current, takeFirstOnly: true);
  }

  List<List<AccessSqlToken>> _splitTopLevelExpressions(List<AccessSqlToken> tokens) {
    final expressions = <List<AccessSqlToken>>[];
    final current = <AccessSqlToken>[];
    var depth = 0;
    for (final token in tokens) {
      if (token.lexeme == '(') {
        depth++;
      } else if (token.lexeme == ')') {
        depth = depth > 0 ? depth - 1 : 0;
      }
      if (depth == 0 && token.lexeme == ',') {
        if (current.isNotEmpty) {
          expressions.add(List<AccessSqlToken>.unmodifiable(current.toList()));
          current.clear();
        }
        continue;
      }
      current.add(token);
    }
    if (current.isNotEmpty) {
      expressions.add(List<AccessSqlToken>.unmodifiable(current.toList()));
    }
    return expressions;
  }

  String? _extractProjectedColumnName(
    List<AccessSqlToken> tokens, {
    bool takeFirstOnly = false,
  }) {
    if (tokens.isEmpty) {
      return null;
    }

    final expression = <AccessSqlToken>[];
    for (var index = 0; index < tokens.length; index++) {
      final token = tokens[index];
      if (token.isWord && token.lexeme == 'AS') {
        break;
      }
      if (takeFirstOnly && expression.isNotEmpty && token.isWord) {
        break;
      }
      expression.add(token);
    }

    final identifiers = <String>[];
    for (final token in expression) {
      if (token.isWord) {
        identifiers.add(token.lexeme);
        continue;
      }
      if (token.lexeme == '.') {
        continue;
      }
      return null;
    }

    if (identifiers.isEmpty) {
      return null;
    }
    return identifiers.last;
  }

  String _normalizeSqlLookupName(String value) {
    return foldToAscii(value)
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll('"', '')
        .replaceAll("'", '')
        .replaceAll('`', '')
        .replaceAll(RegExp(r'\s+'), '')
        .toLowerCase();
  }
}

List<String> _buildDefaultHelperMethods(Set<String> helperNames) {
  final methods = <String>[];
  final sorted = helperNames.toList(growable: false)..sort();
  for (final helper in sorted) {
    switch (helper) {
      case 'uuidV4':
        methods.add('''
  static String _accessUuidV4() {
    final random = DateTime.now().microsecondsSinceEpoch;
    final bytes = List<int>.generate(
      16,
      (index) => ((random >> ((index % 8) * 8)) + (index * 17)) & 0xFF,
      growable: false,
    );
    bytes[6] = (bytes[6] & 0x0F) | 0x40;
    bytes[8] = (bytes[8] & 0x3F) | 0x80;
    final hex = bytes
        .map((value) => value.toRadixString(16).padLeft(2, '0'))
        .join();
    return '\${hex.substring(0, 8)}-'
      '\${hex.substring(8, 12)}-'
      '\${hex.substring(12, 16)}-'
      '\${hex.substring(16, 20)}-'
      '\${hex.substring(20, 32)}';
  }''');
      case 'today':
        methods.add('''
  static DateTime _accessToday() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }''');
      case 'timeNow':
        methods.add('''
  static DateTime _accessTimeNow() {
    final now = DateTime.now();
    return DateTime(1899, 12, 30, now.hour, now.minute, now.second, now.millisecond, now.microsecond);
  }''');
      case 'dateLiteral':
        methods.add('''
  static DateTime _accessDateLiteral(String value) {
    final parts = value.split('/');
    if (parts.length == 3) {
      final month = int.tryParse(parts[0]) ?? 1;
      final day = int.tryParse(parts[1]) ?? 1;
      final year = int.tryParse(parts[2]) ?? 1900;
      return DateTime(year, month, day);
    }
    return DateTime.parse(value);
  }''');
      case 'dateSerial':
        methods.add('''
  static DateTime _accessDateSerial(num year, num month, num day) {
    final normalizedYear = _normalizeAccessYear(year.toInt());
    return DateTime(normalizedYear, month.toInt(), day.toInt());
  }

  static int _normalizeAccessYear(int year) {
    if (year >= 0 && year <= 29) {
      return 2000 + year;
    }
    if (year >= 30 && year <= 99) {
      return 1900 + year;
    }
    return year;
  }''');
      case 'timeSerial':
        methods.add('''
  static DateTime _accessTimeSerial(num hour, num minute, num second) {
    return DateTime(1899, 12, 30)
        .add(Duration(hours: hour.toInt(), minutes: minute.toInt(), seconds: second.toInt()));
  }''');
      case 'left':
        methods.add('''
  static String _accessLeft(String value, num count) {
    final end = count.toInt().clamp(0, value.length) as int;
    return value.substring(0, end);
  }''');
      case 'right':
        methods.add('''
  static String _accessRight(String value, num count) {
    final size = count.toInt().clamp(0, value.length) as int;
    return value.substring(value.length - size);
  }''');
      case 'mid':
        methods.add('''
  static String _accessMid(String value, num start, [num? length]) {
    final begin = ((start.toInt() - 1).clamp(0, value.length)) as int;
    if (length == null) {
      return value.substring(begin);
    }
    final end = ((begin + length.toInt()).clamp(begin, value.length)) as int;
    return value.substring(begin, end);
  }''');
    }
  }
  if (helperNames.contains('temporalParse') || helperNames.contains('temporalFormat')) {
    methods.add('''
  static DateTime? _accessParseTemporalValue(
    Object? value, {
    required String semantic,
  }) {
    if (value == null) {
      return null;
    }
    if (value is DateTime) {
      return value;
    }
    final text = value.toString().trim();
    if (text.isEmpty) {
      return null;
    }
    switch (semantic) {
      case 'date':
      case 'timestamp':
        return DateTime.tryParse(text);
      case 'time':
        final parts = text.split(':');
        if (parts.length < 2) {
          return null;
        }
        final hour = int.tryParse(parts[0]);
        final minute = int.tryParse(parts[1]);
        final second = parts.length >= 3 ? int.tryParse(parts[2]) : 0;
        if (hour == null || minute == null || second == null) {
          return null;
        }
        return DateTime.utc(1899, 12, 30, hour, minute, second);
      default:
        return DateTime.tryParse(text);
    }
  }

  static Object? _accessFormatTemporalValue(
    DateTime? value, {
    required String semantic,
  }) {
    if (value == null) {
      return null;
    }
    final utc = value.toUtc();
    final year = utc.year.toString().padLeft(4, '0');
    final month = utc.month.toString().padLeft(2, '0');
    final day = utc.day.toString().padLeft(2, '0');
    final hour = utc.hour.toString().padLeft(2, '0');
    final minute = utc.minute.toString().padLeft(2, '0');
    final second = utc.second.toString().padLeft(2, '0');
    switch (semantic) {
      case 'date':
        return '\$year-\$month-\$day';
      case 'time':
        return '\$hour:\$minute:\$second';
      case 'timestamp':
      default:
        return utc.toIso8601String();
    }
  }''');
  }
  return methods;
}

class _ResolvedLookupSource {
  final AnalysisTable table;
  final AnalysisColumn valueColumn;
  final AnalysisColumn labelColumn;
  final AnalysisColumn? orderByColumn;

  const _ResolvedLookupSource({
    required this.table,
    required this.valueColumn,
    required this.labelColumn,
    required this.orderByColumn,
  });
}