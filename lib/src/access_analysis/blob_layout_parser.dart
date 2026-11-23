import 'dart:typed_data';

import 'package:xml/xml.dart';

class BlobFieldRecord {
  final int start;
  final int end;
  final int propertyId;
  final int valueLength;
  final int typeCode;
  final int flags;
  final int reserved;
  final int declaredPayloadLength;
  final int payloadLength;
  final Uint8List payload;

  const BlobFieldRecord({
    required this.start,
    required this.end,
    required this.propertyId,
    required this.valueLength,
    required this.typeCode,
    required this.flags,
    required this.reserved,
    required this.declaredPayloadLength,
    required this.payloadLength,
    required this.payload,
  });

  int get payloadStart => start + 16;

  String? get utf16Value {
    if (payload.isEmpty || (payload.length % 2) != 0) {
      return null;
    }
    final units = <int>[];
    for (var index = 0; index < payload.length; index += 2) {
      units.add(payload[index] | (payload[index + 1] << 8));
    }
    return String.fromCharCodes(units);
  }

  String? get normalizedUtf16Value {
    final value = utf16Value;
    if (value == null) {
      return null;
    }
    return value.replaceFirst(RegExp(r'^\u0000+'), '');
  }

  int? get int16Value {
    if (payload.length < 2) {
      return null;
    }
    return ByteData.sublistView(payload).getInt16(0, Endian.little);
  }

  int? get int32Value {
    if (payload.length < 4) {
      return null;
    }
    return ByteData.sublistView(payload).getInt32(0, Endian.little);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'start': start,
      'end': end,
      'propertyId': propertyId,
      'valueLength': valueLength,
      'typeCode': typeCode,
      'flags': flags,
      'reserved': reserved,
      'declaredPayloadLength': declaredPayloadLength,
      'payloadLength': payloadLength,
      'utf16Value': utf16Value,
      'int16Value': int16Value,
      'int32Value': int32Value,
      'payloadHex': payload
          .map((byte) => byte.toRadixString(16).padLeft(2, '0').toUpperCase())
          .join(' '),
    };
  }
}

class BlobControlRecordGroup {
  final String controlName;
  final int matchOffset;
  final BlobFieldRecord nameRecord;
  final List<BlobFieldRecord> previousRecords;
  final List<BlobFieldRecord> nextRecords;

  const BlobControlRecordGroup({
    required this.controlName,
    required this.matchOffset,
    required this.nameRecord,
    required this.previousRecords,
    required this.nextRecords,
  });

  List<BlobFieldRecord> get allRecords => <BlobFieldRecord>[
        ...previousRecords,
        nameRecord,
        ...nextRecords,
      ];
}

class BlobLayoutParser {
  final Uint8List bytes;

  const BlobLayoutParser(this.bytes);

  BlobFieldRecord? tryParseRecordAt(int offset) {
    if (offset < 0 || offset + 16 > bytes.length) {
      return null;
    }

    final data = ByteData.sublistView(bytes, offset);
    final propertyId = data.getUint32(0, Endian.little);
    final valueLength = data.getUint16(4, Endian.little);
    final typeCode = data.getUint16(6, Endian.little);
    final flags = data.getUint32(8, Endian.little);
    final reserved = data.getUint16(12, Endian.little);
    final declaredPayloadLength = data.getUint16(14, Endian.little);

    if (propertyId == 0 || propertyId > 0x4000) {
      return null;
    }
    if (valueLength == 0 || valueLength > 0x4000) {
      return null;
    }
    if (typeCode == 0 || typeCode > 0x40) {
      return null;
    }
    if (flags > 0x01000000) {
      return null;
    }
    final payloadLength = declaredPayloadLength + _extraPayloadBytes(typeCode);
    final end = offset + 16 + payloadLength;
    if (end > bytes.length) {
      return null;
    }

    final payload = Uint8List.sublistView(bytes, offset + 16, end);
    return BlobFieldRecord(
      start: offset,
      end: end,
      propertyId: propertyId,
      valueLength: valueLength,
      typeCode: typeCode,
      flags: flags,
      reserved: reserved,
      declaredPayloadLength: declaredPayloadLength,
      payloadLength: payloadLength,
      payload: payload,
    );
  }

