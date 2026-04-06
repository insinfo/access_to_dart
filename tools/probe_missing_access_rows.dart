import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:jackcess_dart/jackcess_dart.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('accdb', help: 'Caminho do arquivo .accdb')
    ..addOption('password', help: 'Senha opcional do .accdb')
    ..addOption('table', help: 'Nome da tabela no Access')
    ..addOption('key-column', help: 'Nome da coluna chave inteira')
    ..addOption(
      'full-sql',
      help: 'Dump SQL de referencia do Full Convert',
      defaultsTo: 'fixtures/access_siga_struture_end_data.sql',
    )
    ..addFlag('json', help: 'Emite saida JSON', negatable: false)
    ..addFlag('help', abbr: 'h', help: 'Mostra ajuda', negatable: false);

  final args = parser.parse(arguments);
  if (args['help'] as bool) {
    stdout.writeln(parser.usage);
    return;
  }

  final accdbPath = args['accdb'] as String?;
  final tableName = args['table'] as String?;
  final keyColumn = args['key-column'] as String?;
  if (accdbPath == null || accdbPath.isEmpty) {
    stderr.writeln('Missing required option: --accdb <file.accdb>');
    exitCode = 64;
    return;
  }
  if (tableName == null || tableName.isEmpty) {
    stderr.writeln('Missing required option: --table <tableName>');
    exitCode = 64;
    return;
  }
  if (keyColumn == null || keyColumn.isEmpty) {
    stderr.writeln('Missing required option: --key-column <columnName>');
    exitCode = 64;
    return;
  }

  final password = args['password'] as String?;
  final fullSqlPath = args['full-sql'] as String;
  final emitJson = args['json'] as bool;

  final fullKeys = await _extractFullConvertKeys(fullSqlPath, tableName);
  final db = await AccessDatabase.openPath(accdbPath, password: password);
  try {
    final catalog = AccessCatalog(format: db.format, pageChannel: db.pageChannel);
    final model = await catalog.read(accdbPath);
    final table = model.tables.firstWhere(
      (candidate) => _sameName(candidate.name, tableName),
      orElse: () => throw StateError('Tabela nao encontrada: $tableName'),
    );

    final tdefReader = TableDefReader(
      format: db.format,
      pageChannel: db.pageChannel,
      pageNumber: table.tdefPageNumber,
    );
    final tdefData = await tdefReader.readTableDefinitionData();
    final columns = await tdefReader.readColumns();
    final rowReader = RowReader(
      format: db.format,
      columns: columns,
      pageChannel: db.pageChannel,
    );
    final usageMap = await UsageMap.readFromTdef(
      pageChannel: db.pageChannel,
      format: db.format,
      tdefData: tdefData,
      tdefOffset: 55,
    );
    final dataReader = DataPageReader(
      format: db.format,
      pageChannel: db.pageChannel,
    );

    final accessKeys = <int>{};
    final emptyNonDeletedSamples = <Map<String, Object?>>[];
    final parseErrorSamples = <Map<String, Object?>>[];

    var totalSlots = 0;
    var deletedSlots = 0;
    var overflowSlots = 0;
    var parsedRows = 0;
    var emptyNonDeleted = 0;

    for (final pageNum in usageMap.pageNumbers) {
      final pageRows = await dataReader.readPageRows(pageNum);
      for (final pageRow in pageRows) {
        totalSlots++;
        if (pageRow.isDeleted) {
          deletedSlots++;
        }
        if (pageRow.isOverflow) {
          overflowSlots++;
        }
        try {
          final row = await rowReader.readRow(pageRow);
          if (row.isEmpty) {
            if (!pageRow.isDeleted) {
              emptyNonDeleted++;
              if (emptyNonDeletedSamples.length < 20) {
                emptyNonDeletedSamples.add({
                  'page': pageNum,
                  'row': pageRow.rowNumber,
                  'overflow': pageRow.isOverflow,
                  'rowDataLength': pageRow.rowData.length,
                  'first16': _hexSlice(pageRow.rowData, 16),
                });
              }
            }
            continue;
          }

          parsedRows++;
          final keyValue = _rowValue(row, keyColumn);
          if (keyValue is int) {
            accessKeys.add(keyValue);
          } else if (keyValue is num) {
            accessKeys.add(keyValue.toInt());
          }
        } catch (error) {
          if (parseErrorSamples.length < 20) {
            parseErrorSamples.add({
              'page': pageNum,
              'row': pageRow.rowNumber,
              'overflow': pageRow.isOverflow,
              'deleted': pageRow.isDeleted,
              'rowDataLength': pageRow.rowData.length,
              'first16': _hexSlice(pageRow.rowData, 16),
              'error': '$error',
            });
          }
        }
      }
    }

    final missingInAccess = fullKeys.difference(accessKeys).toList()..sort();
    final extraInAccess = accessKeys.difference(fullKeys).toList()..sort();
    final report = <String, Object?>{
      'table': table.name,
      'keyColumn': keyColumn,
      'fullKeyCount': fullKeys.length,
      'accessKeyCount': accessKeys.length,
      'missingInAccess': missingInAccess.length,
      'extraInAccess': extraInAccess.length,
      'missingSample': missingInAccess.take(30).toList(growable: false),
      'extraSample': extraInAccess.take(30).toList(growable: false),
      'totalSlots': totalSlots,
      'deletedSlots': deletedSlots,
      'overflowSlots': overflowSlots,
      'parsedRows': parsedRows,
      'emptyNonDeleted': emptyNonDeleted,
      'emptyNonDeletedSamples': emptyNonDeletedSamples,
      'parseErrorSamples': parseErrorSamples,
    };

    if (emitJson) {
      stdout.writeln(const JsonEncoder.withIndent('  ').convert(report));
      return;
    }

    stdout.writeln('table=${report['table']} keyColumn=${report['keyColumn']}');
    stdout.writeln('fullKeyCount=${report['fullKeyCount']} accessKeyCount=${report['accessKeyCount']}');
    stdout.writeln('missingInAccess=${report['missingInAccess']} extraInAccess=${report['extraInAccess']}');
    stdout.writeln('missingSample=${(report['missingSample'] as List).join(', ')}');
    stdout.writeln('extraSample=${(report['extraSample'] as List).join(', ')}');
    stdout.writeln('totalSlots=${report['totalSlots']} deletedSlots=${report['deletedSlots']} overflowSlots=${report['overflowSlots']}');
    stdout.writeln('parsedRows=${report['parsedRows']} emptyNonDeleted=${report['emptyNonDeleted']}');
    stdout.writeln('emptyNonDeletedSamples=${jsonEncode(report['emptyNonDeletedSamples'])}');
    stdout.writeln('parseErrorSamples=${jsonEncode(report['parseErrorSamples'])}');
  } finally {
    await db.close();
  }
}

