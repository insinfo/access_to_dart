part of 'project_generator.dart';

extension _ProjectGeneratorShared on ProjectGenerator {
  Future<void> _writeReport(AnalysisProject project, Directory root) async {
    final doctorReport = AnalysisDoctor().inspect(project);
    final summary = doctorReport.summary;
    final buffer = StringBuffer();
    buffer.writeln('# Conversion Report');
    buffer.writeln();
    buffer.writeln('- Source: `${project.source}`');
    buffer.writeln('- Format: `${project.format}`');
    buffer.writeln('- Tables: `${project.tables.length}`');
    buffer.writeln('- Linked tables: `${project.linkedTables.length}`');
    buffer.writeln('- Forms: `${project.forms.length}`');
    buffer.writeln('- Doctor errors: `${summary['error']}`');
    buffer.writeln('- Doctor warnings: `${summary['warning']}`');
    buffer.writeln();
    for (final issue in doctorReport.issues) {
      buffer.writeln('- `${issue.severity}` `${issue.code}` ${issue.message}');
    }
    await File('${root.path}${Platform.pathSeparator}conversion-report.md')
        .writeAsString(buffer.toString());
  }

  String _fromMapValue(AnalysisColumn column) {
    final mapAccess = "map[${column.columnConstantName}]";
    final dartType = column.dartType;
    if (dartType == 'int?') return '$mapAccess as int?';
    if (dartType == 'double?') return '($mapAccess as num?)?.toDouble()';
    if (dartType == 'bool?') return '$mapAccess as bool?';
    if (dartType == 'DateTime?') return '$mapAccess as DateTime?';
    return '$mapAccess as String?';
  }

  String _idWriteBackBlock(AnalysisTable table) {
    final primaryKey = table.primaryKey;
    if (primaryKey == null || primaryKey.columns.length != 1) {
      return '';
    }
    final primaryColumnName = primaryKey.columns.first.name;
    AnalysisColumn? column;
    for (final candidate in table.columns) {
      if (candidate.name == primaryColumnName) {
        column = candidate;
        break;
      }
    }
    if (column == null) return '';
    return '''
    if (${column.fieldName} != null) {
      map[${column.columnConstantName}] = ${column.fieldName};
    }
''';
  }
}
