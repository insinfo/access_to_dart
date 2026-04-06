import 'dart:typed_data';

import 'jet_format.dart';
import 'page_channel.dart';
import 'text_sanitizer.dart';

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
  final int? precision;
  final int? scale;

  const ColumnDef({
    required this.name,
    required this.type,
    required this.columnNumber,
    required this.variableColumnNumber,
    required this.fixedOffset,
    required this.length,
    required this.flags,
    required this.extFlags,
    required this.precision,
    required this.scale,
  });

  bool get isVariableLength => (flags & fixedLengthFlagMask) == 0;

  bool get isAutoNumber =>
      (flags & (autoNumberFlagMask | autoNumberGuidFlagMask)) != 0;

  bool get isCalculated => (extFlags & calculatedExtFlagMask) != 0;
}

class IndexColumnDef {
  static const int ascendingFlagMask = 0x01;

  final int columnNumber;
  final int flags;

  const IndexColumnDef({required this.columnNumber, required this.flags});

  bool get ascending => (flags & ascendingFlagMask) != 0;
}

class IndexDef {
  static const int uniqueFlagMask = 0x01;
  static const int ignoreNullsFlagMask = 0x02;
  static const int requiredFlagMask = 0x08;
  static const int primaryKeyType = 1;
  static const int foreignKeyType = 2;

  final int indexNumber;
  final int backingDataNumber;
  final int indexType;
  final int flags;
  final int? relatedTablePageNumber;
  final int? relatedIndexNumber;
  final bool cascadeUpdates;
  final bool cascadeDeletes;
  final bool cascadeNullOnDelete;
  final List<IndexColumnDef> columns;
  final String name;

  const IndexDef({
    required this.indexNumber,
    required this.backingDataNumber,
    required this.indexType,
    required this.flags,
    required this.relatedTablePageNumber,
    required this.relatedIndexNumber,
    required this.cascadeUpdates,
    required this.cascadeDeletes,
    required this.cascadeNullOnDelete,
    required this.columns,
    required this.name,
  });

  bool get isPrimaryKey => indexType == primaryKeyType;
  bool get isForeignKey => indexType == foreignKeyType;
  bool get isUnique => isPrimaryKey || (flags & uniqueFlagMask) != 0;
  bool get isRequired => (flags & requiredFlagMask) != 0;
  bool get ignoreNulls => (flags & ignoreNullsFlagMask) != 0;
}

class TableDefinition {
  final List<ColumnDef> columns;
  final List<IndexDef> indexes;

  const TableDefinition({required this.columns, required this.indexes});
}

/// Parses Table Definition (TDEF) pages.
class TableDefReader {
  static const int _offsetNumCols = 45;
  static const int _offsetNumLogicalIndexes = 47;
  static const int _offsetNumIndexes = 51;
  static const int _offsetIndexDefBlock = 63;
  static const int _sizeIndexDefinition = 12;
  static const int _sizeColumnDefBlock = 25;
  static const int _sizeIndexColumnBlock = 52;
  static const int _skipBeforeIndex = 4;
  static const int _sizeInlineUsageMapPointer = 4;
  static const int _skipBeforeIndexFlags = 4;
  static const int _skipAfterIndexFlags = 5;
  static const int _skipBeforeIndexSlot = 4;
  static const int _skipAfterIndexSlot = 4;
  static const int _maxIndexColumns = 10;
  static const int _columnUnused = -1;
  static const int _invalidIndexNumber = -1;
  static const int _cascadeFlag = 0x01;
  static const int _cascadeNullFlag = 0x02;

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

