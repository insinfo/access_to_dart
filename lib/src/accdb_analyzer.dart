import 'package:jackcess_dart/jackcess_dart.dart';

/// Produces a rich analysis JSON from an [AccessDatabaseModel].
class AccdbAnalyzer {
  final AccessDatabaseModel model;

  AccdbAnalyzer({required this.model});

  Future<Map<String, dynamic>> analyze() async {
    return {
      'schema_version': '1.0',
      'source': model.path,
      'format': model.formatName,
      'summary': {
        'tables': model.tables.length,
        'linkedTables': model.linkedTables.length,
        'queries': model.queries.length,
        'forms': model.forms.length,
        'reports': model.reports.length,
        'macros': model.macros.length,
        'modules': model.modules.length,
      },
      'tables': model.tables.map((t) => _analyzeTable(t)).toList(),
      'linkedTables': model.linkedTables.map((t) => t.toJson()).toList(),
      'queries': model.queries.map((q) => q.toJson()).toList(),
      'forms': model.forms.map((f) => f.toJson()).toList(),
      'reports': model.reports.map((r) => r.toJson()).toList(),
      'macros': model.macros.map((m) => m.toJson()).toList(),
      'modules': model.modules.map((m) => m.toJson()).toList(),
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
      final pgType = AccessColumnSchema.typeCodeToPostgres(c.typeCode, c.length);
      final notNull = c.columnNumber == 0 ? ' NOT NULL' : '';
      final autoInc = c.isAutoNumber ? ' GENERATED ALWAYS AS IDENTITY' : '';
      lines.add('  "${_toSnakeCase(c.name)}" $pgType$notNull$autoInc');
    }
    sb.write(lines.join(',\n'));
    sb.writeln('\n);');
    return sb.toString();
  }

  String _toDartClassName(String name) {
    // PascalCase
    return name.replaceAll(RegExp(r'[^a-zA-ZÀ-ÿ0-9]'), '_').split('_').map((p) {
      if (p.isEmpty) return '';
      return p[0].toUpperCase() + p.substring(1);
    }).join();
  }

  String _toSnakeCase(String name) {
    return name
        .replaceAll(RegExp(r'[^\w]'), '_')
        .replaceAllMapped(RegExp(r'([A-Z])'), (m) => '_${m[0]!.toLowerCase()}')
        .replaceAll(RegExp(r'_+'), '_')
        .toLowerCase()
        .replaceAll(RegExp(r'^_|_$'), '');
  }
}
