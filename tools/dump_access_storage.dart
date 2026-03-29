import 'dart:io';
import 'dart:typed_data';

import 'package:access_to_dart/src/access_analysis/blob_layout_parser.dart';
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
      help:
          'Nome exato de uma stream para imprimir como texto UTF-8/Latin-1 bruto.',
    )
    ..addOption(
      'dump-index',
      help: 'Indice numerico da linha em MSysAccessStorage a ser impressa.',
    )
    ..addOption(
      'find-string',
      help:
          'Procura uma string ASCII/UTF-16LE dentro do stream selecionado e mostra contexto em hex.',
    )
    ..addOption(
      'dump-control-records',
      help:
          'Agrupa os registros binarios imediatamente antes e depois do nome UTF-16LE de um controle dentro do Blob.',
    )
    ..addOption(
      'context-bytes',
      help:
          'Quantidade de bytes de contexto antes/depois ao usar --find-string.',
      defaultsTo: '64',
    )
    ..addFlag(
      'strings-only',
      negatable: false,
      help:
          'Ao fazer dump, mostra apenas strings ASCII imprimiveis relevantes.',
    )
    ..addFlag(
      'dump-property-map',
      negatable: false,
      help:
          'Ao fazer dump, tenta decodificar o stream como PropertyMap MR2/KKD.',
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
  final findString = args['find-string'] as String?;
  final dumpControlRecords = args['dump-control-records'] as String?;
  final contextBytes =
      int.tryParse(args['context-bytes'] as String? ?? '64') ?? 64;
  final stringsOnly = args['strings-only'] as bool;
  final dumpPropertyMap = args['dump-property-map'] as bool;
  final db = await AccessDatabase.openPath(accdbPath, password: password);
  final catalog = AccessCatalog(format: db.format, pageChannel: db.pageChannel);
  final model = await catalog.read(db.info.path);
  final tableReader =
      TableReader(format: db.format, pageChannel: db.pageChannel);

  final catalogRows = await tableReader.readAllRows(2);
  var storageId = -1;
  for (final row in catalogRows) {
    if (row['Name'] == 'MSysAccessStorage') {
      storageId = row['Id'] as int;
      break;
    }
  }

  stdout.writeln('DB: $accdbPath');
  stdout.writeln(
      'Forms catalog: ${model.forms.map((entry) => entry.name).toList()}');
  stdout.writeln(
      'Modules catalog: ${model.modules.map((entry) => entry.name).toList()}');
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
      if (dumpPropertyMap) {
        _dumpPropertyMap(lv);
      } else if (dumpControlRecords != null && dumpControlRecords.isNotEmpty) {
        _dumpControlRecords(lv, dumpControlRecords);
      } else if (findString != null && findString.isNotEmpty) {
        _dumpStringMatches(lv, findString, contextBytes);
      } else if (stringsOnly) {
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

void _dumpControlRecords(List<int> bytes, String controlName) {
  final rawBytes = Uint8List.fromList(bytes);
  final parser = BlobLayoutParser(rawBytes);
  final group = parser.findControlRecordGroup(controlName);
  if (group == null) {
    stdout.writeln('Nenhum grupo de registros encontrado para "$controlName".');
    _dumpCandidateRecordsNearMatches(parser, rawBytes, controlName);
    return;
  }

  stdout.writeln(
      'control=$controlName matchOffset=${group.matchOffset} nameRecordStart=${group.nameRecord.start}');
  for (final record in group.previousRecords) {
    stdout.writeln('prev ${_formatRecord(record)}');
  }
  stdout.writeln('name ${_formatRecord(group.nameRecord)}');
  for (final record in group.nextRecords) {
    stdout.writeln('next ${_formatRecord(record)}');
  }
}

void _dumpCandidateRecordsNearMatches(
  BlobLayoutParser parser,
  Uint8List bytes,
  String controlName,
) {
  final pattern = <int>[];
  for (final codeUnit in controlName.codeUnits) {
    pattern
      ..add(codeUnit & 0xFF)
      ..add((codeUnit >> 8) & 0xFF);
  }

  var found = false;
  for (var index = 0; index <= bytes.length - pattern.length; index++) {
    var matched = true;
    for (var offset = 0; offset < pattern.length; offset++) {
      if (bytes[index + offset] != pattern[offset]) {
        matched = false;
        break;
      }
    }
    if (!matched) {
      continue;
    }
    found = true;
    stdout.writeln('matchOffset=$index');
    for (var candidateOffset = index; candidateOffset >= index - 32; candidateOffset--) {
      if (candidateOffset < 0) {
        break;
      }
      final record = parser.tryParseRecordAt(candidateOffset);
      if (record == null) {
        continue;
      }
      final payloadRelativeOffset = index - record.payloadStart;
      final containsName = payloadRelativeOffset >= 0 &&
          payloadRelativeOffset + pattern.length <= record.payload.length;
      stdout.writeln(
        'candidate containsName=$containsName ${_formatRecord(record)}',
      );
    }
  }

  if (!found) {
    stdout.writeln('Nenhuma ocorrencia UTF-16LE crua encontrada para "$controlName".');
  }
}

void _dumpPropertyMap(List<int> bytes) {
  try {
    final propertyMap = PropertyMapReader().read(Uint8List.fromList(bytes));
    stdout.writeln('defaultProperties=${propertyMap.defaultProperties}');
    final names = propertyMap.namedProperties.keys.toList()..sort();
    for (final name in names) {
      stdout.writeln('[$name] ${propertyMap.namedProperties[name]}');
    }
  } catch (error) {
    stdout.writeln('PropertyMap decode failed: $error');
  }
}

String _formatRecord(BlobFieldRecord record) {
  final decodedParts = <String>[];
  final utf16Value = record.utf16Value;
  if (utf16Value != null && utf16Value.runes.every((code) => code >= 32)) {
    decodedParts.add('utf16="$utf16Value"');
  }
  final int16Value = record.int16Value;
  if (int16Value != null) {
    decodedParts.add('i16=$int16Value');
  }
  final int32Value = record.int32Value;
  if (int32Value != null) {
    decodedParts.add('i32=$int32Value');
  }
  return 'offset=${record.start}..${record.end} '
      'propertyId=${record.propertyId} '
      'valueLength=${record.valueLength} '
      'typeCode=${record.typeCode} '
      'flags=${record.flags} '
      'reserved=${record.reserved} '
      'declaredPayloadLength=${record.declaredPayloadLength} '
      'payloadLength=${record.payloadLength} '
      '${decodedParts.join(' ')} '
      'payloadHex=${_toHex(record.payload)}';
}

void _dumpStringMatches(List<int> bytes, String value, int contextBytes) {
  final asciiPattern = value.codeUnits;
  final widePattern = <int>[];
  for (final codeUnit in value.codeUnits) {
    widePattern
      ..add(codeUnit & 0xFF)
      ..add((codeUnit >> 8) & 0xFF);
  }

  final matches = <String>[];
  _collectMatches(matches, bytes, asciiPattern, 'ascii', contextBytes);
  _collectMatches(matches, bytes, widePattern, 'utf16le', contextBytes);

  if (matches.isEmpty) {
    stdout.writeln('Nenhuma ocorrencia encontrada para "$value".');
    return;
  }

  for (final match in matches) {
    stdout.writeln(match);
  }
}

void _collectMatches(
  List<String> output,
  List<int> bytes,
  List<int> pattern,
  String label,
  int contextBytes,
) {
  if (pattern.isEmpty || bytes.length < pattern.length) {
    return;
  }

  for (var index = 0; index <= bytes.length - pattern.length; index++) {
    var matched = true;
    for (var offset = 0; offset < pattern.length; offset++) {
      if (bytes[index + offset] != pattern[offset]) {
        matched = false;
        break;
      }
    }
    if (!matched) {
      continue;
    }

    final start = (index - contextBytes).clamp(0, bytes.length);
    final end = (index + pattern.length + contextBytes).clamp(0, bytes.length);
    final window = bytes.sublist(start, end);
    output.add(
      'match[$label] offset=$index start=$start end=$end\nhex=${_toHex(window)}\nint32le=${_toInt32Le(window)}',
    );
  }
}

String _toHex(List<int> bytes) {
  return bytes
      .map((byte) => byte.toRadixString(16).padLeft(2, '0').toUpperCase())
      .join(' ');
}

String _toInt32Le(List<int> bytes) {
  final values = <String>[];
  for (var index = 0; index + 3 < bytes.length; index += 4) {
    final value = bytes[index] |
        (bytes[index + 1] << 8) |
        (bytes[index + 2] << 16) |
        (bytes[index + 3] << 24);
    values.add(value.toString());
  }
  return values.join(', ');
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
