import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:args/args.dart';
import 'package:jackcess_dart/jackcess_dart.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('accdb', help: 'Caminho do arquivo .accdb')
    ..addOption('password', help: 'Senha opcional do .accdb')
    ..addOption('table', help: 'Filtra por nome exato de tabela')
    ..addFlag('json', help: 'Emite saida JSON', negatable: false)
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
  final emitJson = args['json'] as bool;

  final db = await AccessDatabase.openPath(accdbPath, password: password);
  try {
    final catalog = AccessCatalog(format: db.format, pageChannel: db.pageChannel);
    final model = await catalog.read(accdbPath);
    final entries = await catalog.debugGetAllEntries();
    final entryById = <int, AccessCatalogEntry>{for (final entry in entries) entry.id: entry};
    final complexEntry = entries.where((entry) => entry.name == 'MSysComplexColumns').firstOrNull;
    final complexRows = await _readSystemTableRows(
      db: db,
      entry: complexEntry,
    );
    final schemasByPageNumber = <int, _TableShape>{};

    final reports = <Map<String, Object?>>[];
    for (final table in model.tables) {
      if (tableFilter != null && tableFilter.isNotEmpty && !_sameName(table.name, tableFilter)) {
        continue;
      }

      final interestingColumns = table.columns.where((column) {
        final normalized = column.typeName.toLowerCase();
        return normalized == 'ole' || normalized == 'binary' || normalized == 'longbinary' || normalized == 'complextype';
      }).toList(growable: false);
      if (interestingColumns.isEmpty) {
        continue;
      }

      final columnReports = <Map<String, Object?>>[];
      final complexTypeIds = await _readComplexTypeIds(
        db: db,
        tdefPageNumber: table.tdefPageNumber,
      );

      for (final column in interestingColumns) {
        final normalized = column.typeName.toLowerCase();
        if (normalized == 'complextype') {
          final complexTypeId = complexTypeIds[column.columnNumber];
          final report = await _buildComplexColumnReport(
            table: table,
            column: column,
            complexTypeId: complexTypeId,
            complexRows: complexRows,
            entryById: entryById,
            schemasByPageNumber: schemasByPageNumber,
            db: db,
          );
          columnReports.add(report);
          continue;
        }

        final sampleValue = _firstNonNullSample(table.sampleRows, column.name);
        columnReports.add({
          'columnName': column.name,
          'typeName': column.typeName,
          'typeCode': column.typeCode,
          'classification': 'ole-like',
          'currentValuePreview': _previewValue(sampleValue),
          'recommendedHandling': 'Mapear como BYTEA no PostgreSQL e preservar o blob integral.',
        });
      }

      reports.add({
        'tableName': table.name,
        'tdefPageNumber': table.tdefPageNumber,
        'columns': columnReports,
      });
    }

    if (emitJson) {
      stdout.writeln(const JsonEncoder.withIndent('  ').convert({
        'source': accdbPath,
        'reports': reports,
      }));
      return;
    }

    stdout.writeln('Fonte: $accdbPath');
    stdout.writeln('MSysComplexColumns: ${complexEntry?.id ?? 'nao encontrado'}');
    for (final tableReport in reports) {
      stdout.writeln('');
      stdout.writeln('Tabela ${tableReport['tableName']} (tdef=${tableReport['tdefPageNumber']})');
      final columns = tableReport['columns'] as List<Object?>;
      for (final entry in columns.cast<Map<String, Object?>>()) {
        stdout.writeln('  Coluna ${entry['columnName']}');
        stdout.writeln('    type=${entry['typeName']} code=${entry['typeCode']} classification=${entry['classification']}');
        if (entry.containsKey('complexTypeId')) {
          stdout.writeln('    complexTypeId=${entry['complexTypeId']}');
        }
        if (entry.containsKey('supportingTables')) {
          final supportingTables = entry['supportingTables'] as Map<String, Object?>;
          stdout.writeln('    typeObj=${supportingTables['typeObject']}');
          stdout.writeln('    flatTable=${supportingTables['flatTable']}');
        }
        if (entry.containsKey('typeObjectShape')) {
          stdout.writeln('    typeObjShape=${entry['typeObjectShape']}');
        }
        if (entry.containsKey('flatTableShape')) {
          stdout.writeln('    flatShape=${entry['flatTableShape']}');
        }
        if (entry.containsKey('flatTablePreview')) {
          stdout.writeln('    flatPreview=${entry['flatTablePreview']}');
        }
        if (entry.containsKey('systemTablePreview')) {
          stdout.writeln('    systemPreview=${entry['systemTablePreview']}');
        }
        stdout.writeln('    valuePreview=${entry['currentValuePreview']}');
        stdout.writeln('    recommendation=${entry['recommendedHandling']}');
      }
    }
  } finally {
    await db.close();
  }
}

