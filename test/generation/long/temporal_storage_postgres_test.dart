import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:access_to_dart/src/project_generator/project_generator.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/dpgsql_migration_executor.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:access_to_dart/src/migration_statement_builder.dart';
import 'package:access_to_dart/src/postgres_connection_options.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';

AnalysisProject fixture(String table, {bool displayFormats = true}) =>
    AnalysisProject.fromJson({
      'schema_version': '1.0',
      'source': 'synthetic-temporal.accdb',
      'format': 'VERSION_16',
      'tables': [
        {
          'name': table,
          'rowCount': 0,
          'columns': [
            {
              'name': 'ID',
              'typeName': 'Long',
              'typeCode': 4,
              'isRequired': true
            },
            {
              'name': 'Horario',
              'typeName': 'DateTime',
              'typeCode': 8,
              if (displayFormats) ...{
                'format': 'Short Time',
                'inputMask': '00:00;0;_',
                'defaultValue': 'Time()'
              }
            },
            {
              'name': 'Dia',
              'typeName': 'DateTime',
              'typeCode': 8,
              if (displayFormats) ...{
                'format': 'Short Date',
                'inputMask': '99/99/0000;0;_',
                'defaultValue': 'Date()'
              }
            },
            {'name': 'Civil', 'typeName': 'DateTime', 'typeCode': 8},
          ],
          'indexes': [
            {
              'name': 'PrimaryKey',
              'isPrimaryKey': true,
              'columns': [
                {'name': 'ID'}
              ]
            }
          ],
          'sampleRows': []
        }
      ],
      'forms': [],
      'linkedTables': [],
    });

