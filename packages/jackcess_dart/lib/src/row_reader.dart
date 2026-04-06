import 'dart:typed_data';

import 'jet_format.dart';
import 'table_def_reader.dart';
import 'data_page_reader.dart';
import 'page_channel.dart';
import 'text_sanitizer.dart';

const int _rowOffsetMask = 0x1FFF;

class RowReader {
  static const int _calcDataLenOffset = 16;
  static const int _calcDataOffset = 20;
  static const int _longValueTypeThisPage = 0x80;
  static const int _longValueTypeOtherPage = 0x40;
  static const int _longValueTypeOtherPages = 0x00;
  static const int _longValueTypeMask = 0xC0000000;
  static const int _sizeLongValueDef = 12;

  final JetFormat format;
  final List<ColumnDef> columns;
  final PageChannel pageChannel;

  RowReader({
    required this.format,
    required this.columns,
    required this.pageChannel,
  });

  Future<Map<String, dynamic>> readRow(DataPageRow row) async {
    // Deleted rows must be ignored even when they carry an overflow pointer.
    if (row.isDeleted) {
      return {};
    }

    final data = row.isOverflow
        ? await _resolveOverflowRowData(row.rowData)
        : row.rowData;
    if (data.isEmpty) {
      return {};
    }
    final bytes = ByteData.view(data.buffer, data.offsetInBytes, data.length);

    // 1. Read column count
    if (data.length < 4) {
      return {};
    }
    final columnCount = bytes.getInt16(0, Endian.little);
    if (columnCount < 0) {
      return {};
    }

    // 2. Read Null Mask
    final nullMaskSize = (columnCount + 7) ~/ 8;
    final nullMaskOffset = data.length - nullMaskSize;
    if (nullMaskOffset < 2 || nullMaskOffset > data.length) {
      return {};
    }
    final nullMask = data.sublist(nullMaskOffset);

    // 3. Read var columns metadata
    final numVarCols = bytes.getInt16(nullMaskOffset - 2, Endian.little);
    if (numVarCols < 0) {
      return {};
    }

    Map<String, dynamic> result = {};
    for (var col in columns) {
      try {
        // Check if column is in null mask
        if (col.columnNumber >= columnCount) continue;

        bool isNull =
            (nullMask[col.columnNumber ~/ 8] & (1 << (col.columnNumber % 8))) ==
                0;
        if (isNull) continue;

        if (!col.isVariableLength) {
          // Read Fixed Length
          int dataStart =
              2 + col.fixedOffset; // OFFSET_COLUMN_FIXED_DATA_ROW_OFFSET = 2
          int len = col.length;
          if (dataStart + len <= data.length) {
            var raw = data.sublist(dataStart, dataStart + len);
            if (col.isCalculated) {
              raw = _unwrapCalculatedValue(raw);
            }
            result[col.name] =
              _parseFixed(raw, col.type, scale: col.scale);
          }
        } else {
          // Read Variable Length
          if (col.variableColumnNumber >= numVarCols) continue;

          // Jet4 simple var length value jump table
          final varColumnOffsetPos =
              nullMaskOffset - 4 - (col.variableColumnNumber * 2);
          if (varColumnOffsetPos < 2 || varColumnOffsetPos + 2 > data.length) {
            continue;
          }
          final dataStart = bytes.getInt16(varColumnOffsetPos, Endian.little);
          final dataEnd = bytes.getInt16(varColumnOffsetPos - 2, Endian.little);

          if (dataStart >= 0 &&
              dataStart <= dataEnd &&
              dataEnd <= data.length) {
            var raw = data.sublist(dataStart, dataEnd);
            if (col.isCalculated) {
              raw = _unwrapCalculatedValue(raw);
            }
            result[col.name] =
              await _parseVar(raw, col.type, scale: col.scale);
          }
        }
      } catch (e, st) {
        print('RowReader Error on col ${col.name}: $e\n$st');
        // Keep partial row data when one complex/unsupported column fails.
      }
    }

    return result;
  }

  Future<Uint8List> _resolveOverflowRowData(Uint8List definition) async {
    var current = definition;
    while (true) {
      if (current.length < 4) {
        return Uint8List(0);
      }

      final rowNum = current[0];
      final pageNum = current[1] | (current[2] << 8) | (current[3] << 16);
      if (pageNum <= 0) {
        return Uint8List(0);
      }

      final page = await _readPageBytes(pageNum);
      if (page.isEmpty || page[0] != 0x01) {
        return Uint8List(0);
      }

      final bytes = ByteData.view(page.buffer, page.offsetInBytes, page.length);
      final rowCount = bytes.getInt16(12, Endian.little);
      if (rowNum < 0 || rowNum >= rowCount) {
        return Uint8List(0);
      }

      final rowStartOffset = 14 + (2 * rowNum);
      final rawRowStart = bytes.getInt16(rowStartOffset, Endian.little);
      final isOverflow = (rawRowStart & 0x4000) != 0;
        final startPos = rawRowStart & _rowOffsetMask;
      final endPos = (rowNum == 0)
          ? format.pageSize
          : (bytes.getInt16(14 + (2 * (rowNum - 1)), Endian.little) & _rowOffsetMask);

      if (startPos > endPos || endPos > page.length) {
        return Uint8List(0);
      }

      current = page.sublist(startPos, endPos);
      if (isOverflow) {
        continue;
      }
      return current;
    }
  }

