import 'dart:typed_data';

import 'text_sanitizer.dart';

class AccessPropertyMapGroup {
  final Map<String, Object?> defaultProperties;
  final Map<String, Map<String, Object?>> namedProperties;

  const AccessPropertyMapGroup({
    required this.defaultProperties,
    required this.namedProperties,
  });

  Map<String, Object?> forName(String name) {
    return namedProperties[_normalizeName(name)] ?? const <String, Object?>{};
  }

  Map<String, dynamic> toJson() => {
        'default': _jsonSafe(defaultProperties),
        'named': _jsonSafe(namedProperties),
      };

  static String _normalizeName(String value) => value.toLowerCase();

  static Object? _jsonSafe(Object? value) {
    if (value is DateTime) {
      return value.toIso8601String();
    }
    if (value is Uint8List) {
      return value
          .map((byte) => byte.toRadixString(16).padLeft(2, '0').toUpperCase())
          .join();
    }
    if (value is List) {
      return value.map(_jsonSafe).toList(growable: false);
    }
    if (value is Map) {
      return value.map((key, nestedValue) => MapEntry('$key', _jsonSafe(nestedValue)));
    }
    return value;
  }
}

class PropertyMapReader {
  static const List<int> _mr2Header = <int>[0x4D, 0x52, 0x32, 0x00];
  static const List<int> _kkdHeader = <int>[0x4B, 0x4B, 0x44, 0x00];
  static const int _propertyNameList = 0x80;

  AccessPropertyMapGroup read(Uint8List bytes) {
    if (bytes.isEmpty) {
      return const AccessPropertyMapGroup(
        defaultProperties: <String, Object?>{},
        namedProperties: <String, Map<String, Object?>>{},
      );
    }

    final input = ByteData.sublistView(bytes);
    var offset = 0;
    if (_matchesHeader(bytes, _mr2Header)) {
      offset = _mr2Header.length;
    } else if (_matchesHeader(bytes, _kkdHeader)) {
      offset = _kkdHeader.length;
    } else {
      throw FormatException('Unknown property map header');
    }

    final propertyNames = <String>[];
    final defaultProperties = <String, Object?>{};
    final namedProperties = <String, Map<String, Object?>>{};

    while (offset + 6 <= bytes.length) {
      final blockLength = input.getInt32(offset, Endian.little);
      if (blockLength <= 0 || offset + blockLength > bytes.length) {
        break;
      }
      final blockType = input.getUint16(offset + 4, Endian.little);
      final blockStart = offset + 6;
      final blockEnd = offset + blockLength;

      if (blockType == _propertyNameList) {
        propertyNames
          ..clear()
          ..addAll(_readPropertyNames(bytes, blockStart, blockEnd));
      } else {
        final entry = _readPropertyValues(bytes, blockStart, blockEnd, propertyNames);
        if (entry.name.isEmpty) {
          defaultProperties.addAll(entry.properties);
        } else {
          namedProperties[entry.name.toLowerCase()] = entry.properties;
        }
      }

      offset = blockEnd;
    }

    return AccessPropertyMapGroup(
      defaultProperties: defaultProperties,
      namedProperties: namedProperties,
    );
  }

  bool _matchesHeader(Uint8List bytes, List<int> header) {
    if (bytes.length < header.length) {
      return false;
    }
    for (var index = 0; index < header.length; index++) {
      if (bytes[index] != header[index]) {
        return false;
      }
    }
    return true;
  }

  List<String> _readPropertyNames(Uint8List bytes, int start, int end) {
    final names = <String>[];
    final input = ByteData.sublistView(bytes);
    var offset = start;
    while (offset + 2 <= end) {
      final nameLength = input.getUint16(offset, Endian.little);
      offset += 2;
      if (offset + nameLength > end) {
        break;
      }
      names.add(_decodeText(bytes.sublist(offset, offset + nameLength)));
      offset += nameLength;
    }
    return names;
  }

  _PropertyEntry _readPropertyValues(
    Uint8List bytes,
    int start,
    int end,
    List<String> propertyNames,
  ) {
    final input = ByteData.sublistView(bytes);
    var offset = start;
    var mapName = '';

    if (offset + 4 <= end) {
      final nameBlockLength = input.getInt32(offset, Endian.little);
      final nameBlockEnd = offset + nameBlockLength;
      offset += 4;
      if (nameBlockLength > 6 && offset + 2 <= nameBlockEnd && nameBlockEnd <= end) {
        final nameLength = input.getUint16(offset, Endian.little);
        offset += 2;
        if (offset + nameLength <= nameBlockEnd) {
          mapName = _decodeText(bytes.sublist(offset, offset + nameLength));
        }
      }
      offset = nameBlockEnd;
    }

    final properties = <String, Object?>{};
    while (offset + 8 <= end) {
      final valueBlockLength = input.getUint16(offset, Endian.little);
      if (valueBlockLength < 8 || offset + valueBlockLength > end) {
        break;
      }
      final valueEnd = offset + valueBlockLength;
      final typeCode = bytes[offset + 3];
      final nameIndex = input.getUint16(offset + 4, Endian.little);
      final dataLength = input.getUint16(offset + 6, Endian.little);
      final dataStart = offset + 8;
      if (nameIndex < propertyNames.length && dataStart + dataLength <= valueEnd) {
        final name = propertyNames[nameIndex];
        properties[name] = _decodeValue(typeCode, bytes.sublist(dataStart, dataStart + dataLength));
      }
      offset = valueEnd;
    }

    return _PropertyEntry(name: mapName, properties: properties);
  }

