import 'analysis_model.dart';
import 'access_src_model.dart';
import 'migration_identifier_style.dart';
import 'migration_statement_builder.dart';

class AnalysisOverlayMerger {
  Map<String, dynamic> mergeSourceOverlay(
    Map<String, dynamic> analysis,
    AccessSrcProject sourceProject,
  ) {
    final rawTables = ((analysis['tables'] as List?) ?? const [])
        .whereType<Map>()
        .map((table) => table.cast<String, dynamic>())
        .toList(growable: false);
    if (rawTables.isEmpty || sourceProject.tables.isEmpty) {
      return analysis;
    }

    final sourceTablesByKey = <String, AccessSrcTable>{
      for (final table in sourceProject.tables) _lookupKey(table.name): table,
    };

    final mergedTables = rawTables.map((table) {
      final sourceTable = sourceTablesByKey[_lookupKey(table['name'] as String? ?? '')];
      if (sourceTable == null) {
        return table;
      }
      return _mergeTable(table, sourceTable);
    }).toList(growable: false);

    analysis['tables'] = mergedTables;

    final mergedProject = AnalysisProject.fromJson(analysis);
    final ddlBuilder = MigrationStatementBuilder(
      identifierPolicy: const MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
    );

    for (var index = 0; index < mergedTables.length; index++) {
      mergedTables[index]['postgres_ddl'] =
          ddlBuilder.buildCreateTableStatement(mergedProject.tables[index]);
    }

    return analysis;
  }

  Map<String, dynamic> _mergeTable(
    Map<String, dynamic> table,
    AccessSrcTable sourceTable,
  ) {
    final merged = Map<String, dynamic>.from(table);
    final primaryKeyColumns = _extractPrimaryKeyColumns(table);
    final sourceColumnsByKey = <String, AccessSrcColumn>{
      for (final column in sourceTable.columns) _lookupKey(column.name): column,
    };

    final mergedColumns = ((table['columns'] as List?) ?? const [])
        .whereType<Map>()
        .map((column) => column.cast<String, dynamic>())
        .map((column) {
          final name = column['name'] as String? ?? '';
          final sourceColumn = sourceColumnsByKey[_lookupKey(name)];
          final updated = Map<String, dynamic>.from(column);
          final isRequired = (column['isRequired'] as bool? ?? false) ||
              primaryKeyColumns.contains(name) ||
              (sourceColumn?.required ?? false);
          updated['isRequired'] = isRequired;

          if (sourceColumn?.caption case final caption?) {
            if (caption.isNotEmpty) {
              updated['caption'] = caption;
            }
          }

          if (sourceColumn?.maxLength case final maxLength?) {
            updated['maxLength'] = maxLength;
          }

          if (sourceColumn?.defaultValue case final defaultValue?) {
            if (defaultValue.isNotEmpty) {
              updated['defaultValue'] = defaultValue;
            }
          }

          if (sourceColumn?.validationRule case final validationRule?) {
            if (validationRule.isNotEmpty) {
              updated['validationRule'] = validationRule;
            }
          }

          if (sourceColumn?.validationText case final validationText?) {
            if (validationText.isNotEmpty) {
              updated['validationText'] = validationText;
            }
          }

          if (sourceColumn?.format case final format?) {
            if (format.isNotEmpty) {
              updated['format'] = format;
            }
          }

          if (sourceColumn?.inputMask case final inputMask?) {
            if (inputMask.isNotEmpty) {
              updated['inputMask'] = inputMask;
            }
          }

          if (sourceColumn?.allowZeroLength case final allowZeroLength?) {
            updated['allowZeroLength'] = allowZeroLength;
          }

          final calculatedExpression = sourceColumn?.expression;
          if (calculatedExpression != null && calculatedExpression.isNotEmpty) {
            updated['calculatedExpression'] = calculatedExpression;
            updated['isCalculated'] = true;
          }
          return updated;
        })
        .toList(growable: false);

    merged['columns'] = mergedColumns;
    return merged;
  }

  Set<String> _extractPrimaryKeyColumns(Map<String, dynamic> table) {
    final names = <String>{};
    final indexes = ((table['indexes'] as List?) ?? const [])
        .whereType<Map>()
        .map((index) => index.cast<String, dynamic>());
    for (final index in indexes) {
      if (index['isPrimaryKey'] != true) {
        continue;
      }
      final columns = ((index['columns'] as List?) ?? const [])
          .whereType<Map>()
          .map((column) => column.cast<String, dynamic>());
      for (final column in columns) {
        final name = column['name'] as String?;
        if (name != null && name.isNotEmpty) {
          names.add(name);
        }
      }
    }
    return names;
  }

  String _lookupKey(String value) {
    final normalized = StringBuffer();
    for (final codeUnit in value.toLowerCase().codeUnits) {
      final isLetter = codeUnit >= 97 && codeUnit <= 122;
      final isDigit = codeUnit >= 48 && codeUnit <= 57;
      if (isLetter || isDigit) {
        normalized.writeCharCode(codeUnit);
      }
    }
    return normalized.toString();
  }
}