import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';
import '../support/backend_autonumber_fixture.dart';
import '../support/subform_postgres_harness.dart';

void main() {
  test(
      'generated server serves verified assets and concurrent API on one origin',
      () async {
    final harness = SubformPostgresHarness.fromEnvironment();
    final database = await harness.createTempDatabase();
    addTearDown(() => harness.dropTempDatabase(database));
    final temp = await Directory.systemTemp.createTemp('same_origin_');
    addTearDown(() => temp.delete(recursive: true));
    final analysis = await writeAutonumberAnalysis(temp);
    final output = '${temp.path}/app';
    final errors = StringBuffer();
    expect(
        await run(['generate', '--analysis', analysis.path, '--output', output],
            out: StringBuffer(), err: errors),
        0,
        reason: '$errors');
    final backend = '$output/backend';
    final pub = await Process.run(Platform.resolvedExecutable, ['pub', 'get'],
        workingDirectory: backend);
    expect(pub.exitCode, 0, reason: '${pub.stdout}\n${pub.stderr}');
    final analyzed = await Process.run(
        Platform.resolvedExecutable, ['analyze', 'lib', 'bin'],
        workingDirectory: backend);
    expect(analyzed.exitCode, 0,
        reason: '${analyzed.stdout}\n${analyzed.stderr}');
    final scopeProbe = File('$backend/bin/request_scope_probe.dart');
    await scopeProbe.writeAsString(await File(
            'test/generation/support/backend_request_scope_probe.dart.txt')
        .readAsString());
    final scoped = await Process.run(
        Platform.resolvedExecutable, ['run', scopeProbe.path],
        workingDirectory: backend);
    expect(scoped.exitCode, 0, reason: '${scoped.stdout}\n${scoped.stderr}');
    expect(scoped.stdout, contains('REQUEST_SCOPE_10_HTTP_AND_FAILURE_OK'));
    final connection = await harness.openDatabase(database);
    try {
      await connection
          .createCommand(
              'CREATE TABLE cadastro (codigo_cadastro BIGSERIAL PRIMARY KEY, nome TEXT)')
          .executeNonQuery();
      await connection
          .createCommand(
              "INSERT INTO cadastro(nome) VALUES ('Synthetic one'), ('Synthetic two')")
          .executeNonQuery();
    } finally {
      await connection.close();
    }
    final release = await Directory('${temp.path}/release').create();
    await File('${release.path}/index.html')
        .writeAsString('<html>same origin fixture</html>');
    await File('${release.path}/main.dart.js')
        .writeAsString('window.sameOriginFixture = true;');
    await File('${release.path}/.build.manifest')
        .writeAsString('index.html\nmain.dart.js\n');
    await File('${release.path}/private.txt').writeAsString('not in manifest');
    final environment = {
      'ACCESS_TO_DART_DB_HOST': harness.host,
      'ACCESS_TO_DART_DB_PORT': '${harness.port}',
      'ACCESS_TO_DART_DB_NAME': database,
      'ACCESS_TO_DART_DB_USER': harness.user,
      'ACCESS_TO_DART_DB_PASSWORD': harness.password,
    };
    final poolProbe = File('$backend/bin/pool_probe.dart');
    await poolProbe.writeAsString(r"""
import 'dart:async';
import '../lib/src/db/database_service.dart';
Future<void> main() async {
  final service = DatabaseService();
  final connections = await Future.wait(List.generate(10, (_) => service.connect()));
  try {
    if(connections.toSet().length != 1) throw StateError('Multiple pools on cold start');
    print('ONE_POOL_FOR_TEN_COLD_REQUESTS');
    final shared = connections.first;
    await shared.statement('CREATE TABLE transaction_probe (label TEXT)');
    final bothEntered = Completer<void>();
    var entered = 0;
    Future<void> barrier() async {
      entered++;
      if (entered == 2) bothEntered.complete();
      await bothEntered.future.timeout(const Duration(seconds: 10));
    }
    final commit = shared.transaction((ctx) async {
      await ctx.table('transaction_probe').insert({'label': 'commit'});
      await barrier();
    });
    final rollback = shared.transaction((ctx) async {
      await ctx.table('transaction_probe').insert({'label': 'rollback'});
      await barrier();
      throw StateError('intentional rollback');
    }).then<void>((_) { throw StateError('Rollback swallowed'); }, onError: (Object e) {
      if (e is! StateError || e.message != 'intentional rollback') throw e;
    });
    await Future.wait([commit, rollback]);
    final rows = await shared.table('transaction_probe').get();
    if (rows.length != 1 || rows.single['label'] != 'commit') {
      throw StateError('Concurrent transactions crossed boundaries');
    }
    print('CONCURRENT_TRANSACTION_COMMIT_ROLLBACK_OK');
  } finally { for(final c in connections.toSet()) { await c.disconnect(); } }
}
""");
    final pooled = await Process.run(
        Platform.resolvedExecutable, ['run', poolProbe.path],
        workingDirectory: backend, environment: environment);
    expect(pooled.exitCode, 0, reason: '${pooled.stdout}\n${pooled.stderr}');
    expect(pooled.stdout, contains('ONE_POOL_FOR_TEN_COLD_REQUESTS'));
    expect(
        pooled.stdout, contains('CONCURRENT_TRANSACTION_COMMIT_ROLLBACK_OK'));
    Future<Uri> start({bool unavailableDatabase = false}) async {
      final process = await Process.start(
          Platform.resolvedExecutable,
          [
            'run',
            'bin/server.dart',
            '--address',
            '127.0.0.1',
            '--port',
            '0',
            '--frontend-dir',
            release.path
          ],
          workingDirectory: backend,
          environment: {
            ...environment,
            if (unavailableDatabase) 'ACCESS_TO_DART_DB_PORT': '1'
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
      return ready.future.timeout(const Duration(seconds: 30));
    }

    final client = HttpClient();
    addTearDown(() => client.close(force: true));
    Future<({int status, String body, String? contentType})> get(
        Uri base, String path) async {
      final request = await client.getUrl(base.resolve(path));
      final response = await request.close();
      return (
        status: response.statusCode,
        body: await utf8.decoder.bind(response).join(),
        contentType: response.headers.contentType?.mimeType
      );
    }

    final base = await start();
    expect((await get(base, '/')).body, contains('same origin fixture'));
    final javascript = await get(base, '/main.dart.js');
    expect(javascript.status, 200);
    expect(javascript.body, contains('sameOriginFixture'));
    expect(javascript.contentType, contains('javascript'));
    expect((await get(base, '/private.txt')).status, 404);
    expect((await get(base, '/missing')).status, 404);
    final missing = await get(base, '/api/v1/does_not_exist');
    expect(missing.status, 404);
    expect(missing.contentType, 'application/json');
    expect(jsonDecode(missing.body), {'error': 'not_found'});
    final nestedMissing = await get(base, '/api/v1/cadastro/1/missing');
    expect(nestedMissing.status, 404);
    expect(nestedMissing.contentType, 'application/json');
    expect(jsonDecode(nestedMissing.body), {'error': 'not_found'});
    final simultaneous = await Future.wait(
        List.generate(10, (_) => get(base, '/api/v1/cadastro/')));
    for (final result in simultaneous) {
      expect(result.status, 200, reason: result.body);
      expect(result.body, contains('Synthetic one'));
      expect(result.body, contains('Synthetic two'));
    }
    // A failing API request must not poison later request DI state.
    expect(
        (await get(base, '/api/v1/cadastro/not-a-number')).status, isNot(200));
    expect((await get(base, '/api/v1/cadastro/')).status, 200);
    final offline = await start(unavailableDatabase: true);
    expect((await get(offline, '/')).status, 200);
    expect((await get(offline, '/main.dart.js')).status, 200);
    // An incomplete release is refused before listening.
    await File('${release.path}/main.dart.js').writeAsString('');
    final invalid = await Process.run(
        Platform.resolvedExecutable,
        [
          'run',
          'bin/server.dart',
          '--port',
          '0',
          '--frontend-dir',
          release.path
        ],
        workingDirectory: backend,
        environment: environment);
    expect(invalid.exitCode, isNot(0));
    expect(invalid.stderr, contains('Frontend entrypoint empty'));
  }, timeout: const Timeout(Duration(minutes: 4)));
}
