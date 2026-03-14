import 'dart:typed_data';

import 'jet_format.dart';
import 'page_channel.dart';

/// Parses an Access Usage Map, ported from Jackcess's UsageMap.java.
///
/// A usage map records which pages belong to a table.
/// In the TDEF, at OFFSET_OWNED_PAGES (55 for Jet4), there are 4 bytes:
///   byte 0:      row number within the usage-map page
///   bytes 1-3:   3-byte LE page number of the usage-map page
///
/// The usage-map page is a data page.  We call findRowStart() to get
/// `rowStart`, then:
///   byte at rowStart      = map_type (0=inline, 1=reference)
///   If inline:
///     bytes rowStart+1..+4 = start_page (int32 LE)
///     bytes rowStart+5..end = bitmap (page bit-set)
///   If reference:
///     bytes rowStart+1..+4*(n+1) = list of reference page numbers (int32 each)
///     Each reference page has page_type 0x05 followed by a bitmap.
class UsageMap {
  final List<int> pageNumbers;
  const UsageMap(this.pageNumbers);

  static const int _mapTypeInline    = 0;
  static const int _mapTypeReference = 1;
  static const int _refPageType      = 0x05; // PageTypes.USAGE_MAP

  // OFFSET_USAGE_MAP_START in Jet4 = 5 (bytes from rowStart to first bitmap byte)
  static const int _offsetUsageMapStart    = 5; // type(1) + startPage(4)
  // OFFSET_USAGE_MAP_PAGE_DATA in Jet4 = 4
  static const int _offsetUsageMapPageData = 4; // page_type(1) + reserved(3)

  /// Read from [tdefData] at [tdefOffset] (OFFSET_OWNED_PAGES = 55 in Jet4).
  static Future<UsageMap> readFromTdef({
    required PageChannel pageChannel,
    required JetFormat format,
    required Uint8List tdefData,
    required int tdefOffset,
  }) async {
    if (tdefOffset + 4 > tdefData.length) return const UsageMap([]);

    // Row number and page number are stored as: row(1 byte) + page(3 bytes LE)
    final rowNum = tdefData[tdefOffset];
    // 3-byte little-endian integer at tdefOffset+1
    final pageNum = tdefData[tdefOffset + 1] |
                    (tdefData[tdefOffset + 2] << 8) |
                    (tdefData[tdefOffset + 3] << 16);

    if (pageNum <= 0) return const UsageMap([]);

    try {
      final buffer = await pageChannel.readPage(pageNum);
      final umapData = buffer.asUint8List();
      final umapBd  = ByteData.view(buffer);

      // findRowStart: rows are stored from the end of the page going backwards.
      // Row N's offset is stored at page[14 + 2*N] (for Jet4, OFFSET_ROW_START=14).
      final rowStart = _findRowStart(umapBd, rowNum, umapData);
      if (rowStart < 0 || rowStart >= umapData.length) return const UsageMap([]);

      final mapType = umapData[rowStart];

      if (mapType == _mapTypeInline) {
        return _readInline(umapData, umapBd, rowStart, rowNum, pageNum, format.pageSize);
      } else if (mapType == _mapTypeReference) {
        return await _readReference(
            umapData, umapBd, rowStart, rowNum, pageNum, pageChannel, format.pageSize);
      }
      return const UsageMap([]);
    } catch (e) {
      return const UsageMap([]);
    }
  }

  // ──────────────────────────────────────────────────────────────────────────

  static UsageMap _readInline(
      Uint8List data, ByteData bd, int rowStart, int rowNum, int pageNum, int pageSize) {
    // start_page is at rowStart + 1 (4 bytes LE)
    if (rowStart + 5 > data.length) return const UsageMap([]);
    final startPage = bd.getInt32(rowStart + 1, Endian.little);
    // bitmap starts at rowStart + _offsetUsageMapStart (5)
    final bitmapStart = rowStart + _offsetUsageMapStart;
    final rowEnd = _findRowEnd(bd, rowNum, pageSize, data);
    if (bitmapStart >= rowEnd || rowEnd > data.length) return const UsageMap([]);
    final bitmap = data.sublist(bitmapStart, rowEnd);
    return UsageMap(_parseBitmap(bitmap, startPage));
  }

