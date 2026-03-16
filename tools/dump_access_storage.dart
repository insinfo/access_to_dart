import 'dart:io';

import 'package:args/args.dart';
import 'package:jackcess_dart/jackcess_dart.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption(
      'accdb',
      abbr: 'a',
      help: 'Caminho do arquivo .accdb.',
    )
    ..addOption(
      'password',
      help: 'Senha opcional para .accdb criptografado.',
    )
    ..addOption(
      'dump-stream',
      help: 'Nome exato de uma stream para imprimir como texto UTF-8/Latin-1 bruto.',
    )
    ..addOption(
      'dump-index',
      help: 'Indice numerico da linha em MSysAccessStorage a ser impressa.',
    )
    ..addFlag(
      'strings-only',
      negatable: false,
      help: 'Ao fazer dump, mostra apenas strings ASCII imprimiveis relevantes.',
    )
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Mostra esta ajuda.',
    );

  final args = parser.parse(arguments);
  if (args['help'] as bool || (args['accdb'] as String?) == null) {
    stdout.writeln(parser.usage);
    return;
  }

  final accdbPath = args['accdb'] as String;
  final password = args['password'] as String?;
  final dumpStream = args['dump-stream'] as String?;
  final dumpIndex = int.tryParse(args['dump-index'] as String? ?? '');
  final stringsOnly = args['strings-only'] as bool;
  final db = await AccessDatabase.openPath(accdbPath, password: password);
  final catalog = AccessCatalog(format: db.format, pageChannel: db.pageChannel);
  final model = await catalog.read(db.info.path);
  final tableReader = TableReader(format: db.format, pageChannel: db.pageChannel);

  final catalogRows = await tableReader.readAllRows(2);
  var storageId = -1;
  for (final row in catalogRows) {
    if (row['Name'] == 'MSysAccessStorage') {
      storageId = row['Id'] as int;
      break;
    }
  }

  stdout.writeln('DB: $accdbPath');
  stdout.writeln('Forms catalog: ${model.forms.map((entry) => entry.name).toList()}');
  stdout.writeln('Modules catalog: ${model.modules.map((entry) => entry.name).toList()}');
  stdout.writeln('MSysAccessStorage id: $storageId');
  if (storageId == -1) {
    return;
  }

  final storageRows = await tableReader.readAllRows(storageId);
  for (var index = 0; index < storageRows.length; index++) {
    final row = storageRows[index];
    final name = row['Name'];
    final lv = row['Lv'];
    final length = lv is List<int> ? lv.length : -1;
    stdout.writeln('[$index] Stream: $name len=$length');
    final shouldDump = (dumpStream != null && name == dumpStream) ||
        (dumpIndex != null && dumpIndex == index);
    if (shouldDump && lv is List<int>) {
      stdout.writeln('--- DUMP [$index] $name START ---');
      if (stringsOnly) {
        for (final value in _extractPrintableStrings(lv)) {
          stdout.writeln(value);
        }
      } else {
        stdout.writeln(String.fromCharCodes(lv));
      }
      stdout.writeln('--- DUMP [$index] $name END ---');
    }
  }
}

Iterable<String> _extractPrintableStrings(List<int> bytes) sync* {
  final emitted = <String>{};

  final buffer = StringBuffer();
  for (final byte in bytes) {
    final isPrintable = byte >= 32 && byte <= 126;
    if (isPrintable) {
      buffer.writeCharCode(byte);
      continue;
    }
    if (buffer.length >= 4) {
      final value = buffer.toString();
      if (emitted.add(value)) {
        yield value;
      }
    }
    buffer.clear();
  }
  if (buffer.length >= 4) {
    final value = buffer.toString();
    if (emitted.add(value)) {
      yield value;
    }
  }

  final wide = StringBuffer();
  for (var index = 0; index + 1 < bytes.length; index += 2) {
    final low = bytes[index];
    final high = bytes[index + 1];
    final isPrintableWide = high == 0 && low >= 32 && low <= 126;
    if (isPrintableWide) {
      wide.writeCharCode(low);
      continue;
    }
    if (wide.length >= 4) {
      final value = wide.toString();
      if (emitted.add(value)) {
        yield value;
      }
    }
    wide.clear();
  }
  if (wide.length >= 4) {
    final value = wide.toString();
    if (emitted.add(value)) {
      yield value;
    }
  }
}