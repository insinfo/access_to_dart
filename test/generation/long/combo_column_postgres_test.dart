import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';
import '../../support/combo_column_fixture.dart';

void main() {
  test(
      'generated lookup preserves third column and NULL through real API and explicit UI Save',
      () async {
    final harness = _LocalPostgresHarness.fromEnvironment();
    final database = await harness.createTempDatabase();
    addTearDown(() => harness.dropTempDatabase(database));
    final persist = Platform.environment['ACCESS_COMBO_OUTPUT'];
    final root = persist == null
        ? await Directory.systemTemp.createTemp('combo_pg_')
        : Directory(persist).absolute;
    if (persist == null) addTearDown(() => root.delete(recursive: true));
    final app = await generateComboColumn(await comboColumnFixture(), root);
    final backend = Directory('${app.path}/backend').absolute;
    final db = await harness.openDatabase(database);
    addTearDown(() => db.close());
    for (final sql in [
      "CREATE TABLE tb_cad_funcionario(cod_func INTEGER PRIMARY KEY,nome TEXT,funca_o_no_sistema TEXT)",
      "INSERT INTO tb_cad_funcionario VALUES(7,'Synthetic name','Synthetic role'),(8,'Other name',NULL)",
      "CREATE TABLE tb_atend(cod_atend SERIAL PRIMARY KEY,cod_func INTEGER,nome_func TEXT,funcao_funcionario TEXT)",
      "INSERT INTO tb_atend(cod_func,nome_func,funcao_funcionario) VALUES(7,'Historical name','Historical role')"
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
        '${backend.path}/bin/combo_server${Platform.isWindows ? '.exe' : ''}';
    await command(['compile', 'exe', 'bin/server.dart', '-o', exe]);
    final hold = Platform.environment['ACCESS_COMBO_BROWSER_HOLD'] == '1';
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

    final options = await get('tb_atend/lookups/cod_func') as List;
    expect(options.length, 2);
    expect(options[0]['columns'], [7, 'Synthetic name', 'Synthetic role']);
    expect(options[1]['columns'], [8, 'Other name', null]);
    var rows = await get('tb_atend') as List;
    expect(rows.single['nome_func'], 'Historical name');
    if (hold) {
      final done = File('${root.path}/browser.done.json');
      if (await done.exists()) await done.delete();
      await File('${root.path}/browser.ready.json')
          .writeAsString(jsonEncode({'port': port}));
      print('COMBO_BROWSER_READY port=$port');
      final until = DateTime.now().add(const Duration(minutes: 5));
      while (!await done.exists() && DateTime.now().isBefore(until)) {
        await Future<void>.delayed(const Duration(milliseconds: 250));
      }
      expect(await done.exists(), true);
      expect(jsonDecode(await done.readAsString())['status'], 'passed');
      rows = await get('tb_atend') as List;
      expect(rows.length, 2);
      expect(rows[0]['cod_func'], 8);
      expect(rows[0]['nome_func'], 'Other name');
      expect(rows[0]['funcao_funcionario'], isNull);
      expect(rows[1]['cod_func'], 7);
      expect(rows[1]['nome_func'], 'Synthetic name');
      expect(rows[1]['funcao_funcionario'], 'Synthetic role');
    }
    print(
        'COMBO_API_OK thirdColumn,NULL,historical${hold ? ',browserUpdateAndCreate' : ''}');
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
