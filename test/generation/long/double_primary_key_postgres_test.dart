import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:access_to_dart/src/project_generator/project_generator.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:access_to_dart/src/migration_statement_builder.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';

AnalysisProject fixture() => AnalysisProject.fromJson({
      'schema_version': '1.0',
      'source': 'synthetic-double.accdb',
      'format': 'VERSION_16',
      'tables': [
        for (final pair in [
          ('CADUNICO', 'Identificação'),
          ('BPC', 'CODBPC'),
          ('DESCUMPRIMENTO', 'Identificação'),
          ('TbPBF08', 'codpbf')
        ])
          {
            'name': pair.$1,
            'rowCount': 0,
            'columns': [
              {
                'name': pair.$2,
                'typeName': 'Double',
                'typeCode': 7,
                'isRequired': true
              },
              {
                'name': 'Label',
                'typeName': 'Text',
                'typeCode': 10,
                'length': 50
              }
            ],
            'indexes': [
              {
                'name': 'PrimaryKey',
                'isPrimaryKey': true,
                'columns': [
                  {'name': pair.$2}
                ]
              }
            ],
            'sampleRows': []
          }
      ],
      'forms': [],
      'linkedTables': []
    });

void main() {
  test(
      'Double PK generated HTTP CRUD preserves keys and rejects non-finite identifiers',
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
    final database = 'access_double_${DateTime.now().microsecondsSinceEpoch}';
    final admin = DpgsqlConnection(cs('postgres'));
    await admin.open();
    DpgsqlConnection? pg;
    Process? server;
    HttpClient? client;
    Directory? temp;
    var created = false;
    const builder = MigrationStatementBuilder(
        identifierPolicy: MigrationIdentifierPolicy(
            style: MigrationIdentifierStyle.snakeAscii));
    try {
      await admin
          .createCommand('CREATE DATABASE "$database" TEMPLATE template0')
          .executeNonQuery();
      created = true;
      pg = DpgsqlConnection(cs(database));
      await pg.open();
      for (final table in fixture().tables) {
        await pg
            .createCommand(builder.buildCreateTableStatement(table))
            .executeNonQuery();
      }
      temp = await Directory.systemTemp.createTemp('access_double_crud_');
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

      for (final table in fixture().tables) {
        final route = builder.identifierPolicy.tableName(table.name);
        final key =
            builder.identifierPolicy.columnName(table.columns.first.name);
        final created =
            await api('POST', route, null, {key: 1.25, 'label': 'synthetic'});
        expect(created.status, 200, reason: '$route create ${created.body}');
        expect(created.body[key], 1.25);
        expect((await api('GET', route, '1.25')).status, 200);
        final integer =
            await api('POST', route, null, {key: 2, 'label': 'integer double'});
        expect(integer.status, 200, reason: '$route integer ${integer.body}');
        expect((await api('GET', route, '2.0')).body[key], 2.0);
        final changed = await api(
            'PUT', route, '1.25', {key: 3.75, 'label': 'changed key'});
        expect(changed.status, 200,
            reason: 'successful PK edit must reload new key');
        expect(changed.body[key], 3.75);
        expect((await api('GET', route, '1.25')).status, 404);
        final missing = await api('PUT', route, '999.25',
            {key: 2, 'label': 'must not mutate existing'});
        expect(missing.status, 404);
        expect((await api('GET', route, '2')).body['label'], 'integer double');
        for (final invalid in [
          'NaN',
          'Infinity',
          '-Infinity',
          '1e999',
          'invalid'
        ]) {
          for (final method in ['GET', 'PUT', 'DELETE']) {
            final result = await api(method, route, invalid,
                method == 'PUT' ? {key: 2, 'label': 'invalid'} : null);
            expect(result.status, 400, reason: '$route $method $invalid');
          }
        }
        final conflict = await api(
            'PUT', route, '3.75', {key: 2, 'label': 'must rollback duplicate'});
        expect(conflict.status, 400);
        expect((await api('GET', route, '3.75')).body['label'], 'changed key');
        expect((await api('GET', route, '2')).body['label'], 'integer double');
        await pg
            .createCommand(
                'CREATE TABLE "${route}_child" (parent DOUBLE PRECISION REFERENCES "$route"("$key"))')
            .executeNonQuery();
        await pg
            .createCommand('INSERT INTO "${route}_child" VALUES (3.75)')
            .executeNonQuery();
        final blocked = await api(
            'PUT', route, '3.75', {key: 4.5, 'label': 'must rollback FK'});
        expect(blocked.status, 400);
        expect((await api('GET', route, '3.75')).body['label'], 'changed key');
        expect((await api('GET', route, '4.5')).status, 404);
        await pg.createCommand('DROP TABLE "${route}_child"').executeNonQuery();
        final racing = await Future.wait([
          api('PUT', route, '3.75', {key: 4.75, 'label': 'winner A'}),
          api('PUT', route, '3.75', {key: 5.75, 'label': 'winner B'})
        ]);
        expect(racing.map((r) => r.status).toList()..sort(), [200, 404]);
        final winner = racing.singleWhere((r) => r.status == 200).body[key];
        expect((await api('GET', route, '$winner')).status, 200);
        expect((await api('DELETE', route, '$winner')).status, 200);
        expect((await api('GET', route, '3.75')).status, 404);
      }
      print(
          'DOUBLE_PK_HTTP_OK four schemas fractional/integer/edit/missing/invalid/delete');
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
