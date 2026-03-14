import 'dart:typed_data';

import 'jet_format.dart';
import 'page_channel.dart';

/// Information about a column extracted from a TableDef page.
class ColumnDef {
  static const int fixedLengthFlagMask = 0x01;
  static const int autoNumberFlagMask = 0x04;
  static const int autoNumberGuidFlagMask = 0x40;
  static const int calculatedExtFlagMask = 0xC0;

  final String name;
  final int type;
  final int columnNumber;
  final int variableColumnNumber;
  final int fixedOffset;
  final int length;
  final int flags;
  final int extFlags;

  const ColumnDef({
    required this.name,
    required this.type,
    required this.columnNumber,
    required this.variableColumnNumber,
    required this.fixedOffset,
    required this.length,
    required this.flags,
    required this.extFlags,
  });

  bool get isVariableLength => (flags & fixedLengthFlagMask) == 0;

  bool get isAutoNumber =>
      (flags & (autoNumberFlagMask | autoNumberGuidFlagMask)) != 0;

  bool get isCalculated => (extFlags & calculatedExtFlagMask) != 0;

  @override
  String toString() {
    return 'ColumnDef(name: $name, type: $type, colNum: $columnNumber, '
        'varColNum: $variableColumnNumber, fixedOffset: $fixedOffset, '
        'len: $length, flags: 0x${flags.toRadixString(16)}, '
        'extFlags: 0x${extFlags.toRadixString(16)})';
  }
}

/// Parses Table Definition (TDEF) pages.
class TableDefReader {
  final JetFormat format;
  final PageChannel pageChannel;
  final int pageNumber;

  TableDefReader({
    required this.format,
    required this.pageChannel,
    required this.pageNumber,
  });

  Future<Uint8List> readTableDefinitionData() async {
    final firstPageBuffer = await pageChannel.readPage(pageNumber);
    final firstPage = firstPageBuffer.asUint8List();

    if (firstPage[0] != 0x02) {
      throw FormatException('Page $pageNumber is not a TableDef page');
    }

    final out = BytesBuilder(copy: false)..add(firstPage);
    var nextPage = ByteData.sublistView(firstPage)
        .getUint32(format.offsetNextTableDefPage, Endian.little);

    while (nextPage != 0) {
      final nextBuffer = await pageChannel.readPage(nextPage);
      final nextBytes = nextBuffer.asUint8List();
      out.add(nextBytes.sublist(8));
      nextPage = ByteData.sublistView(nextBytes)
          .getUint32(format.offsetNextTableDefPage, Endian.little);
    }

    return out.takeBytes();
  }

  /// Reads the core table definition.
  Future<List<ColumnDef>> readColumns() async {
    final uint8List = await readTableDefinitionData();
    final bytes = ByteData.sublistView(uint8List);

    // Verify it's a TableDef page (0x02)
    if (uint8List[0] != 0x02) {
      throw FormatException('Page $pageNumber is not a TableDef page');
    }

    int offsetNumCols = 45;
    int offsetNumRealIndex = 51;
    
    int colCount = bytes.getInt16(offsetNumCols, Endian.little);
    
    // TDEF header size in Jet4 is 63 absolute offset (defined by OffsetIndexDefBlock).
    int tdefHeaderEnd = 63; 
    
    int indexCount = bytes.getInt32(offsetNumRealIndex, Endian.little);
    
    // Jackcess SIZE_INDEX_COLUMN_BLOCK + (idxCount * SIZE_INDEX_INFO_BLOCK) 
    // real sizes in Jet4: SIZE_INDEX_COLUMN_BLOCK=52, SIZE_INDEX_INFO_BLOCK=28
    // However TableImpl.readColumnDefinitions calculates the col offset as:
    // colOffset = getFormat().OFFSET_INDEX_DEF_BLOCK + indexCount * getFormat().SIZE_INDEX_DEFINITION;
    // For Jet4: OFFSET_INDEX_DEF_BLOCK is 63, SIZE_INDEX_DEFINITION is 12 (plus column count * SIZE_COLUMN_HEADER)
    int colRecordSize = 25; // Jet4 SIZE_COLUMN_DEF_BLOCK is 25
    int colOffset = tdefHeaderEnd + (indexCount * 12);
    
    // Column records
    List<Map<String, dynamic>> rawCols = [];
    int currentOffset = colOffset;
    for (int i = 0; i < colCount; i++) {
        int colType = bytes.getUint8(currentOffset);
        int colNum = bytes.getInt16(currentOffset + 5, Endian.little);
        int varColNum = bytes.getInt16(currentOffset + 7, Endian.little);
        int flags = bytes.getUint8(currentOffset + 15);
        int extFlags = bytes.getUint8(currentOffset + 16);
        int fixedOffset = bytes.getInt16(currentOffset + 21, Endian.little);
        int length = bytes.getInt16(currentOffset + 23, Endian.little);
        
        rawCols.add({
           'type': colType,
           'colNum': colNum,
           'varColNum': varColNum,
           'flags': flags,
           'extFlags': extFlags,
           'fixedOffset': fixedOffset,
           'length': length,
        });
        currentOffset += colRecordSize;
    }

    // Column Names block
    // According to Jackcess, column names are stored right after the column definitions block.
    int namesOffset = colOffset + (colCount * colRecordSize);
    currentOffset = namesOffset;
    
    List<String> colNames = [];
    for (int i = 0; i < colCount; i++) {
        int nameLen = bytes.getInt16(currentOffset, Endian.little);
        currentOffset += 2;
        
        String name = '';
        if (nameLen > 0 && currentOffset + nameLen <= uint8List.length) {
            name = _decodeUtf16Le(uint8List, currentOffset, nameLen);
        }
        colNames.add(name);
        currentOffset += nameLen;
    }
    
    List<ColumnDef> columns = [];
    for (int i = 0; i < colCount; i++) {
        var raw = rawCols[i];
        columns.add(ColumnDef(
            name: colNames[i],
            type: raw['type'] as int,
            columnNumber: raw['colNum'] as int,
            variableColumnNumber: raw['varColNum'] as int,
            fixedOffset: raw['fixedOffset'] as int,
            length: raw['length'] as int,
            flags: raw['flags'] as int,
            extFlags: raw['extFlags'] as int,
        ));
    }
    
    columns.sort((a, b) => a.columnNumber.compareTo(b.columnNumber));
    
    return columns;
  }

  String _decodeUtf16Le(Uint8List bytes, int offset, int length) {
    final evenLength = length - (length % 2);
    final codeUnits = <int>[];
    for (var i = 0; i < evenLength; i += 2) {
      codeUnits.add(bytes[offset + i] | (bytes[offset + i + 1] << 8));
    }
    return String.fromCharCodes(codeUnits);
  }
}