  bool isVariableLengthType(int type) {
    return type == 10 || type == 12 || type == 9 || type == 11;
  }

  dynamic _parseFixed(Uint8List data, int type, {int? scale}) {
    final expectedLength = _expectedFixedLength(type);
    if (expectedLength != null && data.length < expectedLength) {
      return null;
    }

    var bytes = ByteData.view(data.buffer, data.offsetInBytes, data.length);
    switch (type) {
      case 1:
        return data[0] != 0;
      case 4:
        return bytes.getInt32(0, Endian.little);
      case 0x05:
        return bytes.getInt64(0, Endian.little) / 10000.0;
      case 0x06:
        return bytes.getFloat32(0, Endian.little);
      case 0x07:
        return bytes.getFloat64(0, Endian.little);
      case 0x08:
        return _parseDateTime(bytes.getFloat64(0, Endian.little));
      case 0x0F:
        return _parseGuid(data);
      case 0x10:
        return _parseNumeric(data, scale: scale);
      case 3:
        return bytes.getInt16(0, Endian.little);
      case 2:
        return bytes.getInt8(0);
      case 0x12:
        return bytes.getInt32(0, Endian.little);
      case 0x13:
        return bytes.getInt64(0, Endian.little);
      default:
        return "FixedType($type)";
    }
  }

  int? _expectedFixedLength(int type) {
    switch (type) {
      case 1:
      case 2:
        return 1;
      case 3:
        return 2;
      case 0x04:
      case 0x06:
      case 0x12:
        return 4;
      case 0x05:
      case 0x07:
      case 0x08:
      case 0x13:
        return 8;
      case 0x0F:
        return 16;
      case 0x10:
        return 17;
      default:
        return null;
    }
  }

  DateTime? _parseDateTime(double value) {
    if (value.isNaN || value.isInfinite) {
      return null;
    }

    final base = DateTime.utc(1899, 12, 30);
    final microsAsDouble = value * Duration.microsecondsPerDay;
    if (!microsAsDouble.isFinite) {
      return null;
    }

    final micros = microsAsDouble.round();
    try {
      return base.add(Duration(microseconds: micros));
    } on RangeError {
      return null;
    }
  }

