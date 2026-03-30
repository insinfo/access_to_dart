import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:access_to_dart/src/access_analysis/access_analysis.dart';
import 'package:access_to_dart/src/access_analysis/blob_layout_parser.dart';
import 'package:access_to_dart/src/identifier_utils.dart';
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
      'output',
      abbr: 'o',
      help: 'Arquivo de saida (.md ou .json). Se omitido, imprime em stdout.',
    )
    ..addOption(
      'format',
      help: 'Formato do relatorio: markdown ou json.',
      allowed: const ['markdown', 'json'],
      defaultsTo: 'markdown',
    )
    ..addMultiOption(
      'form',
      help: 'Nome exato de formulario a analisar. Pode ser repetido.',
    )
    ..addOption(
      'max-strings',
      help: 'Quantidade maxima de strings brutas por stream no relatorio.',
      defaultsTo: '40',
    )
    ..addOption(
      'max-records',
      help: 'Quantidade maxima de registros proximos por controle no Blob.',
      defaultsTo: '12',
    )
    ..addFlag(
      'include-raw-strings',
      help: 'Inclui amostras de strings extraidas de Blob e TypeInfo.',
      defaultsTo: false,
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
  final outputPath = args['output'] as String?;
  final format = args['format'] as String;
  final selectedForms = (args['form'] as List<String>)
      .where((value) => value.trim().isNotEmpty)
      .toSet();
  final maxStrings = int.tryParse(args['max-strings'] as String? ?? '40') ?? 40;
  final maxRecords = int.tryParse(args['max-records'] as String? ?? '12') ?? 12;
  final includeRawStrings = args['include-raw-strings'] as bool;

  final db = await AccessDatabase.openPath(accdbPath, password: password);
  try {
    final catalog =
        AccessCatalog(format: db.format, pageChannel: db.pageChannel);
    final model = await catalog.read(db.info.path);

    final analysis = AccessAnalysis();
    await analysis.extractFromDatabase(db);

    final storageMetadata = await _readFormStorageMetadata(
      db: db,
      catalogFormNames:
          model.forms.map((entry) => entry.name).toList(growable: false),
    );

    final forms = analysis.forms.where((form) {
      return selectedForms.isEmpty || selectedForms.contains(form.name);
    }).toList(growable: false)
      ..sort((left, right) => left.name.compareTo(right.name));

    if (forms.isEmpty) {
      stderr
          .writeln('Nenhum formulario encontrado para os filtros informados.');
      exitCode = 2;
      return;
    }

    final report = <String, dynamic>{
      'generatedAt': DateTime.now().toIso8601String(),
      'accdbPath': File(accdbPath).absolute.path,
      'formsAnalyzed': forms.length,
      'storageFormsMapped': storageMetadata.length,
      'forms': forms
          .map(
            (form) => _buildFormReport(
              form: form,
              metadata: storageMetadata[form.name],
              maxStrings: maxStrings,
              maxRecords: maxRecords,
              includeRawStrings: includeRawStrings,
            ),
          )
          .toList(growable: false),
    };

    final outputText = format == 'json'
        ? const JsonEncoder.withIndent('  ').convert(report)
        : _renderMarkdownReport(report);

    if (outputPath == null || outputPath.trim().isEmpty) {
      stdout.writeln(outputText);
      return;
    }

    final file = File(outputPath);
    file.parent.createSync(recursive: true);
    file.writeAsStringSync(outputText);
    stdout.writeln('Relatorio salvo em: ${file.absolute.path}');
  } finally {
    db.close();
  }
}

