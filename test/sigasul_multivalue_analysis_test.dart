import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/src/accdb_analyzer.dart';
import 'package:crypto/crypto.dart';
import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';

void main() {
  test(
      'all SIGAsul text collections match independent DAO values and parent links',
      () async {
    final oracle = jsonDecode(
            await File('test/fixtures/sigasul_complex_dao.json').readAsString())
        as Map;
    const source = 'fixtures/SIGA2021-SUL_be_senha_4462.accdb';
    expect((await sha256.bind(File(source).openRead()).first).toString(),
        oracle['sourceSha256']);
    final db = await AccessDatabase.openPath(source, password: '4462');
    try {
      final catalog =
          AccessCatalog(format: db.format, pageChannel: db.pageChannel);
      final model = await catalog.read(source);
      final analysis = await AccdbAnalyzer(model: model, db: db).analyze();
      final tables = (analysis['tables'] as List).cast<Map>();
      final children =
          tables.where((t) => t['syntheticKind'] == 'multivalue').toList();
      expect(children, hasLength(3));
      expect(tables.where((t) => t['syntheticKind'] == 'attachment'),
          hasLength(6));
      expect(tables, hasLength(54));
      expect((analysis['summary'] as Map)['tables'], 54);
      final reader =
          TableReader(format: db.format, pageChannel: db.pageChannel);
      for (final child in children) {
        final expected = (oracle['columns'] as List).cast<Map>().singleWhere(
            (c) =>
                c['table'] == child['complexParentTable'] &&
                c['column'] == child['complexParentColumn']);
        final parent =
            tables.singleWhere((t) => t['name'] == child['complexParentTable']);
        final parentRows = await reader.readAllRows(parent['tdefPage'] as int);
        final keys = <Object?, int>{};
        for (final row in parentRows) {
          final link = row[child['complexParentColumn']];
          if (link != null)
            expect(keys.containsKey(link), isFalse,
                reason: 'Collection owners must be unambiguous');
          if (link != null) keys[link] = row[expected['primaryKey']] as int;
        }
        final rows = await reader.readAllRows(child['tdefPage'] as int);
        expect(rows.length, child['physicalRowCount']);
        expect(child['rowCount'], expected['childRows']);
        var orphanCount = 0;
        final records = <String>[];
        for (final row in rows) {
          final owner = keys[row[child['complexLinkColumn']]];
          if (owner == null) {
            orphanCount++;
            continue;
          }
          final key = 'I$owner';
          final value = row[child['complexValueColumn']];
          expect(value == null || value is String, isTrue);
          final canonical = value == null ? 'N' : 'S$value';
          records.add('${key.length}:$key${canonical.length}:$canonical');
        }
        expect(orphanCount, child['orphanRowCount']);
        expect(
            orphanCount, child['complexParentColumn'] == 'MotivoNão' ? 1 : 0);
        expect(records.length, expected['childRows']);
        records.sort();
        expect(sha256.convert(utf8.encode(records.join())).toString(),
            expected['valueSha256']);
      }
    } finally {
      await db.close();
    }
  }, timeout: const Timeout(Duration(minutes: 6)));
}
