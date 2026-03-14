import 'dart:typed_data';

import 'access_types.dart';
import 'data_page_reader.dart';
import 'jet_format.dart';
import 'page_channel.dart';
import 'row_reader.dart';
import 'table_def_reader.dart';
import 'usage_map.dart';

/// Reads all columns and rows from an Access table given its TDEF page number.
class TableReader {
  final JetFormat format;
  final PageChannel pageChannel;

  TableReader({required this.format, required this.pageChannel});

  /// Returns the [AccessTableSchema] for a table at [tdefPage].
  Future<AccessTableSchema> readSchema(
      String tableName, int tdefPage) async {
    final tdefReader =
        TableDefReader(format: format, pageChannel: pageChannel, pageNumber: tdefPage);
    final tdefData = await tdefReader.readTableDefinitionData();
    final bytes = ByteData.sublistView(tdefData);
    if (tdefData[0] != 0x02) {
      throw FormatException(
          'Page $tdefPage for table $tableName is not a TDEF');
    }

    final rowCount = bytes.getInt32(format.offsetNumRows, Endian.little);
    final cols = await tdefReader.readColumns();

    return AccessTableSchema(
      name: tableName,
      tdefPageNumber: tdefPage,
      rowCount: rowCount,
      sampleRows: const [],
      columns: cols
          .map((c) => AccessColumnSchema(
                name: c.name,
                typeCode: c.type,
                typeName: AccessColumnSchema.typeCodeToName(c.type),
                length: c.length,
                columnNumber: c.columnNumber,
                variableColumnNumber: c.variableColumnNumber,
                fixedOffset: c.fixedOffset,
                isVariableLength: c.isVariableLength,
                isAutoNumber: c.isAutoNumber,
                isCalculated: c.isCalculated,
                flags: c.flags,
                extFlags: c.extFlags,
              ))
          .toList(),
    );
  }

  /// Reads all rows from a table at [tdefPage].
  Future<List<Map<String, dynamic>>> readAllRows(int tdefPage) async {
    final tdefReader =
        TableDefReader(format: format, pageChannel: pageChannel, pageNumber: tdefPage);
    final tdefData = await tdefReader.readTableDefinitionData();
    if (tdefData[0] != 0x02) return [];

    final cols = await tdefReader.readColumns();
    final rowReader =
        RowReader(format: format, columns: cols, pageChannel: pageChannel);

    // Phase 2: find data pages via usage map
    // UsageMap offset in TDEF after the header: OFFSET_USAGE_MAPS in Jet4 = 55
    // There are two usage maps: one for data pages, one for free-space.
    // data usage map starts at 55, free-space at 55+9 = 64 approx.
    const usageMapOffset = 55; // OFFSET_OWNED_PAGES for Jet4
    final usageMap = await UsageMap.readFromTdef(
      pageChannel: pageChannel,
      format: format,
      tdefData: tdefData,
      tdefOffset: usageMapOffset,
    );

    final dataReader = DataPageReader(format: format, pageChannel: pageChannel);
    final result = <Map<String, dynamic>>[];

    for (final pageNum in usageMap.pageNumbers) {
      try {
        final rows = await dataReader.readPageRows(pageNum);
        for (final row in rows) {
          if (!row.isDeleted && !row.isOverflow) {
            final map = await rowReader.readRow(row);
            if (map.isNotEmpty) result.add(map);
          }
        }
      } catch (_) {
        // Skip pages that fail to parse
      }
    }
    return result;
  }
}