  int _extraPayloadBytes(int typeCode) {
    switch (typeCode) {
      case 0x0A:
      case 0x0C:
        return 2;
      default:
        return 0;
    }
  }

  BlobControlRecordGroup? findControlRecordGroup(
    String controlName, {
    int searchBackWindow = 24,
    int maxNeighbors = 10,
    int gapWindow = 24,
  }) {
    final pattern = _utf16le(controlName);
    for (final matchOffset in _findPatternOffsets(pattern)) {
      BlobFieldRecord? nameRecord;
      final minOffset = (matchOffset - searchBackWindow).clamp(0, bytes.length);
      for (var offset = matchOffset; offset >= minOffset; offset--) {
        final record = tryParseRecordAt(offset);
        if (record == null) {
          continue;
        }
        if (record.payloadLength < pattern.length) {
          continue;
        }
        final payloadRelativeOffset = matchOffset - record.payloadStart;
        if (payloadRelativeOffset < 0) {
          continue;
        }
        if (payloadRelativeOffset + pattern.length > record.payload.length) {
          continue;
        }
        if (_matchesBytes(
          Uint8List.sublistView(
            record.payload,
            payloadRelativeOffset,
            payloadRelativeOffset + pattern.length,
          ),
          pattern,
        )) {
          if (record.normalizedUtf16Value != controlName) {
            continue;
          }
          nameRecord = record;
          break;
        }
      }
      if (nameRecord == null) {
        continue;
      }

      return BlobControlRecordGroup(
        controlName: controlName,
        matchOffset: matchOffset,
        nameRecord: nameRecord,
        previousRecords:
            _collectPrevious(nameRecord.start, maxNeighbors, gapWindow),
        nextRecords: _collectNext(nameRecord.end, maxNeighbors, gapWindow),
      );
    }
    return null;
  }

  List<BlobFieldRecord> _collectPrevious(int cursor, int maxNeighbors, int gapWindow) {
    final records = <BlobFieldRecord>[];
    var endCursor = cursor;
    while (records.length < maxNeighbors && endCursor > 0) {
      BlobFieldRecord? best;
      final startWindow = (endCursor - gapWindow - 64).clamp(0, bytes.length);
      final endWindow = endCursor - 1;
      for (var offset = endWindow; offset >= startWindow; offset--) {
        final record = tryParseRecordAt(offset);
        if (record == null) {
          continue;
        }
        if (record.end > endCursor) {
          continue;
        }
        if ((endCursor - record.end) > gapWindow) {
          continue;
        }
        best = record;
        break;
      }
      if (best == null) {
        break;
      }
      records.insert(0, best);
      endCursor = best.start;
    }
    return records;
  }

  List<BlobFieldRecord> _collectNext(int cursor, int maxNeighbors, int gapWindow) {
    final records = <BlobFieldRecord>[];
    var startCursor = cursor;
    while (records.length < maxNeighbors && startCursor < bytes.length) {
      BlobFieldRecord? best;
      final endWindow = (startCursor + gapWindow + 64).clamp(0, bytes.length);
      for (var offset = startCursor; offset < endWindow; offset++) {
        final record = tryParseRecordAt(offset);
        if (record == null) {
          continue;
        }
        if ((record.start - startCursor) > gapWindow) {
          continue;
        }
        best = record;
        break;
      }
      if (best == null) {
        break;
      }
      records.add(best);
      startCursor = best.end;
    }
    return records;
  }

  Iterable<int> _findPatternOffsets(List<int> pattern) sync* {
    if (pattern.isEmpty || pattern.length > bytes.length) {
      return;
    }
    for (var index = 0; index <= bytes.length - pattern.length; index++) {
      if (_matchesBytes(Uint8List.sublistView(bytes, index, index + pattern.length), pattern)) {
        yield index;
      }
    }
  }

  bool _matchesBytes(List<int> bytes, List<int> pattern) {
    if (bytes.length != pattern.length) {
      return false;
    }
    for (var index = 0; index < pattern.length; index++) {
      if (bytes[index] != pattern[index]) {
        return false;
      }
    }
    return true;
  }

