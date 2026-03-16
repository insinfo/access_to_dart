import 'package:postgres/postgres.dart';

import 'analysis_model.dart';
import 'migration_statement_builder.dart';
import 'postgres_connection_options.dart';

class PostgresMigrationExecutionResult {
  final int tablesCreated;
  final int rowsInserted;

  const PostgresMigrationExecutionResult({
    required this.tablesCreated,
    required this.rowsInserted,
  });
}

class PostgresMigrationExecutor {
  final PostgresConnectionOptions connectionOptions;

  const PostgresMigrationExecutor({required this.connectionOptions});

  Future<PostgresMigrationExecutionResult> execute({
    required AnalysisProject project,
    required MigrationStatementBuilder statementBuilder,
    Map<String, List<Map<String, dynamic>>>? tableRowsByName,
  }) async {
    final connection = await Connection.open(
      connectionOptions.toEndpoint(),
      settings: connectionOptions.toSettings(),
    );

    var tablesCreated = 0;
    var rowsInserted = 0;

    try {
      await connection.execute(Sql('BEGIN'));

      for (final table in project.tables) {
        final createTableSql = statementBuilder.buildCreateTableStatement(table);
        await connection.execute(Sql(createTableSql));
        tablesCreated++;

        final rows = tableRowsByName?[table.name] ?? table.sampleRows;
        for (final insertSql in statementBuilder.buildInsertStatements(table, rows)) {
          await connection.execute(Sql(insertSql));
          rowsInserted++;
        }
      }

      await connection.execute(Sql('COMMIT'));

      return PostgresMigrationExecutionResult(
        tablesCreated: tablesCreated,
        rowsInserted: rowsInserted,
      );
    } catch (_) {
      try {
        await connection.execute(Sql('ROLLBACK'));
      } catch (_) {}
      rethrow;
    } finally {
      await connection.close();
    }
  }
}