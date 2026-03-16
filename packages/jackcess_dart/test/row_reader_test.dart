import 'dart:io';
import 'dart:typed_data';

import 'package:jackcess_dart/src/data_page_reader.dart';
import 'package:jackcess_dart/src/page_channel.dart';
import 'package:jackcess_dart/src/row_reader.dart';
import 'package:jackcess_dart/src/table_def_reader.dart';
import 'package:test/test.dart';

void main() {
  group('RowReader', () {
    test('parses fixed money double and datetime values', () async {
      final env = await _openTestPageChannel();
      addTearDown(env.dispose);

      final reader = RowReader(
        format: env.pageChannel.format,
        pageChannel: env.pageChannel,
        columns: const <ColumnDef>[
          ColumnDef(
            name: 'ValorMonetario',
            type: 0x05,
            columnNumber: 0,
            variableColumnNumber: 0,
            fixedOffset: 0,
            length: 8,
            flags: ColumnDef.fixedLengthFlagMask,
            extFlags: 0,
            precision: null,
            scale: null,
          ),
          ColumnDef(
            name: 'ValorDouble',
            type: 0x07,
            columnNumber: 1,
            variableColumnNumber: 0,
            fixedOffset: 8,
            length: 8,
            flags: ColumnDef.fixedLengthFlagMask,
            extFlags: 0,
            precision: null,
            scale: null,
          ),
          ColumnDef(
            name: 'DataAtendimento',
            type: 0x08,
            columnNumber: 2,
            variableColumnNumber: 0,
            fixedOffset: 16,
            length: 8,
            flags: ColumnDef.fixedLengthFlagMask,
            extFlags: 0,
            precision: null,
            scale: null,
          ),
        ],
      );

      final rowBytes = BytesBuilder(copy: false);
      rowBytes.add(_int16Le(3));
      rowBytes.add(_int64Le(123456));
      rowBytes.add(_float64Le(42.5));
      rowBytes.add(_float64Le(45291.5));
      rowBytes.add(_int16Le(0));
      rowBytes.addByte(0x07);

      final result = await reader.readRow(
        DataPageRow(
          rowNumber: 0,
          isDeleted: false,
          isOverflow: false,
          rowData: rowBytes.takeBytes(),
        ),
      );

      expect(result['ValorMonetario'], 12.3456);
      expect(result['ValorDouble'], 42.5);
      expect(result['DataAtendimento'], DateTime.utc(2023, 12, 31, 12));
    });

    test('returns null for partial calculated datetime and double payloads', () async {
      final env = await _openTestPageChannel();
      addTearDown(env.dispose);

      final reader = RowReader(
        format: env.pageChannel.format,
        pageChannel: env.pageChannel,
        columns: const <ColumnDef>[
          ColumnDef(
            name: 'DataCalculada',
            type: 0x08,
            columnNumber: 0,
            variableColumnNumber: 0,
            fixedOffset: 0,
            length: 24,
            flags: ColumnDef.fixedLengthFlagMask,
            extFlags: ColumnDef.calculatedExtFlagMask,
            precision: null,
            scale: null,
          ),
          ColumnDef(
            name: 'NumeroCalculado',
            type: 0x07,
            columnNumber: 1,
            variableColumnNumber: 0,
            fixedOffset: 24,
            length: 24,
            flags: ColumnDef.fixedLengthFlagMask,
            extFlags: ColumnDef.calculatedExtFlagMask,
            precision: null,
            scale: null,
          ),
        ],
      );

      final rowBytes = BytesBuilder(copy: false);
      rowBytes.add(_int16Le(2));
      rowBytes.add(_calculatedPayload(_float64Le(45291.5).sublist(0, 4)));
      rowBytes.add(_calculatedPayload(_float64Le(42.5).sublist(0, 4)));
      rowBytes.add(_int16Le(0));
      rowBytes.addByte(0x03);

      final result = await reader.readRow(
        DataPageRow(
          rowNumber: 0,
          isDeleted: false,
          isOverflow: false,
          rowData: rowBytes.takeBytes(),
        ),
      );

      expect(result.containsKey('DataCalculada'), isTrue);
      expect(result['DataCalculada'], isNull);
      expect(result.containsKey('NumeroCalculado'), isTrue);
      expect(result['NumeroCalculado'], isNull);
    });

    test('parses numeric with arbitrary precision', () async {
      final env = await _openTestPageChannel();
      addTearDown(env.dispose);

      final reader = RowReader(
        format: env.pageChannel.format,
        pageChannel: env.pageChannel,
        columns: const <ColumnDef>[
          ColumnDef(
            name: 'ValorNumerico',
            type: 0x10,
            columnNumber: 0,
            variableColumnNumber: 0,
            fixedOffset: 0,
            length: 17,
            flags: ColumnDef.fixedLengthFlagMask,
            extFlags: 0,
            precision: 18,
            scale: 4,
          ),
        ],
      );

      final rowBytes = BytesBuilder(copy: false);
      rowBytes.add(_int16Le(1));
      rowBytes.add(_numericBytes(BigInt.parse('123456789012345')));
      rowBytes.add(_int16Le(0));
      rowBytes.addByte(0x01);

      final result = await reader.readRow(
        DataPageRow(
          rowNumber: 0,
          isDeleted: false,
          isOverflow: false,
          rowData: rowBytes.takeBytes(),
        ),
      );

      expect(result['ValorNumerico'], '12345678901.2345');
    });

    test('parses fixed guid', () async {
      final env = await _openTestPageChannel();
      addTearDown(env.dispose);

      final reader = RowReader(
        format: env.pageChannel.format,
        pageChannel: env.pageChannel,
        columns: const <ColumnDef>[
          ColumnDef(
            name: 'ValorNumerico',
            type: 0x10,
            columnNumber: 0,
            variableColumnNumber: 0,
            fixedOffset: 0,
            length: 17,
            flags: 0,
            extFlags: 0,
            precision: 18,
            scale: 4,
          ),
          ColumnDef(
            name: 'Identificador',
            type: 0x0F,
            columnNumber: 0,
            variableColumnNumber: 0,
            fixedOffset: 0,
            length: 16,
            flags: ColumnDef.fixedLengthFlagMask,
            extFlags: 0,
            precision: null,
            scale: null,
          ),
        ],
      );

      final rowBytes = BytesBuilder(copy: false);
      rowBytes.add(_int16Le(1));
      rowBytes.add(_guidBytes('{00112233-4455-6677-8899-AABBCCDDEEFF}'));
      rowBytes.add(_int16Le(0));
      rowBytes.addByte(0x01);

      final result = await reader.readRow(
        DataPageRow(
          rowNumber: 0,
          isDeleted: false,
          isOverflow: false,
          rowData: rowBytes.takeBytes(),
        ),
      );

      expect(result['Identificador'], '{00112233-4455-6677-8899-AABBCCDDEEFF}');
    });

    test('returns null for partial numeric and guid payloads', () async {
      final env = await _openTestPageChannel();
      addTearDown(env.dispose);

      final variableReader = RowReader(
        format: env.pageChannel.format,
        pageChannel: env.pageChannel,
        columns: const <ColumnDef>[
          ColumnDef(
            name: 'ValorNumerico',
            type: 0x10,
            columnNumber: 0,
            variableColumnNumber: 0,
            fixedOffset: 0,
            length: 8,
            flags: ColumnDef.fixedLengthFlagMask,
            extFlags: 0,
            precision: 18,
            scale: 4,
          ),
        ],
      );

      final numericBytes = BytesBuilder(copy: false);
      numericBytes.add(_int16Le(1));
      numericBytes.add(Uint8List.fromList(_numericBytes(BigInt.parse('1234567890')).sublist(0, 8)));
      numericBytes.add(_int16Le(0));
      numericBytes.addByte(0x01);

      final variableResult = await variableReader.readRow(
        DataPageRow(
          rowNumber: 0,
          isDeleted: false,
          isOverflow: false,
          rowData: numericBytes.takeBytes(),
        ),
      );

      final fixedReader = RowReader(
        format: env.pageChannel.format,
        pageChannel: env.pageChannel,
        columns: const <ColumnDef>[
          ColumnDef(
            name: 'Identificador',
            type: 0x0F,
            columnNumber: 0,
            variableColumnNumber: 0,
            fixedOffset: 0,
            length: 8,
            flags: ColumnDef.fixedLengthFlagMask,
            extFlags: 0,
            precision: null,
            scale: null,
          ),
        ],
      );

      final fixedBytes = BytesBuilder(copy: false);
      fixedBytes.add(_int16Le(1));
      fixedBytes.add(Uint8List.fromList(_guidBytes('{00112233-4455-6677-8899-AABBCCDDEEFF}').sublist(0, 8)));
      fixedBytes.add(_int16Le(0));
      fixedBytes.addByte(0x01);

      final fixedResult = await fixedReader.readRow(
        DataPageRow(
          rowNumber: 0,
          isDeleted: false,
          isOverflow: false,
          rowData: fixedBytes.takeBytes(),
        ),
      );

      expect(variableResult['ValorNumerico'], isNull);
      expect(fixedResult['Identificador'], isNull);
    });
  });
}

