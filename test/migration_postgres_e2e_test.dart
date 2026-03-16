import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:postgres/postgres.dart';
import 'package:test/test.dart';

void main() {
  test(
    'migrate applies fixture to temporary local postgres database',
    () async {
      if (!Platform.isWindows) {
        return;
      }

      final harness = _LocalPostgresHarness.fromEnvironment();
      if (!await harness.canConnect()) {
        stdout.writeln('Skipping local PostgreSQL E2E: admin connection unavailable.');
        return;
      }

      final tempDir = await Directory.systemTemp.createTemp('access_pg_');
      addTearDown(() => tempDir.delete(recursive: true));

      final fixtureFile =
          File('${tempDir.path}${Platform.pathSeparator}fixture.accdb');
      await _runProcess(
        'dart',
        [
          'run',
          'tools/create_access_accdb.dart',
          '--output',
          fixtureFile.path,
          '--table',
          'E2EUsers',
        ],
        description: 'create postgres fixture accdb',
      );

      final databaseName = await harness.createTempDatabase();
      addTearDown(() => harness.dropTempDatabase(databaseName));

      final out = StringBuffer();
      final err = StringBuffer();
      final exitCode = await run(
        [
          'migrate',
          '--accdb',
          fixtureFile.path,
          '--output',
          '${tempDir.path}${Platform.pathSeparator}migration',
          '--pg',
          harness.connectionString(databaseName),
        ],
        out: out,
        err: err,
      );

      expect(exitCode, 0, reason: err.toString());
      expect(out.toString(), contains('PostgreSQL apply: OK'));

      final connection = await harness.openDatabase(databaseName);
      try {
        final result = await connection.execute(
          Sql('SELECT "user_name" FROM "e2_e_users" ORDER BY "user_id"'),
        );
        expect(result.length, 2);
        expect(result.first.first, 'Alice');
        expect(result.last.first, 'Bruno');
      } finally {
        await connection.close();
      }
    },
    timeout: const Timeout(Duration(minutes: 10)),
  );

  test(
    'generated backend serves migrated rows from temporary local postgres database',
    () async {
      if (!Platform.isWindows) {
        return;
      }

      final harness = _LocalPostgresHarness.fromEnvironment();
      if (!await harness.canConnect()) {
        stdout.writeln('Skipping backend smoke against PostgreSQL: admin connection unavailable.');
        return;
      }

      final tempDir = await Directory.systemTemp.createTemp('access_http_');
      addTearDown(() => tempDir.delete(recursive: true));

      final fixtureFile =
          File('${tempDir.path}${Platform.pathSeparator}fixture.accdb');
      final analysisDir =
          Directory('${tempDir.path}${Platform.pathSeparator}analysis');
      final outputDir =
          Directory('${tempDir.path}${Platform.pathSeparator}generated_app');

      await _runProcess(
        'dart',
        [
          'run',
          'tools/create_access_accdb.dart',
          '--output',
          fixtureFile.path,
          '--table',
          'E2EUsers',
        ],
        description: 'create backend smoke fixture accdb',
      );

      final databaseName = await harness.createTempDatabase();
      addTearDown(() => harness.dropTempDatabase(databaseName));

      final migrateOut = StringBuffer();
      final migrateErr = StringBuffer();
      final migrateExit = await run(
        [
          'migrate',
          '--accdb',
          fixtureFile.path,
          '--output',
          '${tempDir.path}${Platform.pathSeparator}migration',
          '--pg',
          harness.connectionString(databaseName),
        ],
        out: migrateOut,
        err: migrateErr,
      );
      expect(migrateExit, 0, reason: migrateErr.toString());

      final analyzeOut = StringBuffer();
      final analyzeErr = StringBuffer();
      final analyzeExit = await run(
        [
          'analyze',
          '--accdb',
          fixtureFile.path,
          '--output',
          analysisDir.path,
        ],
        out: analyzeOut,
        err: analyzeErr,
      );
      expect(analyzeExit, 0, reason: analyzeErr.toString());

      final analysisFile =
          File('${analysisDir.path}${Platform.pathSeparator}analysis.json');
      final generateOut = StringBuffer();
      final generateErr = StringBuffer();
      final generateExit = await run(
        [
          'generate',
          '--analysis',
          analysisFile.path,
          '--output',
          outputDir.path,
        ],
        out: generateOut,
        err: generateErr,
      );
      expect(generateExit, 0, reason: generateErr.toString());

      final backendDir =
          Directory('${outputDir.path}${Platform.pathSeparator}backend');
      await _runProcess(
        'dart',
        ['pub', 'get'],
        workingDirectory: backendDir.path,
        description: 'backend smoke dart pub get',
      );
      await _runProcess(
        'dart',
        ['analyze', '.'],
        workingDirectory: backendDir.path,
        description: 'backend smoke dart analyze',
        allowedNonZeroExitCodes: {2},
      );
      await _runProcess(
        'dart',
        ['compile', 'exe', 'bin/server.dart', '-o', 'build/server.exe'],
        workingDirectory: backendDir.path,
        description: 'backend smoke compile server',
      );

      final port = 18080 + Random().nextInt(500);
      final serverExe =
          '${backendDir.path}${Platform.pathSeparator}build${Platform.pathSeparator}server.exe';
      final serverProcess = await Process.start(
        serverExe,
        ['--address', '127.0.0.1', '--port', '$port'],
        workingDirectory: backendDir.path,
        runInShell: true,
        environment: {
          ...Platform.environment,
          'ACCESS_TO_DART_DB_HOST': harness.host,
          'ACCESS_TO_DART_DB_PORT': '${harness.port}',
          'ACCESS_TO_DART_DB_NAME': databaseName,
          'ACCESS_TO_DART_DB_USER': harness.user,
          'ACCESS_TO_DART_DB_PASSWORD': harness.password,
        },
      );

      addTearDown(() async {
        serverProcess.kill();
        await serverProcess.exitCode.timeout(
          const Duration(seconds: 5),
          onTimeout: () => -1,
        );
      });

      await _waitForHttp('http://127.0.0.1:$port/api/v1/e2_e_users');
      final body = await _httpGet('http://127.0.0.1:$port/api/v1/e2_e_users');
      final rows = jsonDecode(body) as List<dynamic>;

      expect(rows.length, 2);
      expect(rows.first['user_name'], 'Alice');
      expect(rows.last['user_name'], 'Bruno');
    },
    timeout: const Timeout(Duration(minutes: 15)),
  );
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
      password:
          Platform.environment['ACCESS_TO_DART_TEST_PG_PASSWORD'] ?? 'slsadm1n',
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
        'access_e2e_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1 << 20).toRadixString(36)}';
    final connection = await openDatabase(adminDatabase);
    try {
      await connection.execute(Sql('CREATE DATABASE ${_quoteIdentifier(name)}'));
      return name;
    } finally {
      await connection.close();
    }
  }

  Future<void> dropTempDatabase(String databaseName) async {
    final connection = await openDatabase(adminDatabase);
    try {
      await connection.execute(
        Sql(
          "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '${_escapeLiteral(databaseName)}' AND pid <> pg_backend_pid()",
        ),
      );
      await connection.execute(
        Sql('DROP DATABASE IF EXISTS ${_quoteIdentifier(databaseName)}'),
      );
    } finally {
      await connection.close();
    }
  }

  Future<Connection> openDatabase(String databaseName) {
    return Connection.open(
      Endpoint(
        host: host,
        port: port,
        database: databaseName,
        username: user,
        password: password,
      ),
      settings: const ConnectionSettings(sslMode: SslMode.disable),
    );
  }

  String connectionString(String databaseName) {
    return "host=$host port=$port dbname=$databaseName user=$user password=$password sslmode=disable";
  }

  String _quoteIdentifier(String value) {
    return '"${value.replaceAll('"', '""')}"';
  }

  String _escapeLiteral(String value) {
    return value.replaceAll("'", "''");
  }
}

