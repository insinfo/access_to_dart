import 'access_expression.dart';

/// Access database object types from MSysObjects.Type
enum AccessObjectType {
  /// User table (Type == 1)
  table,

  /// Linked (ODBC) table (Type == 4)
  linkedOdbcTable,

  /// Query / view (Type == 5)
  query,

  /// Linked (Jet/ISAM) table (Type == 6)
  linkedTable,

  /// Relationship (Type == 8)
  relationship,

  /// Form (Type == -32768)
  form,

  /// Report (Type == -32764)
  report,

  /// Macro (Type == -32766)
  macro,

  /// Module (Type == -32757)
  module,

  /// Container / folder (Type == 3)
  container,

  /// Group / parent (Type == 2)
  group,

  /// Unknown
  unknown;

  static AccessObjectType fromTypeValue(int typeValue) {
    switch (typeValue) {
      case 1:
        return AccessObjectType.table;
      case 4:
        return AccessObjectType.linkedOdbcTable;
      case 5:
        return AccessObjectType.query;
      case 6:
        return AccessObjectType.linkedTable;
      case 8:
        return AccessObjectType.relationship;
      case -32768:
        return AccessObjectType.form;
      case -32764:
        return AccessObjectType.report;
      case -32766:
        return AccessObjectType.macro;
      case -32757:
        return AccessObjectType.module;
      case 3:
        return AccessObjectType.container;
      case 2:
        return AccessObjectType.group;
      default:
        return AccessObjectType.unknown;
    }
  }

  String get jsonLabel {
    switch (this) {
      case table:
        return 'table';
      case linkedOdbcTable:
        return 'linked_odbc_table';
      case query:
        return 'query';
      case linkedTable:
        return 'linked_table';
      case relationship:
        return 'relationship';
      case form:
        return 'form';
      case report:
        return 'report';
      case macro:
        return 'macro';
      case module:
        return 'module';
      case container:
        return 'container';
      case group:
        return 'group';
      case unknown:
        return 'unknown';
    }
  }
}

/// An entry from the MSysObjects system catalog.
class AccessCatalogEntry {
  final int id;
  final int parentId;
  final String name;
  final AccessObjectType objectType;
  final int flags;
  final int rawType;

  const AccessCatalogEntry({
    required this.id,
    required this.parentId,
    required this.name,
    required this.objectType,
    required this.flags,
    required this.rawType,
  });

  /// Returns true if this is a system/internal object.
  /// Mirrors Jackcess: SYSTEM_OBJECT_FLAGS = SYSTEM_OBJECT_FLAG | ALT_SYSTEM_OBJECT_FLAG
  ///   = 0x80000000 | 0x02 = 0x80000002
  bool get isSystem => ((flags & 0x80000000) | (flags & 0x02)) != 0;

  /// Returns true if this is hidden.
  bool get isHidden => (flags & 0x08) != 0;

  Map<String, dynamic> toJson() => {
        'id': id,
        'parentId': parentId,
        'name': name,
        'type': objectType.jsonLabel,
        'rawType': rawType,
        'flags': flags,
        'isSystem': isSystem,
        'isHidden': isHidden,
      };

  @override
  String toString() =>
      'AccessCatalogEntry(id: $id, name: $name, type: ${objectType.jsonLabel})';
}

/// An Access table schema extracted from the TDEF binary.
class AccessTableSchema {
  final String name;
  final int tdefPageNumber;
  final int rowCount;
  final List<AccessColumnSchema> columns;
  final List<AccessIndexSchema> indexes;
  final List<Map<String, dynamic>> sampleRows;

  const AccessTableSchema({
    required this.name,
    required this.tdefPageNumber,
    required this.rowCount,
    required this.columns,
    required this.indexes,
    required this.sampleRows,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'tdefPage': tdefPageNumber,
        'rowCount': rowCount,
        'columns': columns.map((c) => c.toJson()).toList(),
        'indexes': indexes.map((i) => i.toJson()).toList(),
        'sampleRows': sampleRows,
      };
}

/// An Access column schema.
class AccessColumnSchema {
  final String name;
  final int typeCode;
  final String typeName;
  final int length;
  final int columnNumber;
  final int variableColumnNumber;
  final int fixedOffset;
  final bool isVariableLength;
  final bool isAutoNumber;
  final bool isCalculated;
  final int flags;
  final int extFlags;
  final int? precision;
  final int? scale;