  List<int> _utf16le(String value) {
    final bytes = <int>[];
    for (final codeUnit in value.codeUnits) {
      bytes
        ..add(codeUnit & 0xFF)
        ..add((codeUnit >> 8) & 0xFF);
    }
    return bytes;
  }
}


/// Parses an MSysAccessStorage `DirData` stream into an `(ordinal -> objectName)` map.
///
/// Format verified across Access ACCDB storages: 4-byte LE header followed by
/// repeated records `[tag=0x04][len][UTF-16LE name (len - 4 bytes)][u32 ordinal]`.
Map<int, String> parseAccessDirData(Uint8List bytes) {
  final result = <int, String>{};
  if (bytes.length < 4) return result;
  var pos = 4;
  while (pos + 2 <= bytes.length) {
    final prevPos = pos;
    final tag = bytes[pos];
    final len = bytes[pos + 1];
    if (tag != 0x04 || len < 4 || pos + 2 + len > bytes.length) {
      break;
    }
    final nameLen = len - 4;
    final name = _decodeUtf16LeSlice(bytes, pos + 2, nameLen);
    final ord = _readUint32Le(bytes, pos + 2 + nameLen);
    if (name.isNotEmpty) {
      result[ord] = name;
    }
    pos += 2 + len;
    if (pos <= prevPos) break;
  }
  return result;
}

class AccessBlobProperty {
  final int propertyId;
  final int typeCode;
  final Uint8List payload;

  const AccessBlobProperty({
    required this.propertyId,
    required this.typeCode,
    required this.payload,
  });

  String? get stringValue {
    if (typeCode != 0x0A && typeCode != 0x0C) return null;
    return _decodeUtf16LeSlice(payload, 0, payload.length);
  }

  int? get intValue {
    if (typeCode == 3 && payload.length == 2) {
      return ByteData.sublistView(payload).getInt16(0, Endian.little);
    }
    if (typeCode == 4 && payload.length == 4) {
      return ByteData.sublistView(payload).getInt32(0, Endian.little);
    }
    if ((typeCode == 1 || typeCode == 2) && payload.isNotEmpty) {
      return payload[0];
    }
    return null;
  }
}

class AccessBlobObject {
  final int objectType;
  final List<AccessBlobProperty> properties;

  const AccessBlobObject({
    required this.objectType,
    required this.properties,
  });

  AccessBlobProperty? prop(int id) {
    for (final p in properties) {
      if (p.propertyId == id) return p;
    }
    return null;
  }

  String? str(int id) => prop(id)?.stringValue;
  int? numVal(int id) => prop(id)?.intValue;
  bool hasFlag(int id) => prop(id) != null;
}

class AccessDecodedUiBlob {
  final bool isReport;
  final String? recordSource;
  final String? caption;
  final Map<String, String> properties;
  final Map<String, Map<String, String>> controlDefaults;
  final List<Map<String, dynamic>> groupLevels;
  final List<Map<String, dynamic>> sections;
  final List<Map<String, dynamic>> controls;
  final bool hasEventsOrMacros;

  const AccessDecodedUiBlob({
    required this.isReport,
    required this.recordSource,
    required this.caption,
    required this.properties,
    required this.controlDefaults,
    required this.groupLevels,
    required this.sections,
    required this.controls,
    required this.hasEventsOrMacros,
  });
}

