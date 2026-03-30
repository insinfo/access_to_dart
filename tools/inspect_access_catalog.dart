import 'dart:io';
import 'dart:typed_data';

import 'package:args/args.dart';
import 'package:jackcess_dart/jackcess_dart.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('accdb', help: 'Path to the .accdb file')
    ..addOption('password', help: 'Optional password')
    ..addOption(
      'compare-sql',
      help: 'Optional Full Convert SQL dump to compare against',
    )
    ..addFlag(
      'verbose-rows',
      help: 'Print every row parsed from each MSysObjects usage-map page',
      negatable: false,
    )
    ..addOption(
      'page',
      help: 'Optional MSysObjects data page number to inspect',
    );

  final args = parser.parse(arguments);
  final accdbPath = args['accdb'] as String?;
  if (accdbPath == null || accdbPath.isEmpty) {
    stderr.writeln('Missing required option: --accdb <file.accdb>');
    exitCode = 64;
    return;
  }

  final password = args['password'] as String?;
  final compareSql = args['compare-sql'] as String?;
  final verboseRows = args['verbose-rows'] as bool;
  final filterPage = int.tryParse((args['page'] as String?) ?? '');

  final db = await AccessDatabase.openPath(accdbPath, password: password);
  try {
    final catalog = AccessCatalog(format: db.format, pageChannel: db.pageChannel);
    final allEntries = await catalog.debugGetAllEntries();
    final tableParentId = _resolveTablesContainerId(allEntries);

    final tdefReader = TableDefReader(
      format: db.format,
      pageChannel: db.pageChannel,
      pageNumber: AccessDatabase.systemCatalogPageNumber,
    );
    final cols = await tdefReader.readColumns();
    final rowReader = RowReader(
      format: db.format,
      columns: cols,
      pageChannel: db.pageChannel,
    );
    final tdefData = await tdefReader.readTableDefinitionData();
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

    stdout.writeln('Usage map pages: ${usageMap.pageNumbers}');
    for (final pageNum in usageMap.pageNumbers) {
      if (filterPage != null && pageNum != filterPage) {
        continue;
      }
      final rows = await dataReader.readPageRows(pageNum);
      stdout.writeln('');
      stdout.writeln('--- Page $pageNum has ${rows.length} rows ---');
      for (final row in rows) {
        final map = await rowReader.readRow(row);
        final name = map['Name'];
        final type = map['Type'];
        final id = map['Id'];
        final flags = map['Flags'];
        final mapEmpty = map.isEmpty;
        if (!verboseRows && name == null && !row.isDeleted && !row.isOverflow) {
          continue;
        }
        stdout.writeln(
          '  row=${row.rowNumber} deleted=${row.isDeleted} overflow=${row.isOverflow} bytes=${row.rowData.length} name="${name ?? ''}" type=${type ?? ''} id=${id ?? ''} flags=${_hex(flags)} mapEmpty=$mapEmpty',
        );
        if (row.isOverflow) {
          stdout.writeln('    overflowRef=${_describeOverflowRef(row.rowData)}');
          final target = await _describeOverflowTarget(
            pageChannel: db.pageChannel,
            rowData: row.rowData,
          );
          stdout.writeln('    overflowTarget=$target');
        }
      }
    }

    stdout.writeln('');
    stdout.writeln('Tables container id: $tableParentId');
    stdout.writeln('');
    stdout.writeln('All type=1 entries:');
    final typeOne = allEntries.where((entry) => entry.rawType == 1).toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    for (final entry in typeOne) {
      stdout.writeln(
        '  name="${entry.name}" id=${entry.id} parentId=${entry.parentId} flags=${_hex(entry.flags)} isSystem=${entry.isSystem}',
      );
    }

    final userTables = allEntries
        .where(
          (entry) =>
              entry.rawType == 1 &&
              entry.parentId == tableParentId &&
              !entry.isSystem,
        )
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    stdout.writeln('');
    stdout.writeln('User tables from catalog (${userTables.length}):');
    for (final entry in userTables) {
      stdout.writeln('  ${entry.name}');
    }

    if (compareSql != null && compareSql.isNotEmpty) {
      final sqlTables = await _readFullConvertTables(compareSql);
      final actualKeys = <String, String>{
        for (final entry in userTables) _lookupKey(entry.name): entry.name,
      };
      final missing = <String>[];
      for (final sqlName in sqlTables) {
        if (!actualKeys.containsKey(_lookupKey(sqlName))) {
          missing.add(sqlName);
        }
      }

      stdout.writeln('');
      stdout.writeln('SQL dump tables (${sqlTables.length}):');
      stdout.writeln('Missing from catalog after normalized compare (${missing.length}):');
      for (final name in missing) {
        stdout.writeln('  $name');
      }
    }
  } finally {
    await db.close();
  }
}

