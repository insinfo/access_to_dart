import 'package:access_to_dart/src/accdb_analyzer.dart';
import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';

void main() {
  test('materializa attachment como tabela sintetica no analysis', () async {
    final database = await AccessDatabase.openPath(
      'fixtures/teste1/teste1.accdb',
    );
    try {
      final catalog = AccessCatalog(
        format: database.format,
        pageChannel: database.pageChannel,
      );
      final model = await catalog.read('fixtures/teste1/teste1.accdb');
      final analysis = await AccdbAnalyzer(model: model, db: database).analyze();
      final tables = ((analysis['tables'] as List?) ?? const <Object?>[])
          .whereType<Map>()
          .map((table) => table.cast<String, dynamic>())
          .toList(growable: false);

      final attachmentTable = tables.firstWhere(
        (table) => table['name'] == 'Contatos_Anexos_attachment',
      );

      expect(attachmentTable['syntheticKind'], 'attachment');
      expect(attachmentTable['attachmentParentTable'], 'Contatos');
      expect(attachmentTable['attachmentParentColumn'], 'Anexos');
      expect(attachmentTable['attachmentLinkColumn'], '_Anexos');

      final columns = ((attachmentTable['columns'] as List?) ?? const <Object?>[])
          .whereType<Map>()
          .map((column) => column.cast<String, dynamic>())
          .toList(growable: false);
      final fileData = columns.firstWhere((column) => column['name'] == 'FileData');
      expect(fileData['typeName'], 'OLE');
      expect(attachmentTable['postgres_ddl'] as String, contains('"file_data" BYTEA'));
    } finally {
      await database.close();
    }
  });
}