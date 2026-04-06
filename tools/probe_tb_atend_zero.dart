import 'package:jackcess_dart/jackcess_dart.dart';

Future<void> main() async {
  final db = await AccessDatabase.openPath(
    'fixtures/SIGA2021-CENTRAL_be_2026_senha_4461.accdb',
    password: '4461',
  );
  try {
    final catalog = AccessCatalog(
      format: db.format,
      pageChannel: db.pageChannel,
    );
    final model = await catalog.read(
      'fixtures/SIGA2021-CENTRAL_be_2026_senha_4461.accdb',
    );
    final table = model.tables.firstWhere((candidate) => candidate.name == 'TbAtend');
    final tdefReader = TableDefReader(
      format: db.format,
      pageChannel: db.pageChannel,
      pageNumber: table.tdefPageNumber,
    );
    final tdefData = await tdefReader.readTableDefinitionData();
    final cols = await tdefReader.readColumns();
    final rowReader = RowReader(
      format: db.format,
      columns: cols,
      pageChannel: db.pageChannel,
    );
    final usageMap = await UsageMap.readFromTdef(
      pageChannel: db.pageChannel,
      format: db.format,
      tdefData: tdefData,
      tdefOffset: 55,
    );
    final dataReader = DataPageReader(
      format: db.format,
      pageChannel: db.pageChannel,
    );

    final rows = <Map<String, dynamic>>[];

    final codValues = <int>[];
    final suspicious = <Map<String, dynamic>>[];
    var nullCodAtend = 0;
    for (final pageNum in usageMap.pageNumbers) {
      final pageRows = await dataReader.readPageRows(pageNum);
      for (final pageRow in pageRows) {
        final row = await rowReader.readRow(pageRow);
        if (row.isEmpty) {
          continue;
        }
        rows.add(row);
        final value = row['CodAtend'];
        if (value is int) {
          codValues.add(value);
        } else if (value == null) {
          nullCodAtend++;
        }
        if (value == null || value == 0) {
          suspicious.add({
            '_page': pageNum,
            '_row': pageRow.rowNumber,
            '_deleted': pageRow.isDeleted,
            '_overflow': pageRow.isOverflow,
            ...row,
          });
        }
      }
    }

    final counts = <int, int>{};
    for (final value in codValues) {
      counts[value] = (counts[value] ?? 0) + 1;
    }
    final duplicates = counts.entries.where((entry) => entry.value > 1).toList()
      ..sort((left, right) => right.value.compareTo(left.value));

    print('rows=${rows.length}');
    print('nullCodAtend=$nullCodAtend');
    print('distinct=${counts.length}');
    print('duplicates=${duplicates.length}');
    print('duplicateSample=${duplicates.take(10).map((entry) => '${entry.key}:${entry.value}').join(', ')}');
    print('suspicious=${suspicious.length}');
    for (final row in suspicious.take(10)) {
      print(row);
    }
  } finally {
    await db.close();
  }
}