Future<void> _waitForHttp(String url) async {
  final deadline = DateTime.now().add(const Duration(seconds: 30));
  Object? lastError;

  while (DateTime.now().isBefore(deadline)) {
    try {
      final request = await HttpClient().getUrl(Uri.parse(url));
      final response = await request.close();
      if (response.statusCode >= 200 && response.statusCode < 500) {
        await response.drain<void>();
        return;
      }
    } catch (error) {
      lastError = error;
    }
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }

  fail('Timed out waiting for HTTP endpoint $url. Last error: $lastError');
}

Future<String> _httpGet(String url) async {
  final request = await HttpClient().getUrl(Uri.parse(url));
  final response = await request.close();
  final body = await response.transform(utf8.decoder).join();
  expect(response.statusCode, 200, reason: body);
  return body;
}

Future<ProcessResult> _runProcess(
  String executable,
  List<String> arguments, {
  required String description,
  String? workingDirectory,
  Set<int> allowedNonZeroExitCodes = const <int>{},
}) async {
  final result = await Process.run(
    executable,
    arguments,
    workingDirectory: workingDirectory,
    runInShell: true,
  );

  final stdoutText = result.stdout.toString();
  final stderrText = result.stderr.toString();
  final allowedExitCodes = <int>{0, ...allowedNonZeroExitCodes};

  expect(
    allowedExitCodes.contains(result.exitCode),
    isTrue,
    reason: '$description failed with exit ${result.exitCode}\nSTDOUT:\n$stdoutText\nSTDERR:\n$stderrText',
  );

  return result;
}