import 'dart:io';
import 'dart:typed_data';

import 'package:args/args.dart';
import 'package:jackcess_dart/jackcess_dart.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('accdb', help: 'Caminho do arquivo .accdb')
    ..addOption('password', help: 'Senha opcional do .accdb')
    ..addOption('table', help: 'Filtra por nome exato de tabela')
    ..addFlag('help', abbr: 'h', help: 'Mostra ajuda', negatable: false);

  final args = parser.parse(arguments);
  if (args['help'] as bool) {
    stdout.writeln(parser.usage);
    return;
  }

  final accdbPath = args['accdb'] as String?;
  if (accdbPath == null || accdbPath.isEmpty) {
    stderr.writeln('Missing required option: --accdb <file.accdb>');
    exitCode = 64;
    return;
  }

  final password = args['password'] as String?;
  final tableFilter = args['table'] as String?;

  final db = await AccessDatabase.openPath(accdbPath, password: password);
  try {
    final catalog = AccessCatalog(format: db.format, pageChannel: db.pageChannel);
    final model = await catalog.read(accdbPath);

    stdout.writeln('Fonte: $accdbPath');
    for (final table in model.tables) {
      if (tableFilter != null && tableFilter.isNotEmpty && !_sameName(table.name, tableFilter)) {
        continue;
      }
      final oleColumns = table.columns.where((column) {
        final normalized = column.typeName.toLowerCase();
        return normalized == 'ole' || normalized == 'binary' || normalized == 'longbinary';
      }).toList(growable: false);
      if (oleColumns.isEmpty) {
        continue;
      }

      stdout.writeln('');
      stdout.writeln('Tabela ${table.name}');
      for (final column in oleColumns) {
        final value = _firstNonNullSample(table.sampleRows, column.name);
        stdout.writeln('  Coluna ${column.name} type=${column.typeName} code=${column.typeCode}');
        if (value is Uint8List) {
          stdout.writeln('    len=${value.length}');
          stdout.writeln('    signature=${_detectSignature(value)}');
          stdout.writeln('    first32=${_hexSlice(value, 32)}');
          continue;
        }
        if (value is List<int>) {
          final bytes = Uint8List.fromList(value);
          stdout.writeln('    len=${bytes.length}');
          stdout.writeln('    signature=${_detectSignature(bytes)}');
          stdout.writeln('    first32=${_hexSlice(bytes, 32)}');
          continue;
        }
        stdout.writeln('    sample=${value == null ? 'null' : '${value.runtimeType} => $value'}');
      }
    }
  } finally {
    await db.close();
  }
}

Object? _firstNonNullSample(List<Map<String, dynamic>> rows, String columnName) {
  for (final row in rows) {
    final value = row[columnName];
    if (value != null) {
      return value;
    }
  }
  return null;
}

String _detectSignature(Uint8List bytes) {
  if (bytes.length >= 8 && _startsWith(bytes, const [0xD0, 0xCF, 0x11, 0xE0, 0xA1, 0xB1, 0x1A, 0xE1])) {
    return 'compound-ole';
  }
  if (bytes.length >= 8 && _startsWith(bytes, const [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A])) {
    return 'png';
  }
  if (bytes.length >= 3 && _startsWith(bytes, const [0xFF, 0xD8, 0xFF])) {
    return 'jpeg';
  }
  if (bytes.length >= 4 && _startsWith(bytes, const [0x47, 0x49, 0x46, 0x38])) {
    return 'gif';
  }
  if (bytes.length >= 2 && _startsWith(bytes, const [0x42, 0x4D])) {
    return 'bmp';
  }
  if (bytes.length >= 4 && _startsWith(bytes, const [0x25, 0x50, 0x44, 0x46])) {
    return 'pdf';
  }
  if (bytes.length >= 2 && _startsWith(bytes, const [0x50, 0x4B])) {
    return 'zip-like';
  }
  return 'unknown';
}

bool _startsWith(Uint8List bytes, List<int> signature) {
  if (bytes.length < signature.length) {
    return false;
  }
  for (var index = 0; index < signature.length; index++) {
    if (bytes[index] != signature[index]) {
      return false;
    }
  }
  return true;
}

String _hexSlice(Uint8List bytes, int count) {
  return bytes
      .take(count)
      .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
      .join(' ');
}

bool _sameName(String left, String right) {
  return _normalizedName(left) == _normalizedName(right);
}

String _normalizedName(String value) {
  final buffer = StringBuffer();
  for (final rune in value.toLowerCase().runes) {
    switch (rune) {
      case 0xE1:
      case 0xE0:
      case 0xE2:
      case 0xE3:
        buffer.write('a');
      case 0xE9:
      case 0xEA:
        buffer.write('e');
      case 0xED:
        buffer.write('i');
      case 0xF3:
      case 0xF4:
      case 0xF5:
        buffer.write('o');
      case 0xFA:
        buffer.write('u');
      case 0xE7:
        buffer.write('c');
      default:
        final isAlphaNum = (rune >= 97 && rune <= 122) || (rune >= 48 && rune <= 57);
        if (isAlphaNum) {
          buffer.writeCharCode(rune);
        }
    }
  }
  return buffer.toString();
}