/// Decodes a binary MSysAccessStorage Form/Report `Blob` stream into structured
/// properties, control defaults, group levels, sections and controls.
AccessDecodedUiBlob? parseAccessUiBlob(
  Uint8List bytes, {
  required bool isReport,
}) {
  if (bytes.length < 10) return null;
  final rootType = _readUint16Le(bytes, 8);
  if (rootType != 150 && rootType != 151) return null;

  final objects = <AccessBlobObject>[];
  var pos = 10;
  var expectingCount = false;
  var seenObjects = 0;

  while (pos < bytes.length && objects.length < 10000) {
    final outerPrev = pos;
    if (expectingCount) {
      if (pos + 2 > bytes.length) break;
      pos += 2;
      expectingCount = false;
      continue;
    }

    var objType = seenObjects == 0 ? rootType : 0;
    if (seenObjects > 0) {
      if (pos + 4 <= bytes.length) {
        final marker = _readUint32Le(bytes, pos);
        if (marker == 0x00FD || marker == 0x00FE || marker == 0x00FF) {
          pos += 4;
          if (marker == 0x00FF) expectingCount = true;
          continue;
        }
      }
      if (pos + 2 > bytes.length) break;
      objType = _readUint16Le(bytes, pos);
      pos += 2;
    }
    seenObjects++;

    final props = <AccessBlobProperty>[];
    while (pos < bytes.length && props.length < 2000) {
      final innerPrev = pos;
      if (pos + 4 > bytes.length) break;
      final pid = _readUint32Le(bytes, pos);
      if (pid == 0x00FD || pid == 0x00FE || pid == 0x00FF) {
        pos += 4;
        if (pid == 0x00FF) expectingCount = true;
        break;
      }
      if (pos + 18 > bytes.length) return null;
      final tc = _readUint16Le(bytes, pos + 6);
      final unk2 = _readUint16Le(bytes, pos + 8);
      final payloadLen = _readUint32Le(bytes, pos + 14);
      if (tc == 0 ||
          tc > 100 ||
          (unk2 != 0 && unk2 != 1 && unk2 != 2) ||
          pos + 18 + payloadLen > bytes.length) {
        return null;
      }
      props.add(AccessBlobProperty(
        propertyId: pid,
        typeCode: tc,
        payload: Uint8List.sublistView(bytes, pos + 18, pos + 18 + payloadLen),
      ));
      pos += 18 + payloadLen;
      if (pos <= innerPrev) return null;
    }
    objects.add(AccessBlobObject(objectType: objType, properties: props));
    if (pos <= outerPrev) break;
  }

  if (objects.isEmpty) return null;
  final root = objects.first;
  final rootProps = <String, String>{};
  final width = root.numVal(99);
  if (width != null && width > 0) rootProps['Width'] = '$width';
  final recordSource = root.str(220)?.trim();
  if (recordSource != null && recordSource.isNotEmpty) {
    rootProps['RecordSource'] = recordSource;
  }
  final caption = root.str(221);
  if (caption != null && caption.isNotEmpty) {
    rootProps['Caption'] = caption;
  }
  final filter = root.str(195)?.trim();
  if (filter != null && filter.isNotEmpty) {
    rootProps['Filter'] = filter;
  }
  if (!isReport) {
    if (root.hasFlag(17)) rootProps['AllowDeletions'] = 'NotDefault';
    if (root.hasFlag(21)) rootProps['AllowAdditions'] = 'NotDefault';
    if (root.hasFlag(26)) rootProps['AllowEdits'] = 'NotDefault';
  }
  var hasEventsOrMacros = false;
  for (final p in root.properties) {
    final s = p.stringValue;
    if (s == '[Event Procedure]' || s == '[Embedded Macro]') {
      hasEventsOrMacros = true;
    }
  }

  final controlDefaults = <String, Map<String, String>>{};
  final groupLevels = <Map<String, dynamic>>[];
  final sections = <Map<String, dynamic>>[];
  final allControls = <Map<String, dynamic>>[];
  Map<String, dynamic>? currentSection;
  var seenSection = false;

  for (var i = 1; i < objects.length; i++) {
    final obj = objects[i];
    final ot = obj.objectType;

    if (ot == 159) {
      final glSource = obj.str(220)?.trim();
      if (glSource != null && glSource.isNotEmpty) {
        final glProps = <String, String>{'ControlSource': glSource};
        if (obj.hasFlag(0)) glProps['SortOrder'] = 'NotDefault';
        if (obj.hasFlag(1)) glProps['GroupHeader'] = 'NotDefault';
        if (obj.hasFlag(2)) glProps['GroupFooter'] = 'NotDefault';
        final groupOn = obj.numVal(49);
        if (groupOn != null && groupOn != 0) glProps['GroupOn'] = '$groupOn';
        groupLevels.add(<String, dynamic>{
          'controlSource': glSource,
          if (obj.hasFlag(0)) 'sortOrder': 'NotDefault',
          if (obj.hasFlag(1)) 'groupHeader': 'NotDefault',
          if (obj.hasFlag(2)) 'groupFooter': 'NotDefault',
          'properties': glProps,
        });
      }
      continue;
    }

    final secType = _sectionTypeName(ot, isReport: isReport);
    if (secType != null) {
      seenSection = true;
      final secHeight = obj.numVal(96) ?? 0;
      final secName = obj.str(223) ?? secType;
      final secProps = <String, String>{'Height': '$secHeight'};
      final backColor = obj.numVal(267);
      if (backColor != null) secProps['BackColor'] = '$backColor';
      currentSection = <String, dynamic>{
        'type': secType,
        'name': secName,
        'height': secHeight,
        'properties': secProps,
        'controls': <Map<String, dynamic>>[],
      };
      sections.add(currentSection);
      continue;
    }

    final ctrlType = _controlTypeName(ot);
    if (ctrlType == null) continue;

    final cProps = _decodeControlProperties(obj, ctrlType);
    if (!seenSection) {
      controlDefaults[ctrlType] = cProps;
      continue;
    }

    final ctrlName = obj.str(220)?.trim() ?? '';
    if (ctrlName.isEmpty || ctrlName.startsWith('zecEmptyCell')) continue;

    final emMacroSteps = _decodeControlEmbeddedMacro(obj);
    final ctrlMap = <String, dynamic>{
      'type': ctrlType,
      'name': ctrlName,
      if (cProps['Caption'] != null) 'caption': cProps['Caption'],
      if (cProps['ControlSource'] != null) 'controlSource': cProps['ControlSource'],
      if (cProps['SourceObject'] != null) 'sourceObject': cProps['SourceObject'],
      if (cProps['LinkMasterFields'] != null) 'linkMasterFields': cProps['LinkMasterFields'],
      if (cProps['LinkChildFields'] != null) 'linkChildFields': cProps['LinkChildFields'],
      if (cProps['Left'] != null) 'left': int.tryParse(cProps['Left']!),
      if (cProps['Top'] != null) 'top': int.tryParse(cProps['Top']!),
      if (cProps['Width'] != null) 'width': int.tryParse(cProps['Width']!),
      if (cProps['Height'] != null) 'height': int.tryParse(cProps['Height']!),
      if (currentSection != null) 'section': currentSection['name'],
      if (emMacroSteps != null && emMacroSteps.isNotEmpty)
        'macroDefinitions': <String, dynamic>{'OnClickEmMacro': emMacroSteps},
      'properties': cProps,
    };
    allControls.add(ctrlMap);
    if (currentSection != null) {
      (currentSection['controls'] as List<Map<String, dynamic>>).add(ctrlMap);
    }
  }

  return AccessDecodedUiBlob(
    isReport: isReport,
    recordSource: (recordSource != null && recordSource.isNotEmpty) ? recordSource : null,
    caption: (caption != null && caption.isNotEmpty) ? caption : null,
    properties: rootProps,
    controlDefaults: controlDefaults,
    groupLevels: groupLevels,
    sections: sections,
    controls: allControls,
    hasEventsOrMacros: hasEventsOrMacros,
  );
}

