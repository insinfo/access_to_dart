import 'dart:typed_data';

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

    final syntheticTables = db == null
        ? const <Map<String, dynamic>>[]
        : await _buildSyntheticAttachmentTables();

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
      'tables': [
        ...model.tables.map((t) => _analyzeTable(t)),
        ...syntheticTables,
      ],
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

  Future<List<Map<String, dynamic>>> _buildSyntheticAttachmentTables() async {
    final database = db;
    if (database == null) {
      return const <Map<String, dynamic>>[];
    }

    final catalog = AccessCatalog(
      format: database.format,
      pageChannel: database.pageChannel,
    );
    final entries = await catalog.debugGetAllEntries();
    final entryById = <int, AccessCatalogEntry>{
      for (final entry in entries) entry.id: entry,
    };
    final complexEntry = entries
        .where((entry) => entry.name == 'MSysComplexColumns')
        .firstOrNull;
    if (complexEntry == null) {
      return const <Map<String, dynamic>>[];
    }

    final complexRows = await _readRowsByPage(database, complexEntry.id);
    if (complexRows.isEmpty) {
      return const <Map<String, dynamic>>[];
    }

    final shapeCache = <int, _AttachmentTableShape>{};
    final syntheticTables = <Map<String, dynamic>>[];

    for (final table in model.tables) {
      final complexTypeIds = await _readComplexTypeIds(
        database,
        table.tdefPageNumber,
      );
      for (final column in table.columns) {
        if (_normalizedName(column.typeName) != 'complextype') {
          continue;
        }
        final complexTypeId = complexTypeIds[column.columnNumber];
        if (complexTypeId == null) {
          continue;
        }
        final complexRow = complexRows.firstWhere(
          (candidate) =>
              _rowInt(candidate, 'ComplexID') == complexTypeId ||
              _rowInt(candidate, 'ID') == complexTypeId,
          orElse: () => const <String, dynamic>{},
        );
        if (complexRow.isEmpty) {
          continue;
        }

        final flatTablePage = _rowInt(complexRow, 'FlatTableID');
        if (flatTablePage == null) {
          continue;
        }
        final typeObjectPage = _rowInt(complexRow, 'ComplexTypeObjectID');
        final typeShape = typeObjectPage == null
            ? null
            : await _readTableShapeCached(
                database,
                typeObjectPage,
                entryById[typeObjectPage]?.name ?? 'typeObj#$typeObjectPage',
                shapeCache,
              );
        if (_classifyComplexType(typeShape) != 'attachment') {
          continue;
        }

        final flatShape = await _readTableShapeCached(
          database,
          flatTablePage,
          entryById[flatTablePage]?.name ?? 'flat#$flatTablePage',
          shapeCache,
        );
        final syntheticTableName =
            '${table.name}_${column.name}_attachment';
        final linkColumnName = _inferAttachmentLinkColumnName(
          flatShape,
          column.name,
        );
        if (linkColumnName == null) {
          continue;
        }
        final rows = await _readRowsByPage(database, flatTablePage);
        final syntheticAnalysisTable = AnalysisTable(
          name: syntheticTableName,
          tdefPageNumber: flatTablePage,
          rowCount: rows.length,
          postgresDdl: null,
          dartClassName: _toDartClassName(syntheticTableName),
          syntheticKind: 'attachment',
          attachmentParentTable: table.name,
          attachmentParentColumn: column.name,
          attachmentLinkColumn: linkColumnName,
          columns: [
            for (final flatColumn in flatShape.columns)
              AnalysisColumn(
                name: flatColumn.name,
                typeName: flatColumn.typeName,
                typeCode: flatColumn.typeCode,
                isAutoNumber: false,
                isCalculated: false,
                isRequired: false,
                caption: null,
                defaultValue: null,
                maxLength: null,
                calculatedExpression: null,
                validationRule: null,
                validationText: null,
                description: null,
                decimalPlaces: null,
                displayControl: null,
                textFormat: null,
                imeMode: null,
                imeSentenceMode: null,
                resultType: null,
                propertyGuid: null,
                allowMultipleValues: null,
                rowSourceType: null,
                rowSource: null,
                wssFieldId: null,
                formatString: null,
                inputMask: null,
                allowZeroLength: null,
                precision: null,
                scale: null,
                complexTypeClassification: null,
                attachmentTableName: null,
                attachmentLinkColumn: null,
              ),
          ],
          indexes: const <AnalysisIndex>[],
          sampleRows: rows.take(10).toList(growable: false),
        );
        syntheticTables.add({
          'name': syntheticTableName,
          'tdefPage': flatTablePage,
          'rowCount': rows.length,
          'syntheticKind': 'attachment',
          'attachmentParentTable': table.name,
          'attachmentParentColumn': column.name,
          'attachmentLinkColumn': linkColumnName,
          'columns': [
            for (final flatColumn in flatShape.columns)
              {
                'name': flatColumn.name,
                'typeCode': flatColumn.typeCode,
                'typeName': flatColumn.typeName,
              },
          ],
          'indexes': const <Map<String, dynamic>>[],
          'sampleRows': rows.take(10).toList(growable: false),
          'postgres_ddl': _ddlBuilder.buildCreateTableStatement(
            syntheticAnalysisTable,
          ),
          'dart_class_name': _toDartClassName(syntheticTableName),
        });
      }
    }

    return syntheticTables;
  }

  String _buildPostgresDdl(AccessTableSchema t) {
    return _ddlBuilder.buildCreateTableStatement(_toAnalysisTable(t));
  }

  AnalysisTable _toAnalysisTable(AccessTableSchema table) {
    return AnalysisTable(
      name: table.name,
      tdefPageNumber: table.tdefPageNumber,
      rowCount: table.rowCount,
      postgresDdl: null,
      dartClassName: _toDartClassName(table.name),
      syntheticKind: null,
      attachmentParentTable: null,
      attachmentParentColumn: null,
      attachmentLinkColumn: null,
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
              complexTypeClassification: null,
              attachmentTableName: null,
              attachmentLinkColumn: null,
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

  Future<Map<int, int>> _readComplexTypeIds(
    AccessDatabase database,
    int tdefPageNumber,
  ) async {
    const offsetNumIndexes = 51;
    const offsetIndexDefBlock = 63;
    const sizeIndexDefinition = 12;
    const sizeColumnDefBlock = 25;
    const offsetType = 0;
    const offsetColumnNumber = 5;
    const offsetComplexId = 11;
    final bytes = await TableDefReader(
      format: database.format,
      pageChannel: database.pageChannel,
      pageNumber: tdefPageNumber,
    ).readTableDefinitionData();
    final data = ByteData.sublistView(bytes);
    final indexCount = data.getInt32(offsetNumIndexes, Endian.little);
    final columnStart = offsetIndexDefBlock + (indexCount * sizeIndexDefinition);
    final complexTypeIds = <int, int>{};
    for (var offset = columnStart;
        offset + sizeColumnDefBlock <= bytes.length;
        offset += sizeColumnDefBlock) {
      final type = data.getUint8(offset + offsetType);
      if (type != 0x12) {
        continue;
      }
      final columnNumber =
          data.getInt16(offset + offsetColumnNumber, Endian.little);
      complexTypeIds[columnNumber] =
          data.getInt32(offset + offsetComplexId, Endian.little);
    }
    return complexTypeIds;
  }

  Future<List<Map<String, dynamic>>> _readRowsByPage(
    AccessDatabase database,
    int pageNumber,
  ) {
    final tableReader = TableReader(
      format: database.format,
      pageChannel: database.pageChannel,
    );
    return tableReader.readAllRows(pageNumber);
  }

  Future<_AttachmentTableShape> _readTableShapeCached(
    AccessDatabase database,
    int pageNumber,
    String name,
    Map<int, _AttachmentTableShape> cache,
  ) async {
    final cached = cache[pageNumber];
    if (cached != null) {
      return cached;
    }
    final definition = await TableDefReader(
      format: database.format,
      pageChannel: database.pageChannel,
      pageNumber: pageNumber,
    ).readDefinition();
    final shape = _AttachmentTableShape(
      name: name,
      pageNumber: pageNumber,
      columns: definition.columns
          .map(
            (column) => _AttachmentColumnShape(
              name: column.name,
              typeCode: column.type,
              typeName: AccessColumnSchema.typeCodeToName(column.type),
            ),
          )
          .toList(growable: false),
    );
    cache[pageNumber] = shape;
    return shape;
  }

  String _classifyComplexType(_AttachmentTableShape? shape) {
    if (shape == null) {
      return 'complex-unknown';
    }
    final columns = shape.columns;
    final memoCount = columns.where((column) => column.typeName == 'Memo').length;
    final textCount = columns.where((column) => column.typeName == 'Text').length;
    final dateCount =
        columns.where((column) => column.typeName == 'DateTime').length;
    final oleCount = columns.where((column) => column.typeName == 'OLE').length;
    final longCount = columns.where((column) => column.typeName == 'Long').length;
    if (memoCount >= 1 &&
        textCount >= 2 &&
        dateCount >= 1 &&
        oleCount >= 1 &&
        longCount >= 1) {
      return 'attachment';
    }
    return 'complex-unsupported';
  }

  String? _inferAttachmentLinkColumnName(
    _AttachmentTableShape shape,
    String columnName,
  ) {
    final exact = shape.columns.where((column) => column.name == '_$columnName');
    if (exact.isNotEmpty) {
      return exact.first.name;
    }
    final normalizedTarget = _normalizedName('_$columnName');
    for (final column in shape.columns) {
      if (_normalizedName(column.name) == normalizedTarget) {
        return column.name;
      }
    }
    return null;
  }

  int? _rowInt(Map<String, dynamic> row, String key) {
    for (final entry in row.entries) {
      if (_normalizedName(entry.key) != _normalizedName(key)) {
        continue;
      }
      final value = entry.value;
      if (value is int) {
        return value;
      }
      if (value is num) {
        return value.toInt();
      }
    }
    return null;
  }

  String _normalizedName(String value) {
    final buffer = StringBuffer();
    for (final codeUnit in foldToAscii(value).toLowerCase().codeUnits) {
      final isLetter = codeUnit >= 97 && codeUnit <= 122;
      final isDigit = codeUnit >= 48 && codeUnit <= 57;
      if (isLetter || isDigit) {
        buffer.writeCharCode(codeUnit);
      }
    }
    return buffer.toString();
  }
}

class _AttachmentTableShape {
  final String name;
  final int pageNumber;
  final List<_AttachmentColumnShape> columns;

  const _AttachmentTableShape({
    required this.name,
    required this.pageNumber,
    required this.columns,
  });
}

class _AttachmentColumnShape {
  final String name;
  final int typeCode;
  final String typeName;

  const _AttachmentColumnShape({
    required this.name,
    required this.typeCode,
    required this.typeName,
  });
}
