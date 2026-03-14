import 'package:jackcess_dart/jackcess_dart.dart';

void main() async {
  final db = await AccessDatabase.openPath(r'c:\MyDartProjects\access_to_dart\fixtures\teste1\teste1.accdb');
  try {
    final reader = DataPageReader(format: db.format, pageChannel: db.pageChannel);
    var rows = await reader.readPageRows(17);
    for (int i=0; i < 3; i++) {
        var row = rows[i];
        String str = String.fromCharCodes(row.rowData.where((b) => b >= 32 && b <= 126));
        print('Row $i ascii: $str');
        String msys = String.fromCharCodes(row.rowData.buffer.asUint16List(row.rowData.offsetInBytes, row.rowData.length ~/ 2));
        print('Row $i unicode: $msys\n');
    }
  } finally {
    db.close();
  }
}
