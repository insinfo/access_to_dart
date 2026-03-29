import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:jackcess_dart/jackcess_dart.dart';

import 'src/accdb_analyzer.dart';
import 'src/access_table_rows_reader.dart';
import 'src/analysis_backend_linker.dart';
import 'src/access_src_reader.dart';
import 'src/analysis_overlay_merger.dart';
import 'src/analysis_doctor.dart';
import 'src/analysis_model.dart';
import 'src/migration_identifier_style.dart';
import 'src/migration_writer.dart';
import 'src/postgres_connection_options.dart';
import 'src/postgres_migration_executor.dart';
import 'src/migration_statement_builder.dart';
import 'src/project_generator/project_generator.dart';
import 'src/query_reconciliation/query_reconciliation.dart';

export 'src/accdb_analyzer.dart';
export 'src/access_src_model.dart';
export 'src/access_src_reader.dart';

Future<int> run(
  List<String> arguments, {
  StringSink? out,
  StringSink? err,
}) async {
  final output = out ?? stdout;
  final error = err ?? stderr;

  if (arguments.isEmpty ||
      arguments.contains('--help') ||
      arguments.contains('-h')) {
    _writeUsage(output);
    return 0;
  }

  final command = arguments.first;
  final rest = arguments.skip(1).toList();

  switch (command) {
    case 'inspect-accdb':
      return _runInspectAccdb(rest, output, error);
    case 'analyze':
      return _runAnalyze(rest, output, error);
    case 'read-src':
      return _runReadSrc(rest, output, error);
    case 'generate':
      return _runGenerate(rest, output, error);
    case 'doctor':
      return _runDoctor(rest, output, error);
    case 'migrate':
      return _runMigrate(rest, output, error);
    default:
      error.writeln('Unknown command: $command');
      _writeUsage(error);
      return 64;
  }
}

