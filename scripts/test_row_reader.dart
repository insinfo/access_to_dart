import 'package:jackcess_dart/jackcess_dart.dart';

void main() async {
  final db = await AccessDatabase.openPath(r'c:\MyDartProjects\access_to_dart\fixtures\teste1\teste1.accdb');
  try {
    final tdef = TableDefReader(format: db.format, pageChannel: db.pageChannel, pageNumber: 2);
    final columns = await tdef.readColumns();
    
    final reader = DataPageReader(format: db.format, pageChannel: db.pageChannel);
    final rowReader = RowReader(
      format: db.format,
      columns: columns,
      pageChannel: db.pageChannel,
    );
    
    for (int p in [17]) {
        var rows = await reader.readPageRows(p);
        for (var row in rows) {
            var map = await rowReader.readRow(row);
            if (map.isNotEmpty) {
                print('Row ${row.rowNumber} (${map['Type']}): ${map['Name']}');
            }
        }
    }
  } catch (e, st) {
    print('Error: $e');
    print(st);
  } finally {
    db.close();
  }
}
