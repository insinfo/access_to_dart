import 'dart:io';
import 'package:jackcess_dart/jackcess_dart.dart';

void main() async {
  final db = await AccessDatabase.openPath(r'fixtures/teste1/teste1.accdb');
  try {
    final catalog = AccessCatalog(format: db.format, pageChannel: db.pageChannel);
    final entries = await catalog.debugGetAllEntries();

    final tablesContainer = entries.firstWhere(
      (e) => e.name == 'Tables' && e.rawType == 3,
      orElse: () => throw Exception('Tables not found'),
    );
    print('Tables container id: ${tablesContainer.id}');

    print('\nAll type=1 entries:');
    for (final e in entries.where((e) => e.rawType == 1)) {
      final hexFlags = e.flags.toUnsigned(32).toRadixString(16);
      stdout.writeln('  name="${e.name}" id=${e.id} parentId=${e.parentId} flags=0x$hexFlags isSystem=${e.isSystem}');
    }
  } finally {
    db.close();
  }
}
