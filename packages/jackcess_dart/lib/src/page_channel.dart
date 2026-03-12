import 'dart:io';
import 'dart:typed_data';

import 'jet_format.dart';

class PageChannel {
  static const int _headerSize = 21;

  final RandomAccessFile _file;
  JetFormat? _format;

  PageChannel(this._file);

  Future<void> initialize() async {
    await _file.setPosition(0);
    final headerBytes = await _file.read(_headerSize);
    if (headerBytes.length < _headerSize) {
      throw Exception('Empty or invalid database file; header too small.');
    }

    final versionByte = headerBytes[20];
    _format = JetFormat.getFormat(versionByte);
  }

  JetFormat get format {
    if (_format == null) {
      throw StateError('PageChannel not initialized');
    }
    return _format!;
  }

  Future<ByteBuffer> readPage(int pageNumber) async {
    if (pageNumber < 0) {
      throw RangeError.value(pageNumber, 'pageNumber', 'Must be >= 0');
    }

    final pageSize = format.pageSize;
    final offset = pageNumber * pageSize;
    await _file.setPosition(offset);
    final pageData = await _file.read(pageSize);
    if (pageData.isEmpty) {
      return Uint8List(pageSize).buffer;
    }

    if (pageData.length < pageSize) {
      final paddedData = Uint8List(pageSize);
      paddedData.setAll(0, pageData);
      return paddedData.buffer;
    }
    return pageData.buffer;
  }

  Future<void> close() async {
    await _file.close();
  }
}
