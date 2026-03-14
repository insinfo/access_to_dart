import 'package:jackcess_dart/jackcess_dart.dart';

void main() async {
  final db = await AccessDatabase.openPath(r'fixtures/teste1/teste1.accdb');
  try {
    final buffer = await db.pageChannel.readPage(2);
    final uint8 = buffer.asUint8List();
    
    final usageMap = await UsageMap.readFromTdef(
      pageChannel: db.pageChannel,
      format: db.format,
      tdefData: uint8,
      tdefOffset: 55,
    );
    
    print('UsageMap pages: ${usageMap.pageNumbers}');
  } finally {
    db.close();
  }
}
