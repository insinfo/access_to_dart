import 'dart:convert';
import 'dart:io';

import 'identifier_utils.dart';

class AnalysisProject {
  final String schemaVersion;
  final String source;
  final String format;
  final Map<String, dynamic> summary;
  final List<AnalysisTable> tables;
  final List<AnalysisLinkedTable> linkedTables;
  final List<AnalysisForm> forms;
  final AnalysisCanonicalAnalysis? canonicalAnalysis;
  final Map<String, dynamic>? queryReconciliation;
  final Map<String, dynamic> raw;

  AnalysisProject({
    required this.schemaVersion,
    required this.source,
    required this.format,
    required this.summary,
    required this.tables,
    required this.linkedTables,
    required this.forms,
    required this.canonicalAnalysis,
    required this.queryReconciliation,
    required this.raw,
  });

  factory AnalysisProject.fromJson(Map<String, dynamic> json) {
    return AnalysisProject(
      schemaVersion: json['schema_version'] as String? ?? 'unknown',
      source: json['source'] as String? ?? '',
      format: json['format'] as String? ?? '',
      summary: (json['summary'] as Map?)?.cast<String, dynamic>() ?? const {},
      tables: ((json['tables'] as List?) ?? const [])
          .whereType<Map>()
          .map((table) => AnalysisTable.fromJson(table.cast<String, dynamic>()))
          .toList(),
      linkedTables: ((json['linkedTables'] as List?) ?? const [])
          .whereType<Map>()
          .map((table) =>
              AnalysisLinkedTable.fromJson(table.cast<String, dynamic>()))
          .toList(),
      forms: ((json['forms'] as List?) ?? const [])
          .whereType<Map>()
          .map((form) => AnalysisForm.fromJson(form.cast<String, dynamic>()))
          .toList(),
      canonicalAnalysis: (json['canonical_analysis'] as Map?) == null
          ? null
          : AnalysisCanonicalAnalysis.fromJson(
              (json['canonical_analysis'] as Map).cast<String, dynamic>(),
            ),
      queryReconciliation:
          (json['query_reconciliation'] as Map?)?.cast<String, dynamic>(),
      raw: json,
    );
  }

  static Future<AnalysisProject> load(String path) async {
    final file = File(path);
    final json = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    return AnalysisProject.fromJson(json);
  }

  String get projectName {
    if (tables.isNotEmpty) {
      return toSnakeCaseIdentifier(tables.first.name);
    }
    if (linkedTables.isNotEmpty) {
      return toSnakeCaseIdentifier(linkedTables.first.name);
    }
    final sourceName = source.split(Platform.pathSeparator).last;
    final dotIndex = sourceName.lastIndexOf('.');
    final base = dotIndex <= 0 ? sourceName : sourceName.substring(0, dotIndex);
    return toSnakeCaseIdentifier(base);
  }

  String get dartPackageName => '${projectName}_app_generated';

  AnalysisCanonicalForm? canonicalFormForTable(AnalysisTable table) {
    final candidates = canonicalAnalysis?.forms
            .where((form) => (form.rawVbaCode ?? '').trim().isNotEmpty)
            .toList() ??
        const <AnalysisCanonicalForm>[];
    if (candidates.isEmpty) {
      return null;
    }
    if (tables.length == 1 && candidates.length == 1) {
      return candidates.first;
    }

    final tableKeys = <String>{
      _lookupKey(table.name),
      _lookupKey(table.normalizedName),
      _lookupKey(table.className),
    };
    final singularKeys = tableKeys.map(_singularizeKey).toSet();

    for (final form in candidates) {
      final formKey = _lookupKey(form.name);
      for (final key in {...tableKeys, ...singularKeys}) {
        if (key.isEmpty) {
          continue;
        }
        if (formKey.contains(key) || formKey.contains(_singularizeKey(key))) {
          return form;
        }
      }
    }

    if (tables.length == 1) {
      return candidates.first;
    }
    return null;
  }

  static String _lookupKey(String value) {
    final normalized = StringBuffer();
    for (final codeUnit in foldToAscii(value).toLowerCase().codeUnits) {
      final isLetter = codeUnit >= 97 && codeUnit <= 122;
      final isDigit = codeUnit >= 48 && codeUnit <= 57;
      if (isLetter || isDigit) {
        normalized.writeCharCode(codeUnit);
      }
    }
    return normalized.toString();
  }

