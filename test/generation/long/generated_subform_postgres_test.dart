import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';
import '../support/subform_fixture.dart';
import '../support/subform_postgres_harness.dart';
import '../support/generation_test_utils.dart';

void main() {
  test(
      'generated subform endpoint isolates parents and composite links in PostgreSQL',
      () async {
    final harness = SubformPostgresHarness.fromEnvironment();
    final database = await harness.createTempDatabase();
    addTearDown(() => harness.dropTempDatabase(database));
    final temp = await Directory.systemTemp.createTemp('subform_pg_');
    addTearDown(() => temp.delete(recursive: true));
    final analysis = await writeSubformFixture(temp);
    final output = '${temp.path}/generated';
    final errors = StringBuffer();
    expect(
        await run(['generate', '--analysis', analysis.path, '--output', output],
            out: StringBuffer(), err: errors),
        0,
        reason: errors.toString());
    final setup = await harness.openDatabase(database);
    try {
      for (final sql in [
        'CREATE TABLE familia (id BIGINT PRIMARY KEY, scope BIGINT, area TEXT)',
        'CREATE TABLE pessoa (id BIGINT PRIMARY KEY, family BIGINT, region TEXT, nome TEXT, data TIMESTAMP)',
        "INSERT INTO familia VALUES(1,101,'A'),(2,202,'B'),(3,NULL,'A')",
        "INSERT INTO pessoa VALUES(1,101,'A','Uma','2024-01-02'),(2,202,'B','Outra',NULL),(3,101,'B','Regiao diferente',NULL),(4,NULL,'A','Sem familia',NULL)",
      ]) {
        await setup.createCommand(sql).executeNonQuery();
      }
    } finally {
      await setup.close();
    }
    final backend = '$output/backend';
    await runCheckedProcess('dart', ['pub', 'get'],
        workingDirectory: backend, description: 'subform backend pub get');
    await runCheckedProcess('dart', ['analyze', 'lib'],
        workingDirectory: backend, description: 'subform backend analyze');
    final probe = File('$backend/bin/subform_probe.dart');
    await probe.writeAsString(r'''
import 'dart:convert';
import 'package:eloquent/eloquent.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../lib/src/di/dependency_injector.dart';
import '../lib/src/modules/familia/routes/familia_routes.dart';
import '../lib/src/db/database_service.dart';
import '../lib/src/shared/access_subforms.dart';
Future<void> main() async {
  final db = await DatabaseService().connect();
  try {
    Future<Map<String,Object?>> load(String id, [String key='subform_0']) =>
        AccessSubformController.loadRows(db,'familia',id,key);
    ioc.registerSingleton<Connection>(db);
    final router = Router();
    setupFamiliaRoutes(router, '/api/v1');
    final response = await router(Request('GET',Uri.parse('http://localhost/api/v1/familia/1/subforms/subform_0')));
    if(response.statusCode!=200 || (jsonDecode(await response.readAsString())['rows'] as List).length!=1) {
      throw StateError('HTTP route/DI did not enforce the relation');
    }
    final badResponse = await router(Request('GET',Uri.parse('http://localhost/api/v1/familia/1/subforms/unknown')));
    if(badResponse.statusCode!=400) throw StateError('Unknown HTTP descriptor accepted');
    final first = await load('1');
    final second = await load('2');
    if (!(first['rows'] as List).single['data'].toString().startsWith('2024-01-02')) throw StateError('Date field was not serialized');
    if ((first['rows'] as List).length != 1 || (first['rows'] as List).single['nome'] != 'Uma') {
      throw StateError('Parent 1 leaked unrelated/composite rows');
    }
    if ((second['rows'] as List).length != 1 || (second['rows'] as List).single['nome'] != 'Outra') {
      throw StateError('Parent 2 leaked rows');
    }
    if ((await load('3'))['rows'] is! List || ((await load('3'))['rows'] as List).isNotEmpty) {
      throw StateError('Null parent key removed scope');
    }
    var rejected=0;
    try { await load('404'); } on StateError { rejected++; }
    try { await load('1','unknown'); } on ArgumentError { rejected++; }
    try { await load('1 OR 1=1'); } on FormatException { rejected++; }
    if(rejected != 3) throw StateError('Invalid parent/descriptor was accepted');
    for(var i=10;i<111;i++) {
      await db.table('pessoa').insert({'id':i,'family':101,'region':'A','nome':'Controlled'});
    }
    final bounded=await load('1');
    if((bounded['rows'] as List).length !=100 || bounded['truncated'] != true) {
      throw StateError('Subform result is not bounded');
    }
    print('SUBFORM_POSTGRES_ISOLATION_OK');
  } finally { await db.disconnect(); }
}
''');
    final result =
        await Process.run(Platform.resolvedExecutable, ['run', probe.path],
            workingDirectory: backend,
            environment: {
              ...Platform.environment,
              'ACCESS_TO_DART_DB_HOST': harness.host,
              'ACCESS_TO_DART_DB_PORT': '${harness.port}',
              'ACCESS_TO_DART_DB_NAME': database,
              'ACCESS_TO_DART_DB_USER': harness.user,
              'ACCESS_TO_DART_DB_PASSWORD': harness.password,
            }).timeout(const Duration(minutes: 2));
    expect(result.exitCode, 0, reason: '${result.stdout}\n${result.stderr}');
    expect(result.stdout, contains('SUBFORM_POSTGRES_ISOLATION_OK'));
  }, timeout: const Timeout(Duration(minutes: 7)));
}
