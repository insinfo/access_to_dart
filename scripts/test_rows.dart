import 'dart:typed_data';
import 'package:jackcess_dart/jackcess_dart.dart';

void main() async {
  final db = await AccessDatabase.openPath(r'c:\MyDartProjects\access_to_dart\fixtures\teste1\teste1.accdb');
  try {
    final tdef = TableDefReader(format: db.format, pageChannel: db.pageChannel, pageNumber: 2);
    final columns = await tdef.readColumns();
    int colCount = columns.length;
    print('Columns: $colCount');

    // MsysObjects is likely at page 17, 13, 11
    final dataReader = DataPageReader(format: db.format, pageChannel: db.pageChannel);
    for (int p in [6, 17]) {
        var rows = await dataReader.readPageRows(p);
        print('Page $p has ${rows.length} rows');
        for (var row in rows.take(2)) {
            var data = row.rowData;
            var view = ByteData.view(data.buffer, data.offsetInBytes, data.length);
            int rowCols = view.getInt16(0, Endian.little);
            print('Row ${row.rowNumber} len=${data.length} - cols=$rowCols');
            int nullMaskSize = (rowCols + 7) ~/ 8;
            print(' Null mask size: $nullMaskSize');
            if (data.length >= nullMaskSize) {
                var nullMask = data.sublist(data.length - nullMaskSize);
                print(' Null mask bytes: $nullMask');
            }
        }
    }
    
  } finally {
    db.close();
  }
}