String? _sectionTypeName(int objectType, {required bool isReport}) {
  switch (objectType) {
    case 152:
      return 'Section';
    case 153:
      return isReport ? 'ReportHeader' : 'FormHeader';
    case 154:
      return isReport ? 'ReportFooter' : 'FormFooter';
    case 155:
      return 'PageHeader';
    case 156:
      return 'PageFooter';
    case 157:
      return 'BreakHeader';
    case 158:
      return 'BreakFooter';
    default:
      return null;
  }
}

String? _controlTypeName(int objectType) {
  switch (objectType) {
    case 100:
      return 'Label';
    case 101:
      return 'Rectangle';
    case 102:
      return 'Line';
    case 103:
      return 'Image';
    case 104:
      return 'CommandButton';
    case 105:
      return 'OptionButton';
    case 106:
      return 'CheckBox';
    case 107:
      return 'OptionGroup';
    case 108:
      return 'BoundObjectFrame';
    case 109:
      return 'TextBox';
    case 110:
      return 'ListBox';
    case 111:
      return 'ComboBox';
    case 112:
      return 'Subform';
    case 114:
      return 'ObjectFrame';
    case 118:
      return 'PageBreak';
    case 122:
      return 'ToggleButton';
    case 123:
      return 'Tab';
    case 124:
      return 'Page';
    case 126:
      return 'Attachment';
    case 127:
      return 'EmptyCell';
    default:
      return null;
  }
}