Future<_TestPageChannelEnv> _openTestPageChannel() async {
  final directory = await Directory.systemTemp.createTemp('row_reader_test_');
  final file = File('${directory.path}\\fixture.accdb');
  final bytes = Uint8List(5000);
  bytes[20] = 0x05;
  await file.writeAsBytes(bytes, flush: true);

  final raf = await file.open();
  final channel = PageChannel(raf);
  await channel.initialize();
  return _TestPageChannelEnv(pageChannel: channel, directory: directory);
}

Uint8List _int16Le(int value) {
  final bytes = ByteData(2)..setInt16(0, value, Endian.little);
  return bytes.buffer.asUint8List();
}

Uint8List _int64Le(int value) {
  final bytes = ByteData(8)..setInt64(0, value, Endian.little);
  return bytes.buffer.asUint8List();
}

Uint8List _float64Le(double value) {
  final bytes = ByteData(8)..setFloat64(0, value, Endian.little);
  return bytes.buffer.asUint8List();
}

Uint8List _calculatedPayload(Uint8List actualValue) {
  final bytes = Uint8List(20 + actualValue.length);
  final header = ByteData.sublistView(bytes);
  header.setInt32(16, actualValue.length, Endian.little);
  bytes.setAll(20, actualValue);
  return bytes;
}

