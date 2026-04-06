import 'dart:typed_data';

import 'package:dpgsql/dpgsql.dart';

import 'access_temporal_semantics.dart';
import 'analysis_model.dart';
import 'identifier_utils.dart';
import 'migration_export_mode.dart';
import 'migration_statement_builder.dart';
import 'postgres_connection_options.dart';
import 'postgres_database_ensurer.dart';
import 'postgres_migration_executor.dart';

class DpgsqlMigrationExecutor {
  final PostgresConnectionOptions connectionOptions;

  const DpgsqlMigrationExecutor({required this.connectionOptions});

  Future<PostgresMigrationExecutionResult> execute({
    required AnalysisProject project,
    required MigrationStatementBuilder statementBuilder,
    MigrationExportMode exportMode = MigrationExportMode.schemaAndData,
    Map<String, List<Map<String, dynamic>>>? tableRowsByName,
  }) async {
    await ensurePostgresDatabaseExists(connectionOptions);
    final connection = NpgsqlConnection(
      connectionOptions.toDpgsqlConnectionString(),
    );

    try {
      await connection.open();
    } catch (error, stackTrace) {
      throw PostgresMigrationExecutionException(
        phase: 'connection.open',
        message: 'could not open PostgreSQL connection with dpgsql',
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
    NpgsqlTransaction? transaction;

    try {
      transaction = await connection.beginTransaction();

      for (final statement in statementBuilder.buildPreDataStatements(
        project,
        tableRowsByName: tableRowsByName,
      )) {
        phase = 'pre-data';
        currentTableName = null;
        currentRowIndex = null;
        currentStatement = statement;
        await connection.createCommand(statement).executeNonQuery();
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
          await connection.createCommand(statement).executeNonQuery();
        }

        for (final table in project.tables) {
          currentTableName = table.name;
          final rows = tableRowsByName?[table.name] ?? table.sampleRows;
          if (rows.isEmpty) {
            continue;
          }

          if (statementBuilder.canUseCopySeedForTable(table)) {
            final normalizedRows =
                statementBuilder.normalizedRowsForInsert(table, rows).toList();
            final orderedColumns = statementBuilder.copyColumnNamesForTable(
              table,
              normalizedRows,
            );

            if (normalizedRows.isNotEmpty &&
                orderedColumns.isNotEmpty &&
                _canUseBinaryCopyForTable(
                  table,
                  orderedColumns,
                  rows: normalizedRows,
                )) {
              phase = 'copy';
              currentRowIndex = null;
              currentStatement =
                  'COPY ${statementBuilder.identifierPolicy.quotedTableName(table.name)} '
                  '(${orderedColumns.map(statementBuilder.identifierPolicy.quotedColumnName).join(', ')}) '
                  'FROM STDIN (FORMAT BINARY)';
              final importer = await connection.beginBinaryImport(
                'COPY ${statementBuilder.identifierPolicy.quotedTableName(table.name)} '
                '(${orderedColumns.map(statementBuilder.identifierPolicy.quotedColumnName).join(', ')}) '
                'FROM STDIN (FORMAT BINARY)',
              );

              try {
                for (var rowIndex = 0;
                    rowIndex < normalizedRows.length;
                    rowIndex++) {
                  currentRowIndex = rowIndex;
                  final row = normalizedRows[rowIndex];
                  await importer.startRow(orderedColumns.length);
                  for (final columnName in orderedColumns) {
                    final column = table.columns.firstWhere(
                      (candidate) => candidate.name == columnName,
                    );
                    final value = _coerceBinaryCopyValue(
                      column,
                      statementBuilder.normalizeValueForPostgres(
                        row[columnName],
                      ),
                    );
                    if (value == null) {
                      await importer.writeNull();
                    } else {
                      await importer.write(value);
                    }
                  }
                  rowsInserted++;
                }
                await importer.complete();
                continue;
              } catch (_) {
                await importer.close();
                rethrow;
              }
            }
          }

          var rowIndex = 0;
          for (final insertSql in statementBuilder.buildInsertStatements(
            table,
            rows,
          )) {
            phase = 'insert';
            currentRowIndex = rowIndex;
            currentStatement = insertSql;
            await connection.createCommand(insertSql).executeNonQuery();
            rowsInserted++;
            rowIndex++;
          }
        }
      }

      for (final statement in statementBuilder.buildPostDataStatements(
        project,
        tableRowsByName: tableRowsByName,
      )) {
        currentTableName = null;
        currentRowIndex = null;
        phase = 'post-data';
        currentStatement = statement;
        await connection.createCommand(statement).executeNonQuery();
        if (statement.startsWith('ALTER TABLE ')) {
          foreignKeysCreated++;
        } else if (statement.startsWith('CREATE INDEX ') ||
            statement.startsWith('CREATE UNIQUE INDEX ')) {
          indexesCreated++;
        }
      }

      phase = 'commit';
      currentStatement = 'COMMIT';
      await transaction.commit();

      return PostgresMigrationExecutionResult(
        tablesCreated: tablesCreated,
        foreignKeysCreated: foreignKeysCreated,
        indexesCreated: indexesCreated,
        rowsInserted: rowsInserted,
      );
    } catch (error, stackTrace) {
      if (transaction != null) {
        try {
          await transaction.rollback();
        } catch (_) {}
      }
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

  bool _canUseBinaryCopyForTable(
    AnalysisTable table,
    List<String> orderedColumns,
    {
    Iterable<Map<String, dynamic>>? rows,
  }
  ) {
    final unsafeTypes = <String>{
      'numeric',
      'money',
      'currency',
      'smallmoney',
      'uniqueidentifier',
      'guid',
    };
    for (final columnName in orderedColumns) {
      final column = table.columns.firstWhere(
        (candidate) => candidate.name == columnName,
      );
      final normalizedType = foldToAscii(column.typeName).toLowerCase();
      if (unsafeTypes.contains(normalizedType)) {
        return false;
      }
      if ((normalizedType == 'datetime' ||
              normalizedType == 'date' ||
              normalizedType == 'time') &&
          inferAccessTemporalSemanticWithRows(column, rows: rows) !=
              AccessTemporalSemantic.timestamp) {
        return false;
      }
    }
    return true;
  }

  Object? _coerceBinaryCopyValue(AnalysisColumn column, Object? value) {
    if (value == null) {
      return null;
    }

    final normalizedType = foldToAscii(column.typeName).toLowerCase();
    switch (normalizedType) {
      case 'byte':
      case 'int':
      case 'integer':
      case 'long':
      case 'complextype':
        if (value is int) {
          return value;
        }
        if (value is num) {
          return value.toInt();
        }
        return int.tryParse(value.toString());
      case 'double':
      case 'float':
        if (value is double) {
          return value;
        }
        if (value is num) {
          return value.toDouble();
        }
        return double.tryParse(value.toString());
      case 'yesno':
      case 'boolean':
      case 'bit':
        if (value is bool) {
          return value;
        }
        if (value is num) {
          return value != 0;
        }
        final text = value.toString().trim().toLowerCase();
        return text == 'true' || text == 't' || text == '1';
      case 'datetime':
      case 'date':
      case 'time':
        if (value is DateTime) {
          return value.toUtc();
        }
        return DateTime.tryParse(value.toString())?.toUtc();
      case 'binary':
      case 'longbinary':
      case 'ole':
        if (value is Uint8List) {
          return value;
        }
        if (value is List<int>) {
          return Uint8List.fromList(value);
        }
        return null;
      default:
        return value;
    }
  }
}