  Future<TableDefinition> readDefinition() async {
    final uint8List = await readTableDefinitionData();
    final bytes = ByteData.sublistView(uint8List);

    if (uint8List[0] != 0x02) {
      throw FormatException('Page $pageNumber is not a TableDef page');
    }

    final colCount = bytes.getInt16(_offsetNumCols, Endian.little);
    final logicalIndexCount =
        bytes.getInt32(_offsetNumLogicalIndexes, Endian.little);
    final indexCount = bytes.getInt32(_offsetNumIndexes, Endian.little);
    final colOffset =
        _offsetIndexDefBlock + (indexCount * _sizeIndexDefinition);

    final rawColumns = <ColumnDef>[];
    var currentOffset = colOffset;
    for (var i = 0; i < colCount; i++) {
      rawColumns.add(
        ColumnDef(
          name: '',
          type: bytes.getUint8(currentOffset),
          columnNumber: bytes.getInt16(currentOffset + 5, Endian.little),
          variableColumnNumber:
              bytes.getInt16(currentOffset + 7, Endian.little),
          precision: bytes.getUint8(currentOffset) == 0x10
              ? bytes.getUint8(currentOffset + 11)
              : null,
          scale: bytes.getUint8(currentOffset) == 0x10
              ? bytes.getUint8(currentOffset + 12)
              : null,
          flags: bytes.getUint8(currentOffset + 15),
          extFlags: bytes.getUint8(currentOffset + 16),
          fixedOffset: bytes.getInt16(currentOffset + 21, Endian.little),
          length: bytes.getInt16(currentOffset + 23, Endian.little),
        ),
      );
      currentOffset += _sizeColumnDefBlock;
    }

    final namedColumns = <ColumnDef>[];
    for (final rawColumn in rawColumns) {
      final nameLength = bytes.getInt16(currentOffset, Endian.little);
      currentOffset += 2;
      final name =
          (nameLength > 0 && currentOffset + nameLength <= uint8List.length)
              ? _decodeUtf16Le(uint8List, currentOffset, nameLength)
              : '';
      currentOffset += nameLength;
      namedColumns.add(
        ColumnDef(
          name: name,
          type: rawColumn.type,
          columnNumber: rawColumn.columnNumber,
          variableColumnNumber: rawColumn.variableColumnNumber,
          fixedOffset: rawColumn.fixedOffset,
          length: rawColumn.length,
          flags: rawColumn.flags,
          extFlags: rawColumn.extFlags,
          precision: rawColumn.precision,
          scale: rawColumn.scale,
        ),
      );
    }

    namedColumns.sort((a, b) => a.columnNumber.compareTo(b.columnNumber));

    final indexDataColumns = <List<IndexColumnDef>>[];
    final indexDataFlags = <int>[];

    for (var i = 0; i < indexCount; i++) {
      currentOffset += _skipBeforeIndex;
      final columns = <IndexColumnDef>[];
      for (var j = 0; j < _maxIndexColumns; j++) {
        final columnNumber = bytes.getInt16(currentOffset, Endian.little);
        final flags = bytes.getUint8(currentOffset + 2);
        currentOffset += 3;
        if (columnNumber != _columnUnused) {
          columns.add(IndexColumnDef(columnNumber: columnNumber, flags: flags));
        }
      }
      currentOffset += _sizeInlineUsageMapPointer;
      final rootPageNumber = bytes.getInt32(currentOffset, Endian.little);
      currentOffset += 4;
      currentOffset += _skipBeforeIndexFlags;
      final indexFlags = bytes.getUint8(currentOffset);
      currentOffset += 1;
      currentOffset += _skipAfterIndexFlags;

      assert(
        (_skipBeforeIndex +
                (_maxIndexColumns * 3) +
                _sizeInlineUsageMapPointer +
                4 +
                _skipBeforeIndexFlags +
                1 +
                _skipAfterIndexFlags) ==
            _sizeIndexColumnBlock,
        'Index block layout no longer matches Jet4/ACE expectations',
      );

      indexDataColumns.add(columns);
      indexDataFlags.add(rootPageNumber == 0 ? indexFlags : indexFlags);
    }

    final logicalIndexMetas = <Map<String, dynamic>>[];
    for (var i = 0; i < logicalIndexCount; i++) {
      currentOffset += _skipBeforeIndexSlot;
      final indexNumber = bytes.getInt32(currentOffset, Endian.little);
      currentOffset += 4;
      final backingDataNumber = bytes.getInt32(currentOffset, Endian.little);
      currentOffset += 4;
      final relIndexType = bytes.getUint8(currentOffset);
      currentOffset += 1;
      final relIndexNumber = bytes.getInt32(currentOffset, Endian.little);
      currentOffset += 4;
      final relTablePageNumber = bytes.getInt32(currentOffset, Endian.little);
      currentOffset += 4;
      final cascadeUpdatesFlag = bytes.getUint8(currentOffset);
      currentOffset += 1;
      final cascadeDeletesFlag = bytes.getUint8(currentOffset);
      currentOffset += 1;
      final indexType = bytes.getUint8(currentOffset);
      currentOffset += 1;
      currentOffset += _skipAfterIndexSlot;

      logicalIndexMetas.add(<String, dynamic>{
        'indexNumber': indexNumber,
        'backingDataNumber': backingDataNumber,
        'relIndexType': relIndexType,
        'relIndexNumber': relIndexNumber,
        'relTablePageNumber': relTablePageNumber,
        'cascadeUpdates': (cascadeUpdatesFlag & _cascadeFlag) != 0,
        'cascadeDeletes': (cascadeDeletesFlag & _cascadeFlag) != 0,
        'cascadeNullOnDelete': (cascadeDeletesFlag & _cascadeNullFlag) != 0,
        'indexType': indexType,
      });
    }

    final indexNames = <String>[];
    for (var i = 0; i < logicalIndexCount; i++) {
      final nameLength = bytes.getInt16(currentOffset, Endian.little);
      currentOffset += 2;
      final name =
          (nameLength > 0 && currentOffset + nameLength <= uint8List.length)
              ? _decodeUtf16Le(uint8List, currentOffset, nameLength)
              : '';
      currentOffset += nameLength;
      indexNames.add(name);
    }

    final indexes = <IndexDef>[];
    for (var i = 0; i < logicalIndexCount; i++) {
      final meta = logicalIndexMetas[i];
      final backingDataNumber = meta['backingDataNumber'] as int;
      final flags =
          (backingDataNumber >= 0 && backingDataNumber < indexDataFlags.length)
              ? indexDataFlags[backingDataNumber]
              : 0;
      final columns = (backingDataNumber >= 0 &&
              backingDataNumber < indexDataColumns.length)
          ? indexDataColumns[backingDataNumber]
          : const <IndexColumnDef>[];
      indexes.add(
        IndexDef(
          indexNumber: meta['indexNumber'] as int,
          backingDataNumber: backingDataNumber,
          indexType: meta['indexType'] as int,
          flags: flags,
          relatedTablePageNumber: (meta['relTablePageNumber'] as int) > 0
              ? meta['relTablePageNumber'] as int
              : null,
          relatedIndexNumber:
              (meta['relIndexNumber'] as int) != _invalidIndexNumber
                  ? meta['relIndexNumber'] as int
                  : null,
          cascadeUpdates: meta['cascadeUpdates'] as bool,
          cascadeDeletes: meta['cascadeDeletes'] as bool,
          cascadeNullOnDelete: meta['cascadeNullOnDelete'] as bool,
          columns: columns,
          name: i < indexNames.length ? indexNames[i] : '',
        ),
      );
    }

    indexes.sort((a, b) => a.indexNumber.compareTo(b.indexNumber));

    return TableDefinition(columns: namedColumns, indexes: indexes);
  }

  /// Reads the core table definition columns.
  Future<List<ColumnDef>> readColumns() async =>
      (await readDefinition()).columns;

  Future<List<IndexDef>> readIndexes() async =>
      (await readDefinition()).indexes;

  String _decodeUtf16Le(Uint8List bytes, int offset, int length) {
    return decodeSanitizedUtf16Le(bytes, offset, length);
  }
}