  static String _singularizeKey(String value) {
    if (value.endsWith('s') && value.length > 3) {
      return value.substring(0, value.length - 1);
    }
    return value;
  }
}

class AnalysisCanonicalAnalysis {
  final List<AnalysisCanonicalForm> forms;
  final List<AnalysisCanonicalModule> modules;

  AnalysisCanonicalAnalysis({
    required this.forms,
    required this.modules,
  });

  factory AnalysisCanonicalAnalysis.fromJson(Map<String, dynamic> json) {
    return AnalysisCanonicalAnalysis(
      forms: ((json['forms'] as List?) ?? const [])
          .whereType<Map>()
          .map(
            (form) =>
                AnalysisCanonicalForm.fromJson(form.cast<String, dynamic>()),
          )
          .toList(),
      modules: ((json['modules'] as List?) ?? const [])
          .whereType<Map>()
          .map(
            (module) => AnalysisCanonicalModule.fromJson(
              module.cast<String, dynamic>(),
            ),
          )
          .toList(),
    );
  }
}

class AnalysisCanonicalForm {
  final String name;
  final Map<String, dynamic> components;
  final String? rawVbaCode;

  AnalysisCanonicalForm({
    required this.name,
    required this.components,
    required this.rawVbaCode,
  });

  factory AnalysisCanonicalForm.fromJson(Map<String, dynamic> json) {
    return AnalysisCanonicalForm(
      name: json['name'] as String? ?? 'Form',
      components: (json['components'] as Map?)?.cast<String, dynamic>() ??
          const <String, dynamic>{},
      rawVbaCode: json['rawVbaCode'] as String?,
    );
  }
}

class AnalysisCanonicalModule {
  final String name;
  final String rawVbaCode;

  AnalysisCanonicalModule({
    required this.name,
    required this.rawVbaCode,
  });

  factory AnalysisCanonicalModule.fromJson(Map<String, dynamic> json) {
    return AnalysisCanonicalModule(
      name: json['name'] as String? ?? 'Module',
      rawVbaCode: json['rawVbaCode'] as String? ?? '',
    );
  }
}

class AnalysisTable {
  final String name;
  final int rowCount;
  final String? postgresDdl;
  final String? dartClassName;
  final List<AnalysisColumn> columns;
  final List<AnalysisIndex> indexes;
  final List<Map<String, dynamic>> sampleRows;

  AnalysisTable({
    required this.name,
    required this.rowCount,
    required this.postgresDdl,
    required this.dartClassName,
    required this.columns,
    required this.indexes,
    required this.sampleRows,
  });

  factory AnalysisTable.fromJson(Map<String, dynamic> json) {
    return AnalysisTable(
      name: json['name'] as String? ?? 'UnnamedTable',
      rowCount: json['rowCount'] as int? ?? 0,
      postgresDdl: json['postgres_ddl'] as String?,
      dartClassName: json['dart_class_name'] as String?,
      columns: ((json['columns'] as List?) ?? const [])
          .whereType<Map>()
          .map((column) =>
              AnalysisColumn.fromJson(column.cast<String, dynamic>()))
          .toList(),
      indexes: ((json['indexes'] as List?) ?? const [])
          .whereType<Map>()
          .map((index) => AnalysisIndex.fromJson(index.cast<String, dynamic>()))
          .toList(),
      sampleRows: ((json['sampleRows'] as List?) ?? const [])
          .whereType<Map>()
          .map((row) => row.cast<String, dynamic>())
          .toList(),
    );
  }

  String get className => dartClassName ?? toPascalCaseIdentifier(name);

  String get fileName => '${toSnakeCaseIdentifier(name)}.dart';

  String get normalizedName => toSnakeCaseIdentifier(name);

  String get routeFieldName => toCamelCaseIdentifier(name);

  AnalysisIndex? get primaryKey {
    for (final index in indexes) {
      if (index.isPrimaryKey && index.columns.isNotEmpty) {
        return index;
      }
    }
    return null;
  }
}