Map<String, dynamic> _buildFormReport({
  required CanonicalForm form,
  required _FormStorageMetadata? metadata,
  required int maxStrings,
  required int maxRecords,
  required bool includeRawStrings,
}) {
  final components = Map<String, dynamic>.from(form.components);
  final controls = (components['controls'] as List<dynamic>? ??
          const <dynamic>[])
      .whereType<Map>()
      .map((entry) => Map<String, dynamic>.from(entry.cast<String, dynamic>()))
      .toList(growable: false);
  final sections = (components['sections'] as List<dynamic>? ??
          const <dynamic>[])
      .whereType<Map>()
      .map((entry) => Map<String, dynamic>.from(entry.cast<String, dynamic>()))
      .toList(growable: false);

  final parser = metadata == null ? null : BlobLayoutParser(metadata.blobBytes);
  final controlReports = controls
      .map(
        (control) => _buildControlReport(
          control: control,
          propertyMap: metadata?.propertyMap,
          parser: parser,
          maxRecords: maxRecords,
        ),
      )
      .toList(growable: false);

  return <String, dynamic>{
    'name': form.name,
    'recordSource': components['recordSource'],
    'controlCount': controlReports.length,
    'sectionCount': sections.length,
    'sections': sections.map(_compactSection).toList(growable: false),
    'controls': controlReports,
    if (metadata != null)
      'storage': <String, dynamic>{
        'blobLength': metadata.blobBytes.length,
        'typeInfoLength': metadata.typeInfoBytes.length,
        'propDataLength': metadata.propDataBytes.length,
        'defaultProperties':
            _interestingProperties(metadata.propertyMap?.defaultProperties),
        'namedPropertyCount': metadata.propertyMap?.namedProperties.length ?? 0,
        if (includeRawStrings)
          'blobStrings':
              metadata.blobStrings.take(maxStrings).toList(growable: false),
        if (includeRawStrings)
          'typeInfoStrings':
              metadata.typeInfoStrings.take(maxStrings).toList(growable: false),
      },
  };
}

Map<String, dynamic> _buildControlReport({
  required Map<String, dynamic> control,
  required AccessPropertyMapGroup? propertyMap,
  required BlobLayoutParser? parser,
  required int maxRecords,
}) {
  final name = control['name'] as String?;
  final layout = (control['layout'] is Map)
      ? Map<String, dynamic>.from(
          (control['layout'] as Map).cast<String, dynamic>())
      : const <String, dynamic>{};
  final properties = name == null
      ? const <String, Object?>{}
      : propertyMap?.forName(name) ?? const <String, Object?>{};
  final recordGroup = (name == null || parser == null)
      ? null
      : parser.findControlRecordGroup(name, maxNeighbors: maxRecords);
  final canonicalBlobGeometry = control['blobGeometry'] is Map
      ? Map<String, dynamic>.from(
          (control['blobGeometry'] as Map).cast<String, dynamic>(),
        )
      : null;
  final resolvedBlobGeometry = canonicalBlobGeometry ??
      (recordGroup == null
          ? null
          : _inferBlobGeometry(
              recordGroup,
              control['type']?.toString(),
              layout: layout,
            ));

  return <String, dynamic>{
    'name': name,
    'type': control['type'],
    'role': control['role'],
    'caption': control['caption'],
    'controlSource': control['controlSource'],
    if (layout.isNotEmpty) 'layout': layout,
    if (properties.isNotEmpty) 'properties': _interestingProperties(properties),
    if (recordGroup != null)
      'blobRecordClues': _compactBlobRecordGroup(recordGroup),
    if (resolvedBlobGeometry != null) 'blobGeometry': resolvedBlobGeometry,
    if (resolvedBlobGeometry != null)
      'blobGeometrySource':
          canonicalBlobGeometry != null ? 'canonical' : 'reverse-tool',
    if (resolvedBlobGeometry != null && layout.isNotEmpty)
      'layoutVsBlob': _compareLayoutWithBlob(
        layout,
        resolvedBlobGeometry,
      ),
  };
}

Map<String, dynamic> _compactSection(Map<String, dynamic> section) {
  final controls = (section['controls'] as List<dynamic>? ?? const <dynamic>[])
      .whereType<Map>()
      .map((entry) => entry['name'])
      .whereType<String>()
      .toList(growable: false);
  return <String, dynamic>{
    'kind': section['kind'],
    'name': section['name'],
    'controls': controls,
  };
}

Map<String, dynamic> _compactBlobRecordGroup(BlobControlRecordGroup group) {
  return <String, dynamic>{
    'matchOffset': group.matchOffset,
    'records': group.allRecords.map(_compactBlobRecord).toList(growable: false),
  };
}