Future<int> _runInspectAccdb(
  List<String> arguments,
  StringSink out,
  StringSink err,
) async {
  final parser = ArgParser()
    ..addOption('accdb', help: 'Path to the .accdb file')
    ..addOption('password',
        help: 'Optional password for encrypted .accdb files')
    ..addFlag('json', help: 'Output as JSON', negatable: false)
    ..addFlag('verbose', abbr: 'v', negatable: false);

  final ArgResults args;
  try {
    args = parser.parse(arguments);
  } catch (e) {
    err.writeln('Invalid arguments: $e');
    return 64;
  }

  final accdbPath = args['accdb'] as String?;
  if (accdbPath == null || accdbPath.isEmpty) {
    err.writeln('Missing required option: --accdb <path-to.accdb>');
    return 64;
  }

  final asJson = args['json'] as bool;
  final password = args['password'] as String?;
  final verbose = args['verbose'] as bool;

  try {
    final database =
        await AccessDatabase.openPath(accdbPath, password: password);
    try {
      final info = database.info;
      final catalog = AccessCatalog(
        format: database.format,
        pageChannel: database.pageChannel,
      );
      final model = await catalog.read(accdbPath);

      if (asJson) {
        out.writeln(const JsonEncoder.withIndent('  ').convert(model.toJson()));
      } else {
        final systemCatalog = await database.inspectSystemCatalogPage();
        out.writeln('═' * 60);
        out.writeln('  ACCDB inspection');
        out.writeln('═' * 60);
        out.writeln('  Path: ${info.path}');
        out.writeln('  Format: ${info.format.name}');
        out.writeln('  Size: ${info.fileSize} bytes');
        out.writeln('  Pages: ${info.pageCount}');
        final encryptionInfo = info.encryptionInfo;
        if (encryptionInfo != null) {
          out.writeln(
            '  Encryption: Office ${encryptionInfo.versionLabel} ${encryptionInfo.cipherAlgorithm ?? 'unknown'}-${encryptionInfo.keyBits ?? '?'}',
          );
          out.writeln(
            '  Hash: ${encryptionInfo.hashAlgorithm ?? 'unknown'}  SpinCount: ${encryptionInfo.spinCount ?? '?'}',
          );
        }
        out.writeln(
          '  System catalog page: ${systemCatalog.pageNumber} (${systemCatalog.pageTypeName})',
        );
        out.writeln(
          '  System catalog row count hint: ${systemCatalog.rowCount}',
        );
        out.writeln('─' * 60);

        out.writeln('  Tables (${model.tables.length}):');
        for (final table in model.tables) {
          out.writeln(
            '    [TABLE] ${table.name}  (${table.rowCount} rows, ${table.columns.length} cols)',
          );
          if (verbose) {
            for (final column in table.columns) {
              final layout = column.isVariableLength ? 'VAR' : 'FIX';
              out.writeln(
                '        ${column.name.padRight(30)} ${column.typeName.padRight(12)} [$layout] len=${column.length}',
              );
            }
          }
        }
        out.writeln();
        out.writeln('  Linked Tables (${model.linkedTables.length}):');
        for (final table in model.linkedTables) {
          out.writeln('    [LINKED] ${table.name}');
        }
        out.writeln();
        out.writeln('  Relationships (${model.relationships.length}):');
        for (final relationship in model.relationships
            .take(verbose ? model.relationships.length : 10)) {
          out.writeln(
            '    [REL] ${relationship.name}: ${relationship.fromTable}(${relationship.fromColumns.join(', ')}) -> ${relationship.toTable}(${relationship.toColumns.join(', ')})',
          );
        }
        if (!verbose && model.relationships.length > 10) {
          out.writeln('    ...');
        }
        out.writeln();
        out.writeln('  Queries (${model.queries.length}):');
        for (final query in model.queries) {
          out.writeln('    [QUERY] ${query.name}');
          if (verbose && query.sqlText != null) {
            out.writeln('        ${query.sqlText}');
          }
        }
        out.writeln();
        out.writeln(
          '  Forms    (${model.forms.length}): ${model.forms.map((f) => f.name).join(', ')}',
        );
        out.writeln(
          '  Reports  (${model.reports.length}): ${model.reports.map((r) => r.name).join(', ')}',
        );
        out.writeln(
          '  Macros   (${model.macros.length}): ${model.macros.map((m) => m.name).join(', ')}',
        );
        out.writeln(
          '  Modules  (${model.modules.length}): ${model.modules.map((m) => m.name).join(', ')}',
        );
        out.writeln('─' * 60);
      }
      return 0;
    } finally {
      await database.close();
    }
  } on FileSystemException catch (e) {
    err.writeln('Cannot open ACCDB: ${e.path ?? accdbPath}');
    return 66;
  } on AccdbPointerException catch (e) {
    err.writeln(e);
    err.writeln('Run `git lfs pull --include="$accdbPath"` to materialize it.');
    return 66;
  } on UnsupportedAccdbEncryptionException catch (e) {
    err.writeln('$e');
    err.writeln('Retry with --password <senha> for encrypted ACCDB files.');
    return 65;
  } catch (e, st) {
    err.writeln('Failed to inspect ACCDB: $e');
    err.writeln(st);
    return 1;
  }
}