class AnalysisColumn {
  final String name;
  final String typeName;
  final int typeCode;
  final bool isAutoNumber;
  final bool isCalculated;
  final int? precision;
  final int? scale;

  AnalysisColumn({
    required this.name,
    required this.typeName,
    required this.typeCode,
    required this.isAutoNumber,
    required this.isCalculated,
    required this.precision,
    required this.scale,
  });

  factory AnalysisColumn.fromJson(Map<String, dynamic> json) {
    return AnalysisColumn(
      name: json['name'] as String? ?? 'column',
      typeName: json['typeName'] as String? ?? 'Unknown',
      typeCode: json['typeCode'] as int? ?? -1,
      isAutoNumber: json['isAutoNumber'] as bool? ?? false,
      isCalculated: json['isCalculated'] as bool? ?? false,
      precision: json['precision'] as int?,
      scale: json['scale'] as int?,
    );
  }

  String get fieldName => toCamelCaseIdentifier(name);

  String get jsonKey => name;

  String get normalizedName => toSnakeCaseIdentifier(name);

  String get columnConstantName => '${fieldName}Col';

  String get dartType {
    final normalized = foldToAscii(typeName).toLowerCase();
    switch (normalized) {
      case 'byte':
      case 'int':
      case 'integer':
      case 'long':
      case 'complextype':
        return 'int?';
      case 'double':
      case 'float':
        return 'double?';
      case 'numeric':
      case 'money':
      case 'currency':
        return 'String?';
      case 'yesno':
      case 'boolean':
        return 'bool?';
      case 'datetime':
        return 'DateTime?';
      default:
        return 'String?';
    }
  }
}

class AnalysisIndex {
  final String name;
  final bool isPrimaryKey;
  final List<AnalysisIndexColumn> columns;

  AnalysisIndex({
    required this.name,
    required this.isPrimaryKey,
    required this.columns,
  });

  factory AnalysisIndex.fromJson(Map<String, dynamic> json) {
    return AnalysisIndex(
      name: json['name'] as String? ?? 'index',
      isPrimaryKey: json['isPrimaryKey'] as bool? ?? false,
      columns: ((json['columns'] as List?) ?? const [])
          .whereType<Map>()
          .map((column) =>
              AnalysisIndexColumn.fromJson(column.cast<String, dynamic>()))
          .toList(),
    );
  }
}

class AnalysisIndexColumn {
  final String name;

  AnalysisIndexColumn({required this.name});

  factory AnalysisIndexColumn.fromJson(Map<String, dynamic> json) {
    return AnalysisIndexColumn(name: json['name'] as String? ?? 'column');
  }
}

class AnalysisLinkedTable {
  final String name;

  AnalysisLinkedTable({required this.name});

  factory AnalysisLinkedTable.fromJson(Map<String, dynamic> json) {
    return AnalysisLinkedTable(name: json['name'] as String? ?? 'linked_table');
  }
}

class AnalysisForm {
  final String name;
  final String? caption;
  final String? recordSource;
  final List<AnalysisFormControl> controls;

  AnalysisForm({
    required this.name,
    required this.caption,
    required this.recordSource,
    required this.controls,
  });

  factory AnalysisForm.fromJson(Map<String, dynamic> json) {
    return AnalysisForm(
      name: json['name'] as String? ?? 'Form',
      caption: json['caption'] as String?,
      recordSource: json['recordSource'] as String?,
      controls: ((json['controls'] as List?) ?? const [])
          .whereType<Map>()
          .map((control) =>
              AnalysisFormControl.fromJson(control.cast<String, dynamic>()))
          .toList(),
    );
  }
}

class AnalysisFormControl {
  final String type;
  final String name;
  final String? controlSource;
  final String? caption;

  AnalysisFormControl({
    required this.type,
    required this.name,
    required this.controlSource,
    required this.caption,
  });

  factory AnalysisFormControl.fromJson(Map<String, dynamic> json) {
    return AnalysisFormControl(
      type: json['type'] as String? ?? 'Control',
      name: json['name'] as String? ?? 'control',
      controlSource: json['controlSource'] as String?,
      caption: json['caption'] as String?,
    );
  }
}
