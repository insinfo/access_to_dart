import 'dart:io';

import 'package:jackcess_dart/jackcess_dart.dart';

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty ||
      arguments.contains('--help') ||
      arguments.contains('-h')) {
    stdout.writeln('Usage: dart run jackcess_dart <path-to.accdb>');
    return;
  }

  try {
    final database = await AccessDatabase.openPath(arguments.first);
    try {
      final page0 = await database.readPage(0);
      stdout.writeln('ACCDB inspection');
      stdout.writeln('Path: ${database.info.path}');
      stdout.writeln('Format: ${database.info.format.name}');
      stdout.writeln('Page size: ${database.info.pageSize} bytes');
      stdout.writeln('File size: ${database.info.fileSize} bytes');
      stdout.writeln('Estimated page count: ${database.info.pageCount}');
      stdout.writeln('Page 0 buffer size: ${page0.lengthInBytes} bytes');
    } finally {
      await database.close();
    }
  } catch (e) {
    stderr.writeln('Error: $e');
    exitCode = 1;
  }
}