Map<String, String> _decodeControlProperties(
  AccessBlobObject obj,
  String ctrlType,
) {
  final props = <String, String>{};
  void setInt(String key, int pid) {
    final v = obj.numVal(pid);
    if (v != null) props[key] = '$v';
  }
  void setStr(String key, int pid) {
    final v = obj.str(pid);
    if (v != null && v.isNotEmpty) props[key] = v;
  }

  final name = obj.str(220);
  if (name != null && name.isNotEmpty) props['Name'] = name;

  if (ctrlType == 'ComboBox') {
    setInt('Left', 99);
    setInt('Top', 100);
    setInt('Width', 101);
    setInt('Height', 102);
    setStr('ControlSource', 221);
    setStr('RowSourceType', 222);
    setStr('RowSource', 223);
    setStr('ColumnWidths', 224);
    setStr('FontName', 234);
    setStr('Format', 250);
  } else if (ctrlType == 'ListBox') {
    setInt('Left', 97);
    setInt('Top', 98);
    setInt('Width', 99);
    setInt('Height', 100);
    setStr('ControlSource', 221);
    setStr('RowSourceType', 222);
    setStr('RowSource', 223);
    setStr('FontName', 234);
  } else if (ctrlType == 'Subform') {
    setInt('Left', 96);
    setInt('Top', 97);
    setInt('Width', 98);
    setInt('Height', 99);
    setStr('SourceObject', 221);
    setStr('LinkChildFields', 222);
    setStr('LinkMasterFields', 223);
  } else if (ctrlType == 'Label') {
    setInt('Left', 96);
    setInt('Top', 97);
    setInt('Width', 98);
    setInt('Height', 99);
    setInt('FontSize', 100);
    setInt('FontWeight', 101);
    setInt('BackStyle', 50);
    setInt('TextAlign', 51);
    setInt('BackColor', 156);
    setInt('BorderColor', 268);
    setStr('Caption', 221);
    setStr('FontName', 222);
  } else if (ctrlType == 'TextBox') {
    setInt('Left', 96);
    setInt('Top', 97);
    setInt('Width', 98);
    setInt('Height', 99);
    setInt('FontSize', 105);
    setInt('FontWeight', 106);
    setInt('BackColor', 156);
    setInt('BorderColor', 272);
    setStr('ControlSource', 221);
    setStr('Format', 222);
    setStr('FontName', 232);
  } else if (ctrlType == 'Image') {
    setInt('Left', 96);
    setInt('Top', 97);
    setInt('Width', 98);
    setInt('Height', 99);
    setInt('PictureType', 56);
    setInt('BorderColor', 157);
    setStr('Picture', 232);
  } else if (ctrlType == 'CommandButton' || ctrlType == 'ToggleButton' || ctrlType == 'Page') {
    setInt('Left', 96);
    setInt('Top', 97);
    setInt('Width', 98);
    setInt('Height', 99);
    setStr('Caption', 221);
    setStr('FontName', 228);
  } else if (ctrlType == 'Rectangle' || ctrlType == 'Line') {
    setInt('Left', 96);
    setInt('Top', 97);
    setInt('Width', 98);
    setInt('Height', 99);
    setInt('BackStyle', 50);
    setInt('BorderColor', 157);
  } else {
    setInt('Left', 96);
    setInt('Top', 97);
    setInt('Width', 98);
    setInt('Height', 99);
    setStr('ControlSource', 221);
  }

  return props;
}

int _readUint16Le(Uint8List b, int o) => b[o] | (b[o + 1] << 8);
int _readUint32Le(Uint8List b, int o) =>
    b[o] | (b[o + 1] << 8) | (b[o + 2] << 16) | (b[o + 3] << 24);
String _decodeUtf16LeSlice(Uint8List bytes, int start, int length) {
  if (length <= 0 || start < 0 || start + length > bytes.length) return '';
  final units = <int>[];
  for (var i = 0; i + 1 < length; i += 2) {
    final unit = bytes[start + i] | (bytes[start + i + 1] << 8);
    if (unit != 0) units.add(unit);
  }
  return String.fromCharCodes(units);
}


