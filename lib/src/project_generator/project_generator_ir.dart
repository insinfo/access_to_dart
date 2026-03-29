part of 'project_generator.dart';

class GeneratedFieldDescriptor {
  final String runtimeName;
  final String columnConstantName;
  final String fieldName;
  final String dartType;
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
  final String? wssFieldId;
  final String? fromMapExpression;
  final GeneratedLookupDescriptor? lookup;

  const GeneratedFieldDescriptor({
    required this.runtimeName,
    required this.columnConstantName,
    required this.fieldName,
    required this.dartType,
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
    required this.wssFieldId,
    this.fromMapExpression,
    this.lookup,
  });

  bool get isReadOnly => isAutoNumber || isCalculated;

  bool get isDropdownSuggested {
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

  String get inputType {
    if (foldToAscii(dartType).toLowerCase() == 'bool?') return 'checkbox';
    if (isDropdownSuggested) return 'select';
    if (inputMask != null && inputMask!.trim().isNotEmpty) return 'text';
    if (dartType == 'DateTime?') return 'date';
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
    if (inputType == 'date') return 'numeric';
    if (inputType == 'number') return 'decimal';
    return null;
  }
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
  final List<GeneratedLookupDescriptor> lookups;

  const GeneratedBackendModule({
    required this.packageName,
    required this.className,
    required this.normalizedName,
    required this.routeName,
    required this.tableRuntimeName,
    required this.primaryKeyRuntimeName,
    required this.lookups,
  });
}

class GeneratedFrontendModule {
  final String packageName;
  final String className;
  final String nameSnake;
  final String moduleNameKebab;
  final String formLogicClassName;
  final String primaryKeyField;
  final List<GeneratedFieldDescriptor> fields;

  const GeneratedFrontendModule({
    required this.packageName,
    required this.className,
    required this.nameSnake,
    required this.moduleNameKebab,
    required this.formLogicClassName,
    required this.primaryKeyField,
    required this.fields,
  });
}

class GeneratedCoreModelDescriptor {
  final String className;
  final String fileName;
  final String idWriteBackBlock;
  final List<GeneratedFieldDescriptor> fields;

  const GeneratedCoreModelDescriptor({
    required this.className,
    required this.fileName,
    required this.idWriteBackBlock,
    required this.fields,
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
    return GeneratedBackendModule(
      packageName: project.dartPackageName,
      className: table.className,
      normalizedName: table.normalizedName,
      routeName: tableRouteName(table),
      tableRuntimeName: tableRuntimeName(table),
      primaryKeyRuntimeName: primaryKeyRuntimeName(table),
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
    return GeneratedFrontendModule(
      packageName: project.dartPackageName,
      className: table.className,
      nameSnake: table.normalizedName,
      moduleNameKebab: tableRouteSegment(table),
      formLogicClassName: '${table.className}FormLogic',
      primaryKeyField: _getPrimaryKey(table).fieldName,
      fields: table.columns
          .map(
            (column) => GeneratedFieldDescriptor(
              runtimeName: columnRuntimeName(column),
              columnConstantName: column.columnConstantName,
              fieldName: column.fieldName,
              dartType: column.dartType,
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
              wssFieldId: column.wssFieldId,
              fromMapExpression: _fromMapValue(column),
              lookup: _resolveLookupDescriptor(project, column),
            ),
          )
          .toList(growable: false),
    );
  }

  GeneratedCoreModelDescriptor _buildCoreModelIr(AnalysisTable table) {
    return GeneratedCoreModelDescriptor(
      className: table.className,
      fileName: table.fileName,
      idWriteBackBlock: _idWriteBackBlock(table),
      fields: table.columns
          .map(
            (column) => GeneratedFieldDescriptor(
              runtimeName: columnRuntimeName(column),
              columnConstantName: column.columnConstantName,
              fieldName: column.fieldName,
              dartType: column.dartType,
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
              wssFieldId: column.wssFieldId,
              fromMapExpression: _fromMapValue(column),
              lookup: null,
            ),
          )
          .toList(growable: false),
    );
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