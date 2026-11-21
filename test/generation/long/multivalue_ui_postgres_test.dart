import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';
import '../../support/multivalue_ui_fixture.dart';

void main() {
  test(
      'real collection GET drives read-only exported UI without pointer exposure or writes',
      () async {
    final harness = _LocalPostgresHarness.fromEnvironment();
    final database = await harness.createTempDatabase();
    addTearDown(() => harness.dropTempDatabase(database));
    final persist = Platform.environment['ACCESS_MULTIVALUE_OUTPUT'];
    final root = persist == null
        ? await Directory.systemTemp.createTemp('multivalue_ui_pg_')
        : Directory(persist).absolute;
    if (persist == null) addTearDown(() => root.delete(recursive: true));
    final app = await generateMultivalueUi(await multivalueUiFixture(), root);
    final backend = Directory('${app.path}/backend').absolute;
    final db = await harness.openDatabase(database);
    addTearDown(() => db.close());
    for (final sql in [
      "CREATE TABLE tb_encaminhamento(codenc SERIAL PRIMARY KEY,motivo_nao INTEGER)",
      "INSERT INTO tb_encaminhamento(motivo_nao) VALUES(100),(NULL),(200),(300)",
      "CREATE TABLE motivo_values(child_id SERIAL PRIMARY KEY,parent_pointer INTEGER,value TEXT)",
      "INSERT INTO motivo_values(parent_pointer,value) VALUES(100,'FALTA DE RECURSO FINANCEIRO'),(100,'OUTROS'),(100,NULL),(1,'WRONG PARENT PK')",
      "INSERT INTO motivo_values(parent_pointer,value) SELECT 300,'OUTROS' FROM generate_series(1,101)"
    ]) {
      await db.createCommand(sql).executeNonQuery();
    }
    Future<void> command(List<String> args) async {
      final r = await Process.run(Platform.resolvedExecutable, args,
              workingDirectory: backend.path)
          .timeout(const Duration(minutes: 2));
      expect(r.exitCode, 0, reason: '${r.stdout}\n${r.stderr}');
    }

    await command(['pub', 'get']);
    await command(['analyze', 'lib']);
    final exe =
        '${backend.path}/bin/multivalue_ui_server${Platform.isWindows ? '.exe' : ''}';
    await command(['compile', 'exe', 'bin/server.dart', '-o', exe]);
    final hold = Platform.environment['ACCESS_MULTIVALUE_BROWSER_HOLD'] == '1';
    final release = Directory('${app.path}/frontend/build').absolute;
    if (hold) expect(await File('${release.path}/main.dart.js').exists(), true);
    final process = await Process.start(
        exe,
        [
          '--address',
          '127.0.0.1',
          '--port',
          '0',
          if (hold) ...['--frontend-dir', release.path]
        ],
        workingDirectory: backend.path,
        environment: {
          ...Platform.environment,
          'ACCESS_TO_DART_DB_HOST': harness.host,
          'ACCESS_TO_DART_DB_PORT': '${harness.port}',
          'ACCESS_TO_DART_DB_NAME': database,
          'ACCESS_TO_DART_DB_USER': harness.user,
          'ACCESS_TO_DART_DB_PASSWORD': harness.password
        });
    addTearDown(() async {
      process.kill();
      await process.exitCode.timeout(const Duration(seconds: 10));
    });
    final ready = Completer<int>();
    final log = StringBuffer();
    process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen((line) {
      log.writeln(line);
      final m = RegExp(r'Serving at http://[^:]+:(\d+)').firstMatch(line);
      if (m != null && !ready.isCompleted) ready.complete(int.parse(m[1]!));
    });
    process.stderr.transform(utf8.decoder).listen(log.write);
    final port = await ready.future.timeout(const Duration(seconds: 20),
        onTimeout: () => throw StateError(log.toString()));
    final client = HttpClient();
    addTearDown(() => client.close(force: true));
    Future<dynamic> get(String path) async {
      final response = await (await client
              .getUrl(Uri.parse('http://127.0.0.1:$port/api/v1/$path')))
          .close();
      final body = await response.transform(utf8.decoder).join();
      expect(response.statusCode, 200, reason: body);
      return jsonDecode(body);
    }

    final first = await get('tb_encaminhamento/1/collections/motivo_nao');
    expect((first['values'] as List).map((v) => v['value']).toList(),
        ['FALTA DE RECURSO FINANCEIRO', 'OUTROS', null]);
    expect(first['truncated'], false);
    for (final id in [2, 3]) {
      expect(await get('tb_encaminhamento/$id/collections/motivo_nao'),
          {'values': [], 'truncated': false});
    }
    final truncated = await get('tb_encaminhamento/4/collections/motivo_nao');
    expect(truncated['values'].length, 100);
    expect(truncated['truncated'], true);
    if (hold) {
      final done = File('${root.path}/browser.done.json');
      if (await done.exists()) await done.delete();
      await File('${root.path}/browser.ready.json')
          .writeAsString(jsonEncode({'port': port}));
      print('MULTIVALUE_BROWSER_READY port=$port');
      final until = DateTime.now().add(const Duration(minutes: 5));
      while (!await done.exists() && DateTime.now().isBefore(until)) {
        await Future<void>.delayed(const Duration(milliseconds: 250));
      }
      expect(await done.exists(), true);
      expect(jsonDecode(await done.readAsString())['status'], 'passed');
    }
    final parents = await get('tb_encaminhamento') as List;
    expect(parents.length, 4);
    expect(parents.map((r) => r['motivo_nao']).toList(), [100, null, 200, 300]);
    expect(await get('tb_encaminhamento/1/collections/motivo_nao'), first);
    expect(await get('tb_encaminhamento/4/collections/motivo_nao'), truncated);
    print(
        'MULTIVALUE_UI_API_OK pointer,null,empty,truncated,noChanges${hold ? ',browser' : ''}');
  }, timeout: const Timeout(Duration(minutes: 10)));
}

