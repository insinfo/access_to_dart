import 'package:jackcess_dart/jackcess_dart.dart';

void main() async {
  final db = await AccessDatabase.openPath(r'fixtures/teste1/teste1.accdb');
  try {
    final buf = await db.pageChannel.readPage(42);
    final uint8 = buf.asUint8List();
    print('Page 42 type: 0x${uint8[0].toRadixString(16)}');
    print('First 20 bytes: ${uint8.take(20).toList()}');
  } finally {
    db.close();
  }
}