List<Map<String, dynamic>>? _decodeControlEmbeddedMacro(AccessBlobObject obj) {
  for (final prop in obj.properties) {
    if (prop.propertyId != 275 || prop.payload.length < 20) continue;
    final xmlText = _extractAxlXmlFromPayload(prop.payload);
    if (xmlText == null) continue;
    try {
      final doc = XmlDocument.parse(xmlText);
      final root = doc.rootElement;
      final statements = root.findElements('Statements').firstOrNull;
      if (statements == null) return null;
      final steps = <Map<String, dynamic>>[];
      _collectAxlStatements(statements, steps);
      return steps.isEmpty ? null : steps;
    } catch (_) {
      return null;
    }
  }
  return null;
}

String? _extractAxlXmlFromPayload(Uint8List payload) {
  const marker = <int>[0x5F, 0x00, 0x41, 0x00, 0x58, 0x00, 0x4C, 0x00, 0x3A, 0x00];
  final sb = StringBuffer();
  var i = 0;
  while (i + marker.length <= payload.length) {
    var matched = true;
    for (var j = 0; j < marker.length; j++) {
      if (payload[i + j] != marker[j]) {
        matched = false;
        break;
      }
    }
    if (!matched) {
      i++;
      continue;
    }
    i += marker.length;
    while (i + 1 < payload.length) {
      final cu = payload[i] | (payload[i + 1] << 8);
      i += 2;
      if (cu == 0) break;
      sb.writeCharCode(cu);
    }
  }
  final out = sb.toString().trim();
  return out.isEmpty ? null : out;
}

void _collectAxlStatements(
  XmlElement container,
  List<Map<String, dynamic>> out, {
  String? condition,
}) {
  for (final child in container.childElements) {
    final tag = child.name.local;
    if (tag == 'Action') {
      out.add(_convertAxlAction(child, condition: condition));
    } else if (tag == 'ConditionalBlock') {
      final ifElems = child.findElements('If').toList();
      final elseIfElems = child.findElements('ElseIf').toList();
      final elseElems = child.findElements('Else').toList();
      if (ifElems.length == 1 && elseIfElems.isEmpty && elseElems.isEmpty) {
        final ifElem = ifElems.single;
        final condText =
            ifElem.findElements('Condition').firstOrNull?.innerText.trim() ?? '';
        final stmts = ifElem.findElements('Statements').firstOrNull;
        if (stmts != null) {
          final inner = <Map<String, dynamic>>[];
          _collectAxlStatements(
            stmts,
            inner,
            condition: condText.isEmpty ? condition : condText,
          );
          if (inner.length == 1 && condition == null) {
            out.add(inner.single);
          } else if (inner.isNotEmpty) {
            out.add(<String, dynamic>{
              'condition': condText,
              'children': inner,
            });
          }
        }
      } else {
        out.add(<String, dynamic>{
          'condition': 'ConditionalBlock',
          'children': <Map<String, dynamic>>[
            <String, dynamic>{'action': 'ConditionalBlock'},
          ],
        });
      }
    }
  }
}