Future<Map<String, Object?>> _buildComplexColumnReport({
  required AccessTableSchema table,
  required AccessColumnSchema column,
  required int? complexTypeId,
  required List<Map<String, dynamic>> complexRows,
  required Map<int, AccessCatalogEntry> entryById,
  required Map<int, _TableShape> schemasByPageNumber,
  required AccessDatabase db,
}) async {
  final sampleValue = _firstNonNullSample(table.sampleRows, column.name);
  final report = <String, Object?>{
    'columnName': column.name,
    'typeName': column.typeName,
    'typeCode': column.typeCode,
    'classification': 'complex-unknown',
    'currentValuePreview': _previewValue(sampleValue),
  };
  if (complexTypeId == null) {
    report['recommendedHandling'] = 'ComplexType sem complexTypeId resolvido; investigar TableDef antes de mapear para PostgreSQL.';
    return report;
  }

  report['complexTypeId'] = complexTypeId;
  final row = complexRows.firstWhere(
    (candidate) =>
        _rowInt(candidate, 'ComplexID') == complexTypeId ||
        _rowInt(candidate, 'ID') == complexTypeId,
    orElse: () => <String, dynamic>{},
  );
  if (row.isEmpty) {
    report['systemTablePreview'] = complexRows
        .take(3)
        .map(_jsonSafeMap)
        .toList(growable: false);
    report['recommendedHandling'] = 'complexTypeId nao encontrado em MSysComplexColumns; nao mapear como INTEGER definitivo.';
    return report;
  }

  final conceptualTableId = _rowInt(row, 'ConceptualTableID');
  final flatTableId = _rowInt(row, 'FlatTableID');
  final typeObjectId = _rowInt(row, 'ComplexTypeObjectID');
  final typeShape = typeObjectId == null
      ? null
      : await _readTableShapeCached(
          db: db,
          pageNumber: typeObjectId,
          name: entryById[typeObjectId]?.name ?? 'typeObj#$typeObjectId',
          cache: schemasByPageNumber,
        );
  final flatShape = flatTableId == null
      ? null
      : await _readTableShapeCached(
          db: db,
          pageNumber: flatTableId,
          name: entryById[flatTableId]?.name ?? 'flat#$flatTableId',
          cache: schemasByPageNumber,
        );

  final classification = _classifyComplexType(typeShape);
  report['classification'] = classification;
  report['supportingTables'] = {
    'conceptualTableId': conceptualTableId,
    'typeObject': _describeEntry(entryById[typeObjectId]),
    'flatTable': _describeEntry(entryById[flatTableId]),
  };
  if (typeShape != null) {
    report['typeObjectShape'] = typeShape.columns
        .map((column) => '${column.name}:${column.typeName}')
        .toList(growable: false);
  }
  if (flatShape != null) {
    report['flatTableShape'] = flatShape.columns
        .map((column) => '${column.name}:${column.typeName}')
        .toList(growable: false);
  }
  if (flatTableId != null) {
    final flatRows = await _readRowsByPage(db: db, pageNumber: flatTableId);
    report['flatTablePreview'] = {
      'rowCount': flatRows.length,
      'firstRow': flatRows.isEmpty ? null : _jsonSafeMap(flatRows.first),
    };
  }
  report['recommendedHandling'] = _recommendationForClassification(classification);
  return report;
}

Future<Map<int, int>> _readComplexTypeIds({
  required AccessDatabase db,
  required int tdefPageNumber,
}) async {
  const offsetNumIndexes = 51;
  const offsetIndexDefBlock = 63;
  const sizeIndexDefinition = 12;
  const sizeColumnDefBlock = 25;
  const offsetType = 0;
  const offsetColumnNumber = 5;
  const offsetComplexId = 11;
  final bytes = await TableDefReader(
    format: db.format,
    pageChannel: db.pageChannel,
    pageNumber: tdefPageNumber,
  ).readTableDefinitionData();
  final data = ByteData.sublistView(bytes);
  final indexCount = data.getInt32(offsetNumIndexes, Endian.little);
  final columnStart = offsetIndexDefBlock + (indexCount * sizeIndexDefinition);
  final complexTypeIds = <int, int>{};
  for (var offset = columnStart; offset + sizeColumnDefBlock <= bytes.length; offset += sizeColumnDefBlock) {
    final type = data.getUint8(offset + offsetType);
    final columnNumber = data.getInt16(offset + offsetColumnNumber, Endian.little);
    if (type != 0x12) {
      continue;
    }
    complexTypeIds[columnNumber] = data.getInt32(offset + offsetComplexId, Endian.little);
  }
  return complexTypeIds;
}

Future<List<Map<String, dynamic>>> _readSystemTableRows({
  required AccessDatabase db,
  required AccessCatalogEntry? entry,
}) async {
  if (entry == null) {
    return const <Map<String, dynamic>>[];
  }
  return _readRowsByPage(db: db, pageNumber: entry.id);
}

