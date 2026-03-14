import 'dart:typed_data';

import 'jet_format.dart';
import 'page_channel.dart';

class DataPageRow {
  final int rowNumber;
  final bool isDeleted;
  final bool isOverflow;
  final Uint8List rowData;

  const DataPageRow({
    required this.rowNumber,
    required this.isDeleted,
    required this.isOverflow,
    required this.rowData,
  });
}

class DataPageReader {
  final JetFormat format;
  final PageChannel pageChannel;

  DataPageReader({
    required this.format,
    required this.pageChannel,
  });

  /// Reads all rows from a given data page.
  Future<List<DataPageRow>> readPageRows(int pageNumber) async {
    final buffer = await pageChannel.readPage(pageNumber);
    final bytes = ByteData.view(buffer);
    final uint8List = buffer.asUint8List();

    // Verify it's a data page (0x01)
    if (uint8List[0] != 0x01) {
      throw FormatException('Page $pageNumber is not a Data Page');
    }

    int rowCount = bytes.getInt16(12, Endian.little);
    
    List<DataPageRow> rows = [];
    for (int i = 0; i < rowCount; i++) {
        int rowStartOffset = 14 + (2 * i);
        int rowStart = bytes.getInt16(rowStartOffset, Endian.little);
        
        bool isDeleted = (rowStart & 0x8000) != 0;
        bool isOverflow = (rowStart & 0x4000) != 0;
        int startPos = rowStart & 0x0FFF;
        
        // Find row end
        int endPos;
        if (i == 0) {
            endPos = format.pageSize;
        } else {
            int prevRowStartOffset = 14 + (2 * (i - 1));
            endPos = bytes.getInt16(prevRowStartOffset, Endian.little) & 0x0FFF;
        }
        
        if (startPos > endPos || endPos > format.pageSize) {
            // Corrupted or invalid row
            continue;
        }
        
        rows.add(DataPageRow(
            rowNumber: i,
            isDeleted: isDeleted,
            isOverflow: isOverflow,
            rowData: uint8List.sublist(startPos, endPos)
        ));
    }
    
    return rows;
  }
}