Future<int> _runAnalyze(
  List<String> arguments,
  StringSink out,
  StringSink err,
) async {
  final parser = ArgParser()
    ..addOption('accdb', help: 'Path to the .accdb file')
    ..addOption('password',
        help: 'Optional password for encrypted .accdb files')
    ..addOption('backend-accdb',
      help: 'Optional path to the linked backend .accdb file')
    ..addOption('backend-password',
      help: 'Optional password for encrypted linked backend .accdb files')
    ..addOption('src', help: 'Optional path to the .accdb.src directory')
    ..addOption('output',
        abbr: 'o', help: 'Output directory for analysis.json');

  final ArgResults args;
  try {
    args = parser.parse(arguments);
  } catch (e) {
    err.writeln('Invalid arguments: $e');
    return 64;
  }

  final accdbPath = args['accdb'] as String?;
  if (accdbPath == null || accdbPath.isEmpty) {
    err.writeln('Missing required option: --accdb <path-to.accdb>');
    return 64;
  }

  final outputDir = args['output'] as String? ?? 'build';
  final password = args['password'] as String?;
  final backendAccdbPath = args['backend-accdb'] as String?;
  final backendPassword = args['backend-password'] as String?;
  final srcPath = args['src'] as String?;

  try {
    final database =
        await AccessDatabase.openPath(accdbPath, password: password);
    try {
      out.writeln('Analyzing $accdbPath ...');
      final catalog = AccessCatalog(
        format: database.format,
        pageChannel: database.pageChannel,
      );
      final model = await catalog.read(accdbPath);

      final analyzer = AccdbAnalyzer(model: model, db: database);
      var analysis = await analyzer.analyze();
      if (srcPath != null && srcPath.isNotEmpty) {
        final sourceProject = await AccessSrcReader().readDirectory(srcPath);
        analysis['source_overlay'] = sourceProject.toJson();
        AnalysisOverlayMerger().mergeSourceOverlay(analysis, sourceProject);
        analysis['query_reconciliation'] = QueryReconciliationBuilder()
            .build(model.queries, sourceProject.queries);
      }

      if (backendAccdbPath != null && backendAccdbPath.isNotEmpty) {
        final backendDatabase = await AccessDatabase.openPath(
          backendAccdbPath,
          password: backendPassword,
        );
        try {
          final backendCatalog = AccessCatalog(
            format: backendDatabase.format,
            pageChannel: backendDatabase.pageChannel,
          );
          final backendModel = await backendCatalog.read(backendAccdbPath);
          final backendAnalyzer = AccdbAnalyzer(
            model: backendModel,
            db: backendDatabase,
          );
          final backendAnalysis = await backendAnalyzer.analyze();
          analysis = AnalysisBackendLinker().mergeLinkedBackendAnalysis(
            analysis,
            backendAnalysis,
          );
        } finally {
          await backendDatabase.close();
        }
      }

      final outDir = Directory(outputDir);
      await outDir.create(recursive: true);
      final analysisFile = File('$outputDir/analysis.json');
      await analysisFile
          .writeAsString(const JsonEncoder.withIndent('  ').convert(analysis));

      out.writeln('Analysis written to: ${analysisFile.path}');
        final summary = (analysis['summary'] as Map?)?.cast<String, dynamic>() ??
          const <String, dynamic>{};
        out.writeln('  Tables : ${summary['tables'] ?? model.tables.length}');
        out.writeln('  Linked : ${summary['linkedTables'] ?? model.linkedTables.length}');
        out.writeln('  Rels   : ${summary['relationships'] ?? model.relationships.length}');
        out.writeln('  Queries: ${summary['queries'] ?? model.queries.length}');
        out.writeln('  Forms  : ${summary['forms'] ?? model.forms.length}');
        out.writeln('  Reports: ${summary['reports'] ?? model.reports.length}');
        out.writeln('  Macros : ${summary['macros'] ?? model.macros.length}');
        out.writeln('  Modules: ${summary['modules'] ?? model.modules.length}');

      final reconciliation = analysis['query_reconciliation'];
      if (reconciliation is Map<String, dynamic>) {
        final summary = reconciliation['summary'];
        if (summary is Map<String, dynamic>) {
          out.writeln('  Query match : ${summary['matchedNormalized'] ?? 0}');
          out.writeln('  Query relax : ${summary['matchedRelaxed'] ?? 0}');
          out.writeln('  Query shape : ${summary['matchedStructural'] ?? 0}');
          out.writeln(
            '  Query order : ${summary['matchedOrderEquivalent'] ?? 0}',
          );
          out.writeln('  Query join  : ${summary['matchedJoinGraph'] ?? 0}');
          out.writeln('  Query from  : ${summary['matchedFromOmitted'] ?? 0}');
          out.writeln('  Query setop : ${summary['matchedSetOperation'] ?? 0}');
          out.writeln('  Query diff  : ${summary['mismatched'] ?? 0}');
          out.writeln('  Bin SQL miss: ${summary['missingBinarySql'] ?? 0}');
          out.writeln('  Src SQL miss: ${summary['missingSourceSql'] ?? 0}');
        }
      }
      return 0;
    } finally {
      await database.close();
    }
  } on FileSystemException catch (e) {
    err.writeln('Cannot open ACCDB: ${e.path ?? accdbPath}');
    return 66;
  } on AccdbPointerException catch (e) {
    err.writeln(e);
    return 66;
  } on UnsupportedAccdbEncryptionException catch (e) {
    err.writeln('$e');
    err.writeln('Retry with --password <senha> for encrypted ACCDB files.');
    return 65;
  } catch (e, st) {
    err.writeln('Failed to analyze ACCDB: $e');
    err.writeln(st);
    return 1;
  }
}

