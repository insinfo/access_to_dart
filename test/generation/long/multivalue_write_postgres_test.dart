import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/complex_collection_sequence.dart';
import 'package:access_to_dart/src/migration_statement_builder.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import '../../support/multivalue_ui_fixture.dart';

void main() {
  test(
      'explicit collection PUT is atomic, isolated and optimistic with sequence allocation',
      () async {
    final harness = _LocalPostgresHarness.fromEnvironment();
    final database = await harness.createTempDatabase();
    addTearDown(() => harness.dropTempDatabase(database));
    final persist = Platform.environment['ACCESS_MULTIVALUE_OUTPUT'];
    final root = persist == null
        ? await Directory.systemTemp.createTemp('multivalue_write_')
        : Directory(persist).absolute;
    if (persist == null) addTearDown(() => root.delete(recursive: true));
    final fixture = await multivalueUiFixture();
    final app = await generateMultivalueUi(fixture, root);
    final backend = Directory('${app.path}/backend').absolute;
    final db = await harness.openDatabase(database);
    addTearDown(() => db.close());
    const first = 'FALTA DE RECURSO FINANCEIRO';
    const second = 'CONDIÇÃO DE SAÚDE PESSOAL/FAMILIAR';
    const third = 'NEGATIVA DE ATENDIMENTO';
    final builder = MigrationStatementBuilder(
        identifierPolicy: MigrationIdentifierPolicy(
            style: MigrationIdentifierStyle.snakeAscii));
    final project = AnalysisProject.fromJson(fixture);
    for (final sql in [
      "CREATE TABLE tb_encaminhamento(codenc SERIAL PRIMARY KEY,motivo_nao INTEGER)",
      "INSERT INTO tb_encaminhamento(motivo_nao) VALUES(100),(NULL),(NULL),(NULL),(NULL)",
      "CREATE TABLE motivo_values(child_id SERIAL PRIMARY KEY,parent_pointer INTEGER,value TEXT)",
      "INSERT INTO motivo_values(parent_pointer,value) VALUES(100,'$first'),(900,'ORPHAN')",
      ...builder.buildComplexPointerSequenceStatements(project),
      ...builder.buildComplexPointerSequenceOwnershipStatements(project),
      ...builder.buildComplexPointerSequenceSyncStatements(project),
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
        '${backend.path}/bin/multivalue_write_server${Platform.isWindows ? '.exe' : ''}';
    await command(['compile', 'exe', 'bin/server.dart', '-o', exe]);
    final hold = Platform.environment['ACCESS_MULTIVALUE_BROWSER_HOLD'] == '1';
    final process = await Process.start(
        exe,
        [
          '--address',
          '127.0.0.1',
          '--port',
          '0',
          if (hold) ...['--frontend-dir', '${app.path}/frontend/build']
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
    Future<dynamic> api(String method, String suffix,
        [Map<String, dynamic>? data, int status = 200]) async {
      final req = await client.openUrl(method,
          Uri.parse('http://127.0.0.1:$port/api/v1/tb_encaminhamento$suffix'));
      if (data != null) {
        req.headers.contentType = ContentType.json;
        req.write(jsonEncode(data));
      }
      final response = await req.close();
      final body = await response.transform(utf8.decoder).join();
      expect(response.statusCode, status, reason: body);
      return jsonDecode(body);
    }

    Future<dynamic> get(int id) => api('GET', '/$id/collections/motivo_nao');
    Future<dynamic> put(int id, List values, dynamic previous,
            [int status = 200]) =>
        api('PUT', '/$id/collections/motivo_nao',
            {'values': values, 'revision': previous['revision']}, status);
    final initial = await get(1);
    expect(initial['editable'], true);
    final stableId = initial['values'].single['id'];
    final changed = await put(1, [first, second], initial);
    expect(changed['values'].map((r) => r['value']), [first, second]);
    expect(changed['values'].first['id'], stableId);
    await put(1, [], initial, 409);
    await put(1, [first, first], changed, 400);
    await put(1, [null], changed, 400);
    await put(1, ['OUTSIDE'], changed, 400);
    final empty = await get(2);
    final stillEmpty = await put(2, [], empty);
    expect(stillEmpty['values'], isEmpty);
    expect((await api('GET', '/2'))['motivo_nao'], isNull);
    final allocated = await put(2, [second], empty);
    expect(allocated['values'].single['value'], second);
    final pointer = (await api('GET', '/2'))['motivo_nao'];
    expect(pointer, greaterThan(900),
        reason: 'orphan child links reserved during migration');
    final cleared = await put(2, [], allocated);
    expect(cleared['values'], isEmpty);
    expect((await api('GET', '/2'))['motivo_nao'], pointer);
    final beforeRace = await get(1);
    final statuses = await Future.wait([
      for (final value in [first, second])
        () async {
          final req = await client.putUrl(Uri.parse(
              'http://127.0.0.1:$port/api/v1/tb_encaminhamento/1/collections/motivo_nao'));
          req.headers.contentType = ContentType.json;
          req.write(jsonEncode({
            'values': [value],
            'revision': beforeRace['revision']
          }));
          final response = await req.close();
          await response.drain<void>();
          return response.statusCode;
        }()
    ]);
    expect(statuses..sort(), [200, 409]);
    final parent3 = await get(3);
    final parent4 = await get(4);
    await Future.wait([
      put(3, [first], parent3),
      put(4, [second], parent4)
    ]);
    expect((await api('GET', '/3'))['motivo_nao'],
        isNot((await api('GET', '/4'))['motivo_nao']));
    await db
        .createCommand(
            "CREATE FUNCTION fail_selected() RETURNS trigger LANGUAGE plpgsql AS 'BEGIN IF NEW.value = ''$third'' THEN RAISE EXCEPTION ''controlled failure''; END IF; RETURN NEW; END'")
        .executeNonQuery();
    await db
        .createCommand(
            'CREATE TRIGGER fail_selected BEFORE INSERT ON motivo_values FOR EACH ROW EXECUTE FUNCTION fail_selected()')
        .executeNonQuery();
    final parent5 = await get(5);
    await put(5, [first, third], parent5, 500);
    expect((await api('GET', '/5'))['motivo_nao'], isNull,
        reason: 'pointer allocation rolls back with failed child insert');
    expect((await get(5))['values'], isEmpty);
    expect((await get(3))['values'].single['value'], first);
    // Generic parent write guard must still reject pointer reassignment.
    final protected = await api('PUT', '/3', {'codenc': 3, 'motivo_nao': 900});
    expect(protected['motivo_nao'], isNot(900));
    final thirdPointer = (await api('GET', '/3'))['motivo_nao'];
    await db
        .createCommand(
            'INSERT INTO tb_encaminhamento(codenc,motivo_nao) VALUES(6,$thirdPointer),(7,888),(8,777)')
        .executeNonQuery();
    await put(3, [second], await get(3), 409);
    await db
        .createCommand(
            "INSERT INTO motivo_values(parent_pointer,value) VALUES(888,NULL),(888,'LEGACY')")
        .executeNonQuery();
    final legacy = await get(7);
    expect(legacy['editable'], false);
    await put(7, [], legacy, 409);
    await db
        .createCommand(
            "INSERT INTO motivo_values(parent_pointer,value) SELECT 777,'$first' FROM generate_series(1,101)")
        .executeNonQuery();
    final tooMany = await get(8);
    expect(tooMany['truncated'], true);
    expect(tooMany['editable'], false);
    await put(8, [], tooMany, 409);
    await db
        .createCommand('DELETE FROM tb_encaminhamento WHERE codenc IN(6,7,8)')
        .executeNonQuery();
    await db
        .createCommand(
            'DELETE FROM motivo_values WHERE parent_pointer IN(777,888)')
        .executeNonQuery();
    final sequence =
        complexCollectionSequenceName('TbEncaminhamento', 'MotivoNão');
    final previousSequence = await db
        .createCommand("SELECT nextval('\"$sequence\"')")
        .executeScalar();
    for (final sql
        in builder.buildComplexPointerSequenceSyncStatements(project)) {
      await db.createCommand(sql).executeNonQuery();
    }
    final nextSequence = await db
        .createCommand("SELECT nextval('\"$sequence\"')")
        .executeScalar();
    expect(int.parse(nextSequence.toString()),
        greaterThan(int.parse(previousSequence.toString())),
        reason:
            'migration synchronization cannot rewind consumed sequence values');
    await db
        .createCommand(
            'ALTER TABLE motivo_values ALTER COLUMN child_id SET DEFAULT 1')
        .executeNonQuery();
    final missingAllocator = await get(2);
    expect(missingAllocator['editable'], false);
    expect(missingAllocator['readOnlyReason'],
        contains('--auto-number-mode sequence'));
    await put(2, [first], missingAllocator, 409);
    await db
        .createCommand(
            "ALTER TABLE motivo_values ALTER COLUMN child_id SET DEFAULT nextval('motivo_values_child_id_seq'::regclass)")
        .executeNonQuery();
    expect((await get(2))['editable'], true);
    if (hold) {
      final done = File('${root.path}/browser.done.json');
      if (await done.exists()) await done.delete();
      await File('${root.path}/browser.ready.json')
          .writeAsString(jsonEncode({'port': port}));
      print('MULTIVALUE_WRITE_BROWSER_READY port=$port');
      final until = DateTime.now().add(const Duration(minutes: 6));
      while (!await done.exists() && DateTime.now().isBefore(until)) {
        await Future<void>.delayed(const Duration(milliseconds: 250));
      }
      expect(await done.exists(), true);
      expect(jsonDecode(await done.readAsString())['status'], 'passed');
    }
    print(
        'MULTIVALUE_WRITE_OK selection,clear,stableIds,orphanHighWater,concurrency,rollback,pointerGuard');
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
