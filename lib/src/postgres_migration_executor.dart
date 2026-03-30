import 'package:postgres/postgres.dart';

import 'analysis_model.dart';
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
    Connection? connection;
    try {
      connection = await Connection.open(
        connectionOptions.toEndpoint(),
        settings: connectionOptions.toSettings(),
      );
    } catch (error, stackTrace) {
      throw PostgresMigrationExecutionException(
        phase: 'connection.open',
        message: 'could not open PostgreSQL connection',
        cause: error,
        stackTrace: stackTrace,
      );
    }

    var tablesCreated = 0;
    var foreignKeysCreated = 0;
    var indexesCreated = 0;
    var rowsInserted = 0;
    var phase = 'transaction';
    String? currentTableName;
    int? currentRowIndex;
    String? currentStatement;

    try {
      await connection.runTx((session) async {
        for (final statement
            in statementBuilder.buildPreDataStatements(project)) {
          phase = 'pre-data';
          currentTableName = null;
          currentRowIndex = null;
          currentStatement = statement;
          await session.execute(Sql(statement));
          if (statement.startsWith('CREATE TABLE ')) {
            tablesCreated++;
          }
        }

        if (exportMode.includesData) {
          for (final statement in statementBuilder.buildPreInsertStatements(
            project,
            tableRowsByName: tableRowsByName,
          )) {
            phase = 'pre-insert';
            currentTableName = null;
            currentRowIndex = null;
            currentStatement = statement;
            await session.execute(Sql(statement));
          }

          for (final table in project.tables) {
            currentTableName = table.name;
            final rows = tableRowsByName?[table.name] ?? table.sampleRows;
            var rowIndex = 0;
            for (final insertSql
                in statementBuilder.buildInsertStatements(table, rows)) {
              phase = 'insert';
              currentRowIndex = rowIndex;
              currentStatement = insertSql;
              await session.execute(Sql(insertSql));
              rowsInserted++;
              rowIndex++;
            }
          }
        }

        for (final statement
            in statementBuilder.buildPostDataStatements(project)) {
          currentTableName = null;
          currentRowIndex = null;
          phase = 'post-data';
          currentStatement = statement;
          await session.execute(Sql(statement));
          if (statement.startsWith('ALTER TABLE ')) {
            foreignKeysCreated++;
          } else if (statement.startsWith('CREATE INDEX ') ||
              statement.startsWith('CREATE UNIQUE INDEX ')) {
            indexesCreated++;
          }
        }
      });

      return PostgresMigrationExecutionResult(
        tablesCreated: tablesCreated,
        foreignKeysCreated: foreignKeysCreated,
        indexesCreated: indexesCreated,
        rowsInserted: rowsInserted,
      );
    } catch (error, stackTrace) {
      throw PostgresMigrationExecutionException(
        phase: phase,
        message: 'database operation failed',
        cause: error,
        stackTrace: stackTrace,
        tableName: currentTableName,
        rowIndex: currentRowIndex,
        statementPreview: _statementPreview(currentStatement),
      );
    } finally {
      await connection.close();
    }
  }

  String? _statementPreview(String? statement) {
    if (statement == null) {
      return null;
    }
    final compact = statement.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (compact.length <= 240) {
      return compact;
    }
    return '${compact.substring(0, 240)}...';
  }
}
