import 'package:jackcess_dart/jackcess_dart.dart';

void main() async {
  final db = await AccessDatabase.openPath(r'c:\MyDartProjects\access_to_dart\fixtures\teste1\teste1.accdb');
  try {
    print('Opened DB format: ${db.format.name}');
    
    // Page 2 is MSysObjects
    final reader = TableDefReader(
       format: db.format, 
       pageChannel: db.pageChannel,
       pageNumber: 2
    );
    
    final columns = await reader.readColumns();
    print('Parsed MSysObjects columns:');
    for (var c in columns) {
      print(' - $c');
    }
  } catch (e, st) {
    print('Error: $e');
    print(st);
  } finally {
    await db.close();
  }
}
