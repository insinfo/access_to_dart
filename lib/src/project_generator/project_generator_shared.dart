part of 'project_generator.dart';

extension _ProjectGeneratorShared on ProjectGenerator {
  Future<void> _writeReport(AnalysisProject project, Directory root) async {
    final inventory = await _writeAccessReportInventory(project, root);
    final exportedForms = <String, Map>{
      for (final form in (((project.raw['source_overlay'] as Map?)?['forms'] as List?) ?? const []).whereType<Map>())
        form['name'].toString().toLowerCase(): form,
    };
    final formCapabilities = ((project.raw['forms'] as List?) ?? const [])
        .whereType<Map>().map((form) => describeAccessFormCapabilities(
          <String,dynamic>{...form,
            if (exportedForms.containsKey(form['name']?.toString().toLowerCase()))
              'properties': exportedForms[form['name']?.toString().toLowerCase()]!['properties'],
          },
          hasSourceExport: exportedForms.containsKey(form['name']?.toString().toLowerCase()),
        )).toList();
    await File('${root.path}${Platform.pathSeparator}access-form-capabilities.json')
        .writeAsString(const JsonEncoder.withIndent('  ').convert({
          'schema_version':'1.0',
          'scope':'per_form_source_permissions_not_table_authorization',
          'forms':formCapabilities,
        }));
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
    buffer.writeln('- Capacidades por formulário: [access-form-capabilities.json](access-form-capabilities.json). Permissões da fonte não habilitam gravação automaticamente.');
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
    buffer.writeln(
      '- Inventário completo: [access-reports.json](access-reports.json).',
    );
    buffer.writeln(
      '- Reports principais: `${(inventory['reports'] as List).length}`; '
      'overlay: `${(inventory['source_overlay_reports'] as List).length}`; '
      'canônicos: `${(inventory['canonical_reports'] as List).length}`.',
    );
    final reportSummary = inventory['summary'] as Map<String, Object?>;
    for (final entry in const {
      'sections': 'Seções',
      'controls': 'Controles',
      'groupLevels': 'Níveis de agrupamento',
    }.entries) {
      final counts = reportSummary[entry.key] as Map<String, int>;
      if (counts['available_reports'] == 0) {
        buffer.writeln(
            '- ${entry.value}: não informados nos reports principais.');
      } else {
        buffer.writeln(
          '- ${entry.value}: `${counts['total']}` em '
          '`${counts['available_reports']}` reports com esse metadado.',
        );
      }
    }
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
    }
    buffer.writeln();
    buffer.writeln(
      '> Este artefato preserva o inventário e os metadados disponíveis; não gera um renderer de reports, layout paginado ou PDF. Campos ausentes não significam ausência de seções, controles ou agrupamentos.',
    );
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

  Future<Map<String, Object?>> _writeAccessReportInventory(
    AnalysisProject project,
    Directory root,
  ) async {
    // Preserve os objetos completos, inclusive propriedades ainda não tipadas.
    // As fontes ficam separadas para não duplicar controles nas contagens.
    final reports = (project.raw['reports'] as List?) ?? const [];
    final overlayReports =
        ((project.raw['source_overlay'] as Map?)?['reports'] as List?) ??
            const [];
    final canonicalReports =
        ((project.raw['canonical_analysis'] as Map?)?['reports'] as List?) ??
            const [];
    final summary = <String, Object?>{};
    for (final key in ['sections', 'controls', 'groupLevels']) {
      var available = 0;
      var total = 0;
      for (final report in reports.whereType<Map>()) {
        final entries = report[key];
        if (entries is List) {
          available++;
          total += entries.length;
        }
      }
      summary[key] = <String, int>{
        'available_reports': available,
        'total': total,
      };
    }
    final inventory = <String, Object?>{
      'schema_version': '1.0',
      'artifact': 'access_report_inventory',
      'analysis_schema_version': project.schemaVersion,
      'source': project.source,
      'status': 'inventory_only',
      'renderer_generated': false,
      'reports': reports,
      'source_overlay_reports': overlayReports,
      'canonical_reports': canonicalReports,
      'summary': summary,
    };
    await File('${root.path}${Platform.pathSeparator}access-reports.json')
        .writeAsString(const JsonEncoder.withIndent('  ').convert(inventory));
    return inventory;
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

  String _fromMapValue(
    AnalysisColumn column, {
    Iterable<Map<String, dynamic>>? rows,
  }) {
    final mapAccess = "map[${column.columnConstantName}]";
    final dartType = column.dartType;
    if (dartType == 'int?') return '$mapAccess as int?';
    if (dartType == 'double?') return '($mapAccess as num?)?.toDouble()';
    if (dartType == 'bool?') return '$mapAccess as bool?';
    if (dartType == 'DateTime?') {
      final semantic = switch (
        inferAccessTemporalSemanticWithRows(column, rows: rows)
      ) {
        AccessTemporalSemantic.dateOnly => 'date',
        AccessTemporalSemantic.timeOnly => 'time',
        _ => 'timestamp',
      };
      return "_accessParseTemporalValue($mapAccess, semantic: '$semantic')";
    }
    return '$mapAccess as String?';
  }

  String _toMapValue(
    AnalysisColumn column, {
    Iterable<Map<String, dynamic>>? rows,
  }) {
    final fieldAccess = column.fieldName;
    final dartType = column.dartType;
    if (dartType == 'DateTime?') {
      final semantic = switch (
        inferAccessTemporalStorageSemantic(column)
      ) {
        AccessTemporalSemantic.dateOnly => 'date',
        AccessTemporalSemantic.timeOnly => 'time',
        _ => 'timestamp',
      };
      return "_accessFormatTemporalValue($fieldAccess, semantic: '$semantic')";
    }
    return fieldAccess;
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
