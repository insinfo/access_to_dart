import 'dart:typed_data';
import 'package:jackcess_dart/jackcess_dart.dart';

void main() async {
  final db = await AccessDatabase.openPath(r'c:\MyDartProjects\access_to_dart\fixtures\teste1\teste1.accdb');
  try {
    for (int i = 0; i < 20; i++) {
        final buffer = await db.pageChannel.readPage(i);
        if (buffer.asUint8List()[0] == 0x01) {
             print('Page $i is a DataPage');
             int rowCount = ByteData.view(buffer).getInt16(12, Endian.little);
             print('  Rows on page: $rowCount');
        }
    }
  } finally {
    db.close();
  }
}