  String? _parseNumeric(Uint8List data, {int? scale}) {
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

    return _formatScaledBigInt(intValue, scale ?? 0);
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

  String _formatScaledBigInt(BigInt value, int scale) {
    final negative = value.isNegative;
    final digits = value.abs().toString();
    if (scale <= 0) {
      return negative ? '-$digits' : digits;
    }

    final padded = digits.padLeft(scale + 1, '0');
    final split = padded.length - scale;
    final integerPart = padded.substring(0, split);
    final fractionalPart = padded.substring(split);
    final formatted = '$integerPart.$fractionalPart';
    return negative ? '-$formatted' : formatted;
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

  Future<dynamic> _parseVar(Uint8List data, int type, {int? scale}) async {
    if (type == 12 || type == 11) {
      return _parseLongValue(data, type);
    }
    if (type == 10) {
      if (_hasCompressedTextHeader(data)) {
        return _decodeCompressedText(data);
      }
      return _decodeUtf16Le(data, 0, data.length);
    }
    if (type == 9) {
      return data;
    }
    // Fallback to fixed parsing for normally-fixed types stored in var block
    return _parseFixed(data, type, scale: scale);
  }

  Future<dynamic> _parseLongValue(Uint8List definition, int type) async {
    final valueBytes = await _readLongValue(definition);
    if (type == 12) {
      if (valueBytes.isEmpty) {
        return '';
      }
      if (_hasCompressedTextHeader(valueBytes)) {
        return _decodeCompressedText(valueBytes);
      }
      return _decodeUtf16Le(valueBytes, 0, valueBytes.length);
    }
    return valueBytes;
  }

  Future<Uint8List> _readLongValue(Uint8List definition) async {
    if (definition.length < 4) {
      return definition;
    }

    final def = ByteData.view(
      definition.buffer,
      definition.offsetInBytes,
      definition.length,
    );
    final lengthWithFlags = def.getUint32(0, Endian.little);
    final length = lengthWithFlags & ~_longValueTypeMask;
    final type = ((lengthWithFlags & _longValueTypeMask) >>> 24) & 0xFF;

    if (type == _longValueTypeThisPage) {
      final inlineStart = 12;
      final inlineEnd = inlineStart + length;
      if (definition.length <= inlineStart) {
        return Uint8List(0);
      }
      return definition.sublist(
        inlineStart,
        inlineEnd < definition.length ? inlineEnd : definition.length,
      );
    }

    if (definition.length < _sizeLongValueDef) {
      return definition;
    }

    final firstRowNum = definition[4];
    final firstPageNum =
        definition[5] | (definition[6] << 8) | (definition[7] << 16);

    if (type == _longValueTypeOtherPage) {
      return _readSingleLvalPage(firstPageNum, firstRowNum, length);
    }
    if (type == _longValueTypeOtherPages) {
      return _readMultiPageLval(firstPageNum, firstRowNum, length);
    }

    return definition;
  }

  Future<Uint8List> _readSingleLvalPage(
      int pageNum, int rowNum, int length) async {
    final page = await _readPageBytes(pageNum);
    final row = _readRowBytesFromPage(page, rowNum);
    if (row.isEmpty) {
      return Uint8List(0);
    }
    return row.length > length ? row.sublist(0, length) : row;
  }

  Future<Uint8List> _readMultiPageLval(
      int pageNum, int rowNum, int length) async {
    final out = BytesBuilder(copy: false);
    var nextPage = pageNum;
    var nextRow = rowNum;
    var remaining = length;

    while (remaining > 0 && nextPage > 0) {
      final page = await _readPageBytes(nextPage);
      final row = _readRowBytesFromPage(page, nextRow);
      if (row.length < 4) {
        break;
      }

      nextRow = row[0];
      nextPage = row[1] | (row[2] << 8) | (row[3] << 16);
      final chunk = row.sublist(4);
      if (chunk.length > remaining) {
        out.add(chunk.sublist(0, remaining));
        remaining = 0;
      } else {
        out.add(chunk);
        remaining -= chunk.length;
      }
    }

    return out.takeBytes();
  }

  Future<Uint8List> _readPageBytes(int pageNumber) async {
    final buffer = await pageChannel.readPage(pageNumber);
    return buffer.asUint8List();
  }

  Uint8List _readRowBytesFromPage(Uint8List page, int rowNum) {
    if (page.isEmpty || page[0] != 0x01) {
      return Uint8List(0);
    }

    final bytes = ByteData.view(page.buffer, page.offsetInBytes, page.length);
    final rowCount = bytes.getInt16(12, Endian.little);
    if (rowNum < 0 || rowNum >= rowCount) {
      return Uint8List(0);
    }

    final rowStartOffset = 14 + (2 * rowNum);
    final rawRowStart = bytes.getInt16(rowStartOffset, Endian.little);
    final startPos = rawRowStart & _rowOffsetMask;
    final endPos = (rowNum == 0)
        ? format.pageSize
      : (bytes.getInt16(14 + (2 * (rowNum - 1)), Endian.little) & _rowOffsetMask);

    if (startPos > endPos || endPos > page.length) {
      return Uint8List(0);
    }
    return page.sublist(startPos, endPos);
  }

  bool _hasCompressedTextHeader(Uint8List data) {
    return data.length >= 2 && data[0] == 0xFF && data[1] == 0xFE;
  }

  String _decodeCompressedText(Uint8List data) {
    final output = StringBuffer();
    var inCompressedMode = true;
    var segmentStart = 2;

    for (var i = 2; i < data.length; i++) {
      if (data[i] == 0x00) {
        _appendTextSegment(
          output,
          data,
          segmentStart,
          i,
          inCompressedMode,
        );
        inCompressedMode = !inCompressedMode;
        segmentStart = i + 1;
      }
    }

    _appendTextSegment(
      output,
      data,
      segmentStart,
      data.length,
      inCompressedMode,
    );
    return sanitizeDecodedText(output.toString());
  }

  void _appendTextSegment(
    StringBuffer output,
    Uint8List data,
    int start,
    int end,
    bool inCompressedMode,
  ) {
    if (end <= start) {
      return;
    }

    if (inCompressedMode) {
      for (var i = start; i < end; i++) {
        output.writeCharCode(data[i]);
      }
      return;
    }

    output.write(_decodeUtf16Le(data, start, end - start));
  }

  Uint8List _unwrapCalculatedValue(Uint8List data) {
    if (data.length < _calcDataOffset) {
      return data;
    }

    final bytes = ByteData.view(data.buffer, data.offsetInBytes, data.length);
    final dataLen = bytes.getInt32(_calcDataLenOffset, Endian.little);
    final available = data.length - _calcDataOffset;
    final actualLen = dataLen < available ? dataLen : available;
    if (actualLen <= 0) {
      return Uint8List(0);
    }
    return data.sublist(_calcDataOffset, _calcDataOffset + actualLen);
  }

  String _decodeUtf16Le(Uint8List data, int offset, int length) {
    return decodeSanitizedUtf16Le(data, offset, length);
  }
}
