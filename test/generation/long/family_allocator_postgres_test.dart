import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';
import '../../support/family_allocator_fixture.dart';

void main() {
  test(
      'family numbering is atomic through generated API and preserves existing IDs',
      () async {
    final harness = _LocalPostgresHarness.fromEnvironment();
    final database = await harness.createTempDatabase();
    addTearDown(() => harness.dropTempDatabase(database));
    final persist = Platform.environment['ACCESS_FAMILY_OUTPUT'];
    final root = persist == null
        ? await Directory.systemTemp.createTemp('family_allocator_pg_')
        : Directory(persist).absolute;
    if (persist == null) addTearDown(() => root.delete(recursive: true));
    final app =
        await generateFamilyAllocator(await familyAllocatorFixture(), root);
    final backend = Directory('${app.path}/backend').absolute;
    final connection = await harness.openDatabase(database);
    addTearDown(() => connection.close());
    Future<void> sql(String value) async {
      await connection.createCommand(value).executeNonQuery();
    }

    await sql(
        "CREATE TABLE cad_residencia(cod_fam INTEGER DEFAULT 0 PRIMARY KEY,complemento TEXT CHECK (complemento <> 'FAIL'))");
    Future<void> command(List<String> args) async {
      final result = await Process.run(Platform.resolvedExecutable, args,
              workingDirectory: backend.path)
          .timeout(const Duration(minutes: 2));
      expect(result.exitCode, 0, reason: '${result.stdout}\n${result.stderr}');
    }

    await command(['pub', 'get']);
    await command(['analyze', 'lib']);
    final exe =
        '${backend.path}/bin/family_server${Platform.isWindows ? '.exe' : ''}';
    await command(['compile', 'exe', 'bin/server.dart', '-o', exe]);
    final hold = Platform.environment['ACCESS_FAMILY_BROWSER_HOLD'] == '1';
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
    final logs = StringBuffer();
    process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen((line) {
      logs.writeln(line);
      final match = RegExp(r'Serving at http://[^:]+:(\d+)').firstMatch(line);
      if (match != null && !ready.isCompleted)
        ready.complete(int.parse(match[1]!));
    });
    process.stderr.transform(utf8.decoder).listen(logs.write);
    final port = await ready.future.timeout(const Duration(seconds: 20),
        onTimeout: () => throw StateError(logs.toString()));
    final client = HttpClient();
    addTearDown(() => client.close(force: true));
    Future<({int status, dynamic body})> api(String method,
        [Map<String, dynamic>? body, int? id]) async {
      final request = await client.openUrl(
          method,
          Uri.parse(
              'http://127.0.0.1:$port/api/v1/cad_residencia${id == null ? '' : '/$id'}'));
      if (body != null) {
        request.headers.contentType = ContentType.json;
        request.write(jsonEncode(body));
      }
      final response = await request.close();
      final text = await response.transform(utf8.decoder).join();
      return (status: response.statusCode, body: jsonDecode(text));
    }

    Future<int> create(String label, {int? suppliedId}) async {
      final response = await api('POST', {
        'complemento': label,
        if (suppliedId != null) 'cod_fam': suppliedId
      });
      expect(response.status, 200, reason: '${response.body}');
      return (response.body as Map)['cod_fam'] as int;
    }

    expect(await create('Empty', suppliedId: 999), 1);
    await sql("INSERT INTO cad_residencia VALUES(10,'Existing import')");
    expect(await create('Gap'), 11);
    await sql('DELETE FROM cad_residencia WHERE cod_fam IN(10,11)');
    expect(await create('Delete max'), 2);
    final update =
        await api('PUT', {'cod_fam': 999, 'complemento': 'Updated'}, 1);
    expect(update.status, 200);
    expect(update.body['cod_fam'], 1);
    var rows = (await api('GET')).body as List;
    expect(rows.map((r) => r['cod_fam']).toList(), [1, 2]);
    final failed = await api('POST', {'complemento': 'FAIL'});
    expect(failed.status, greaterThanOrEqualTo(400));
    expect(await create('After rollback'), 3,
        reason: 'failed insert cannot consume a number');
    await sql('TRUNCATE cad_residencia');
    final concurrent =
        await Future.wait(List.generate(10, (i) => create('Concurrent $i')));
    expect(concurrent.toSet().length, 10);
    expect(concurrent..sort(), List.generate(10, (i) => i + 1));
    // The table lock must conflict with ordinary INSERTs outside this allocator.
    final external = await harness.openDatabase(database);
    try {
      await external.createCommand('BEGIN').executeNonQuery();
      await external
          .createCommand(
              "INSERT INTO cad_residencia VALUES(100,'External writer')")
          .executeNonQuery();
      var completed = false;
      final waiting = create('After external writer').then((id) {
        completed = true;
        return id;
      });
      await Future<void>.delayed(const Duration(milliseconds: 300));
      expect(completed, false,
          reason: 'allocator must wait for external uncommitted INSERT');
      await external.createCommand('COMMIT').executeNonQuery();
      expect(await waiting, 101);
    } finally {
      try {
        await external.createCommand('ROLLBACK').executeNonQuery();
      } catch (_) {}
      await external.close();
    }
    if (hold) {
      await sql('TRUNCATE cad_residencia');
      final done = File('${root.path}/browser.done.json');
      if (await done.exists()) await done.delete();
      await File('${root.path}/browser.ready.json')
          .writeAsString(jsonEncode({'port': port, 'status': 'ready'}));
      print('FAMILY_BROWSER_READY port=$port');
      final until = DateTime.now().add(const Duration(minutes: 5));
      while (!await done.exists() && DateTime.now().isBefore(until)) {
        await Future<void>.delayed(const Duration(milliseconds: 250));
      }
      expect(await done.exists(), true,
          reason: 'browser handshake did not complete');
      expect(jsonDecode(await done.readAsString())['status'], 'passed');
      rows = (await api('GET')).body as List;
      expect(rows.length, 1);
      expect(rows.single['cod_fam'], 1);
      expect(rows.single['complemento'], 'Browser synthetic family');
    }
    print(
        'FAMILY_ALLOCATOR_API_OK empty,gap,deleteMax,update,rollback,10concurrent,externalWriter${hold ? ',browser' : ''}');
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
