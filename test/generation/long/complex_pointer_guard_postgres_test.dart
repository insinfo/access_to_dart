import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';
import '../../support/multivalue_ui_fixture.dart';

void main() {
  test(
      'generic parent POST and PUT cannot supply or replace complex collection pointers',
      () async {
    final harness = _LocalPostgresHarness.fromEnvironment();
    final database = await harness.createTempDatabase();
    addTearDown(() => harness.dropTempDatabase(database));
    final root =
        await Directory.systemTemp.createTemp('complex_pointer_guard_');
    addTearDown(() => root.delete(recursive: true));
    final fixture = await multivalueUiFixture();
    final parent = fixture['tables'][0];
    parent['columns'].add({'name': 'Obs', 'typeName': 'Text', 'typeCode': 10});
    parent['columns'][1]['defaultValue'] = '0';
    parent['columns'].add({
      'name': 'Anexo',
      'typeName': 'ComplexType',
      'typeCode': 18,
      'defaultValue': '0'
    });
    final app = await generateMultivalueUi(fixture, root);
    final backend = Directory('${app.path}/backend').absolute;
    final db = await harness.openDatabase(database);
    addTearDown(() => db.close());
    for (final sql in [
      "CREATE TABLE tb_encaminhamento(codenc SERIAL PRIMARY KEY,motivo_nao INTEGER DEFAULT 0,obs TEXT,anexo INTEGER DEFAULT 0)",
      "INSERT INTO tb_encaminhamento(motivo_nao,obs) VALUES(100,'first'),(200,'second')",
      "UPDATE tb_encaminhamento SET anexo=codenc*700",
      "CREATE TABLE motivo_values(child_id SERIAL PRIMARY KEY,parent_pointer INTEGER,value TEXT)",
      "INSERT INTO motivo_values(parent_pointer,value) VALUES(100,'FIRST'),(200,'SECOND')"
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
        '${backend.path}/bin/pointer_guard_server${Platform.isWindows ? '.exe' : ''}';
    await command(['compile', 'exe', 'bin/server.dart', '-o', exe]);
    final process =
        await Process.start(exe, ['--address', '127.0.0.1', '--port', '0'],
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
    Future<dynamic> api(String method, String suffix,
        [Map<String, dynamic>? data]) async {
      final req = await client.openUrl(method,
          Uri.parse('http://127.0.0.1:$port/api/v1/tb_encaminhamento$suffix'));
      if (data != null) {
        req.headers.contentType = ContentType.json;
        req.write(jsonEncode(data));
      }
      final response = await req.close();
      final body = await response.transform(utf8.decoder).join();
      expect(response.statusCode, 200, reason: body);
      return jsonDecode(body);
    }

    final created =
        await api('POST', '', {'motivo_nao': 100, 'anexo': 1400, 'obs': 'new'});
    final updated = await api('PUT', '/1',
        {'codenc': 1, 'motivo_nao': 200, 'anexo': 1400, 'obs': 'updated'});
    print(
        'POINTER_GUARD_RESULT create=${created['motivo_nao']} update=${updated['motivo_nao']}');
    expect(created['motivo_nao'], isNull,
        reason:
            'new parent must not borrow another collection or allocate pointer0');
    expect(updated['motivo_nao'], 100,
        reason: 'ordinary update cannot reassign a saved collection');
    expect(updated['obs'], 'updated');
    expect(created['anexo'], isNull);
    expect(updated['anexo'], 700);
    final clear = await api(
        'PUT', '/1', {'codenc': 1, 'motivo_nao': null, 'obs': 'not cleared'});
    expect(clear['motivo_nao'], 100);
    final malformed = await api('PUT', '/1', {
      'codenc': 1,
      'motivo_nao': ['not a pointer'],
      'obs': 'ignored readonly value'
    });
    expect(malformed['motivo_nao'], 100);
    final first = await api('GET', '/1/collections/motivo_nao');
    expect(first['values'].single['value'], 'FIRST');
    final second = await api('GET', '/2/collections/motivo_nao');
    expect(second['values'].single['value'], 'SECOND');
    final empty =
        await api('GET', '/${created['codenc']}/collections/motivo_nao');
    expect(empty['values'], isEmpty);
    print(
        'COMPLEX_POINTER_GUARD_OK create,update,null,malformed,existingCollections');
  }, timeout: const Timeout(Duration(minutes: 3)));
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
