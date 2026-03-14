import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:jackcess_dart/jackcess_dart.dart';

import 'src/access_src_reader.dart';
import 'src/accdb_analyzer.dart';

export 'src/access_src_model.dart';
export 'src/access_src_reader.dart';
export 'src/accdb_analyzer.dart';

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
    default:
      error.writeln('Unknown command: $command');
      _writeUsage(error);
      return 64;
  }
}

// ─── inspect-accdb ──────────────────────────────────────────────────────────

Future<int> _runInspectAccdb(
    List<String> arguments, StringSink out, StringSink err) async {
  final parser = ArgParser()
    ..addOption('accdb', help: 'Path to the .accdb file')
    ..addOption('password', help: 'Optional password for encrypted .accdb files')
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
    final database = await AccessDatabase.openPath(accdbPath, password: password);
    try {
      final info = database.info;
      final catalog = AccessCatalog(
          format: database.format, pageChannel: database.pageChannel);
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
              '  Encryption: Office ${encryptionInfo.versionLabel} ${encryptionInfo.cipherAlgorithm ?? 'unknown'}-${encryptionInfo.keyBits ?? '?'}');
          out.writeln(
              '  Hash: ${encryptionInfo.hashAlgorithm ?? 'unknown'}  SpinCount: ${encryptionInfo.spinCount ?? '?'}');
        }
        out.writeln(
            '  System catalog page: ${systemCatalog.pageNumber} (${systemCatalog.pageTypeName})');
        out.writeln('  System catalog row count hint: ${systemCatalog.rowCount}');
        out.writeln('─' * 60);

        out.writeln('  Tables (${model.tables.length}):');
        for (final t in model.tables) {
          out.writeln('    [TABLE] ${t.name}  (${t.rowCount} rows, ${t.columns.length} cols)');
          if (verbose) {
            for (final c in t.columns) {
              final pg = c.isVariableLength ? 'VAR' : 'FIX';
              out.writeln(
                  '        ${c.name.padRight(30)} ${c.typeName.padRight(12)} [$pg] len=${c.length}');
            }
          }
        }
        out.writeln();
        out.writeln('  Linked Tables (${model.linkedTables.length}):');
        for (final t in model.linkedTables) {
          out.writeln('    [LINKED] ${t.name}');
        }
        out.writeln();
        out.writeln('  Queries (${model.queries.length}):');
        for (final q in model.queries) {
          out.writeln('    [QUERY] ${q.name}');
          if (verbose && q.sqlText != null) {
            out.writeln('        ${q.sqlText}');
          }
        }
        out.writeln();
        out.writeln('  Forms    (${model.forms.length}): ${model.forms.map((f) => f.name).join(', ')}');
        out.writeln('  Reports  (${model.reports.length}): ${model.reports.map((r) => r.name).join(', ')}');
        out.writeln('  Macros   (${model.macros.length}): ${model.macros.map((m) => m.name).join(', ')}');
        out.writeln('  Modules  (${model.modules.length}): ${model.modules.map((m) => m.name).join(', ')}');
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

// ─── analyze ────────────────────────────────────────────────────────────────

Future<int> _runAnalyze(
    List<String> arguments, StringSink out, StringSink err) async {
  final parser = ArgParser()
    ..addOption('accdb', help: 'Path to the .accdb file')
    ..addOption('password', help: 'Optional password for encrypted .accdb files')
    ..addOption('src', help: 'Optional path to the .accdb.src directory')
    ..addOption('output', abbr: 'o', help: 'Output directory for analysis.json');

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
  final srcPath = args['src'] as String?;

  try {
    final database = await AccessDatabase.openPath(accdbPath, password: password);
    try {
      out.writeln('Analyzing $accdbPath ...');
      final catalog = AccessCatalog(
          format: database.format, pageChannel: database.pageChannel);
      final model = await catalog.read(accdbPath);

      final analyzer = AccdbAnalyzer(model: model);
      final analysis = await analyzer.analyze();
      if (srcPath != null && srcPath.isNotEmpty) {
        final sourceProject = await AccessSrcReader().readDirectory(srcPath);
        analysis['source_overlay'] = sourceProject.toJson();
      }

      final outDir = Directory(outputDir);
      await outDir.create(recursive: true);
      final analysisFile = File('$outputDir/analysis.json');
      await analysisFile.writeAsString(
          const JsonEncoder.withIndent('  ').convert(analysis));

      out.writeln('Analysis written to: ${analysisFile.path}');
      out.writeln('  Tables : ${model.tables.length}');
      out.writeln('  Linked : ${model.linkedTables.length}');
      out.writeln('  Queries: ${model.queries.length}');
      out.writeln('  Forms  : ${model.forms.length}');
      out.writeln('  Reports: ${model.reports.length}');
      out.writeln('  Macros : ${model.macros.length}');
      out.writeln('  Modules: ${model.modules.length}');
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

// ─── read-src ───────────────────────────────────────────────────────────────

Future<int> _runReadSrc(
    List<String> arguments, StringSink out, StringSink err) async {
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

// ─── Helpers ────────────────────────────────────────────────────────────────

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
      '  inspect-accdb --accdb <path-to.accdb> [--password <pwd>] [--json] [-v]   Inspect and list all objects');
  sink.writeln(
      '  analyze       --accdb <path-to.accdb> [--password <pwd>] [-o <outdir>]    Produce analysis.json');
  sink.writeln(
      '  read-src      --src <path.accdb.src>                Parse exported source dir');
}