Future<int> _runReadSrc(
  List<String> arguments,
  StringSink out,
  StringSink err,
) async {
  final srcPath = _readOption(arguments, '--src');
  if (srcPath == null || srcPath.isEmpty) {
    err.writeln('Missing required option: --src <path-to.accdb.src>');
    return 64;
  }

  try {
    final project = await AccessSrcReader().readDirectory(srcPath);
    out.writeln(const JsonEncoder.withIndent('  ').convert(project.toJson()));
    return 0;
  } on FileSystemException catch (e) {
    err.writeln('Cannot open ACCDB source directory: ${e.path ?? srcPath}');
    return 66;
  } catch (e) {
    err.writeln('Failed to read ACCDB source directory: $e');
    return 1;
  }
}

Future<int> _runGenerate(
  List<String> arguments,
  StringSink out,
  StringSink err,
) async {
  final parser = ArgParser()
    ..addOption('analysis', help: 'Path to analysis.json')
    ..addOption('output',
        abbr: 'o', help: 'Output directory for the generated app')
    ..addOption(
      'identifier-style',
      help: 'Identifier style: snake_ascii or original',
      defaultsTo: 'snake_ascii',
    );

  final ArgResults args;
  try {
    args = parser.parse(arguments);
  } catch (e) {
    err.writeln('Invalid arguments: $e');
    return 64;
  }

  final analysisPath = args['analysis'] as String?;
  if (analysisPath == null || analysisPath.isEmpty) {
    err.writeln('Missing required option: --analysis <path-to-analysis.json>');
    return 64;
  }

  final outputDir = args['output'] as String? ?? 'generated';

  final MigrationIdentifierStyle identifierStyle;
  try {
    identifierStyle = MigrationIdentifierStyle.parse(
      args['identifier-style'] as String? ?? 'snake_ascii',
    );
  } on FormatException catch (e) {
    err.writeln(e.message);
    return 64;
  }

  try {
    final project = await AnalysisProject.load(analysisPath);
    final generated = await ProjectGenerator(
      identifierStyle: identifierStyle,
    ).generate(
      project: project,
      outputDirectory: outputDir,
    );
    out.writeln('Generated app written to: ${generated.rootDirectory.path}');
    out.writeln(
      '  Core    : ${generated.rootDirectory.path}${Platform.pathSeparator}core',
    );
    out.writeln(
      '  Backend : ${generated.rootDirectory.path}${Platform.pathSeparator}backend',
    );
    out.writeln(
      '  Frontend: ${generated.rootDirectory.path}${Platform.pathSeparator}frontend',
    );
    return 0;
  } on FileSystemException catch (e) {
    err.writeln('Cannot open analysis.json: ${e.path ?? analysisPath}');
    return 66;
  } catch (e, st) {
    err.writeln('Failed to generate app: $e');
    err.writeln(st);
    return 1;
  }
}

