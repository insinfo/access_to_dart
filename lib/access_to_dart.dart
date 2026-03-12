import 'dart:convert';
import 'dart:io';

import 'package:jackcess_dart/jackcess_dart.dart';

import 'src/access_src_reader.dart';

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
  switch (command) {
    case 'inspect-accdb':
      return _runInspectAccdb(arguments.skip(1).toList(), output, error);
    case 'read-src':
      return _runReadSrc(arguments.skip(1).toList(), output, error);
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
  final accdbPath = _readOption(arguments, '--accdb');
  if (accdbPath == null || accdbPath.isEmpty) {
    err.writeln('Missing required option: --accdb <path-to.accdb>');
    return 64;
  }

  try {
    final database = await AccessDatabase.openPath(accdbPath);
    try {
      final info = database.info;
      out.writeln('ACCDB inspection');
      out.writeln('Path: ${info.path}');
      out.writeln('Format: ${info.format.name}');
      out.writeln('Page size: ${info.pageSize} bytes');
      out.writeln('File size: ${info.fileSize} bytes');
      out.writeln('Estimated page count: ${info.pageCount}');
      return 0;
    } finally {
      await database.close();
    }
  } on FileSystemException catch (e) {
    err.writeln('Cannot open ACCDB: ${e.path ?? accdbPath}');
    return 66;
  } catch (e) {
    err.writeln('Failed to inspect ACCDB: $e');
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
    out.writeln(
      const JsonEncoder.withIndent('  ').convert(project.toJson()),
    );
    return 0;
  } on FileSystemException catch (e) {
    err.writeln('Cannot open ACCDB source directory: ${e.path ?? srcPath}');
    return 66;
  } catch (e) {
    err.writeln('Failed to read ACCDB source directory: $e');
    return 1;
  }
}

String? _readOption(List<String> arguments, String optionName) {
  for (var i = 0; i < arguments.length; i++) {
    if (arguments[i] != optionName) {
      continue;
    }

    if (i + 1 >= arguments.length) {
      return '';
    }

    return arguments[i + 1];
  }

  return null;
}

void _writeUsage(StringSink sink) {
  sink.writeln('Usage: dart run access_to_dart <command> [options]');
  sink.writeln('');
  sink.writeln('Commands:');
  sink.writeln('  inspect-accdb --accdb <path-to.accdb>');
  sink.writeln('  read-src --src <path-to.accdb.src>');
}