Future<Set<int>> _extractFullConvertKeys(String path, String tableName) async {
  final normalizedTable = tableName.toLowerCase();
  final pattern = RegExp(
    '^INSERT INTO "public"\\."${RegExp.escape(normalizedTable)}" VALUES \\(([-]?[0-9]+),',
    caseSensitive: false,
  );
  final keys = <int>{};
  final lines = File(path)
      .openRead()
      .transform(SystemEncoding().decoder)
      .transform(const LineSplitter());
  await for (final line in lines) {
    final match = pattern.firstMatch(line);
    if (match == null) {
      continue;
    }
    final value = int.tryParse(match.group(1) ?? '');
    if (value != null) {
      keys.add(value);
    }
  }
  return keys;
}

Object? _rowValue(Map<String, dynamic> row, String key) {
  for (final entry in row.entries) {
    if (_sameName(entry.key, key)) {
      return entry.value;
    }
  }
  return null;
}

bool _sameName(String left, String right) {
  return _normalizeName(left) == _normalizeName(right);
}

String _normalizeName(String value) {
  final lower = value.toLowerCase();
  final buffer = StringBuffer();
  for (final codeUnit in lower.codeUnits) {
    final isLetter = codeUnit >= 97 && codeUnit <= 122;
    final isDigit = codeUnit >= 48 && codeUnit <= 57;
    if (isLetter || isDigit) {
      buffer.writeCharCode(codeUnit);
    }
  }
  return buffer.toString();
}

String _hexSlice(List<int> bytes, int count) {
  return bytes
      .take(count)
      .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
      .join(' ');
}