Map<String, dynamic> _compactBlobRecord(BlobFieldRecord record) {
  return <String, dynamic>{
    'offset': '${record.start}..${record.end}',
    'propertyId': record.propertyId,
    'typeCode': record.typeCode,
    'valueLength': record.valueLength,
    'payloadLength': record.payloadLength,
    if (record.int16Value != null) 'int16': record.int16Value,
    if (record.int32Value != null) 'int32': record.int32Value,
    if (_isPrintableText(record.normalizedUtf16Value))
      'utf16': record.normalizedUtf16Value,
  };
}

Map<String, Object?> _interestingProperties(Map<String, Object?>? properties) {
  if (properties == null || properties.isEmpty) {
    return const <String, Object?>{};
  }

  const preferredOrder = <String>[
    'Caption',
    'ControlSource',
    'DisplayControl',
    'Section',
    'Left',
    'Top',
    'Width',
    'Height',
    'LayoutCachedLeft',
    'LayoutCachedTop',
    'LayoutCachedWidth',
    'LayoutCachedHeight',
    'ColumnStart',
    'ColumnEnd',
    'RowStart',
    'RowEnd',
    'LayoutGroup',
    'BackStyle',
    'BackColor',
    'ForeColor',
    'BorderColor',
    'BorderStyle',
    'BorderWidth',
    'SpecialEffect',
    'TextAlign',
    'FontName',
    'FontSize',
    'FontWeight',
    'FontItalic',
    'FontUnderline',
    'Visible',
    'Enabled',
    'TabIndex',
    'TabStop',
    'RowSource',
    'RowSourceType',
    'InputMask',
    'ValidationRule',
    'ValidationText',
    'Format',
    'DefaultValue',
  ];

  final result = <String, Object?>{};
  for (final name in preferredOrder) {
    final value = _readCaseInsensitive(properties, name);
    if (value != null) {
      result[name] = value;
    }
  }

  for (final entry in properties.entries) {
    result.putIfAbsent(entry.key, () => entry.value);
  }
  return result;
}

Object? _readCaseInsensitive(Map<String, Object?> properties, String name) {
  final direct = properties[name];
  if (direct != null) {
    return direct;
  }
  final target = name.toLowerCase();
  for (final entry in properties.entries) {
    if (entry.key.toLowerCase() == target) {
      return entry.value;
    }
  }
  return null;
}

Future<Map<String, _FormStorageMetadata>> _readFormStorageMetadata({
  required AccessDatabase db,
  required List<String> catalogFormNames,
}) async {
  final tableReader =
      TableReader(format: db.format, pageChannel: db.pageChannel);
  final storageId = await _findAccessStorageId(tableReader);
  if (storageId == null) {
    return const <String, _FormStorageMetadata>{};
  }

  final storageRows = await tableReader.readAllRows(storageId);
  final formNames = _resolveStorageFormNames(storageRows, catalogFormNames);
  if (formNames.isEmpty) {
    return const <String, _FormStorageMetadata>{};
  }

  final ordinalBase = _detectOrdinalBase(storageRows, formNames.length);
  final result = <String, _FormStorageMetadata>{};
  for (var index = 0; index < storageRows.length; index++) {
    final rawOrdinal =
        int.tryParse(storageRows[index]['Name']?.toString() ?? '');
    final ordinal =
        _resolveObjectOrdinal(rawOrdinal, ordinalBase, formNames.length);
    if (ordinal == null) {
      continue;
    }

    final blobBytes = _findSiblingStreamBytes(storageRows, index, 'Blob');
    if (blobBytes == null || blobBytes.isEmpty) {
      continue;
    }
    final typeInfoBytes =
        _findSiblingStreamBytes(storageRows, index, 'TypeInfo') ??
            const <int>[];
    final propDataBytes =
        _findSiblingStreamBytes(storageRows, index, 'PropData') ??
            const <int>[];
    final propertyMap = propDataBytes.isEmpty
        ? null
        : _tryReadPropertyMap(Uint8List.fromList(propDataBytes));

    result[formNames[ordinal]] = _FormStorageMetadata(
      blobBytes: Uint8List.fromList(blobBytes),
      typeInfoBytes: Uint8List.fromList(typeInfoBytes),
      propDataBytes: Uint8List.fromList(propDataBytes),
      blobStrings: _extractPrintableStrings(blobBytes).toList(growable: false),
      typeInfoStrings:
          _extractPrintableStrings(typeInfoBytes).toList(growable: false),
      propertyMap: propertyMap,
    );
  }

  return result;
}