  Object? _decodeValue(int typeCode, Uint8List data) {
    switch (typeCode) {
      case 0x01:
        return data.isNotEmpty && data[0] != 0;
      case 0x02:
        return data.isEmpty ? null : data[0];
      case 0x03:
        return data.length < 2
            ? null
            : ByteData.sublistView(data).getInt16(0, Endian.little);
      case 0x04:
        return data.length < 4
            ? null
            : ByteData.sublistView(data).getInt32(0, Endian.little);
      case 0x05:
        return data.length < 8
            ? null
            : ByteData.sublistView(data).getInt64(0, Endian.little) / 10000.0;
      case 0x06:
        return data.length < 4
            ? null
            : ByteData.sublistView(data).getFloat32(0, Endian.little);
      case 0x07:
        return data.length < 8
            ? null
            : ByteData.sublistView(data).getFloat64(0, Endian.little);
      case 0x08:
        return data.length < 8
            ? null
            : _parseDateTime(ByteData.sublistView(data).getFloat64(0, Endian.little));
      case 0x09:
      case 0x0B:
        return Uint8List.fromList(data);
      case 0x0A:
      case 0x0C:
        return _decodeText(data);
      case 0x0F:
        return _parseGuid(data);
      case 0x10:
        return _parseNumeric(data);
      case 0x12:
        return data.length < 4
            ? null
            : ByteData.sublistView(data).getInt32(0, Endian.little);
      case 0x13:
        return data.length < 8
            ? null
            : ByteData.sublistView(data).getInt64(0, Endian.little);
      default:
        return Uint8List.fromList(data);
    }
  }

  DateTime? _parseDateTime(double value) {
    if (value.isNaN || value.isInfinite) {
      return null;
    }
    final base = DateTime.utc(1899, 12, 30);
    final micros = (value * Duration.microsecondsPerDay).round();
    return base.add(Duration(microseconds: micros));
  }

  String? _parseNumeric(Uint8List data) {
    if (data.length < 17) {
      return null;
    }

    final negate = data[0] != 0;
    final bytes = Uint8List.fromList(data.sublist(1, 17));
    _fixNumericByteOrder(bytes);

    var intValue = BigInt.zero;
    for (final byte in bytes) {
      intValue = (intValue << 8) | BigInt.from(byte);
    }
    if (negate) {
      intValue = -intValue;
    }

    return intValue.toString();
  }

  void _fixNumericByteOrder(Uint8List bytes) {
    var position = 0;
    if ((bytes.length % 8) != 0) {
      _reverseRange(bytes, 0, 4);
      position += 4;
    }
    for (; position < bytes.length; position += 8) {
      _reverseRange(bytes, position, position + 8);
    }
  }

  void _reverseRange(Uint8List bytes, int start, int endExclusive) {
    var left = start;
    var right = endExclusive - 1;
    while (left < right) {
      final temp = bytes[left];
      bytes[left] = bytes[right];
      bytes[right] = temp;
      left++;
      right--;
    }
  }

  String? _parseGuid(Uint8List data) {
    if (data.length < 16) {
      return null;
    }

    final bytes = Uint8List.fromList(data.sublist(0, 16));
    _reverseRange(bytes, 0, 4);
    _reverseRange(bytes, 4, 6);
    _reverseRange(bytes, 6, 8);

    final hex = bytes
        .map((byte) => byte.toRadixString(16).padLeft(2, '0').toUpperCase())
        .join();
    return '{${hex.substring(0, 8)}-${hex.substring(8, 12)}-${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20, 32)}}';
  }

  String _decodeText(Uint8List data) {
    if (data.isEmpty) {
      return '';
    }
    if (data.length >= 2 && data[0] == 0xFF && data[1] == 0xFE) {
      return _decodeCompressedText(data);
    }
    return _decodeUtf16Le(data, 0, data.length);
  }

  String _decodeCompressedText(Uint8List data) {
    final buffer = StringBuffer();
    var compressed = true;
    var segmentStart = 2;
    for (var index = 2; index < data.length; index++) {
      if (data[index] == 0x00) {
        _appendTextSegment(buffer, data, segmentStart, index, compressed);
        compressed = !compressed;
        segmentStart = index + 1;
      }
    }
    _appendTextSegment(buffer, data, segmentStart, data.length, compressed);
    return sanitizeDecodedText(buffer.toString());
  }

  void _appendTextSegment(
    StringBuffer output,
    Uint8List data,
    int start,
    int end,
    bool compressed,
  ) {
    if (end <= start) {
      return;
    }
    if (compressed) {
      for (var index = start; index < end; index++) {
        output.writeCharCode(data[index]);
      }
      return;
    }
    output.write(_decodeUtf16Le(data, start, end - start));
  }

  String _decodeUtf16Le(Uint8List data, int offset, int length) {
    return decodeSanitizedUtf16Le(data, offset, length);
  }
}

class _PropertyEntry {
  final String name;
  final Map<String, Object?> properties;

  const _PropertyEntry({required this.name, required this.properties});
}