  const AccessColumnSchema({
    required this.name,
    required this.typeCode,
    required this.typeName,
    required this.length,
    required this.columnNumber,
    required this.variableColumnNumber,
    required this.fixedOffset,
    required this.isVariableLength,
    required this.isAutoNumber,
    required this.isCalculated,
    required this.flags,
    required this.extFlags,
    required this.precision,
    required this.scale,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'typeCode': typeCode,
        'typeName': typeName,
        'length': length,
        'columnNumber': columnNumber,
        'variableColumnNumber': variableColumnNumber,
        'fixedOffset': fixedOffset,
        'isVariableLength': isVariableLength,
        'isAutoNumber': isAutoNumber,
        'isCalculated': isCalculated,
        'flags': flags,
        'extFlags': extFlags,
        'precision': precision,
        'scale': scale,
      };

  /// Maps an Access type code to a human-readable name.
  static String typeCodeToName(int code) {
    switch (code) {
      case 0x01:
        return 'Boolean';
      case 0x02:
        return 'Byte';
      case 0x03:
        return 'Integer';
      case 0x04:
        return 'Long';
      case 0x05:
        return 'Money';
      case 0x06:
        return 'Float';
      case 0x07:
        return 'Double';
      case 0x08:
        return 'DateTime';
      case 0x09:
        return 'Binary';
      case 0x0A:
        return 'Text';
      case 0x0B:
        return 'OLE';
      case 0x0C:
        return 'Memo';
      case 0x0F:
        return 'GUID';
      case 0x10:
        return 'Numeric';
      case 0x12:
        return 'ComplexType';
      case 0x13:
        return 'BigInt';
      default:
        return 'Unknown(0x${code.toRadixString(16)})';
    }
  }

  /// Maps an Access type code to a PostgreSQL type.
  static String typeCodeToPostgres(int code, int length,
      {int? precision, int? scale}) {
    switch (code) {
      case 0x01:
        return 'BOOLEAN';
      case 0x02:
        return 'SMALLINT';
      case 0x03:
        return 'SMALLINT';
      case 0x04:
        return 'INTEGER';
      case 0x05:
        return 'NUMERIC(19, 4)';
      case 0x06:
        return 'REAL';
      case 0x07:
        return 'DOUBLE PRECISION';
      case 0x08:
        return 'TIMESTAMP';
      case 0x09:
        return 'BYTEA';
      case 0x0A:
        return length > 0 ? 'VARCHAR(${length ~/ 2})' : 'TEXT';
      case 0x0B:
        return 'BYTEA';
      case 0x0C:
        return 'TEXT';
      case 0x0F:
        return 'UUID';
      case 0x10:
        if (precision != null && scale != null && precision > 0) {
          return 'NUMERIC($precision, $scale)';
        }
        return 'NUMERIC';
      case 0x12:
        return 'INTEGER';
      case 0x13:
        return 'BIGINT';
      default:
        return 'TEXT';
    }
  }

  /// Maps an Access type code to a Dart type.
  static String typeCodeToDart(int code) {
    switch (code) {
      case 0x01:
        return 'bool';
      case 0x02:
      case 0x03:
      case 0x04:
        return 'int';
      case 0x05:
        return 'double';
      case 0x06:
        return 'double';
      case 0x07:
        return 'double';
      case 0x08:
        return 'DateTime';
      case 0x09:
        return 'Uint8List';
      case 0x0A:
        return 'String';
      case 0x0B:
        return 'Uint8List';
      case 0x0C:
        return 'String';
      case 0x0F:
        return 'String';
      case 0x10:
        return 'double';
      case 0x12:
        return 'int';
      case 0x13:
        return 'int';
      default:
        return 'dynamic';
    }
  }
}

class AccessIndexColumnSchema {
  final String name;
  final int columnNumber;
  final bool ascending;
  final int flags;

  const AccessIndexColumnSchema({
    required this.name,
    required this.columnNumber,
    required this.ascending,
    required this.flags,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'columnNumber': columnNumber,
        'ascending': ascending,
        'flags': flags,
      };
}

class AccessIndexSchema {
  final String name;
  final int indexNumber;
  final int backingDataNumber;
  final bool isPrimaryKey;
  final bool isForeignKey;
  final bool isUnique;
  final bool isRequired;
  final bool ignoreNulls;
  final int flags;
  final int? relatedTablePageNumber;
  final int? relatedIndexNumber;
  final bool cascadeUpdates;
  final bool cascadeDeletes;
  final bool cascadeNullOnDelete;
  final List<AccessIndexColumnSchema> columns;

  const AccessIndexSchema({
    required this.name,
    required this.indexNumber,
    required this.backingDataNumber,
    required this.isPrimaryKey,
    required this.isForeignKey,
    required this.isUnique,
    required this.isRequired,
    required this.ignoreNulls,
    required this.flags,
    required this.relatedTablePageNumber,
    required this.relatedIndexNumber,
    required this.cascadeUpdates,
    required this.cascadeDeletes,
    required this.cascadeNullOnDelete,
    required this.columns,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'indexNumber': indexNumber,
        'backingDataNumber': backingDataNumber,
        'isPrimaryKey': isPrimaryKey,
        'isForeignKey': isForeignKey,
        'isUnique': isUnique,
        'isRequired': isRequired,
        'ignoreNulls': ignoreNulls,
        'flags': flags,
        'relatedTablePageNumber': relatedTablePageNumber,
        'relatedIndexNumber': relatedIndexNumber,
        'cascadeUpdates': cascadeUpdates,
        'cascadeDeletes': cascadeDeletes,
        'cascadeNullOnDelete': cascadeNullOnDelete,
        'columns': columns.map((column) => column.toJson()).toList(),
      };
}

class AccessRelationshipSchema {
  final String name;
  final String fromTable;
  final List<String> fromColumns;
  final String toTable;
  final List<String> toColumns;
  final int flags;
  final int columnCount;