int _resolveTablesContainerId(List<AccessCatalogEntry> entries) {
  for (final entry in entries) {
    if (entry.name == 'Tables' && entry.rawType == 3) {
      return entry.id;
    }
  }
  return 0;
}

Future<List<String>> _readFullConvertTables(String sqlPath) async {
  final file = File(sqlPath);
  final lines = await file.readAsLines();
  final regex = RegExp(r'^CREATE TABLE "public"\."([^"]+)"');
  final tables = <String>[];
  for (final line in lines) {
    final match = regex.firstMatch(line);
    if (match != null) {
      tables.add(match.group(1)!);
    }
  }
  return tables;
}

String _lookupKey(String value) {
  final normalized = StringBuffer();
  final folded = value
      .replaceAll('ç', 'c')
      .replaceAll('Ç', 'C')
      .toLowerCase();
  for (final codeUnit in folded.codeUnits) {
    final isLetter = codeUnit >= 97 && codeUnit <= 122;
    final isDigit = codeUnit >= 48 && codeUnit <= 57;
    if (isLetter || isDigit) {
      normalized.writeCharCode(codeUnit);
    }
  }
  return normalized.toString();
}

String _hex(dynamic value) {
  if (value is! num) {
    return '0x0';
  }
  return '0x${value.toInt().toRadixString(16)}';
}

String _describeOverflowRef(List<int> bytes) {
  if (bytes.length < 4) {
    return 'short:${bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}';
  }
  final rowNum = bytes[0];
  final pageNum = bytes[1] | (bytes[2] << 8) | (bytes[3] << 16);
  final hex = bytes
      .map((b) => b.toRadixString(16).padLeft(2, '0'))
      .join(' ');
  return 'row=$rowNum page=$pageNum raw=[$hex]';
}

Future<String> _describeOverflowTarget({
  required PageChannel pageChannel,
  required List<int> rowData,
}) async {
  if (rowData.length < 4) {
    return 'invalid-ref';
  }
  final rowNum = rowData[0];
  final pageNum = rowData[1] | (rowData[2] << 8) | (rowData[3] << 16);
  final buffer = await pageChannel.readPage(pageNum);
  final page = buffer.asUint8List();
  if (page.isEmpty) {
    return 'empty-page';
  }
  final pageType = page[0];
  final bytes = ByteData.view(buffer);
  final rowCount = bytes.getInt16(12, Endian.little);
  if (rowNum >= rowCount) {
    return 'pageType=$pageType rowCount=$rowCount row=$rowNum out-of-range';
  }
  final rowStartOffset = 14 + (2 * rowNum);
  final rawRowStart = bytes.getInt16(rowStartOffset, Endian.little);
  final isDeleted = (rawRowStart & 0x8000) != 0;
  final isOverflow = (rawRowStart & 0x4000) != 0;
  final startPos = rawRowStart & 0x0FFF;
  final endPos = rowNum == 0
      ? page.length
      : (bytes.getInt16(14 + (2 * (rowNum - 1)), Endian.little) & 0x0FFF);
  final payload = (startPos <= endPos && endPos <= page.length)
      ? page.sublist(startPos, endPos)
      : <int>[];
  final hex = payload
      .take(24)
      .map((b) => b.toRadixString(16).padLeft(2, '0'))
      .join(' ');
  return 'pageType=$pageType rowCount=$rowCount row=$rowNum deleted=$isDeleted overflow=$isOverflow start=$startPos end=$endPos payloadLen=${payload.length} payload=[$hex]';
}
