import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';
import '../support/subform_postgres_harness.dart';

void main() {
  test('generated collection GET follows complex pointer, never parent PK',
      () async {
    final temp = await Directory.systemTemp.createTemp('multivalue_get_');
    addTearDown(() => temp.delete(recursive: true));
    Map<String, Object?> column(String name, String type,
            {bool auto = false}) =>
        {
          'name': name,
          'typeName': type,
          'typeCode': type == 'Text'
              ? 10
              : type == 'ComplexType'
                  ? 18
                  : 4,
          'isAutoNumber': auto,
          'isRequired': auto,
        };
    List<Map<String, Object?>> pk(String name) => [
          {
            'name': 'PrimaryKey',
            'isPrimaryKey': true,
            'isUnique': true,
            'columns': [
              {'name': name}
            ]
          }
        ];
    final input = File('${temp.path}/analysis.json');
    await input.writeAsString(jsonEncode({
      'schema_version': '1.0',
      'source': 'synthetic.accdb',
      'tables': [
        {
          'name': 'Encaminhamento Teste',
          'columns': [
            column('ID', 'Long', auto: true),
            column('MotivoNão', 'ComplexType')
          ],
          'indexes': [
            ...pk('ID'),
            {
              'name': 'PointerUnique',
              'isUnique': true,
              'columns': [
                {'name': 'MotivoNão'}
              ]
            }
          ],
          'sampleRows': [
            {'ID': 1, 'MotivoNão': 100},
            {'ID': 2, 'MotivoNão': null},
            {'ID': 3, 'MotivoNão': 1}
          ]
        },
        {
          'name': 'Motivos da Pessoa',
          'syntheticKind': 'multivalue',
          'complexParentTable': 'Encaminhamento Teste',
          'complexParentColumn': 'MotivoNão',
          'complexLinkColumn': 'ParentPointer',
          'complexValueColumn': 'Value',
          'columns': [
            column('ChildID', 'Long', auto: true),
            column('ParentPointer', 'Long'),
            column('Value', 'Text')
          ],
          'indexes': pk('ChildID'),
          'sampleRows': [
            {'ChildID': 10, 'ParentPointer': 100, 'Value': 'FIRST'},
            {'ChildID': 11, 'ParentPointer': 100, 'Value': 'SECOND'},
            {'ChildID': 12, 'ParentPointer': 1, 'Value': 'WRONG PARENT PK'},
          ]
        },
      ],
      'linkedTables': [],
      'relationships': [],
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
    final specs = jsonDecode(
        await File('$backend/lib/src/shared/access_multivalues.json')
            .readAsString()) as Map;
    expect((specs['encaminhamento_teste'] as Map).containsKey('motivo_nao'),
        isTrue);
    final process = await Process.start(Platform.resolvedExecutable,
        ['run', 'bin/server.dart', '--address', '127.0.0.1', '--port', '0'],
        workingDirectory: backend,
        environment: {
          'ACCESS_TO_DART_DB_HOST': harness.host,
          'ACCESS_TO_DART_DB_PORT': '${harness.port}',
          'ACCESS_TO_DART_DB_NAME': database,
          'ACCESS_TO_DART_DB_USER': harness.user,
          'ACCESS_TO_DART_DB_PASSWORD': harness.password,
        });
    addTearDown(() async {
      process.kill();
      await process.exitCode;
    });
    final ready = Completer<Uri>();
    final log = StringBuffer();
    process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen((line) {
      log.writeln(line);
      if (line.startsWith('Serving at ')) {
        ready.complete(Uri.parse(line.substring(11)));
      }
    });
    process.stderr.transform(utf8.decoder).listen(log.writeln);
    unawaited(process.exitCode.then((code) {
      if (!ready.isCompleted) {
        ready.completeError(StateError('Server exited $code: $log'));
      }
    }));
    final base = await ready.future.timeout(const Duration(seconds: 30));
    final client = HttpClient();
    addTearDown(() => client.close(force: true));
    Future<({int status, Map body})> get(String suffix) async {
      final request = await client
          .getUrl(base.resolve('/api/v1/encaminhamento_teste/$suffix'));
      final response = await request.close();
      return (
        status: response.statusCode,
        body: jsonDecode(await utf8.decoder.bind(response).join()) as Map
      );
    }

    final values = await get('1/collections/motivo_nao');
    expect(values.status, 200);
    expect(values.body, {
      'values': [
        {'id': 10, 'value': 'FIRST'},
        {'id': 11, 'value': 'SECOND'}
      ],
      'truncated': false
    });
    expect((await get('2/collections/motivo_nao')).body,
        {'values': [], 'truncated': false});
    expect((await get('999/collections/motivo_nao')).status, 404);
    expect((await get('bad/collections/motivo_nao')).status, 400);
    expect((await get('1/collections/unknown')).status, 400);
    final concurrent = await Future.wait(
        List.generate(10, (_) => get('1/collections/motivo_nao')));
    expect(
        concurrent.every(
            (r) => r.status == 200 && (r.body['values'] as List).length == 2),
        isTrue);
    final connection = await harness.openDatabase(database);
    try {
      final rows = await connection
          .executeReader('SELECT COUNT(*) FROM motivos_da_pessoa');
      try {
        expect(await rows.read(), isTrue);
        expect(rows.getValue(0), 3);
      } finally {
        await rows.close();
      }
    } finally {
      await connection.close();
    }
  }, timeout: const Timeout(Duration(minutes: 3)));
}
