import 'dart:io';
import 'dart:typed_data';

import 'jet_format.dart';
import 'office_encryption.dart';

class PageChannel {
  static const int _headerSize = 21;
  static const int _rootPageSize = 4096;
  static const int _headerMaskOffset = 24;

  final RandomAccessFile _file;
  final String? _password;
  JetFormat? _format;
  AccdbEncryptionInfo? _encryptionInfo;
  OfficeAgileCodec? _officeCodec;

  PageChannel(this._file, {String? password}) : _password = password;

  Future<void> initialize() async {
    await _file.setPosition(0);
    final headerBytes = await _file.read(_headerSize);
    if (headerBytes.length < _headerSize) {
      throw Exception('Empty or invalid database file; header too small.');
    }

    final versionByte = headerBytes[20];
    _format = JetFormat.getFormat(versionByte);

    final rootPage = await _readRootPage();
    _applyHeaderMask(rootPage);
    _encryptionInfo = OfficeAgileCodec.inspect(rootPage);
    if (_encryptionInfo != null && _password != null && _password.isNotEmpty) {
      _officeCodec = OfficeAgileCodec.open(rootPage, _password);
    }
  }

  JetFormat get format {
    if (_format == null) {
      throw StateError('PageChannel not initialized');
    }
    return _format!;
  }

  AccdbEncryptionInfo? get encryptionInfo => _encryptionInfo;

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
      return _decodePageIfNeeded(pageNumber, paddedData).buffer;
    }
    return _decodePageIfNeeded(pageNumber, Uint8List.fromList(pageData)).buffer;
  }

  Future<void> close() async {
    await _file.close();
  }

  Future<Uint8List> _readRootPage() async {
    await _file.setPosition(0);
    final rootPage = await _file.read(_rootPageSize);
    if (rootPage.length < _rootPageSize) {
      final padded = Uint8List(_rootPageSize);
      padded.setAll(0, rootPage);
      return padded;
    }
    return Uint8List.fromList(rootPage);
  }

  void _applyHeaderMask(Uint8List bytes) {
    final headerMask = format.headerMask;
    final maxLength = bytes.length - _headerMaskOffset;
    final maskLength = headerMask.length < maxLength ? headerMask.length : maxLength;
    for (var i = 0; i < maskLength; i++) {
      bytes[_headerMaskOffset + i] ^= headerMask[i];
    }
  }

  Uint8List _decodePageIfNeeded(int pageNumber, Uint8List bytes) {
    if (pageNumber == 0) {
      _applyHeaderMask(bytes);
      return bytes;
    }
    if (_encryptionInfo == null) {
      return bytes;
    }
    final codec = _officeCodec;
    if (codec == null) {
      throw UnsupportedAccdbEncryptionException(_encryptionInfo!);
    }
    return codec.decryptPage(bytes, pageNumber);
  }
}