class _LocalPostgresHarness {
  final String host;
  final int port;
  final String adminDatabase;
  final String user;
  final String password;

  const _LocalPostgresHarness({
    required this.host,
    required this.port,
    required this.adminDatabase,
    required this.user,
    required this.password,
  });

  factory _LocalPostgresHarness.fromEnvironment() {
    return _LocalPostgresHarness(
      host: Platform.environment['ACCESS_TO_DART_TEST_PG_HOST'] ?? 'localhost',
      port: int.tryParse(
            Platform.environment['ACCESS_TO_DART_TEST_PG_PORT'] ?? '',
          ) ??
          5432,
      adminDatabase:
          Platform.environment['ACCESS_TO_DART_TEST_PG_DATABASE'] ?? 'postgres',
      user: Platform.environment['ACCESS_TO_DART_TEST_PG_USER'] ?? 'postgres',
      password: Platform.environment['ACCESS_TO_DART_TEST_PG_PASSWORD'] ?? '',
    );
  }

  Future<bool> canConnect() async {
    try {
      final connection = await openDatabase(adminDatabase);
      await connection.close();
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<String> createTempDatabase() async {
    final name =
        'access_family_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1 << 20).toRadixString(36)}';
    final connection = await openDatabase(adminDatabase);
    try {
      await connection
          .createCommand(
              'CREATE DATABASE ${_quoteIdentifier(name)} TEMPLATE template0')
          .executeNonQuery();
      return name;
    } finally {
      await connection.close();
    }
  }

  Future<void> dropTempDatabase(String databaseName) async {
    final connection = await openDatabase(adminDatabase);
    try {
      await connection
          .createCommand(
            "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '${_escapeLiteral(databaseName)}' AND pid <> pg_backend_pid()",
          )
          .executeNonQuery();
      await connection
          .createCommand(
              'DROP DATABASE IF EXISTS ${_quoteIdentifier(databaseName)}')
          .executeNonQuery();
    } finally {
      await connection.close();
    }
  }

  Future<DpgsqlConnection> openDatabase(String databaseName) async {
    final connection = DpgsqlConnection(
      'Host=$host;Port=$port;Database=$databaseName;Username=$user;Password=$password;SSL Mode=Disable',
    );
    await connection.open();
    return connection;
  }

  String _quoteIdentifier(String value) {
    return '"${value.replaceAll('"', '""')}"';
  }

  String _escapeLiteral(String value) {
    return value.replaceAll("'", "''");
  }
}
