import 'analysis_model.dart';
import 'dpgsql_migration_executor.dart';
import 'migration_export_mode.dart';
import 'migration_statement_builder.dart';
import 'postgres_connection_options.dart';

class PostgresMigrationExecutionException implements Exception {
  final String phase;
  final String message;
  final Object cause;
  final StackTrace stackTrace;
  final String? tableName;
  final int? rowIndex;
  final String? statementPreview;

  const PostgresMigrationExecutionException({
    required this.phase,
    required this.message,
    required this.cause,
    required this.stackTrace,
    this.tableName,
    this.rowIndex,
    this.statementPreview,
  });

  @override
  String toString() {
    final buffer = StringBuffer(
      'PostgreSQL migration failed during $phase: $message',
    );
    if (tableName != null && tableName!.isNotEmpty) {
      buffer.write(' [table=$tableName');
      if (rowIndex != null) {
        buffer.write(', rowIndex=$rowIndex');
      }
      buffer.write(']');
    }
    if (statementPreview != null && statementPreview!.isNotEmpty) {
      buffer.write('\nStatement preview: $statementPreview');
    }
    buffer.write('\nCause: $cause');
    return buffer.toString();
  }
}

class PostgresMigrationExecutionResult {
  final int tablesCreated;
  final int foreignKeysCreated;
  final int indexesCreated;
  final int rowsInserted;

  const PostgresMigrationExecutionResult({
    required this.tablesCreated,
    required this.foreignKeysCreated,
    required this.indexesCreated,
    required this.rowsInserted,
  });
}

class PostgresMigrationExecutor {
  final PostgresConnectionOptions connectionOptions;

  const PostgresMigrationExecutor({required this.connectionOptions});

  Future<PostgresMigrationExecutionResult> execute({
    required AnalysisProject project,
    required MigrationStatementBuilder statementBuilder,
    MigrationExportMode exportMode = MigrationExportMode.schemaAndData,
    Map<String, List<Map<String, dynamic>>>? tableRowsByName,
  }) async {
    return DpgsqlMigrationExecutor(connectionOptions: connectionOptions).execute(
      project: project,
      statementBuilder: statementBuilder,
      exportMode: exportMode,
      tableRowsByName: tableRowsByName,
    );
  }
}
