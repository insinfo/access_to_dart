import 'package:jackcess_dart/jackcess_dart.dart';

import 'identifier_utils.dart';
import 'access_analysis/access_analysis.dart';

/// Produces a rich analysis JSON from an [AccessDatabaseModel] and [AccessDatabase].
class AccdbAnalyzer {
  final AccessDatabaseModel model;
  final AccessDatabase? db;

  AccdbAnalyzer({required this.model, this.db});

  Future<Map<String, dynamic>> analyze() async {
    final canonicalAnalysis = AccessAnalysis();
    if (db != null) {
      await canonicalAnalysis.extractFromDatabase(db!);
    }

    return {
      'schema_version': '1.0',
      'source': model.path,
      'format': model.formatName,
      'summary': {
        'tables': model.tables.length,
        'linkedTables': model.linkedTables.length,
        'relationships': model.relationships.length,
        'queries': model.queries.length,
        'forms': model.forms.length,
        'reports': model.reports.length,
        'macros': model.macros.length,
        'modules': model.modules.length,
      },
      'tables': model.tables.map((t) => _analyzeTable(t)).toList(),
      'linkedTables': model.linkedTables.map((t) => t.toJson()).toList(),       
      'relationships': model.relationships.map((r) => r.toJson()).toList(),     
      'queries': model.queries.map((q) => q.toJson()).toList(),
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
    final sb = StringBuffer();
    sb.writeln('CREATE TABLE "${_toSnakeCase(t.name)}" (');
    final lines = <String>[];
    for (final c in t.columns) {
      final pgType = AccessColumnSchema.typeCodeToPostgres(
        c.typeCode,
        c.length,
        precision: c.precision,
        scale: c.scale,
      );
      final notNull = c.columnNumber == 0 ? ' NOT NULL' : '';
      final autoInc = c.isAutoNumber ? ' GENERATED ALWAYS AS IDENTITY' : '';
      lines.add('  "${_toSnakeCase(c.name)}" $pgType$notNull$autoInc');
    }
    final primaryKey = t.indexes.where((index) => index.isPrimaryKey).isEmpty
        ? null
        : t.indexes.firstWhere((index) => index.isPrimaryKey);
    if (primaryKey != null && primaryKey.columns.isNotEmpty) {
      final keyColumns = primaryKey.columns
          .map((column) => '"${_toSnakeCase(column.name)}"')
          .join(', ');
      lines.add('  PRIMARY KEY ($keyColumns)');
    }
    sb.write(lines.join(',\n'));
    sb.writeln('\n);');
    return sb.toString();
  }

  String _toDartClassName(String name) {
    return toPascalCaseIdentifier(name);
  }

  String _toSnakeCase(String name) {
    return toSnakeCaseIdentifier(name);
  }
}