Future<int> _runDoctor(
  List<String> arguments,
  StringSink out,
  StringSink err,
) async {
  final parser = ArgParser()
    ..addOption('analysis', help: 'Path to analysis.json');

  final ArgResults args;
  try {
    args = parser.parse(arguments);
  } catch (e) {
    err.writeln('Invalid arguments: $e');
    return 64;
  }

  final analysisPath = args['analysis'] as String?;
  if (analysisPath == null || analysisPath.isEmpty) {
    err.writeln('Missing required option: --analysis <path-to-analysis.json>');
    return 64;
  }

  try {
    final project = await AnalysisProject.load(analysisPath);
    final report = AnalysisDoctor().inspect(project);
    final summary = report.summary;
    out.writeln('Doctor report for: $analysisPath');
    out.writeln('  Errors  : ${summary['error']}');
    out.writeln('  Warnings: ${summary['warning']}');
    out.writeln('  Info    : ${summary['info']}');
    for (final issue in report.issues) {
      out.writeln('  [${issue.severity}] ${issue.code} ${issue.message}');
    }
    return report.hasErrors ? 2 : 0;
  } on FileSystemException catch (e) {
    err.writeln('Cannot open analysis.json: ${e.path ?? analysisPath}');
    return 66;
  } catch (e, st) {
    err.writeln('Failed to run doctor: $e');
    err.writeln(st);
    return 1;
  }
}

Future<int> _runMigrate(
  List<String> arguments,
  StringSink out,
  StringSink err,
) async {
  final parser = ArgParser()
    ..addOption('analysis', help: 'Path to analysis.json')
    ..addOption('accdb', help: 'Path to the .accdb file for direct migration')
    ..addOption('password',
        help: 'Optional password for encrypted .accdb files')
    ..addOption('pg', help: 'Optional PostgreSQL connection string')
    ..addOption(
      'identifier-style',
      help: 'Identifier style: snake_ascii or original',
      defaultsTo: 'snake_ascii',
    )
    ..addOption('output',
        abbr: 'o', help: 'Output directory for migration assets');

  final ArgResults args;
  try {
    args = parser.parse(arguments);
  } catch (e) {
    err.writeln('Invalid arguments: $e');
    return 64;
  }

  final analysisPath = args['analysis'] as String?;
  final accdbPath = args['accdb'] as String?;
  if ((analysisPath == null || analysisPath.isEmpty) &&
      (accdbPath == null || accdbPath.isEmpty)) {
    err.writeln(
      'Missing required source: provide --analysis <path-to-analysis.json> or --accdb <path-to.accdb>',
    );
    return 64;
  }

  final outputDir = args['output'] as String? ?? 'build/migration';
  final pg = args['pg'] as String?;
  final password = args['password'] as String?;

  final MigrationIdentifierStyle identifierStyle;
  try {
    identifierStyle = MigrationIdentifierStyle.parse(
      args['identifier-style'] as String? ?? 'snake_ascii',
    );
  } on FormatException catch (e) {
    err.writeln(e.message);
    return 64;
  }

  try {
    final project = analysisPath != null && analysisPath.isNotEmpty
        ? await AnalysisProject.load(analysisPath)
        : await _loadAnalysisProjectFromAccdb(
            accdbPath!,
            password: password,
          );

    final migrationRows = await _loadMigrationRows(
      explicitAccdbPath: accdbPath,
      inferredAccdbPath: project.source,
      password: password,
      out: out,
      err: err,
    );

    final artifacts = await MigrationWriter().write(
      project: project,
      outputDirectory: outputDir,
      connectionString: pg,
      identifierStyle: identifierStyle,
      tableRowsByName: migrationRows?.rowsByTable,
    );
    out.writeln('Migration assets written to: $outputDir');
    out.writeln('  Schema : ${artifacts.schemaFile.path}');
    out.writeln('  Seed   : ${artifacts.seedFile.path}');
    out.writeln('  Manifest: ${artifacts.manifestFile.path}');
    if (pg != null && pg.isNotEmpty) {
      final connectionOptions = PostgresConnectionOptions.parse(pg);
      final execution = await PostgresMigrationExecutor(
        connectionOptions: connectionOptions,
      ).execute(
        project: project,
        statementBuilder: MigrationStatementBuilder(
          identifierPolicy: MigrationIdentifierPolicy(style: identifierStyle),
        ),
        tableRowsByName: migrationRows?.rowsByTable,
      );
      out.writeln('  PostgreSQL apply: OK');
      out.writeln('  Tables created : ${execution.tablesCreated}');
      out.writeln('  Rows inserted  : ${execution.rowsInserted}');
    }
    return 0;
  } on FileSystemException catch (e) {
    err.writeln(
      'Cannot open migration source: ${e.path ?? analysisPath ?? accdbPath}',
    );
    return 66;
  } on UnsupportedAccdbEncryptionException catch (e) {
    err.writeln('$e');
    err.writeln('Retry with --password <senha> for encrypted ACCDB files.');
    return 65;
  } catch (e, st) {
    err.writeln('Failed to write migration assets: $e');
    err.writeln(st);
    return 1;
  }
}

