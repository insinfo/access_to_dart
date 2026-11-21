import 'dart:io';
import 'dart:typed_data';
import 'package:jackcess_dart/src/attachment_decoder.dart';
import 'package:test/test.dart';

Uint8List storage(List<int> payload,
    {bool compressed = false, String extension = 'bin'}) {
  final extensionUnits = [...extension.codeUnits, 0];
  final headerLength = 12 + extensionUnits.length * 2;
  final body = Uint8List(headerLength + payload.length);
  final header = ByteData.sublistView(body);
  header.setUint32(0, headerLength, Endian.little);
  header.setUint32(4, 1, Endian.little);
  header.setUint32(8, extensionUnits.length, Endian.little);
  for (var i = 0; i < extensionUnits.length; i++) {
    header.setUint16(12 + 2 * i, extensionUnits[i], Endian.little);
  }
  body.setRange(headerLength, body.length, payload);
  final List<int> packed =
      compressed ? ZLibEncoder(level: 3).convert(body) : body;
  final result = Uint8List(8 + packed.length);
  final wrapper = ByteData.sublistView(result);
  wrapper.setUint32(0, compressed ? 1 : 0, Endian.little);
  wrapper.setUint32(4, body.length, Endian.little);
  result.setRange(8, result.length, packed);
  return result;
}

void main() {
  for (final compressed in [false, true]) {
    test(
        'decodes original file and removes extension header compressed=$compressed',
        () {
      final payload = List<int>.generate(8192, (i) => (i * 19) & 255);
      final encoded =
          storage(payload, compressed: compressed, extension: 'pdf');
      final original = Uint8List.fromList(encoded);
      expect(decodeAttachmentFileData(encoded), payload);
      expect(encoded, original,
          reason: 'Decoding must not mutate the encoded storage');
      expect(decodeAttachmentFileData(storage([], compressed: compressed)),
          isEmpty);
    });
  }
  test('row mapping preserves all metadata and unrelated binary data', () {
    final encoded = storage([1, 2, 3], compressed: true);
    final row = <String, dynamic>{
      'FileData': encoded,
      'FileType': 'bin',
      'FileName': 'synthetic.bin',
      'OtherBinary': [9, 8]
    };
    final decoded = decodeAttachmentRow(row);
    expect(decoded['FileData'], [1, 2, 3]);
    expect(decoded['FileType'], row['FileType']);
    expect(decoded['FileName'], row['FileName']);
    expect(decoded['OtherBinary'], same(row['OtherBinary']));
    expect(row['FileData'], same(encoded));
    expect(decodeAttachmentRow({'FileData': null}), {'FileData': null});
    expect(() => decodeAttachmentRow({'FileData': 'not binary'}),
        throwsFormatException);
  });
  test('rejects unsupported, truncated and impossible wrapper lengths', () {
    for (var length = 0; length < 8; length++) {
      expect(() => decodeAttachmentFileData(Uint8List(length)),
          throwsFormatException);
    }
    for (final flag in [2, 0xffffffff]) {
      final encoded = storage([1]);
      ByteData.sublistView(encoded).setUint32(0, flag, Endian.little);
      expect(() => decodeAttachmentFileData(encoded), throwsFormatException);
    }
    for (final length in [0, 3, 0x80000000, 0xffffffff]) {
      final encoded = storage([1]);
      ByteData.sublistView(encoded).setUint32(4, length, Endian.little);
      expect(() => decodeAttachmentFileData(encoded), throwsFormatException);
    }
  });
  test('rejects raw data-length mismatch and out-of-bounds content header', () {
    final valid = storage([1, 2, 3]);
    expect(() => decodeAttachmentFileData(valid.sublist(0, valid.length - 1)),
        throwsFormatException);
    expect(
        () => decodeAttachmentFileData([...valid, 0]), throwsFormatException);
    for (final length in [0, 3, valid.length, 0xffffffff]) {
      final encoded = Uint8List.fromList(valid);
      ByteData.sublistView(encoded).setUint32(8, length, Endian.little);
      expect(() => decodeAttachmentFileData(encoded), throwsFormatException);
    }
  });
  test('rejects damaged compressed stream and checks advertised output bound',
      () {
    final valid = storage(List<int>.filled(16384, 65), compressed: true);
    final truncated = valid.sublist(0, valid.length - 4);
    expect(() => decodeAttachmentFileData(truncated), throwsFormatException);
    final corrupt = Uint8List.fromList(valid)..[8] = 0;
    expect(() => decodeAttachmentFileData(corrupt), throwsFormatException);
    final tooSmall = Uint8List.fromList(valid);
    ByteData.sublistView(tooSmall).setUint32(4, 4, Endian.little);
    expect(() => decodeAttachmentFileData(tooSmall), throwsFormatException);
    final tooLarge = Uint8List.fromList(valid);
    ByteData.sublistView(tooLarge).setUint32(4, 20000, Endian.little);
    expect(() => decodeAttachmentFileData(tooLarge), throwsFormatException);
  });
}
