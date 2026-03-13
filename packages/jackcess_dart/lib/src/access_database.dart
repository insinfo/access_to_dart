import 'dart:io';
import 'dart:typed_data';

import 'jet_format.dart';
import 'page_channel.dart';

class AccdbPointerException implements Exception {
  final String path;

  const AccdbPointerException(this.path);

  @override
  String toString() {
    return 'ACCDB fixture is a Git LFS pointer, not a materialized database: '
        '$path';
  }
}

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

class AccessPageHeaderInfo {
  final int pageNumber;
  final int pageType;
  final String pageTypeName;

  const AccessPageHeaderInfo({
    required this.pageNumber,
    required this.pageType,
    required this.pageTypeName,
  });

  Map<String, Object> toJson() {
    return <String, Object>{
      'pageNumber': pageNumber,
      'pageType': pageType,
      'pageTypeName': pageTypeName,
    };
  }
}

class AccessTableDefPageInfo extends AccessPageHeaderInfo {
  final int nextTableDefPage;
  final int rowCount;
  final int tableTypeRaw;

  const AccessTableDefPageInfo({
    required super.pageNumber,
    required super.pageType,
    required super.pageTypeName,
    required this.nextTableDefPage,
    required this.rowCount,
    required this.tableTypeRaw,
  });

  @override
  Map<String, Object> toJson() {
    return <String, Object>{
      ...super.toJson(),
      'nextTableDefPage': nextTableDefPage,
      'rowCount': rowCount,
      'tableTypeRaw': tableTypeRaw,
    };
  }
}

class AccessDatabase {
  static const int systemCatalogPageNumber = 2;

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

    final prefix = await file.openRead(0, 64).fold<List<int>>(
      <int>[],
      (buffer, chunk) {
        buffer.addAll(chunk);
        return buffer;
      },
    );
    if (String.fromCharCodes(prefix)
        .startsWith('version https://git-lfs.github.com/spec/v1')) {
      throw AccdbPointerException(file.path);
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

  Future<AccessPageHeaderInfo> readPageHeader(int pageNumber) async {
    final data = (await readPage(pageNumber)).asUint8List();
    final pageType = data.first;
    return AccessPageHeaderInfo(
      pageNumber: pageNumber,
      pageType: pageType,
      pageTypeName: _pageTypeName(pageType),
    );
  }

  Future<AccessTableDefPageInfo> inspectSystemCatalogPage() async {
    final data = (await readPage(systemCatalogPageNumber)).asUint8List();
    final bytes = ByteData.sublistView(data);
    return AccessTableDefPageInfo(
      pageNumber: systemCatalogPageNumber,
      pageType: data.first,
      pageTypeName: _pageTypeName(data.first),
      nextTableDefPage:
          bytes.getUint32(format.offsetNextTableDefPage, Endian.little),
      rowCount: bytes.getUint32(format.offsetNumRows, Endian.little),
      tableTypeRaw: bytes.getUint8(format.offsetTableType),
    );
  }

  Future<void> close() async {
    await _pageChannel.close();
  }

  static String _pageTypeName(int pageType) {
    switch (pageType) {
      case 0x00:
        return 'INVALID';
      case 0x01:
        return 'DATA';
      case 0x02:
        return 'TABLE_DEF';
      default:
        return 'UNKNOWN';
    }
  }
}
