import 'dart:typed_data';
import 'package:jackcess_dart/jackcess_dart.dart';

void main() async {
  final db = await AccessDatabase.openPath(r'c:\MyDartProjects\access_to_dart\fixtures\teste1\teste1.accdb');
  try {
    final buffer = await db.pageChannel.readPage(2);
    final bytes = buffer.asUint8List();
    final byteData = ByteData.view(buffer);
    
    int indexCount = byteData.getInt32(51, Endian.little);
    int colCount = byteData.getInt16(45, Endian.little);
    
    int colOffset = 63 + (indexCount * 12);
    
    int namesOffset = colOffset + (colCount * 25);
    int curOff = namesOffset;
    for (int i = 0; i < colCount; i++) {
      int nameLen = byteData.getInt16(curOff, Endian.little);
      curOff += 2;
      print('Name length for $i: $nameLen');
      if (curOff + nameLen > bytes.length) break;
      String name = String.fromCharCodes(bytes.buffer.asUint16List(bytes.offsetInBytes + curOff, nameLen ~/ 2));
      print('Col $i Name = "$name"');
      curOff += nameLen;
    }
    
  } finally {
    db.close();
  }
}
