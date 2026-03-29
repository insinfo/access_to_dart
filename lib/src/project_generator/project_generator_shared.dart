part of 'project_generator.dart';

extension _ProjectGeneratorShared on ProjectGenerator {
  Future<void> _writeReport(AnalysisProject project, Directory root) async {
    final doctorReport = AnalysisDoctor().inspect(project);
    final summary = doctorReport.summary;
    final reconciliationSummary =
        (project.queryReconciliation?['summary'] as Map?)
                ?.cast<String, dynamic>() ??
            const {};
    final buffer = StringBuffer();
    buffer.writeln('# Conversion Report');
    buffer.writeln();
    buffer.writeln('## Readiness');
    buffer.writeln();
    buffer.writeln('- Level: `${doctorReport.readinessLevel}`');
    buffer.writeln(
      '- Profile: `${project.tables.isEmpty && project.linkedTables.isNotEmpty ? 'frontend_access_com_backend_externo' : 'analysis_com_tabelas_locais'}`',
    );
    buffer.writeln();
    buffer.writeln('## Inventory');
    buffer.writeln();
    buffer.writeln('- Source: `${project.source}`');
    buffer.writeln('- Format: `${project.format}`');
    buffer.writeln('- Tables: `${project.tables.length}`');
    buffer.writeln('- Linked tables: `${project.linkedTables.length}`');
    buffer.writeln('- Forms: `${project.forms.length}`');
    buffer.writeln('- Reports: `${project.reportCatalogNames.length}`');
    buffer.writeln('- Doctor errors: `${summary['error']}`');
    buffer.writeln('- Doctor warnings: `${summary['warning']}`');
    buffer.writeln('- Doctor info: `${summary['info']}`');
    if (reconciliationSummary.isNotEmpty) {
      buffer.writeln(
        '- Query mismatches: `${reconciliationSummary['mismatched'] ?? 0}`',
      );
      buffer.writeln(
        '- Query missingInBinary: `${reconciliationSummary['missingInBinary'] ?? 0}`',
      );
      buffer.writeln(
        '- Query missingInSource: `${reconciliationSummary['missingInSource'] ?? 0}`',
      );
    }
    buffer.writeln();
    buffer.writeln('## Report Inventory');
    buffer.writeln();
    if (project.reportCatalogNames.isEmpty) {
      buffer.writeln('- Nenhum report catalogado no analysis atual.');
    } else {
      for (final reportName in project.reportCatalogNames.take(25)) {
        buffer.writeln('- `$reportName`');
      }
      if (project.reportCatalogNames.length > 25) {
        buffer.writeln(
          '- ... e mais `${project.reportCatalogNames.length - 25}` reports no catalogo.',
        );
      }
      buffer.writeln();
      buffer.writeln(
        '> Observacao: a trilha de reports foi aberta com inventario de catalogo. A extração estruturada de controles e secoes ainda precisa ser promovida para o modelo tipado.',
      );
    }
    buffer.writeln();
    buffer.writeln('## Findings');
    buffer.writeln();
    for (final issue in doctorReport.issues) {
      buffer.writeln('- `${issue.severity}` `${issue.code}` ${issue.message}');
    }
    buffer.writeln();
    buffer.writeln('## Next Steps');
    buffer.writeln();
    for (final step in _recommendedNextSteps(project, doctorReport)) {
      buffer.writeln('- $step');
    }
    await File('${root.path}${Platform.pathSeparator}conversion-report.md')
        .writeAsString(buffer.toString());
  }

  List<String> _recommendedNextSteps(
    AnalysisProject project,
    DoctorReport doctorReport,
  ) {
    final steps = <String>[];
    final issueCodes = doctorReport.issues.map((issue) => issue.code).toSet();

    if (issueCodes.contains('analysis.linked_only')) {
      steps.add(
        'Gerar tambem o analysis do backend .accdb vinculado para materializar DDL, relacionamentos e reposit\u00f3rios reais no backend gerado.',
      );
    }
    if (issueCodes.contains('forms.catalog_only')) {
      steps.add(
        'Expandir a decodificacao binaria de forms e reports para gerar telas AngularDart mais proximas da UI original do Access.',
      );
    }
    if (issueCodes.contains('query.coverage_gap')) {
      steps.add(
        'Revisar queries ausentes no binario ou no overlay para decidir se elas devem virar codigo gerado, views SQL ou apenas artefatos de auditoria.',
      );
    }
    if (project.tables.isNotEmpty) {
      steps.add(
        'Validar o projeto gerado contra PostgreSQL real, substituindo fallback estatico por reposit\u00f3rios conectados e smoke tests end-to-end.',
      );
    } else {
      steps.add(
        'Usar este scaffold como frontend e integra\u00e7\u00e3o, alimentando o backend gerado com o analysis do banco vinculado real.',
      );
    }

    if (steps.isEmpty) {
      steps.add(
        'Executar smoke tests do backend e frontend gerados para validar build, migra\u00e7\u00f5es e rotas REST em ambiente real.',
      );
    }

    return steps;
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