Future<AnalysisProject> _loadAnalysisProjectFromAccdb(
  String accdbPath, {
  String? password,
}) async {
  final database = await AccessDatabase.openPath(accdbPath, password: password);
  try {
    final catalog = AccessCatalog(
      format: database.format,
      pageChannel: database.pageChannel,
    );
    final model = await catalog.read(accdbPath);
    final analysis = await AccdbAnalyzer(model: model, db: database).analyze();
    return AnalysisProject.fromJson(analysis);
  } finally {
    await database.close();
  }
}

Future<AccessTableRowsSnapshot?> _loadMigrationRows({
  required String? explicitAccdbPath,
  required String inferredAccdbPath,
  required String? password,
  required StringSink out,
  required StringSink err,
}) async {
  final resolvedPath =
      explicitAccdbPath != null && explicitAccdbPath.isNotEmpty
          ? explicitAccdbPath
          : inferredAccdbPath;

  if (resolvedPath.isEmpty) {
    return null;
  }

  final sourceFile = File(resolvedPath);
  if (!await sourceFile.exists()) {
    return null;
  }

  try {
    final snapshot = await AccessTableRowsReader().readAll(
      accdbPath: resolvedPath,
      password: password,
    );
    out.writeln(
      'Loaded ${snapshot.rowCount} Access rows from ${snapshot.tableCount} tables for migration.',
    );
    return snapshot;
  } catch (e) {
    err.writeln(
      'Warning: failed to load full Access rows from $resolvedPath, falling back to sampleRows. Error: $e',
    );
    return null;
  }
}

String? _readOption(List<String> arguments, String optionName) {
  for (var i = 0; i < arguments.length; i++) {
    if (arguments[i] != optionName) continue;
    if (i + 1 >= arguments.length) return '';
    return arguments[i + 1];
  }
  return null;
}

void _writeUsage(StringSink sink) {
  sink.writeln('Usage: dart run access_to_dart <command> [options]');
  sink.writeln('');
  sink.writeln('Commands:');
  sink.writeln(
    '  inspect-accdb --accdb <path-to.accdb> [--password <pwd>] [--json] [-v]   Inspect and list all objects',
  );
  sink.writeln(
    '  analyze       --accdb <path-to.accdb> [--password <pwd>] [-o <outdir>]    Produce analysis.json',
  );
  sink.writeln(
    '  read-src      --src <path.accdb.src>                Parse exported source dir',
  );
  sink.writeln(
    '  doctor        --analysis <analysis.json>            Validate generated analysis',
  );
  sink.writeln(
    '  migrate       [--analysis <analysis.json> | --accdb <file.accdb>] [-o dir] [--pg <conn>] [--identifier-style snake_ascii|original]  Emit/apply PostgreSQL migration assets',
  );
  sink.writeln(
    '  generate      --analysis <analysis.json> [-o dir] [--identifier-style snake_ascii|original]  Generate core/backend/frontend scaffold',
  );
}