void main() {
  test(
      'Access DateTime keeps civil date time and microseconds through INSERT COPY and binary executor',
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
    final database = 'access_temporal_${DateTime.now().microsecondsSinceEpoch}';
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
    final rows = <Map<String, dynamic>>[
      {
        'ID': 1,
        'Horario': DateTime.utc(1899, 12, 30, 5, 6, 7, 123, 456),
        'Dia': DateTime.utc(2021, 8, 2, 13, 45, 12, 345, 678),
        'Civil': DateTime(2020, 2, 3, 4, 5, 6, 7, 8)
      },
      {
        'ID': 2,
        'Horario': DateTime.utc(2024, 3, 4, 8, 9, 10, 987, 654),
        'Dia': DateTime.utc(2022, 9, 3),
        'Civil': DateTime.utc(2020, 2, 3, 4, 5, 6, 7, 8)
      },
    ];
    try {
      await admin
          .createCommand('CREATE DATABASE "$database" TEMPLATE template0')
          .executeNonQuery();
      created = true;
      pg = DpgsqlConnection(cs(database));
      await pg.open();
      await pg
          .createCommand("SET TIME ZONE 'Pacific/Honolulu'")
          .executeNonQuery();
      for (final name in ['TemporalInsert', 'TemporalCopy']) {
        final table = fixture(name).tables.single;
        await pg
            .createCommand(builder.buildCreateTableStatement(table, rows: rows))
            .executeNonQuery();
        if (name == 'TemporalInsert') {
          for (final sql in builder.buildInsertStatements(table, rows)) {
            await pg.createCommand(sql).executeNonQuery();
          }
        } else {
          temp = await Directory.systemTemp.createTemp('access_temporal_copy_');
          final file = File('${temp.path}/seed.sql');
          final copyLines = builder
              .buildSeedStatementsInPreferredFormat(table, rows)
              .join('\n');
          await file.writeAsString('$copyLines\n');
          final psql = env['ACCESS_TO_DART_TEST_PSQL'] ??
              (Platform.isWindows
                  ? r'C:\Program Files\PostgreSQL\17\bin\psql.exe'
                  : 'psql');
          final copy = await Process.run(psql, [
            '--no-psqlrc',
            '-v',
            'ON_ERROR_STOP=1',
            '-h',
            host,
            '-p',
            port,
            '-U',
            user,
            '-d',
            database,
            '-f',
            file.path
          ], environment: {
            ...env,
            'PGPASSWORD': password
          });
          expect(copy.exitCode, 0, reason: '${copy.stdout}\n${copy.stderr}');
        }
      }
      final binary = fixture('TemporalBinary', displayFormats: false);
      final result = await DpgsqlMigrationExecutor(
              connectionOptions: PostgresConnectionOptions(
                  host: host,
                  port: int.parse(port),
                  database: database,
                  username: user,
                  password: password,
                  sslMode: SslMode.disable))
          .execute(
              project: binary,
              statementBuilder: builder,
              tableRowsByName: {'TemporalBinary': rows});
      expect(result.rowsInserted, 2);
      for (final name in [
        'temporal_insert',
        'temporal_copy',
        'temporal_binary'
      ]) {
        final reader = await pg.executeReader(
            'SELECT id,pg_typeof(horario)::text,pg_typeof(dia)::text,to_char(horario,\'YYYY-MM-DD HH24:MI:SS.US\'),to_char(dia,\'YYYY-MM-DD HH24:MI:SS.US\'),to_char(civil,\'YYYY-MM-DD HH24:MI:SS.US\') FROM "$name" ORDER BY id');
        try {
          for (var i = 0; i < 2; i++) {
            expect(await reader.read(), true);
            expect(reader.getValue(1), 'timestamp without time zone',
                reason: name);
            expect(reader.getValue(2), 'timestamp without time zone',
                reason: name);
            expect(
                reader.getValue(3),
                i == 0
                    ? '1899-12-30 05:06:07.123456'
                    : '2024-03-04 08:09:10.987654',
                reason: name);
            expect(
                reader.getValue(4),
                i == 0
                    ? '2021-08-02 13:45:12.345678'
                    : '2022-09-03 00:00:00.000000',
                reason: name);
            expect(reader.getValue(5), '2020-02-03 04:05:06.007008',
                reason: '$name preserves local civil components');
          }
          expect(await reader.read(), false);
        } finally {
          await reader.close();
        }
      }
      await pg
          .createCommand('INSERT INTO temporal_insert(id) VALUES(3)')
          .executeNonQuery();
      final defaults = await pg.executeReader(
          "SELECT horario::date=DATE '1899-12-30',dia::time=TIME '00:00:00' FROM temporal_insert WHERE id=3");
      try {
        expect(await defaults.read(), true);
        expect(defaults.getValue(0), true);
        expect(defaults.getValue(1), true);
      } finally {
        await defaults.close();
      }
      await ProjectGenerator().generate(
          project: fixture('TemporalInsert'),
          outputDirectory: '${temp!.path}/app');
      final backend = '${temp.path}/app/backend';
      Future<void> command(List<String> args) async {
        final result = await Process.run(Platform.resolvedExecutable, args,
                workingDirectory: backend)
            .timeout(const Duration(minutes: 2));
        expect(result.exitCode, 0,
            reason: '${result.stdout}\n${result.stderr}');
      }

      final page = await File(
              '${temp.path}/app/frontend/lib/src/modules/temporal_insert/pages/incluir_temporal_insert/incluir_temporal_insert_page.dart')
          .readAsString();
      final metadataStart = page.indexOf(
          '  static const Map<String, Map<String, Object?>> _fieldPresentation');
      final metadataEnd = page.indexOf(
          '  static const Map<String, String> _dynamicLookupFields',
          metadataStart);
      final helpersStart = page.indexOf('  String _presentFieldValue(');
      final helpersEnd = page.indexOf('  Future<void> salvar(', helpersStart);
      expect(
          [metadataStart, metadataEnd, helpersStart, helpersEnd]
              .every((i) => i >= 0),
          true);
      final uiProbe = File('${temp.path}/temporal_ui_probe.dart');
      await uiProbe.writeAsString('''class TemporalUiProbe {
${page.substring(metadataStart, metadataEnd)}
${page.substring(helpersStart, helpersEnd)}
}
${page.substring(page.indexOf('class _ConsumedChar'))}
void main() {
  final p = TemporalUiProbe();
  if (p._presentFieldValue('horario', '2024-10-11T12:13:14.987654Z') != '12:13:14') throw StateError('ISO timestamp must display as native time');
  if (p._presentFieldValue('dia', '2024-10-12T15:16:17.123456Z') != '2024-10-12') throw StateError('ISO timestamp must display as native date');
  if (p._presentFieldValue('horario', DateTime(1899,12,30,11,22)) != '11:22:00') throw StateError('Local time display shifted');
  final date = p._normalizeFieldValue('dia','2024-08-10') as DateTime;
  if (date.year != 2024 || date.month != 8 || date.day != 10 || date.hour != 0) throw StateError('Native date must bypass Access text mask');
  final time = p._normalizeFieldValue('horario','11:22') as DateTime;
  if (time.year != 1899 || time.month != 12 || time.day != 30 || time.hour != 11 || time.minute != 22) throw StateError('Explicit time edit must use Access anchor');
  print('TEMPORAL_EMITTED_UI_HELPERS_OK');
}
''');
      final uiResult =
          await Process.run(Platform.resolvedExecutable, ['run', uiProbe.path]);
      expect(uiResult.exitCode, 0,
          reason: '${uiResult.stdout}\n${uiResult.stderr}');
      expect(uiResult.stdout, contains('TEMPORAL_EMITTED_UI_HELPERS_OK'));
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
          String method, int? id,
          [Map<String, dynamic>? body]) async {
        final request = await client!.openUrl(
            method,
            Uri.parse(
                'http://127.0.0.1:$httpPort/api/v1/temporal_insert${id == null ? '' : '/$id'}'));
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

      final loaded = await api('GET', 1);
      expect(loaded.status, 200);
      expect(loaded.body['horario'], '1899-12-30T05:06:07.123456Z');
      expect(loaded.body['dia'], '2021-08-02T13:45:12.345678Z');
      final unchanged = await api('PUT', 1, loaded.body);
      expect(unchanged.status, 200, reason: '${unchanged.body}');
      expect(unchanged.body, loaded.body,
          reason: 'loaded DTO roundtrip does not discard hidden components');
      final changed = await api('PUT', 1, {
        'id': 1,
        'horario': '2024-10-11T12:13:14.987654Z',
        'dia': '2024-10-12T15:16:17.123456Z',
        'civil': '2024-10-13T18:19:20.654321Z'
      });
      expect(changed.status, 200, reason: '${changed.body}');
      expect(changed.body['horario'], '2024-10-11T12:13:14.987654Z');
      expect(changed.body['dia'], '2024-10-12T15:16:17.123456Z');
      expect((await api('GET', 1)).body, changed.body);
      final inserted = await api('POST', null, {
        'id': 4,
        'horario': '2025-01-02T03:04:05.678901Z',
        'dia': '2025-01-03T04:05:06.789012Z',
        'civil': '2025-01-04T05:06:07.890123Z'
      });
      expect(inserted.status, 200, reason: '${inserted.body}');
      expect(inserted.body['horario'], '2025-01-02T03:04:05.678901Z');
      expect(inserted.body['dia'], '2025-01-03T04:05:06.789012Z');
      final timeInput = await api('POST', null,
          {'id': 5, 'horario': '11:22', 'dia': '2024-08-10', 'civil': null});
      expect(timeInput.status, 200, reason: '${timeInput.body}');
      expect(timeInput.body['horario'], '1899-12-30T11:22:00.000Z');
      expect(timeInput.body['dia'], '2024-08-10T00:00:00.000Z');
      final beforeDefault = DateTime.now();
      final defaulted = await api('POST', null, {'id': 6});
      final afterDefault = DateTime.now();
      expect(defaulted.status, 200, reason: '${defaulted.body}');
      final defaultTime = DateTime.parse(defaulted.body['horario'] as String);
      final defaultDate = DateTime.parse(defaulted.body['dia'] as String);
      expect([defaultTime.year, defaultTime.month, defaultTime.day],
          [1899, 12, 30]);
      expect(defaultTime.hour, anyOf(beforeDefault.hour, afterDefault.hour),
          reason: 'model Time() default keeps the local clock hour');
      expect([defaultDate.hour, defaultDate.minute, defaultDate.second],
          [0, 0, 0]);
      print(
          'TEMPORAL_GENERATED_HTTP_OK GET,unchangedPUT,PUT,POST,legacyTimeInput,localDefaults');
      print(
          'TEMPORAL_CIVIL_PG_OK INSERT,COPY,binary,defaults localOffsetMinutes=${(rows.first['Civil'] as DateTime).timeZoneOffset.inMinutes}');
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
