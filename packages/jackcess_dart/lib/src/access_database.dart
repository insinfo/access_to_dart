import 'dart:io';
import 'dart:typed_data';

import 'jet_format.dart';
import 'page_channel.dart';

class AccessDatabaseInfo {
  final String path;
  final JetFormat format;
  final int pageSize;
  final int fileSize;
  final int pageCount;

  const AccessDatabaseInfo({
    required this.path,
    required this.format,
    required this.pageSize,
    required this.fileSize,
    required this.pageCount,
  });

  Map<String, Object> toJson() {
    return <String, Object>{
      'path': path,
      'format': format.name,
      'pageSize': pageSize,
      'fileSize': fileSize,
      'pageCount': pageCount,
    };
  }
}

class AccessDatabase {
  final File file;
  final PageChannel _pageChannel;
  final AccessDatabaseInfo info;

  AccessDatabase._({
    required this.file,
    required PageChannel pageChannel,
    required this.info,
  }) : _pageChannel = pageChannel;

  static Future<AccessDatabase> openPath(String path) {
    return openFile(File(path));
  }

  static Future<AccessDatabase> openFile(File file) async {
    if (!await file.exists()) {
      throw FileSystemException('ACCDB file not found', file.path);
    }

    final randomAccessFile = await file.open(mode: FileMode.read);
    final pageChannel = PageChannel(randomAccessFile);

    try {
      await pageChannel.initialize();

      final fileSize = await randomAccessFile.length();
      final pageSize = pageChannel.format.pageSize;
      final pageCount =
          fileSize == 0 ? 0 : ((fileSize + pageSize) - 1) ~/ pageSize;

      return AccessDatabase._(
        file: file,
        pageChannel: pageChannel,
        info: AccessDatabaseInfo(
          path: file.path,
          format: pageChannel.format,
          pageSize: pageSize,
          fileSize: fileSize,
          pageCount: pageCount,
        ),
      );
    } catch (_) {
      await pageChannel.close();
      rethrow;
    }
  }

  JetFormat get format => info.format;

  Future<ByteBuffer> readPage(int pageNumber) {
    return _pageChannel.readPage(pageNumber);
  }

  Future<void> close() async {
    await _pageChannel.close();
  }
}