Uint8List _numericBytes(BigInt unscaledValue) {
  final bytes = Uint8List(17);
  bytes[0] = unscaledValue.isNegative ? 0x80 : 0x00;
  var magnitude = unscaledValue.abs();
  final magnitudeBytes = Uint8List(16);
  for (var index = 15; index >= 0 && magnitude > BigInt.zero; index--) {
    magnitudeBytes[index] = (magnitude & BigInt.from(0xFF)).toInt();
    magnitude = magnitude >> 8;
  }
  final fixedOrder = Uint8List.fromList(magnitudeBytes);
  _reverseRange(fixedOrder, 0, 8);
  _reverseRange(fixedOrder, 8, 16);
  bytes.setAll(1, fixedOrder);
  return bytes;
}

Uint8List _guidBytes(String guid) {
  final hex = guid.replaceAll('{', '').replaceAll('}', '').replaceAll('-', '');
  final bytes = Uint8List(16);
  for (var i = 0; i < 16; i++) {
    bytes[i] = int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16);
  }
  _reverseRange(bytes, 0, 4);
  _reverseRange(bytes, 4, 6);
  _reverseRange(bytes, 6, 8);
  return bytes;
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

final class _TestPageChannelEnv {
  const _TestPageChannelEnv({
    required this.pageChannel,
    required this.directory,
  });

  final PageChannel pageChannel;
  final Directory directory;

  Future<void> dispose() async {
    await pageChannel.close();
    if (await directory.exists()) {
      await directory.delete(recursive: true);
    }
  }
}