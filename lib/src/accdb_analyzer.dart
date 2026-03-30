import 'package:jackcess_dart/jackcess_dart.dart';

import 'identifier_utils.dart';
import 'access_analysis/access_analysis.dart';
import 'analysis_model.dart';
import 'migration_identifier_style.dart';
import 'migration_statement_builder.dart';

/// Produces a rich analysis JSON from an [AccessDatabaseModel] and [AccessDatabase].
class AccdbAnalyzer {
  final AccessDatabaseModel model;
  final AccessDatabase? db;
  final MigrationStatementBuilder _ddlBuilder = const MigrationStatementBuilder(
    identifierPolicy: MigrationIdentifierPolicy(
      style: MigrationIdentifierStyle.snakeAscii,
    ),
  );

  AccdbAnalyzer({required this.model, this.db});

  Future<Map<String, dynamic>> analyze() async {
    final canonicalAnalysis = AccessAnalysis();
    if (db != null) {
      await canonicalAnalysis.extractFromDatabase(db!);
    }

    final stableQueries = model.queries
        .where((query) => !_isTemporaryAccessObjectName(query.name))
        .toList(growable: false);

    return {
      'schema_version': '1.0',
      'source': model.path,
      'format': model.formatName,
      'summary': {
        'tables': model.tables.length,
        'linkedTables': model.linkedTables.length,
        'relationships': model.relationships.length,
        'queries': stableQueries.length,
        'forms': model.forms.length,
        'reports': model.reports.length,
        'macros': model.macros.length,
        'modules': model.modules.length,
      },
      'tables': model.tables.map((t) => _analyzeTable(t)).toList(),
      'linkedTables': model.linkedTables.map((t) => t.toJson()).toList(),
      'relationships': model.relationships.map((r) => r.toJson()).toList(),
      'queries': stableQueries.map((q) => q.toJson()).toList(),
      'forms': model.forms.map((f) => f.toJson()).toList(),
      'reports': model.reports.map((r) => r.toJson()).toList(),
      'macros': model.macros.map((m) => m.toJson()).toList(),
      'modules': model.modules.map((m) => m.toJson()).toList(),
      'canonical_analysis': canonicalAnalysis.toJson(),
    };
  }

  Map<String, dynamic> _analyzeTable(AccessTableSchema t) {
    return {
      ...t.toJson(),
      'postgres_ddl': _buildPostgresDdl(t),
      'dart_class_name': _toDartClassName(t.name),
    };
  }

  String _buildPostgresDdl(AccessTableSchema t) {
    return _ddlBuilder.buildCreateTableStatement(_toAnalysisTable(t));
  }

  AnalysisTable _toAnalysisTable(AccessTableSchema table) {
    return AnalysisTable(
      name: table.name,
      rowCount: table.rowCount,
      postgresDdl: null,
      dartClassName: _toDartClassName(table.name),
      columns: table.columns
          .map(
            (column) => AnalysisColumn(
              name: column.name,
              typeName: column.typeName,
              typeCode: column.typeCode,
              isAutoNumber: column.isAutoNumber,
              isCalculated: column.isCalculated,
              isRequired: column.isRequired,
              caption: column.caption,
              defaultValue: column.defaultValue,
              maxLength: column.maxLength,
              calculatedExpression: column.calculatedExpression,
              validationRule: column.validationRule,
              validationText: column.validationText,
              description: column.description,
              decimalPlaces: column.decimalPlaces,
              displayControl: column.displayControl,
              textFormat: column.textFormat,
              imeMode: column.imeMode,
              imeSentenceMode: column.imeSentenceMode,
              resultType: column.resultType,
              propertyGuid: column.propertyGuid,
              allowMultipleValues: column.allowMultipleValues,
              rowSourceType: column.rowSourceType,
              rowSource: column.rowSource,
              wssFieldId: column.wssFieldId,
              formatString: column.formatString,
              inputMask: column.inputMask,
              allowZeroLength: column.allowZeroLength,
              precision: column.precision,
              scale: column.scale,
            ),
          )
          .toList(),
      indexes: table.indexes
          .map(
            (index) => AnalysisIndex(
              name: index.name,
              indexNumber: index.indexNumber,
              backingDataNumber: index.backingDataNumber,
              isPrimaryKey: index.isPrimaryKey,
              isForeignKey: index.isForeignKey,
              isUnique: index.isUnique,
              isRequired: index.isRequired,
              ignoreNulls: index.ignoreNulls,
              flags: index.flags,
              columns: index.columns
                  .map(
                    (column) => AnalysisIndexColumn(
                      name: column.name,
                      columnNumber: column.columnNumber,
                      ascending: column.ascending,
                      flags: column.flags,
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
      sampleRows: table.sampleRows,
    );
  }

  String _toDartClassName(String name) {
    return toPascalCaseIdentifier(name);
  }

  bool _isTemporaryAccessObjectName(String value) {
    final normalized = value.trim().toLowerCase();
    if (normalized.isEmpty) {
      return false;
    }
    return normalized.startsWith('~sq_') ||
        normalized.startsWith('~tmp') ||
        normalized.startsWith('~tmpclp');
  }
}