  static Future<UsageMap> _readReference(
      Uint8List data, ByteData bd, int rowStart, int rowNum, int pageNum,
      PageChannel pageChannel, int pageSize) async {
    // Each 4-byte int after the type byte is a reference to a map page.
    final rowEnd = _findRowEnd(bd, rowNum, pageSize, data);
    final pages = <int>[];
    int pagesPerMapPage = 0; // will compute based on first ref page

    // numPages = (rowEnd - rowStart - 1) / 4
    final numRefPages = (rowEnd - rowStart - 1) ~/ 4;

    for (int i = 0; i < numRefPages; i++) {
      final refPageNumOffset = rowStart + 1 + (i * 4);
      if (refPageNumOffset + 4 > data.length) break;
      final refPageNum = bd.getInt32(refPageNumOffset, Endian.little);
      if (refPageNum <= 0) continue;

      try {
        final refBuffer = await pageChannel.readPage(refPageNum);
        final refData = refBuffer.asUint8List();
        if (refData.isEmpty || refData[0] != _refPageType) continue;

        // Bitmap starts at OFFSET_USAGE_MAP_PAGE_DATA (4)
        final bitmapStart = _offsetUsageMapPageData;
        final bitmap = refData.sublist(bitmapStart);

        // maxPagesPerMapPage = (pageSize - _offsetUsageMapPageData) * 8
        if (pagesPerMapPage == 0) {
          pagesPerMapPage = (pageSize - _offsetUsageMapPageData) * 8;
        }

        final basePageOffset = pagesPerMapPage * i;
        pages.addAll(_parseBitmapWithBase(bitmap, basePageOffset));
      } catch (_) {}
    }
    return UsageMap(pages);
  }

  /// Find the start position of a row in a usage-map data page.
  /// Mirrors TableImpl.findRowStart(buffer, rowNum, format):
  ///   rowStart = page[OFFSET_ROW_START + rowNum * SIZE_ROW_LOCATION] & 0x0FFF
  /// For Jet4: OFFSET_ROW_START=14, SIZE_ROW_LOCATION=2.
  static int _findRowStart(ByteData bd, int rowNum, Uint8List data) {
    const offsetRowStart = 14;
    const sizeRowLocation = 2;
    final offsetInPage = offsetRowStart + (rowNum * sizeRowLocation);
    if (offsetInPage + 2 > data.length) return -1;
    final raw = bd.getInt16(offsetInPage, Endian.little);
    return raw & 0x0FFF;
  }

  /// Find the end position of a row.
  static int _findRowEnd(ByteData bd, int rowNum, int pageSize, Uint8List data) {
    if (rowNum == 0) return pageSize;
    const offsetRowStart = 14;
    const sizeRowLocation = 2;
    final prevOffset = offsetRowStart + ((rowNum - 1) * sizeRowLocation);
    if (prevOffset + 2 > data.length) return pageSize;
    return bd.getInt16(prevOffset, Endian.little) & 0x0FFF;
  }

  static List<int> _parseBitmap(Uint8List bitmap, int startPage) {
    return _parseBitmapWithBase(bitmap, 0).map((i) => startPage + i).toList();
  }

  static List<int> _parseBitmapWithBase(Uint8List bitmap, int baseOffset) {
    final pages = <int>[];
    for (int byteIdx = 0; byteIdx < bitmap.length; byteIdx++) {
      final b = bitmap[byteIdx];
      if (b == 0) continue;
      for (int bit = 0; bit < 8; bit++) {
        if ((b & (1 << bit)) != 0) {
          pages.add(baseOffset + byteIdx * 8 + bit);
        }
      }
    }
    return pages;
  }
}
