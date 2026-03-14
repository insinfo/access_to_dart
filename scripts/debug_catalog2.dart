import 'package:jackcess_dart/jackcess_dart.dart';

void main() async {
  final db = await AccessDatabase.openPath(r'fixtures/teste1/teste1.accdb');
  try {
    final tdefReader = TableDefReader(
        format: db.format, pageChannel: db.pageChannel, pageNumber: 2);
    final cols = await tdefReader.readColumns();
    final rowReader =
        RowReader(format: db.format, columns: cols, pageChannel: db.pageChannel);

    final tdefBuf = await db.pageChannel.readPage(2);
    final tdefUint8 = tdefBuf.asUint8List();
    final usageMap = await UsageMap.readFromTdef(
      pageChannel: db.pageChannel,
      format: db.format,
      tdefData: tdefUint8,
      tdefOffset: 55,
    );

    print('Usage map pages: ${usageMap.pageNumbers}');
    
    final dataReader = DataPageReader(format: db.format, pageChannel: db.pageChannel);
    
    for (final pageNum in usageMap.pageNumbers) {
      final rows = await dataReader.readPageRows(pageNum);
      print('\n--- Page $pageNum has ${rows.length} rows ---');
      for (final row in rows) {
        if (row.isDeleted || row.isOverflow) continue;
        final map = await rowReader.readRow(row);
        final name = map['Name'];
        final type = map['Type'];
        final id = map['Id'];
        final flags = map['Flags'];
        if (name != null) {
          print('  row=${row.rowNumber} name="$name" type=$type id=$id flags=0x${(flags as int?)?.toUnsigned(32).toRadixString(16)} mapEmpty=${map.isEmpty}');
        }
      }
    }
  } finally {
    db.close();
  }
}
