import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';
import '../support/subform_postgres_harness.dart';
import '../support/generation_test_utils.dart';

void main() {
  for (final format in ['insert', 'copy']) {
    test('physical Access NULL survives target DEFAULT in $format migration',
        () async {
      final temp = await Directory.systemTemp.createTemp('physical_null_');
      addTearDown(() => temp.delete(recursive: true));
      final baseline =
          jsonDecode(await (await ensureTeste1QuickAnalysis()).readAsString())
              as Map<String, dynamic>;
      final table = (baseline['tables'] as List)
          .cast<Map>()
          .singleWhere((t) => t['name'] == 'Contatos');
      final source =
          await AccessDatabase.openPath('fixtures/teste1/teste1.accdb');
      late List<Map<String, dynamic>> physical;
      try {
        physical = await TableReader(
                format: source.format, pageChannel: source.pageChannel)
            .readAllRows(table['tdefPage'] as int);
      } finally {
        await source.close();
      }
      expect(physical, hasLength(2));
      expect(physical.every((row) => !row.containsKey('Empresa')), isTrue,
          reason: 'Physical fixture exposes the sparse NULL representation');
      table['columns'] = (table['columns'] as List)
          .where((c) => ['ID', 'Empresa', 'Nome'].contains(c['name']))
          .toList();
      final company =
          (table['columns'] as List).singleWhere((c) => c['name'] == 'Empresa');
      company['defaultValue'] = 'MIGRATION_DEFAULT_PROBE';
      table['indexes'] = (table['indexes'] as List)
          .where((i) => i['isPrimaryKey'] == true)
          .toList();
      baseline['tables'] = [table];
      baseline['linkedTables'] = [];
      baseline['relationships'] = [];
      final input = File('${temp.path}/analysis.json');
      await input.writeAsString(jsonEncode(baseline));
      final synthetic =
          jsonDecode(jsonEncode(baseline)) as Map<String, dynamic>;
      final syntheticTable = (synthetic['tables'] as List).single as Map;
      syntheticTable.remove('tdefPage');
      syntheticTable['sampleRows'] = [
        {'ID': 9000}
      ];
      final syntheticInput = File('${temp.path}/synthetic.json');
      await syntheticInput.writeAsString(jsonEncode(synthetic));
      expect(
          await run([
            'migrate',
            '--analysis',
            syntheticInput.path,
            '--seed-format',
            format,
            '--output',
            '${temp.path}/synthetic'
          ], out: StringBuffer(), err: StringBuffer()),
          0);
      final syntheticSeed =
          await File('${temp.path}/synthetic/seed.sql').readAsString();
      expect(syntheticSeed, contains('9000'));
      expect(syntheticSeed.toLowerCase(), isNot(contains('empresa')),
          reason: 'Synthetic omitted fields must retain DEFAULT intent');
      final harness = SubformPostgresHarness.fromEnvironment();
      final database = await harness.createTempDatabase();
      addTearDown(() => harness.dropTempDatabase(database));
      final errors = StringBuffer();
      expect(
          await run([
            'migrate',
            '--analysis',
            input.path,
            '--seed-format',
            format,
            '--auto-number-mode',
            'sequence',
            '--output',
            '${temp.path}/migration',
            '--pg',
            'host=${harness.host} port=${harness.port} dbname=$database user=${harness.user} password=${harness.password} sslmode=disable'
          ], out: StringBuffer(), err: errors),
          0,
          reason: '$errors');
      final connection = await harness.openDatabase(database);
      try {
        final reader = await connection.executeReader(
            'SELECT id, empresa, nome FROM contatos ORDER BY id');
        var index = 0;
        try {
          while (await reader.read()) {
            expect(reader.getValue(0), physical[index]['ID']);
            expect(reader.getValue(1), isNull,
                reason: 'Physical NULL must not activate SQL DEFAULT');
            expect(reader.getValue(2), physical[index]['Nome']);
            index++;
          }
        } finally {
          await reader.close();
        }
        expect(index, 2);
        // New rows that actually omit a value retain their intentional DEFAULT,
        // and imported autonumbers still advance the sequence.
        await connection
            .createCommand('INSERT INTO contatos DEFAULT VALUES')
            .executeNonQuery();
        final defaults = await connection.executeReader(
            'SELECT id, empresa FROM contatos ORDER BY id DESC LIMIT 1');
        try {
          expect(await defaults.read(), isTrue);
          expect(defaults.getValue(0), greaterThan(physical.last['ID'] as int));
          expect(defaults.getValue(1), 'MIGRATION_DEFAULT_PROBE');
        } finally {
          await defaults.close();
        }
      } finally {
        await connection.close();
      }
    }, timeout: const Timeout(Duration(minutes: 3)));
  }
}