  const AccessRelationshipSchema({
    required this.name,
    required this.fromTable,
    required this.fromColumns,
    required this.toTable,
    required this.toColumns,
    required this.flags,
    required this.columnCount,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'fromTable': fromTable,
        'fromColumns': fromColumns,
        'toTable': toTable,
        'toColumns': toColumns,
        'flags': flags,
        'columnCount': columnCount,
      };
}

/// An Access query definition.
class AccessQueryDef {
  final String name;
  final int objectId;
  final String? sqlText;
  final int queryType;
  final List<AccessQueryRow> rows;

  const AccessQueryDef({
    required this.name,
    required this.objectId,
    required this.sqlText,
    required this.queryType,
    required this.rows,
  });

  String get queryTypeName => AccessQueryRow.queryTypeName(queryType);

  Map<String, dynamic> toJson() => {
        'name': name,
        'objectId': objectId,
        'sqlText': sqlText,
        'queryType': queryType,
        'queryTypeName': queryTypeName,
        'rows': rows.map((row) => row.toJson()).toList(),
      };
}

class AccessQueryRow {
  final int? attribute;
  final String attributeName;
  final int? flag;
  final String? expression;
  final AccessExpressionNode? expressionAst;
  final String? name1;
  final String? name2;
  final int? extra;
  final int? order;

  const AccessQueryRow({
    required this.attribute,
    required this.attributeName,
    required this.flag,
    required this.expression,
    required this.expressionAst,
    required this.name1,
    required this.name2,
    required this.extra,
    required this.order,
  });

  Map<String, dynamic> toJson() => {
        'attribute': attribute,
        'attributeName': attributeName,
        'flag': flag,
        'expression': expression,
        'expressionAst': expressionAst?.toJson(),
        'name1': name1,
        'name2': name2,
        'extra': extra,
        'order': order,
      };

  static String attributeNameFor(int? attribute) {
    switch (attribute) {
      case 1:
        return 'TYPE';
      case 2:
        return 'PARAMETER';
      case 3:
        return 'FLAG';
      case 4:
        return 'REMOTEDB';
      case 5:
        return 'TABLE';
      case 6:
        return 'COLUMN';
      case 7:
        return 'JOIN';
      case 8:
        return 'WHERE';
      case 9:
        return 'GROUPBY';
      case 10:
        return 'HAVING';
      case 11:
        return 'ORDERBY';
      case 255:
        return 'END';
      default:
        return 'UNKNOWN';
    }
  }

  static String queryTypeName(int queryType) {
    switch (queryType) {
      case 1:
        return 'select';
      case 2:
        return 'make_table';
      case 3:
        return 'append';
      case 4:
        return 'update';
      case 5:
        return 'delete';
      case 6:
        return 'cross_tab';
      case 7:
        return 'data_definition';
      case 8:
        return 'pass_through';
      case 9:
        return 'union';
      default:
        return 'unknown';
    }
  }
}

/// Complete model of all objects in an Access database.
class AccessDatabaseModel {
  final String path;
  final String formatName;
  final List<AccessTableSchema> tables;
  final List<AccessCatalogEntry> linkedTables;
  final List<AccessRelationshipSchema> relationships;
  final List<AccessQueryDef> queries;
  final List<AccessCatalogEntry> forms;
  final List<AccessCatalogEntry> reports;
  final List<AccessCatalogEntry> macros;
  final List<AccessCatalogEntry> modules;

  const AccessDatabaseModel({
    required this.path,
    required this.formatName,
    required this.tables,
    required this.linkedTables,
    required this.relationships,
    required this.queries,
    required this.forms,
    required this.reports,
    required this.macros,
    required this.modules,
  });

  Map<String, dynamic> toJson() => {
        'path': path,
        'format': formatName,
        'tables': tables.map((t) => t.toJson()).toList(),
        'linkedTables': linkedTables.map((t) => t.toJson()).toList(),
        'relationships': relationships.map((r) => r.toJson()).toList(),
        'queries': queries.map((q) => q.toJson()).toList(),
        'forms': forms.map((f) => f.toJson()).toList(),
        'reports': reports.map((r) => r.toJson()).toList(),
        'macros': macros.map((m) => m.toJson()).toList(),
        'modules': modules.map((m) => m.toJson()).toList(),
      };
}
