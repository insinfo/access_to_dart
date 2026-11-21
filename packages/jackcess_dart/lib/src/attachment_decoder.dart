import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

/// Decodes Access Attachment.FileData storage into the original file payload.
///
/// This is an attachment-specific semantic operation, not an OLE/LongBinary
/// decoder. Generic table readers intentionally retain the encoded storage.
/// Format corroborated by Jackcess AttachmentColumnInfoImpl.AttachmentImpl:
/// two little-endian uint32 wrapper fields (type, decoded length), followed by
/// a raw (type 0) or zlib (type 1) body whose first uint32 is its header length.
Uint8List decodeAttachmentFileData(List<int> encoded) {
  final bytes = encoded is Uint8List ? encoded : Uint8List.fromList(encoded);
  if (bytes.length < 8) {
    throw const FormatException('Truncated attachment wrapper.');
  }
  final wrapper = ByteData.sublistView(bytes);
  final type = wrapper.getUint32(0, Endian.little);
  final expectedLength = wrapper.getUint32(4, Endian.little);
  if (expectedLength < 4 || expectedLength > 0x7fffffff) {
    throw const FormatException('Invalid attachment decoded length.');
  }
  final storage = Uint8List.sublistView(bytes, 8);
  final Uint8List content;
  if (type == 0) {
    content = storage;
  } else if (type == 1) {
    if (storage.length < 6) {
      throw const FormatException('Truncated attachment zlib stream.');
    }
    final sink = _BoundedAttachmentSink(expectedLength);
    try {
      final decoder = ZLibDecoder().startChunkedConversion(sink);
      decoder.add(storage);
      decoder.close();
      content = sink.takeBytes();
    } on FormatException {
      rethrow;
    } on Exception {
      throw const FormatException('Invalid compressed attachment stream.');
    }
  } else {
    throw FormatException('Unsupported attachment storage type: $type.');
  }
  if (content.length != expectedLength) {
    throw const FormatException('Attachment decoded length mismatch.');
  }
  if (type == 1) {
    // Dart's streaming inflater can return all bytes for a stream whose Adler32
    // trailer was truncated. Validate that trailer explicitly before accepting
    // the file, rather than mistaking a complete payload for complete storage.
    final expectedChecksum =
        ByteData.sublistView(storage).getUint32(storage.length - 4, Endian.big);
    var sum1 = 1;
    var sum2 = 0;
    for (final byte in content) {
      sum1 = (sum1 + byte) % 65521;
      sum2 = (sum2 + sum1) % 65521;
    }
    if (((sum2 << 16) | sum1) != expectedChecksum) {
      throw const FormatException('Attachment zlib checksum mismatch.');
    }
  }
  final headerLength =
      ByteData.sublistView(content).getUint32(0, Endian.little);
  if (headerLength < 4 || headerLength > content.length) {
    throw const FormatException('Invalid attachment content header length.');
  }
  // The opaque header contains flags and the UTF-16 file extension; neither is
  // part of the saved file. FileName/FileType metadata remain in their columns.
  return Uint8List.fromList(Uint8List.sublistView(content, headerLength));
}

/// Copies an attachment row, decoding only its FileData field. Metadata and
/// generic binary columns are not rewritten. Malformed storage fails explicitly.
Map<String, dynamic> decodeAttachmentRow(Map<String, dynamic> row) {
  final result = Map<String, dynamic>.from(row);
  final value = result['FileData'];
  if (value == null) return result;
  if (value is! List<int>) {
    throw const FormatException(
        'Attachment FileData must contain binary storage.');
  }
  result['FileData'] = decodeAttachmentFileData(value);
  return result;
}

class _BoundedAttachmentSink extends ByteConversionSinkBase {
  final int expectedLength;
  final BytesBuilder _bytes = BytesBuilder(copy: false);
  int _length = 0;

  _BoundedAttachmentSink(this.expectedLength);

  @override
  void add(List<int> chunk) {
    if (chunk.length > expectedLength - _length) {
      throw const FormatException(
          'Attachment expands beyond its declared length.');
    }
    _length += chunk.length;
    _bytes.add(chunk);
  }

  @override
  void close() {}

  Uint8List takeBytes() => _bytes.takeBytes();
}
