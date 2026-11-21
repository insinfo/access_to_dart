import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:access_to_dart/src/project_generator/project_generator.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/access_to_dart.dart' as cli;
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';

AnalysisProject fixture() => AnalysisProject.fromJson({
      'schema_version': '1.0',
      'source': 'synthetic-autonumber.accdb',
      'format': 'VERSION_16',
      'tables': [
        for (final auto in [true, false])
          {
            'name': auto ? 'Cadastro' : 'Manual',
            'rowCount': auto ? 2 : 1,
            'columns': [
              {
                'name': 'CodigoCadastro',
                'typeName': 'Long',
                'typeCode': 4,
                'isAutoNumber': auto,
                'isRequired': true
              },
              {'name': 'Nome', 'typeName': 'Text', 'typeCode': 10, 'length': 50}
            ],
            'indexes': [
              {
                'name': 'PrimaryKey',
                'isPrimaryKey': true,
                'columns': [
                  {'name': 'CodigoCadastro'}
                ]
              }
            ],
            'sampleRows': auto
                ? [
                    {'CodigoCadastro': 5, 'Nome': 'existing five'},
                    {'CodigoCadastro': 42, 'Nome': 'existing max'}
                  ]
                : [
                    {'CodigoCadastro': 7, 'Nome': 'manual'}
                  ]
          }
      ],
      'forms': [],
      'linkedTables': []
    });

