import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';
import '../support/subform_postgres_harness.dart';

void main() {
  test('real MotivoNão collection is read through generated HTTP API',
      () async {
    const sourcePath = 'fixtures/SIGA2021-SUL_be_senha_4462.accdb';
    final source = await AccessDatabase.openPath(sourcePath, password: '4462');
    late Map parent;
    late Map child;
    late int parentId;
    late List<Map<String, dynamic>> expected;
    try {
      final model = await AccessCatalog(
              format: source.format, pageChannel: source.pageChannel)
          .read(sourcePath);
      final analysis = await AccdbAnalyzer(model: model, db: source).analyze();
      final tables = (analysis['tables'] as List).cast<Map>();
      parent = tables.singleWhere((t) => t['name'] == 'TbEncaminhamento');
      child = tables.singleWhere((t) =>
          t['syntheticKind'] == 'multivalue' &&
          t['complexParentTable'] == 'TbEncaminhamento' &&
          t['complexParentColumn'] == 'MotivoNão');
      final parentKey = ((parent['indexes'] as List)
              .singleWhere((i) => i['isPrimaryKey'] == true)['columns'] as List)
          .single['name'] as String;
      final childKey = ((child['indexes'] as List)
              .singleWhere((i) => i['isPrimaryKey'] == true)['columns'] as List)
          .single['name'] as String;
      final link = child['complexLinkColumn'] as String;
      final value = child['complexValueColumn'] as String;
      final selectedPointer =
          ((child['sampleRows'] as List).first as Map)[link];
      final reader =
          TableReader(format: source.format, pageChannel: source.pageChannel);
      final parents = await reader.readAllRows(parent['tdefPage'] as int);
      parentId = parents.singleWhere(
          (row) => row['MotivoNão'] == selectedPointer)[parentKey] as int;
      final physical = await reader.readAllRows(child['tdefPage'] as int);
      final selected = physical
          .where((row) => row[link] == selectedPointer)
          .toList()
        ..sort((a, b) => (a[childKey] as int).compareTo(b[childKey] as int));
      expected = selected
          .map((row) =>
              <String, dynamic>{'id': row[childKey], 'value': row[value]})
          .toList();
      expect(expected, isNotEmpty);
      // The controlled companion test covers unequal IDs and pointers.
      // This source can legitimately assign the same number to both.
    } finally {
      await source.close();
    }
    final temp = await Directory.systemTemp.createTemp('real_motivonao_');
    addTearDown(() => temp.delete(recursive: true));
    final input = File('${temp.path}/analysis.json');
    await input.writeAsString(jsonEncode({
      'schema_version': '1.0',
      'source': sourcePath,
      'tables': [parent, child],
      'linkedTables': [],
      'relationships': []
    }));
    final harness = SubformPostgresHarness.fromEnvironment();
    final database = await harness.createTempDatabase();
    addTearDown(() => harness.dropTempDatabase(database));
    final errors = StringBuffer();
    expect(
        await run([
          'migrate',
          '--analysis',
          input.path,
          '--password',
          '4462',
          '--auto-number-mode',
          'sequence',
          '--output',
          '${temp.path}/migration',
          '--pg',
          'host=${harness.host} port=${harness.port} dbname=$database user=${harness.user} password=${harness.password} sslmode=disable'
        ], out: StringBuffer(), err: errors),
        0,
        reason: '$errors');
    final output = '${temp.path}/app';
    expect(
        await run(['generate', '--analysis', input.path, '--output', output],
            out: StringBuffer(), err: errors),
        0,
        reason: '$errors');
    final backend = '$output/backend';
    final pub = await Process.run(Platform.resolvedExecutable, ['pub', 'get'],
        workingDirectory: backend);
    expect(pub.exitCode, 0, reason: '${pub.stdout}\n${pub.stderr}');
    final analyze = await Process.run(
        Platform.resolvedExecutable, ['analyze', 'lib', 'bin'],
        workingDirectory: backend);
    expect(analyze.exitCode, 0, reason: '${analyze.stdout}\n${analyze.stderr}');
    final encodedExpected = base64Encode(utf8.encode(jsonEncode(expected)));
    final probe = File('$backend/bin/real_collection_probe.dart');
    await probe.writeAsString('''
import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import '../lib/src/di/dependency_injector.dart';
import '../lib/src/db/database_service.dart';
import '../lib/src/db/with_database_shelf.dart';
import '../lib/src/routes/api_routes.dart';
Future<void> main() async {
  setupDependencies();
  final router=Router(); setupApiRoutes(router);
  final handler=Pipeline().addMiddleware(withDbShelfMiddleware()).addHandler(router);
  final server=await shelf_io.serve(handler,'127.0.0.1',0);
  final client=HttpClient();
  try {
    final request=await client.getUrl(Uri.parse('http://127.0.0.1:\${server.port}/api/v1/tb_encaminhamento/$parentId/collections/motivo_nao'));
    final response=await request.close();
    if(response.statusCode!=200)throw StateError('Collection HTTP failed: \${response.statusCode}');
    final data=jsonDecode(await utf8.decoder.bind(response).join()) as Map;
    final expected=jsonDecode(utf8.decode(base64Decode('$encodedExpected')));
    if(jsonEncode(data['values'])!=jsonEncode(expected)||data['truncated']!=false)throw StateError('Collection values differ from physical source');
    print('REAL_MOTIVONAO_READ_OK count=\${(data['values'] as List).length}');
  } finally {
    client.close(force:true); await server.close(force:true);
    await (await ioc.get<DatabaseService>().connect()).disconnect();
  }
}
''');
    final result =
        await Process.run(Platform.resolvedExecutable, ['run', probe.path],
            workingDirectory: backend,
            environment: {
              'ACCESS_TO_DART_DB_HOST': harness.host,
              'ACCESS_TO_DART_DB_PORT': '${harness.port}',
              'ACCESS_TO_DART_DB_NAME': database,
              'ACCESS_TO_DART_DB_USER': harness.user,
              'ACCESS_TO_DART_DB_PASSWORD': harness.password,
            });
    expect(result.exitCode, 0, reason: '${result.stdout}\n${result.stderr}');
    expect(result.stdout, contains('REAL_MOTIVONAO_READ_OK'));
  }, timeout: const Timeout(Duration(minutes: 6)));
}
