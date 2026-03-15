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

    final reconciliation = project.queryReconciliation;
    if (reconciliation != null) {
      final summary =
          (reconciliation['summary'] as Map?)?.cast<String, dynamic>() ??
              const {};
      final mismatched = summary['mismatched'] as int? ?? 0;
      final missingInBinary = summary['missingInBinary'] as int? ?? 0;
      final missingInSource = summary['missingInSource'] as int? ?? 0;

      if (mismatched > 0) {
        issues.add(
          DoctorIssue(
            severity: 'warning',
            code: 'query.mismatch',
            message:
                'Ainda existem $mismatched queries em mismatch na reconciliacao binario vs .src.',
          ),
        );
      }
      if (missingInBinary > 0 || missingInSource > 0) {
        issues.add(
          DoctorIssue(
            severity: 'info',
            code: 'query.coverage_gap',
            message:
                'Persistem gaps de cobertura na reconciliacao: missingInBinary=$missingInBinary, missingInSource=$missingInSource.',
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
