import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/access_query_contract.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:crypto/crypto.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';
import '../support/subform_postgres_harness.dart';

void main() {
  test('generated CSPRONT1 HTTP endpoint matches DAO and rejects invalid input',
      () async {
    final analysis = jsonDecode(
        File('build/codex-sigasul-goal/analysis-complex-complete/analysis.json')
            .readAsStringSync()) as Map<String, dynamic>;
    final shape = jsonDecode(
        File('build/codex-sigasul-goal/query-audit/cspront1-shape.json')
            .readAsStringSync()) as Map;
    final oracle = jsonDecode(
        File('build/codex-sigasul-goal/query-audit/cspront1-results.json')
            .readAsStringSync()) as Map;
    expect(
        oracle['sourceSha256'],
        sha256
            .convert(File('fixtures/SIGA2021-SUL_be_senha_4462.accdb')
                .readAsBytesSync())
            .toString());
    expect(
        oracle['sqlSha256'],
        sha256
            .convert(utf8.encode(
                File('fixtures/SIGAsul.accdb.src/queries/CSPRONT1.sql')
                    .readAsStringSync()))
            .toString());
    final tables = (analysis['tables'] as List)
        .cast<Map>()
        .where((v) =>
            ['TbPessoa', 'CadResidencia', 'TbUnidade'].contains(v['name']))
        .toList();
    expect(tables.length, 3);
    analysis['tables'] = tables;
    analysis['linkedTables'] = [];
    analysis['relationships'] = [];
    attachDaoQueryContract(analysis, shape.cast<String, dynamic>(),
        actualSourceHash: oracle['sourceSha256'] as String,
        asciiCaseInsensitiveText: true);
    final query = (analysis['queries'] as List)
        .cast<Map>()
        .singleWhere((q) => q['name'] == 'CSPRONT1');
    final plan = compileContractQuery(analysis, query.cast<String, dynamic>(),
        (query['executionContract'] as Map).cast<String, dynamic>());
    final temp = await Directory.systemTemp.createTemp('cspront1_parity_');
    addTearDown(() => temp.delete(recursive: true));
    final file = File('${temp.path}/analysis.json');
    await file.writeAsString(jsonEncode(analysis));
    final harness = SubformPostgresHarness.fromEnvironment();
    final database = await harness.createTempDatabase();
    addTearDown(() => harness.dropTempDatabase(database));
    final errors = StringBuffer();
    expect(
        await run([
          'migrate',
          '--analysis',
          file.path,
          '--password',
          '4462',
          '--backend-password',
          '4462',
          '--output',
          '${temp.path}/migration',
          '--pg',
          'host=${harness.host} port=${harness.port} dbname=$database user=${harness.user} password=${harness.password} sslmode=disable'
        ], out: StringBuffer(), err: errors),
        0,
        reason: '$errors');
    // Controlled fixture supplements real parity with truncation and typed NULL cases.
    final fixtureSql =
        r'SELECT QueryFixture.Id, QueryFixture.Name, QueryFixture.Ended, QueryFixture.Amount, QueryFixture.[Ação], ExtraFixture.Acao, QueryFixture.[Nº], ExtraFixture.No, QueryFixture.[Cost$"tag] FROM QueryFixture INNER JOIN ExtraFixture ON QueryFixture.Id=ExtraFixture.Id WHERE QueryFixture.Name="Keep"';
    (analysis['tables'] as List).add(<String, dynamic>{
      'name': 'QueryFixture',
      'rowCount': 151,
      'columns': [
        {'name': 'Id', 'typeCode': 4, 'typeName': 'Long', 'isRequired': true},
        {'name': 'Name', 'typeCode': 10, 'typeName': 'Text', 'maxLength': 255},
        {'name': 'Ended', 'typeCode': 8, 'typeName': 'DateTime'},
        {'name': 'Amount', 'typeCode': 5, 'typeName': 'Money'},
        for (final label in ['Ação', 'Nº', r'Cost$"tag'])
          {'name': label, 'typeCode': 10, 'typeName': 'Text', 'maxLength': 255},
      ],
      'indexes': []
    });
    (analysis['tables'] as List).add(<String, dynamic>{
      'name': 'ExtraFixture',
      'rowCount': 150,
      'indexes': [],
      'columns': [
        {'name': 'Id', 'typeCode': 4, 'typeName': 'Long', 'isRequired': true},
        for (final label in ['Acao', 'No'])
          {'name': label, 'typeCode': 10, 'typeName': 'Text', 'maxLength': 255},
      ]
    });
    (analysis['queries'] as List)
        .add(<String, dynamic>{'name': 'FixtureRead', 'sqlText': fixtureSql});
    attachDaoQueryContract(analysis, shape.cast<String, dynamic>(),
        actualSourceHash: oracle['sourceSha256'] as String,
        asciiCaseInsensitiveText: true);
    attachDaoQueryContract(
        analysis,
        {
          'queryName': 'FixtureRead',
          'readOnly': true,
          'sourceSha256': oracle['sourceSha256'],
          'sqlSha256': accessQuerySqlHash(fixtureSql),
          'parameters': [],
          'columns': [
            {'ordinal': 0, 'name': 'Id', 'daoType': 4},
            {'ordinal': 1, 'name': 'Name', 'daoType': 10},
            {'ordinal': 2, 'name': 'Ended', 'daoType': 8},
            {'ordinal': 3, 'name': 'Amount', 'daoType': 5},
            for (var i = 0; i < 5; i++)
              {
                'ordinal': i + 4,
                'name': ['Ação', 'Acao', 'Nº', 'No', r'Cost$"tag'][i],
                'daoType': 10
              },
          ],
        },
        actualSourceHash: oracle['sourceSha256'] as String,
        asciiCaseInsensitiveText: true);
    await file.writeAsString(jsonEncode(analysis));
    final fixtureDb = await harness.openDatabase(database);
    try {
      await fixtureDb
          .createCommand(
              'CREATE TABLE query_fixture (id INTEGER PRIMARY KEY, name TEXT, ended TIMESTAMP, amount NUMERIC(19,4))')
          .executeNonQuery();
      await fixtureDb
          .createCommand(
              "INSERT INTO query_fixture SELECT id, 'Keep', NULL, CASE WHEN id % 2 = 0 THEN NULL ELSE 12.3456 END FROM generate_series(1,150) id")
          .executeNonQuery();
      await fixtureDb
          .createCommand(
              'INSERT INTO query_fixture VALUES (151,NULL,NULL,NULL)')
          .executeNonQuery();
      const ids =
          MigrationIdentifierPolicy(style: MigrationIdentifierStyle.snakeAscii);
      for (final label in ['Ação', 'Nº', r'Cost$"tag']) {
        await fixtureDb
            .createCommand(
                'ALTER TABLE query_fixture ADD COLUMN ${ids.quotedColumnName(label)} TEXT')
            .executeNonQuery();
      }
      await fixtureDb
          .createCommand(
              "UPDATE query_fixture SET ${ids.quotedColumnName('Ação')}='left-action', ${ids.quotedColumnName('Nº')}='left-number', ${ids.quotedColumnName(r'Cost$"tag')}='escaped'")
          .executeNonQuery();
      await fixtureDb
          .createCommand(
              'CREATE TABLE extra_fixture (id INTEGER PRIMARY KEY, acao TEXT, no TEXT)')
          .executeNonQuery();
      await fixtureDb
          .createCommand(
              "INSERT INTO extra_fixture SELECT id,'right-action','right-number' FROM generate_series(1,150) id")
          .executeNonQuery();
    } finally {
      await fixtureDb.close();
    }
    final app = '${temp.path}/app';
    expect(
        await run(['generate', '--analysis', file.path, '--output', app],
            out: StringBuffer(), err: errors),
        0,
        reason: '$errors');
    final backend = '$app/backend';
    final pub = await Process.run(Platform.resolvedExecutable, ['pub', 'get'],
        workingDirectory: backend);
    expect(pub.exitCode, 0, reason: '${pub.stdout}\n${pub.stderr}');
    final check = await Process.run(
        Platform.resolvedExecutable, ['analyze', 'lib', 'bin'],
        workingDirectory: backend);
    expect(check.exitCode, 0, reason: '${check.stdout}\n${check.stderr}');
    final spec = jsonDecode(File('$backend/lib/src/shared/access_queries.json')
        .readAsStringSync()) as Map;
    expect((spec['queries'] as Map).keys, contains('cspront1'));
    expect(
        (spec['diagnostics'] as List)
            .any((d) => d['status'] == 'missing-dao-contract'),
        isTrue);
    final expectedFile = File('$backend/expected_cases.json');
    await expectedFile.writeAsString(jsonEncode(oracle['cases']));
    final probe = File('$backend/bin/query_http_probe.dart');
    await probe.writeAsString(queryHttpProbe);
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
    final responses =
        jsonDecode(File('$backend/http_results.json').readAsStringSync())
            as List;
    var nonempty = 0;
    for (final sample in oracle['cases'] as List) {
      final data = responses[(oracle['cases'] as List).indexOf(sample)] as Map;
      expect(data['truncated'], false);
      expect(data['readOnly'], true);
      final columns = data['columns'] as List;
      expect(columns.map((c) => c['name']), plan.outputs.map((c) => c.name));
      expect(columns.map((c) => c['daoType']),
          plan.outputs.map((c) => c.typeCode));
      final hashes = <String>[];
      for (final row in data['rows'] as List) {
        expect((row as List).length, 134);
        final cells = <String>[];
        for (var i = 0; i < plan.outputs.length; i++) {
          final value = row[i];
          if (value == null) {
            cells.add('N');
            continue;
          }
          final String text;
          switch (plan.outputs[i].typeCode) {
            case 1:
              expect(value, isA<bool>());
              text = value == true ? 'true' : 'false';
            case 4:
              expect(value, isA<int>());
              text = value.toString();
            case 5:
              expect(value, isA<String>());
              text = moneyText(value);
            case 8:
              expect(value, isA<String>());
              text = DateTime.parse(value as String)
                  .toIso8601String()
                  .replaceFirst(RegExp(r'Z$'), '');
            case 10:
              expect(value, isA<String>());
              text = value as String;
            default:
              throw StateError('Unexpected type');
          }
          cells.add('V${base64Encode(utf8.encode(text))}');
        }
        hashes.add(sha256.convert(utf8.encode(cells.join('|'))).toString());
      }
      final direct = await harness.openDatabase(database);
      final expectedCells = <List<String>>[];
      try {
        final values = plan.bind({
          (shape['parameters'] as List).single['name'] as String:
              sample['parameter']
        });
        final params = DpgsqlParameterCollection();
        for (var i = 0; i < values.length; i++) {
          params.addWithValue('p$i', values[i]);
        }
        final reader = await direct.executeReader(plan.sql,
            parameters: params, rewriteParameters: false);
        try {
          while (await reader.read()) {
            expectedCells.add([
              for (var i = 0; i < plan.outputs.length; i++)
                canonical(reader.getValue(i), plan.outputs[i].typeCode)
            ]);
          }
        } finally {
          await reader.close();
        }
      } finally {
        await direct.close();
      }
      final actualRows = data['rows'] as List;
      if (expectedCells.length == 1 && actualRows.length == 1) {
        final different = <int>[];
        for (var i = 0; i < plan.outputs.length; i++) {
          if (expectedCells.single[i] !=
              canonical(actualRows.single[i], plan.outputs[i].typeCode)) {
            different.add(i);
          }
        }
        expect(different, isEmpty,
            reason: 'HTTP versus direct driver: mismatching ordinals only');
      }
      hashes.sort();
      expect(hashes, sample['rowHashes'],
          reason:
              'DAO result parity for case index ${(oracle['cases'] as List).indexOf(sample)}');
      if (hashes.isNotEmpty) nonempty++;
    }
    expect(nonempty, greaterThanOrEqualTo(5));
  }, timeout: const Timeout(Duration(minutes: 8)));
}

String moneyText(Object value) {
  final match =
      RegExp(r'^(-?)([0-9]+)(?:\.([0-9]+))?$').firstMatch(value.toString());
  if (match == null) throw StateError('Unexpected money representation');
  final fraction = match.group(3) ?? '';
  if (fraction.length > 4 && fraction.substring(4).contains(RegExp('[1-9]'))) {
    throw StateError('Money result has more than four decimal places');
  }
  final digits = fraction.padRight(4, '0').substring(0, 4);
  final integer = BigInt.parse(match.group(2)!).toString();
  final sign = integer == '0' && digits == '0000' ? '' : match.group(1)!;
  return '$sign$integer.$digits';
}

const queryHttpProbe = r'''
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
  setupDependencies();final router=Router();setupApiRoutes(router);
  final server=await shelf_io.serve(Pipeline().addMiddleware(withDbShelfMiddleware()).addHandler(router),'127.0.0.1',0);
  final client=HttpClient();
  Future<Map> get(Map<String,String> query,{String key='cspront1',int status=200}) async {
    final uri=Uri.http('127.0.0.1:${server.port}','/api/v1/access-queries/$key',query);
    final response=await(await client.getUrl(uri)).close();
    final body=jsonDecode(await utf8.decoder.bind(response).join()) as Map;
    if(response.statusCode!=status)throw StateError('Unexpected query status ${response.statusCode}, expected $status');
    return body;
  }
  try {
    final cases=jsonDecode(File('expected_cases.json').readAsStringSync()) as List;
    final responses=<Map>[];
    for(final sample in cases){responses.add(await get({'parameters':jsonEncode({'p0':sample['parameter']})}));}
    final empty=await get({'parameters':jsonEncode({'p0':null})});
    if((empty['rows'] as List).isNotEmpty)throw StateError('Null binding unexpectedly returned rows');
    for(final params in [{},{'p0':1},{'p0':'1.0'},{'p0':'1 OR 1=1'},{'p0':'2147483648'},{'p0':'1','sql':'SELECT 1'}]) {
      await get({'parameters':jsonEncode(params)},status:400);
    }
    await get({},status:400);
    await get({'parameters':'not json'},status:400);
    await get({'parameters':jsonEncode({'p0':'1'}),'limit':'101'},status:400);
    await get({'parameters':jsonEncode({'p0':'1'}),'sql':'SELECT 1'},status:400);
    await get({'parameters':'{}'},key:'missing',status:404);
    final fixture=await get({'parameters':'{}'},key:'fixture_read');
    if(fixture['truncated']!=true || fixture['limit']!=100 || (fixture['rows'] as List).length!=100)throw StateError('Missing bounded result metadata');
    final labels=(fixture['columns'] as List).map((c)=>c['name']).toList();
    if(jsonEncode(labels)!=jsonEncode(['Id','Name','Ended','Amount','Ação','Acao','Nº','No',r'Cost$"tag']))throw StateError('Output labels changed or collided');
    for(final row in fixture['rows'] as List) {
      if(row.length!=9 || row[4]!='left-action' || row[5]!='right-action' || row[6]!='left-number' || row[7]!='right-number' || row[8]!='escaped')throw StateError('Ordinal output assigned the wrong column');
      if(row[0] is! int || row[1]!='Keep' || row[2]!=null || (row[3]!=null && row[3]!='12.3456'))throw StateError('Fixture result lost typed value or NULL');
    }
    final limited=await get({'parameters':'{}','limit':'2'},key:'fixture_read');
    if(limited['truncated']!=true || (limited['rows'] as List).length!=2)throw StateError('Requested limit ignored');
    final parallel=await Future.wait(List.generate(10,(_)=>get({'parameters':'{}','limit':'1'},key:'fixture_read')));
    if(parallel.any((r)=>(r['rows'] as List).length!=1))throw StateError('Concurrent query response corrupted');
    await File('http_results.json').writeAsString(jsonEncode(responses));
    print('GENERATED_QUERY_HTTP_OK');
  } finally {
    client.close(force:true);await server.close(force:true);
    await(await ioc.get<DatabaseService>().connect()).disconnect();
  }
}
''';

String canonical(Object? value, int type) {
  if (value == null) return 'N';
  final String text;
  switch (type) {
    case 1:
      text = value == true ? 'true' : 'false';
    case 4:
      text = value.toString();
    case 5:
      text = moneyText(value);
    case 8:
      text = (value is DateTime ? value : DateTime.parse(value as String))
          .toIso8601String()
          .replaceFirst(RegExp(r'Z$'), '');
    case 10:
      text = value as String;
    default:
      throw StateError('Unexpected type');
  }
  return 'V${base64Encode(utf8.encode(text))}';
}