void main() {
  test(
      'CLI default migration supports generated AutoNumber POST without forcing ordinary keys',
      () async {
    final env = Platform.environment;
    final user = env['ACCESS_TO_DART_TEST_PG_USER'];
    final password = env['ACCESS_TO_DART_TEST_PG_PASSWORD'];
    if (user == null || password == null) {
      throw StateError('Session PG credentials required');
    }
    final host = env['ACCESS_TO_DART_TEST_PG_HOST'] ?? 'localhost';
    final port = env['ACCESS_TO_DART_TEST_PG_PORT'] ?? '5432';
    String cs(String database) =>
        'Host=$host;Port=$port;Database=$database;Username=$user;Password=$password;SSL Mode=Disable';
    final database = 'access_cli_auto_${DateTime.now().microsecondsSinceEpoch}';
    final admin = DpgsqlConnection(cs('postgres'));
    await admin.open();
    DpgsqlConnection? pg;
    Process? server;
    HttpClient? client;
    Directory? temp;
    var created = false;
    try {
      await admin
          .createCommand('CREATE DATABASE "$database" TEMPLATE template0')
          .executeNonQuery();
      created = true;
      pg = DpgsqlConnection(cs(database));
      await pg.open();
      temp = await Directory.systemTemp.createTemp('access_cli_auto_');
      final analysis = File('${temp.path}/analysis.json');
      await analysis.writeAsString(jsonEncode(fixture().raw));
      final error = StringBuffer();
      expect(
          await cli.run([
            'migrate',
            '--analysis',
            analysis.path,
            '--output',
            '${temp.path}/migration',
            '--pg',
            Uri(
                scheme: 'postgresql',
                userInfo: '$user:$password',
                host: host,
                port: int.parse(port),
                path: '/$database',
                queryParameters: {'sslmode': 'disable'}).toString()
          ], out: StringBuffer(), err: error),
          0,
          reason: error.toString());
      await ProjectGenerator()
          .generate(project: fixture(), outputDirectory: '${temp.path}/app');
      final backend = '${temp.path}/app/backend';
      Future<void> command(List<String> args) async {
        final result = await Process.run(Platform.resolvedExecutable, args,
                workingDirectory: backend)
            .timeout(const Duration(minutes: 2));
        expect(result.exitCode, 0,
            reason: '${result.stdout}\n${result.stderr}');
      }

      await command(['pub', 'get']);
      await command(['analyze', 'lib']);
      final exe =
          '$backend/bin/temporal_server${Platform.isWindows ? '.exe' : ''}';
      await command(['compile', 'exe', 'bin/server.dart', '-o', exe]);
      server =
          await Process.start(exe, ['--address', '127.0.0.1', '--port', '0'],
              workingDirectory: backend,
              environment: {
                ...env,
                'ACCESS_TO_DART_DB_HOST': host,
                'ACCESS_TO_DART_DB_PORT': port,
                'ACCESS_TO_DART_DB_NAME': database,
                'ACCESS_TO_DART_DB_USER': user,
                'ACCESS_TO_DART_DB_PASSWORD': password,
              });
      final ready = Completer<int>();
      final logs = StringBuffer();
      server.stdout
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .listen((line) {
        logs.writeln(line);
        final match = RegExp(r'Serving at http://[^:]+:(\d+)').firstMatch(line);
        if (match != null && !ready.isCompleted) {
          ready.complete(int.parse(match[1]!));
        }
      });
      server.stderr.transform(utf8.decoder).listen(logs.write);
      final httpPort = await ready.future.timeout(const Duration(seconds: 30),
          onTimeout: () => throw StateError(logs.toString()));
      client = HttpClient();
      Future<({int status, Map<String, dynamic> body})> api(
          String method, String route, String? id,
          [Map<String, dynamic>? body]) async {
        final request = await client!.openUrl(
            method,
            Uri.parse(
                'http://127.0.0.1:$httpPort/api/v1/$route${id == null ? '' : '/$id'}'));
        if (body != null) {
          request.headers.contentType = ContentType.json;
          request.write(jsonEncode(body));
        }
        final response = await request.close();
        return (
          status: response.statusCode,
          body: jsonDecode(await response.transform(utf8.decoder).join())
              as Map<String, dynamic>
        );
      }

      expect((await api('GET', 'cadastro', '5')).body['nome'], 'existing five');
      expect((await api('GET', 'cadastro', '42')).body['nome'], 'existing max');
      final first =
          await api('POST', 'cadastro', null, {'nome': 'new default'});
      print('CLI_DEFAULT_AUTONUMBER_POST_STATUS=${first.status}');
      expect(first.status, 200,
          reason:
              'CLI default schema must support generated AutoNumber INSERT');
      expect(first.body['codigo_cadastro'], 43);
      await pg
          .createCommand(
              "ALTER TABLE cadastro ADD CONSTRAINT synthetic_reject CHECK (nome <> 'reject')")
          .executeNonQuery();
      expect((await api('POST', 'cadastro', null, {'nome': 'reject'})).status,
          400);
      expect((await api('GET', 'cadastro', '44')).status, 404);
      final afterRollback =
          await api('POST', 'cadastro', null, {'nome': 'after rollback'});
      expect(afterRollback.status, 200);
      expect(afterRollback.body['codigo_cadastro'], 45);
      final manual = await api('POST', 'manual', null,
          {'codigo_cadastro': 8, 'nome': 'explicit ordinary key'});
      expect(manual.status, 200);
      expect(manual.body['codigo_cadastro'], 8);
      final columns = await pg.executeReader(
          "SELECT column_default FROM information_schema.columns WHERE table_schema='public' AND table_name='manual' AND column_name='codigo_cadastro'");
      try {
        expect(await columns.read(), true);
        expect(columns.getValue(0), isNull);
      } finally {
        await columns.close();
      }
      expect(
          await cli.run([
            'migrate',
            '--analysis',
            analysis.path,
            '--output',
            '${temp.path}/plain',
            '--auto-number-mode',
            'plain-int'
          ], out: StringBuffer(), err: error),
          0,
          reason: error.toString());
      final plain = await File('${temp.path}/plain/schema.sql').readAsString();
      expect(plain, contains('Auto-number mode: plain-int'));
      expect(plain, isNot(contains('CREATE SEQUENCE')));
      expect(plain, isNot(contains('nextval(')));
      print(
          'CLI_DEFAULT_AUTONUMBER_OK existing IDs, next ID, rollback gap, non-AutoNumber, explicit plain-int');
    } finally {
      client?.close(force: true);
      if (server != null) {
        server.kill();
        await server.exitCode.timeout(const Duration(seconds: 10));
      }
      if (pg != null) await pg.close();
      if (created) {
        await admin
            .createCommand('DROP DATABASE "$database" WITH (FORCE)')
            .executeNonQuery();
      }
      await admin.close();
      if (temp != null) await temp.delete(recursive: true);
    }
  }, timeout: const Timeout(Duration(minutes: 6)));
}
