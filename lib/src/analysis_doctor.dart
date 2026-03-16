import 'analysis_model.dart';

class DoctorIssue {
  final String severity;
  final String code;
  final String message;

  DoctorIssue({
    required this.severity,
    required this.code,
    required this.message,
  });
}

class DoctorReport {
  final List<DoctorIssue> issues;

  DoctorReport(this.issues);

  bool get hasErrors => issues.any((issue) => issue.severity == 'error');

  String get readinessLevel {
    if (hasErrors) {
      return 'blocked';
    }
    if (issues.any((issue) => issue.severity == 'warning')) {
      return 'partial';
    }
    return 'ready';
  }

  Map<String, int> get summary {
    final result = <String, int>{'error': 0, 'warning': 0, 'info': 0};
    for (final issue in issues) {
      result[issue.severity] = (result[issue.severity] ?? 0) + 1;
    }
    return result;
  }
}

class AnalysisDoctor {
  DoctorReport inspect(AnalysisProject project) {
    final issues = <DoctorIssue>[];
  final reconciliation = project.queryReconciliation;
  final reconciliationSummary =
    (reconciliation?['summary'] as Map?)?.cast<String, dynamic>() ??
      const {};
  final mismatched = reconciliationSummary['mismatched'] as int? ?? 0;
  final missingInBinary =
    reconciliationSummary['missingInBinary'] as int? ?? 0;
  final missingInSource =
    reconciliationSummary['missingInSource'] as int? ?? 0;
  final matchedNormalized =
    reconciliationSummary['matchedNormalized'] as int? ?? 0;
  final matchedRelaxed =
    reconciliationSummary['matchedRelaxed'] as int? ?? 0;
  final matchedStructural =
    reconciliationSummary['matchedStructural'] as int? ?? 0;
  final matchedOrderEquivalent =
    reconciliationSummary['matchedOrderEquivalent'] as int? ?? 0;
  final matchedJoinGraph =
    reconciliationSummary['matchedJoinGraph'] as int? ?? 0;
  final matchedSetOperation =
    reconciliationSummary['matchedSetOperation'] as int? ?? 0;

    if (project.tables.isEmpty && project.linkedTables.isEmpty) {
      issues.add(
        DoctorIssue(
          severity: 'error',
          code: 'analysis.empty',
          message:
              'Nenhuma tabela local ou vinculada foi encontrada no analysis.json.',
        ),
      );
    }

    if (project.tables.isEmpty && project.linkedTables.isNotEmpty) {
      issues.add(
        DoctorIssue(
          severity: 'warning',
          code: 'analysis.linked_only',
          message:
              'A base parece ser frontend Access com tabelas vinculadas; para gerar backend rico, analise tambem o backend .accdb.',
        ),
      );
    }

    if (project.tables.isNotEmpty && project.linkedTables.isNotEmpty) {
      issues.add(
        DoctorIssue(
          severity: 'info',
          code: 'analysis.hybrid_topology',
          message:
              'A base mistura tabelas locais e vinculadas; valide a fronteira entre frontend Access e backend antes de gerar o projeto final.',
        ),
      );
    }

    for (final table in project.tables) {
      if (table.columns.isEmpty) {
        issues.add(
          DoctorIssue(
            severity: 'error',
            code: 'table.no_columns',
            message:
                'Tabela ${table.name} nao possui colunas no analysis.json.',
          ),
        );
      }

      if (table.primaryKey == null) {
        issues.add(
          DoctorIssue(
            severity: 'warning',
            code: 'table.no_primary_key',
            message:
                'Tabela ${table.name} nao possui chave primaria detectada.',
          ),
        );
      }

      if (table.sampleRows.isEmpty) {
        issues.add(
          DoctorIssue(
            severity: 'info',
            code: 'table.no_sample_rows',
            message:
                'Tabela ${table.name} nao possui sampleRows para scaffolding de preview.',
          ),
        );
      }
    }

    if (reconciliation != null) {
      if (mismatched > 0) {
        issues.add(
          DoctorIssue(
            severity: 'warning',
            code: 'query.mismatch',
            message:
                'Ainda existem $mismatched queries em mismatch na reconciliacao binario vs .src.',
          ),
        );
      } else {
        issues.add(
          DoctorIssue(
            severity: 'info',
            code: 'query.reconciliation_clean',
            message:
                'A reconciliacao binario vs .src nao possui mismatches nas queries cobertas.',
          ),
        );
      }

      if (missingInBinary > 0 || missingInSource > 0) {
        issues.add(
          DoctorIssue(
            severity:
                (missingInBinary + missingInSource) >= 20 ? 'warning' : 'info',
            code: 'query.coverage_gap',
            message:
                'Persistem gaps de cobertura na reconciliacao: missingInBinary=$missingInBinary, missingInSource=$missingInSource.',
          ),
        );
      }

      final matchedTotal = matchedNormalized +
          matchedRelaxed +
          matchedStructural +
          matchedOrderEquivalent +
          matchedJoinGraph +
          matchedSetOperation;
      if (matchedTotal > 0) {
        issues.add(
          DoctorIssue(
            severity: 'info',
            code: 'query.coverage_summary',
            message:
                'Queries reconciliadas por tier: normalized=$matchedNormalized, relaxed=$matchedRelaxed, structural=$matchedStructural, order=$matchedOrderEquivalent, join=$matchedJoinGraph, setop=$matchedSetOperation.',
          ),
        );
      }
    }

    if (project.forms.isEmpty) {
      issues.add(
        DoctorIssue(
          severity: 'info',
          code: 'forms.none',
          message:
              'Nenhum form foi decodificado; o frontend sera gerado a partir das tabelas.',
        ),
      );
      } else if (project.forms.every(
        (form) =>
            (form.recordSource == null || form.recordSource!.trim().isEmpty) &&
            form.controls.isEmpty,
      )) {
        issues.add(
          DoctorIssue(
            severity: 'warning',
            code: 'forms.catalog_only',
            message:
                'Os forms foram detectados no catalogo, mas ainda sem estrutura util suficiente para gerar telas proximas da UI original.',
          ),
        );
    }

      if (project.tables.isNotEmpty &&
          project.tables.every((table) => table.sampleRows.isEmpty)) {
        issues.add(
          DoctorIssue(
            severity: 'info',
            code: 'analysis.no_preview_data',
            message:
                'Nenhuma tabela local possui sampleRows; o scaffold sera gerado sem dados de preview para telas e testes de smoke.',
          ),
        );
      }

    if (issues.isEmpty) {
      issues.add(
        DoctorIssue(
          severity: 'info',
          code: 'analysis.ok',
          message: 'Nenhum problema estrutural relevante foi detectado.',
        ),
      );
    }

    return DoctorReport(issues);
  }
}
