import 'dart:typed_data';

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