Future<List<Map<String, dynamic>>> _readRowsByPage({
  required AccessDatabase db,
  required int pageNumber,
}) async {
  final tableReader = TableReader(
    format: db.format,
    pageChannel: db.pageChannel,
  );
  return tableReader.readAllRows(pageNumber);
}

Future<_TableShape> _readTableShapeCached({
  required AccessDatabase db,
  required int pageNumber,
  required String name,
  required Map<int, _TableShape> cache,
}) async {
  final cached = cache[pageNumber];
  if (cached != null) {
    return cached;
  }
  final definition = await TableDefReader(
    format: db.format,
    pageChannel: db.pageChannel,
    pageNumber: pageNumber,
  ).readDefinition();
  final shape = _TableShape(
    name: name,
    pageNumber: pageNumber,
    columns: definition.columns
        .map(
          (column) => _ColumnShape(
            name: column.name,
            typeCode: column.type,
            typeName: AccessColumnSchema.typeCodeToName(column.type),
          ),
        )
        .toList(growable: false),
  );
  cache[pageNumber] = shape;
  return shape;
}

String _classifyComplexType(_TableShape? shape) {
  if (shape == null) {
    return 'complex-unknown';
  }
  final columns = shape.columns;
  if (columns.length == 1 && _isSimpleMultiValueType(columns.single.typeName)) {
    return 'multi-value';
  }
  final memoCount = columns.where((column) => column.typeName == 'Memo').length;
  final textCount = columns.where((column) => column.typeName == 'Text').length;
  final dateCount = columns.where((column) => column.typeName == 'DateTime').length;
  final oleCount = columns.where((column) => column.typeName == 'OLE').length;
  final longCount = columns.where((column) => column.typeName == 'Long').length;
  if (memoCount >= 1 && textCount >= 2 && dateCount >= 1 && oleCount >= 1 && longCount >= 1) {
    return 'attachment';
  }
  if (memoCount >= 1 && dateCount >= 1) {
    return 'version-history';
  }
  return 'complex-unsupported';
}

bool _isSimpleMultiValueType(String typeName) {
  return const <String>{
    'Boolean',
    'Byte',
    'Integer',
    'Long',
    'Money',
    'Float',
    'Double',
    'DateTime',
    'Text',
    'Memo',
    'GUID',
    'Numeric',
    'BigInt',
  }.contains(typeName);
}

String _recommendationForClassification(String classification) {
  switch (classification) {
    case 'attachment':
      return 'Nao mapear como INTEGER escalar. Extrair como relacao auxiliar de anexos; FileData deve virar BYTEA e metadados devem ser preservados.';
    case 'multi-value':
      return 'Nao mapear como INTEGER escalar. Tratar como tabela filha multivalor associada a chave da row principal.';
    case 'version-history':
      return 'Nao mapear como INTEGER escalar. Tratar como historico auxiliar, fora da tabela principal.';
    case 'complex-unsupported':
      return 'ComplexType sem assinatura conhecida nas referencias. Preserve o FK bruto apenas como fallback diagnostico, nao como contrato final.';
    default:
      return 'Investigar mais antes de emitir DDL final.';
  }
}

String _describeEntry(AccessCatalogEntry? entry) {
  if (entry == null) {
    return 'desconhecido';
  }
  return '${entry.name}#${entry.id}';
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

Map<String, Object?> _jsonSafeMap(Map<String, dynamic> row) {
  return row.map((key, value) => MapEntry(key, _previewValue(value)));
}

Object? _previewValue(Object? value) {
  if (value == null) {
    return null;
  }
  if (value is Uint8List) {
    return {
      'runtimeType': 'Uint8List',
      'length': value.length,
      'first16': value.take(16).toList(growable: false),
    };
  }
  if (value is List<int>) {
    return {
      'runtimeType': 'List<int>',
      'length': value.length,
      'first16': value.take(16).toList(growable: false),
    };
  }
  return {'runtimeType': value.runtimeType.toString(), 'value': '$value'};
}

int? _rowInt(Map<String, dynamic> row, String key) {
  for (final entry in row.entries) {
    if (_sameName(entry.key, key)) {
      final value = entry.value;
      if (value is int) {
        return value;
      }
      if (value is num) {
        return value.toInt();
      }
    }
  }
  return null;
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

class _TableShape {
  final String name;
  final int pageNumber;
  final List<_ColumnShape> columns;

  const _TableShape({
    required this.name,
    required this.pageNumber,
    required this.columns,
  });
}

class _ColumnShape {
  final String name;
  final int typeCode;
  final String typeName;

  const _ColumnShape({
    required this.name,
    required this.typeCode,
    required this.typeName,
  });
}