Map<String, dynamic> _convertAxlAction(
  XmlElement elem, {
  String? condition,
}) {
  final rawName = elem.getAttribute('Name') ?? '';
  final argMap = <String, String>{};
  final rawArgList = <String>[];
  for (final arg in elem.findElements('Argument')) {
    final k = arg.getAttribute('Name') ?? '';
    final v = arg.innerText.trim();
    if (k.isNotEmpty) argMap[k.toLowerCase()] = v;
    rawArgList.add(v);
  }
  String arg(String key, [String fallback = '']) =>
      argMap[key.toLowerCase()] ?? fallback;

  String action = rawName;
  List<String> arguments;
  switch (rawName) {
    case 'OnError':
      final goto = arg('GoTo', 'Next').toLowerCase();
      final code = switch (goto) {
        'next' || '' => '0',
        'macro name' => '1',
        'fail' => '2',
        _ => goto,
      };
      arguments = <String>[code];
      break;
    case 'MessageBox':
      action = 'MsgBox';
      final beep = arg('Beep', 'Yes').toLowerCase() == 'no' ? '0' : '-1';
      final type = switch (arg('Type', 'None').toLowerCase()) {
        'none' || '' => '0',
        'critical' => '1',
        'warning?' => '2',
        'warning!' => '3',
        'information' => '4',
        _ => '0',
      };
      final title = arg('Title');
      arguments = <String>[
        arg('Message'),
        beep,
        type,
        if (title.isNotEmpty) title,
      ];
      break;
    case 'GoToRecord':
      final objType = arg('ObjectType');
      final objTypeCode = objType.isEmpty ? '-1' : objType;
      final objName = arg('ObjectName');
      final rec = switch (arg('Record', 'Next').toLowerCase()) {
        'previous' => '0',
        'next' || '' => '1',
        'first' => '2',
        'last' => '3',
        'goto' => '4',
        'new' => '5',
        _ => arg('Record'),
      };
      arguments = <String>[objTypeCode, objName, rec];
      break;
    case 'OpenForm':
      final view = switch (arg('View', 'Form').toLowerCase()) {
        'form' || '' => '0',
        'design' => '1',
        'print preview' => '2',
        'datasheet' => '3',
        'pivottable' => '4',
        'pivotchart' => '5',
        'layout' => '6',
        _ => '0',
      };
      final dataMode = switch (arg('DataMode').toLowerCase()) {
        '' => '-1',
        'add' => '0',
        'edit' => '1',
        'read only' => '2',
        _ => arg('DataMode'),
      };
      final winMode = switch (arg('WindowMode', 'Normal').toLowerCase()) {
        'normal' || '' => '0',
        'hidden' => '1',
        'icon' => '2',
        'dialog' => '3',
        _ => '0',
      };
      arguments = <String>[
        arg('FormName'),
        view,
        arg('FilterName'),
        arg('WhereCondition'),
        dataMode,
        winMode,
      ];
      break;
    case 'OpenReport':
      final view = switch (arg('View', 'Print').toLowerCase()) {
        'print' || '' => '0',
        'design' => '1',
        'print preview' => '2',
        'report' => '5',
        'layout' => '6',
        _ => '2',
      };
      final winMode = switch (arg('WindowMode', 'Normal').toLowerCase()) {
        'normal' || '' => '0',
        'hidden' => '1',
        'icon' => '2',
        'dialog' => '3',
        _ => '0',
      };
      arguments = <String>[
        arg('ReportName'),
        view,
        arg('FilterName'),
        arg('WhereCondition'),
        winMode,
      ];
      break;
    case 'OpenQuery':
      final view = switch (arg('View', 'Datasheet').toLowerCase()) {
        'datasheet' || '' => '0',
        'design' => '1',
        'print preview' => '2',
        _ => '0',
      };
      final dataMode = switch (arg('DataMode', 'Edit').toLowerCase()) {
        'add' => '0',
        'edit' || '' => '1',
        'read only' => '2',
        _ => '1',
      };
      arguments = <String>[arg('QueryName'), view, dataMode];
      break;
    case 'SaveRecord':
      action = 'RunCommand';
      arguments = <String>['97'];
      break;
    case 'DeleteRecord':
      action = 'RunCommand';
      arguments = <String>['223'];
      break;
    case 'UndoRecord':
      action = 'RunCommand';
      arguments = <String>['292'];
      break;
    case 'CloseWindow':
      action = 'Close';
      arguments = <String>[arg('ObjectType'), arg('ObjectName'), arg('Save')];
      break;
    case 'RunMenuCommand':
      action = 'RunCommand';
      final cmdName = arg('Command').toLowerCase();
      final code = switch (cmdName) {
        'saverecord' => '97',
        'deleterecord' => '223',
        'undo' => '292',
        'refresh' => '18',
        'refreshpage' => '37',
        'print' => '340',
        'closewindow' => '58',
        _ => arg('Command'),
      };
      arguments = <String>[code];
      break;
    default:
      arguments = rawArgList;
      break;
  }

  return <String, dynamic>{
    'action': action,
    'arguments': arguments,
    if (condition != null && condition.isNotEmpty) 'condition': condition,
  };
}