List<String> _resolveStorageFormNames(
  List<Map<String, dynamic>> storageRows,
  List<String> catalogFormNames,
) {
  final extracted =
      _extractObjectNamesFromDirData(storageRows, catalogFormNames);
  if (extracted.isNotEmpty) {
    return extracted;
  }

  final catalog = catalogFormNames.toList(growable: false);
  if (catalog.isEmpty) {
    return const <String>[];
  }

  final candidateCount = _countStorageFormCandidates(storageRows);
  if (candidateCount == 1 && catalog.length == 1) {
    return catalog;
  }
  if (candidateCount == catalog.length) {
    return catalog;
  }
  return const <String>[];
}

int _countStorageFormCandidates(List<Map<String, dynamic>> storageRows) {
  var count = 0;
  for (var index = 0; index < storageRows.length; index++) {
    if (int.tryParse(storageRows[index]['Name']?.toString() ?? '') == null) {
      continue;
    }
    final blobBytes = _findSiblingStreamBytes(storageRows, index, 'Blob');
    if (blobBytes == null || blobBytes.isEmpty) {
      continue;
    }
    final typeInfoBytes =
        _findSiblingStreamBytes(storageRows, index, 'TypeInfo');
    final propDataBytes =
        _findSiblingStreamBytes(storageRows, index, 'PropData');
    final hasFormMetadata =
        (typeInfoBytes != null && typeInfoBytes.isNotEmpty) ||
            (propDataBytes != null && propDataBytes.isNotEmpty);
    if (hasFormMetadata) {
      count++;
    }
  }
  return count;
}

Future<int?> _findAccessStorageId(TableReader tableReader) async {
  final catalogRows = await tableReader.readAllRows(2);
  for (final row in catalogRows) {
    if (row['Name']?.toString() == 'MSysAccessStorage') {
      return row['Id'] as int?;
    }
  }
  return null;
}

List<String> _extractObjectNamesFromDirData(
  List<Map<String, dynamic>> storageRows,
  Iterable<String> catalogNames,
) {
  final catalogByKey = <String, String>{
    for (final name in catalogNames) _normalizeLookupKey(name): name,
  };
  var bestMatch = const <String>[];
  for (final row in storageRows) {
    if (row['Name']?.toString() != 'DirData') {
      continue;
    }
    final bytes = _asBytes(row['Lv']);
    if (bytes == null || bytes.isEmpty) {
      continue;
    }
    final strings = _extractPrintableStrings(bytes).toList(growable: false);
    final values = <String>[];
    final seen = <String>{};
    for (var index = 0; index < strings.length; index++) {
      final match = _matchCatalogNameAt(strings, index, catalogByKey);
      if (match == null) {
        final rawValue = strings[index];
        if (_normalizeLookupKey(rawValue).startsWith('frm') &&
            seen.add(rawValue)) {
          values.add(rawValue);
        }
        continue;
      }
      if (seen.add(match.value)) {
        values.add(match.value);
      }
      index += match.consumedParts - 1;
    }
    if (values.length > bestMatch.length) {
      bestMatch = values;
    }
  }
  return bestMatch;
}

int _detectOrdinalBase(
    List<Map<String, dynamic>> storageRows, int objectCount) {
  final ordinals = storageRows
      .map((row) => int.tryParse(row['Name']?.toString() ?? ''))
      .whereType<int>()
      .toList(growable: false);
  if (ordinals.isEmpty) {
    return 0;
  }
  if (ordinals.contains(0)) {
    return 0;
  }
  final maxOrdinal =
      ordinals.reduce((left, right) => left > right ? left : right);
  if (ordinals.every((value) => value >= 1) && maxOrdinal <= objectCount) {
    return 1;
  }
  return 0;
}

