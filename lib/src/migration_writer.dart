import 'dart:convert';
import 'dart:io';

import 'analysis_model.dart';
import 'migration_identifier_style.dart';
import 'migration_statement_builder.dart';

class MigrationArtifacts {
  final File schemaFile;
  final File seedFile;
  final File manifestFile;

  MigrationArtifacts({
    required this.schemaFile,
    required this.seedFile,
    required this.manifestFile,
  });
}

class MigrationWriter {
  Future<MigrationArtifacts> write({
    required AnalysisProject project,
    required String outputDirectory,
    String? connectionString,
    MigrationIdentifierStyle identifierStyle =
        MigrationIdentifierStyle.snakeAscii,
    Map<String, List<Map<String, dynamic>>>? tableRowsByName,
  }) async {
    final directory = Directory(outputDirectory);
    await directory.create(recursive: true);

    final statementBuilder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(style: identifierStyle),
    );

    final schemaFile = File(
      '${directory.path}${Platform.pathSeparator}schema.sql',
    );
    final seedFile = File(
      '${directory.path}${Platform.pathSeparator}seed.sql',
    );
    final manifestFile = File(
      '${directory.path}${Platform.pathSeparator}migration_manifest.json',
    );

    await schemaFile.writeAsString(statementBuilder.buildSchema(project));
    await seedFile.writeAsString(
      statementBuilder.buildSeed(
        project,
        tableRowsByName: tableRowsByName,
      ),
    );
    await manifestFile.writeAsString(
      const JsonEncoder.withIndent('  ').convert({
        'source': project.source,
        'format': project.format,
        'tableCount': project.tables.length,
        'linkedTableCount': project.linkedTables.length,
        'generatedAtUtc': DateTime.now().toUtc().toIso8601String(),
        'identifierStyle': identifierStyle.cliValue,
        'fullDataIncluded': tableRowsByName != null,
        'rowCount': (tableRowsByName?.values ?? const <List<Map<String, dynamic>>>[])
          .fold<int>(0, (sum, rows) => sum + rows.length),
        'targetConnectionProvided':
            connectionString != null && connectionString.isNotEmpty,
      }),
    );

    return MigrationArtifacts(
      schemaFile: schemaFile,
      seedFile: seedFile,
      manifestFile: manifestFile,
    );
  }
}