int? _resolveObjectOrdinal(int? rawOrdinal, int ordinalBase, int objectCount) {
  if (rawOrdinal == null) {
    return null;
  }
  final ordinal = rawOrdinal - ordinalBase;
  if (ordinal < 0 || ordinal >= objectCount) {
    return null;
  }
  return ordinal;
}

List<int>? _findSiblingStreamBytes(
  List<Map<String, dynamic>> storageRows,
  int markerIndex,
  String streamName,
) {
  for (var index = markerIndex + 1; index < storageRows.length; index++) {
    final name = storageRows[index]['Name']?.toString();
    if (int.tryParse(name ?? '') != null) {
      break;
    }
    if (name == streamName) {
      return _asBytes(storageRows[index]['Lv']);
    }
  }
  return null;
}

AccessPropertyMapGroup? _tryReadPropertyMap(Uint8List bytes) {
  try {
    return PropertyMapReader().read(bytes);
  } catch (_) {
    return null;
  }
}

Iterable<String> _extractPrintableStrings(List<int> bytes) sync* {
  final emitted = <String>{};

  final ascii = StringBuffer();
  for (final byte in bytes) {
    final isPrintable = byte >= 32 && byte <= 126;
    if (isPrintable) {
      ascii.writeCharCode(byte);
      continue;
    }
    if (ascii.length >= 4) {
      final value = ascii.toString();
      if (emitted.add(value)) {
        yield value;
      }
    }
    ascii.clear();
  }
  if (ascii.length >= 4) {
    final value = ascii.toString();
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

String _normalizeLookupKey(String value) {
  final buffer = StringBuffer();
  for (final codeUnit in foldToAscii(value).toLowerCase().codeUnits) {
    final isLetter = codeUnit >= 97 && codeUnit <= 122;
    final isDigit = codeUnit >= 48 && codeUnit <= 57;
    if (isLetter || isDigit) {
      buffer.writeCharCode(codeUnit);
    }
  }
  return buffer.toString();
}

_StringMatch? _matchCatalogNameAt(
  List<String> values,
  int index,
  Map<String, String> catalogByKey,
) {
  for (var parts = 3; parts >= 1; parts--) {
    if (index + parts > values.length) {
      continue;
    }
    final combined = values.sublist(index, index + parts).join();
    final resolved = _resolveCatalogName(combined, catalogByKey);
    if (resolved != null) {
      return _StringMatch(resolved, parts);
    }
  }
  return null;
}

String? _resolveCatalogName(String value, Map<String, String> catalogByKey) {
  final normalizedValue = _normalizeLookupKey(value);
  final direct = catalogByKey[normalizedValue];
  if (direct != null) {
    return direct;
  }

  String? bestMatch;
  var bestScore = 0;
  for (final entry in catalogByKey.entries) {
    final key = entry.key;
    if (key.length < 4) {
      continue;
    }
    if (!normalizedValue.startsWith(key) && !key.startsWith(normalizedValue)) {
      continue;
    }
    final score = key.length;
    if (score > bestScore) {
      bestScore = score;
      bestMatch = entry.value;
    }
  }
  return bestMatch;
}

List<int>? _asBytes(Object? value) {
  if (value is List<int>) {
    return value;
  }
  return null;
}

bool _isPrintableText(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  return value.runes.every((rune) => rune >= 32 && rune != 127);
}

Map<String, dynamic>? _inferBlobGeometry(
  BlobControlRecordGroup group,
  String? controlType, {
  Map<String, dynamic>? layout,
}) {
  final preferredBases = _preferredBlobRectangleBases(controlType);
  Map<String, dynamic>? bestPreferred;
  var bestPreferredDistance = 1 << 30;
  var bestPreferredLayoutDistance = 1 << 29;
  Map<String, dynamic>? bestFallback;
  var bestFallbackDistance = 1 << 30;
  var bestFallbackLayoutDistance = 1 << 29;
  final records = group.allRecords;
  for (var index = 0; index + 3 < records.length; index++) {
    final first = records[index];
    final second = records[index + 1];
    final third = records[index + 2];
    final fourth = records[index + 3];

    if (second.propertyId != first.propertyId + 1 ||
        third.propertyId != second.propertyId + 1 ||
        fourth.propertyId != third.propertyId + 1) {
      continue;
    }
    if (first.typeCode != 3 ||
        second.typeCode != 3 ||
        third.typeCode != 3 ||
        fourth.typeCode != 3) {
      continue;
    }

    final left = _readBlobSmallInt(first);
    final top = _readBlobSmallInt(second);
    final right = _readBlobSmallInt(third);
    final bottom = _readBlobSmallInt(fourth);
    if (left == null || top == null || right == null || bottom == null) {
      continue;
    }
    if (right < left || bottom < top) {
      continue;
    }

    final candidate = <String, dynamic>{
      'propertyBase': first.propertyId,
      'propertyRange': '${first.propertyId}..${fourth.propertyId}',
      'source':
          preferredBases.contains(first.propertyId) ? 'preferred' : 'fallback',
      'left': left,
      'top': top,
      'right': right,
      'bottom': bottom,
      'width': right - left,
      'height': bottom - top,
    };
    final distance =
        _distanceToMatch(group.matchOffset, first.start, fourth.end);
    final layoutDistance = _layoutDistance(layout, candidate);
    if (preferredBases.contains(first.propertyId)) {
      if (layoutDistance < bestPreferredLayoutDistance ||
          (layoutDistance == bestPreferredLayoutDistance &&
              distance < bestPreferredDistance)) {
        bestPreferredLayoutDistance = layoutDistance;
        bestPreferredDistance = distance;
        bestPreferred = candidate;
      }
    } else if (layoutDistance < bestFallbackLayoutDistance ||
        (layoutDistance == bestFallbackLayoutDistance &&
            distance < bestFallbackDistance)) {
      bestFallbackLayoutDistance = layoutDistance;
      bestFallbackDistance = distance;
      bestFallback = candidate;
    }
  }
  if (controlType == 'OptionGroup') {
    return bestPreferred;
  }
  return bestPreferred ?? bestFallback;
}

int _distanceToMatch(int matchOffset, int start, int end) {
  if (matchOffset >= start && matchOffset <= end) {
    return 0;
  }
  final distanceToStart = (matchOffset - start).abs();
  final distanceToEnd = (matchOffset - end).abs();
  return distanceToStart < distanceToEnd ? distanceToStart : distanceToEnd;
}

int _layoutDistance(
  Map<String, dynamic>? layout,
  Map<String, dynamic> candidate,
) {
  if (layout == null || layout.isEmpty) {
    return 1 << 29;
  }
  var score = 0;
  var matchedAxis = 0;
  for (final key in const <String>['left', 'top', 'width', 'height']) {
    final layoutValue = _asComparableInt(layout[key]);
    final candidateValue = _asComparableInt(candidate[key]);
    if (layoutValue == null || candidateValue == null) {
      continue;
    }
    matchedAxis++;
    score += (layoutValue - candidateValue).abs();
  }
  if (matchedAxis == 0) {
    return 1 << 29;
  }
  return score;
}

Set<int> _preferredBlobRectangleBases(String? controlType) {
  switch (controlType) {
    case 'TextBox':
      return const <int>{302};
    case 'ComboBox':
      return const <int>{310};
    case 'CheckBox':
    case 'CommandButton':
      return const <int>{293};
    case 'Label':
      return const <int>{282};
    default:
      return const <int>{};
  }
}

int? _readBlobSmallInt(BlobFieldRecord record) {
  if (record.payload.length < 4) {
    return null;
  }
  return ByteData.sublistView(record.payload).getUint16(
    record.payload.length - 2,
    Endian.little,
  );
}

Map<String, dynamic>? _compareLayoutWithBlob(
  Map<String, dynamic> layout,
  Map<String, dynamic>? blobGeometry,
) {
  if (blobGeometry == null) {
    return null;
  }
  final comparisons = <String, dynamic>{};
  for (final key in const <String>['left', 'top', 'width', 'height']) {
    final layoutValue = _asComparableInt(layout[key]);
    final blobValue = _asComparableInt(blobGeometry[key]);
    if (layoutValue == null || blobValue == null) {
      continue;
    }
    comparisons[key] = <String, dynamic>{
      'layout': layoutValue,
      'blob': blobValue,
      'matches': layoutValue == blobValue,
    };
  }
  if (comparisons.isEmpty) {
    return null;
  }
  comparisons['allMatch'] = comparisons.values
      .whereType<Map<String, dynamic>>()
      .every((entry) => entry['matches'] == true);
  return comparisons;
}

int? _asComparableInt(Object? value) {
  if (value is int) {
    return value;
  }
  if (value is num) {
    return value.toInt();
  }
  if (value is String) {
    return int.tryParse(value);
  }
  return null;
}

String _renderMarkdownReport(Map<String, dynamic> report) {
  final buffer = StringBuffer();
  final forms = (report['forms'] as List<dynamic>? ?? const <dynamic>[])
      .whereType<Map>()
      .map((entry) => Map<String, dynamic>.from(entry.cast<String, dynamic>()))
      .toList(growable: false);

  buffer.writeln('# Relatorio Reverso de Formularios Access');
  buffer.writeln();
  buffer.writeln('- arquivo: `${report['accdbPath']}`');
  buffer.writeln('- gerado em: `${report['generatedAt']}`');
  buffer.writeln('- formularios analisados: `${report['formsAnalyzed']}`');
  buffer.writeln(
      '- formularios mapeados em `MSysAccessStorage`: `${report['storageFormsMapped']}`');
  buffer.writeln();

  for (final form in forms) {
    buffer.writeln('## Formulario `${form['name']}`');
    buffer.writeln();
    if (form['recordSource'] != null) {
      buffer.writeln('- `RecordSource`: `${form['recordSource']}`');
    }
    buffer.writeln('- controles: `${form['controlCount']}`');
    buffer.writeln('- secoes: `${form['sectionCount']}`');

    final storage = form['storage'];
    if (storage is Map) {
      final storageMap =
          Map<String, dynamic>.from(storage.cast<String, dynamic>());
      buffer.writeln('- `Blob`: `${storageMap['blobLength']}` bytes');
      buffer.writeln('- `TypeInfo`: `${storageMap['typeInfoLength']}` bytes');
      buffer.writeln('- `PropData`: `${storageMap['propDataLength']}` bytes');

      final defaultProperties = storageMap['defaultProperties'];
      if (defaultProperties is Map && defaultProperties.isNotEmpty) {
        buffer.writeln('- propriedades default relevantes:');
        for (final entry in defaultProperties.entries) {
          buffer.writeln('  - `${entry.key}` = `${entry.value}`');
        }
      }
    }
    buffer.writeln();

    final sections = (form['sections'] as List<dynamic>? ?? const <dynamic>[])
        .whereType<Map>()
        .map(
            (entry) => Map<String, dynamic>.from(entry.cast<String, dynamic>()))
        .toList(growable: false);
    if (sections.isNotEmpty) {
      buffer.writeln('### Secoes');
      buffer.writeln();
      for (final section in sections) {
        final controlNames =
            (section['controls'] as List<dynamic>? ?? const <dynamic>[])
                .whereType<String>()
                .toList(growable: false);
        final suffix =
            controlNames.isEmpty ? '' : ' -> `${controlNames.join('`, `')}`';
        buffer.writeln('- `${section['kind']}` / `${section['name']}`$suffix');
      }
      buffer.writeln();
    }

    final controls = (form['controls'] as List<dynamic>? ?? const <dynamic>[])
        .whereType<Map>()
        .map(
            (entry) => Map<String, dynamic>.from(entry.cast<String, dynamic>()))
        .toList(growable: false);
    if (controls.isNotEmpty) {
      buffer.writeln('### Controles');
      buffer.writeln();
      for (final control in controls) {
        buffer.writeln('- `${control['name']}` tipo `${control['type']}`');
        if (control['caption'] != null) {
          buffer.writeln('  caption: `${control['caption']}`');
        }
        if (control['controlSource'] != null) {
          buffer.writeln('  source: `${control['controlSource']}`');
        }
        if (control['layout'] is Map && (control['layout'] as Map).isNotEmpty) {
          final layout = (control['layout'] as Map)
              .entries
              .map((entry) => '${entry.key}=${entry.value}')
              .join(', ');
          buffer.writeln('  layout: `$layout`');
        }
        if (control['properties'] is Map &&
            (control['properties'] as Map).isNotEmpty) {
          final props = (control['properties'] as Map)
              .entries
              .map((entry) => '${entry.key}=${entry.value}')
              .join(', ');
          buffer.writeln('  propriedades: `$props`');
        }
        if (control['blobRecordClues'] is Map) {
          final blob = Map<String, dynamic>.from(
            (control['blobRecordClues'] as Map).cast<String, dynamic>(),
          );
          buffer.writeln('  match blob: `${blob['matchOffset']}`');
          final records =
              (blob['records'] as List<dynamic>? ?? const <dynamic>[])
                  .whereType<Map>()
                  .take(4)
                  .map((entry) =>
                      Map<String, dynamic>.from(entry.cast<String, dynamic>()))
                  .toList(growable: false);
          for (final record in records) {
            final hints = <String>[
              'propertyId=${record['propertyId']}',
              'typeCode=${record['typeCode']}',
              if (record['int16'] != null) 'int16=${record['int16']}',
              if (record['int32'] != null) 'int32=${record['int32']}',
              if (record['utf16'] != null) 'utf16=${record['utf16']}',
            ].join(', ');
            buffer.writeln('  blob record: `${record['offset']}` $hints');
          }
        }
        if (control['blobGeometry'] is Map) {
          final blobGeometry = Map<String, dynamic>.from(
            (control['blobGeometry'] as Map).cast<String, dynamic>(),
          );
          final geometrySource = control['blobGeometrySource'];
          buffer.writeln(
            '  blob geometry: `${blobGeometry['propertyRange']}` ${blobGeometry['source']} left=${blobGeometry['left']} top=${blobGeometry['top']} width=${blobGeometry['width']} height=${blobGeometry['height']}${geometrySource == null ? '' : ' source=$geometrySource'}',
          );
        }
        if (control['layoutVsBlob'] is Map) {
          final layoutVsBlob = Map<String, dynamic>.from(
            (control['layoutVsBlob'] as Map).cast<String, dynamic>(),
          );
          buffer.writeln(
              '  layout x blob: `allMatch=${layoutVsBlob['allMatch']}`');
        }
      }
      buffer.writeln();
    }

    if (storage is Map) {
      final storageMap =
          Map<String, dynamic>.from(storage.cast<String, dynamic>());
      final blobStrings =
          (storageMap['blobStrings'] as List<dynamic>? ?? const <dynamic>[])
              .whereType<String>()
              .toList(growable: false);
      if (blobStrings.isNotEmpty) {
        buffer.writeln('### Strings Blob');
        buffer.writeln();
        for (final value in blobStrings) {
          buffer.writeln('- `$value`');
        }
        buffer.writeln();
      }
      final typeInfoStrings =
          (storageMap['typeInfoStrings'] as List<dynamic>? ?? const <dynamic>[])
              .whereType<String>()
              .toList(growable: false);
      if (typeInfoStrings.isNotEmpty) {
        buffer.writeln('### Strings TypeInfo');
        buffer.writeln();
        for (final value in typeInfoStrings) {
          buffer.writeln('- `$value`');
        }
        buffer.writeln();
      }
    }
  }

  return buffer.toString().trimRight();
}

final class _FormStorageMetadata {
  final Uint8List blobBytes;
  final Uint8List typeInfoBytes;
  final Uint8List propDataBytes;
  final List<String> blobStrings;
  final List<String> typeInfoStrings;
  final AccessPropertyMapGroup? propertyMap;

  const _FormStorageMetadata({
    required this.blobBytes,
    required this.typeInfoBytes,
    required this.propDataBytes,
    required this.blobStrings,
    required this.typeInfoStrings,
    required this.propertyMap,
  });
}

final class _StringMatch {
  final String value;
  final int consumedParts;

  const _StringMatch(this.value, this.consumedParts);
}
