import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:dpgsql/dpgsql.dart';
import 'audit_postgres_value_hashes.dart';
import 'audit_postgres_complex_values.dart';

// Full-data acceptance probe. Credentials are session environment only.
Future<void> main(List<String> args) async {
  if (args.length < 2 || args.length > 7) {
    throw ArgumentError(
        'analysis.json output-directory [dao-oracle.json] [backend.exe] [dao-value-oracle.json] [dao-complex-oracle.json] [dao-all-scalar-oracle.json]');
  }
  final analysis = jsonDecode(await File(args[0]).readAsString()) as Map;
  Map? oracle;
  Map? valueOracle;
  Map? complexOracle;
  Map? allScalarOracle;
  Map<String, Object?>? allScalarReport;
  Map<String, Object?>? complexReport;
  Map<String, Object?>? valueReport;
  String? sourceSha256;
  final daoCounts = <String, int>{};
  if (args.length >= 3) {
    oracle = jsonDecode(await File(args[2]).readAsString()) as Map;
    final source =
        (analysis['backend_analysis'] as Map?)?['source'] ?? analysis['source'];
    final digest = await _sha256(source as String);
    sourceSha256 = digest;
    if (digest != (oracle['source'] as Map)['sha256']) {
      throw StateError(
          'DAO oracle does not match the current Access source hash');
    }
    for (final row in (oracle['tables'] as List).cast<Map>()) {
      daoCounts[row['table'] as String] = row['daoCount'] as int;
    }
    final names =
        (analysis['tables'] as List).cast<Map>().map((t) => t['name']).toSet();
    if (names.length != daoCounts.length ||
        !names.every(daoCounts.containsKey)) {
      throw StateError('DAO oracle must cover exactly the migration table set');
    }
  }
  if (args.length >= 5) {
    valueOracle = jsonDecode(await File(args[4]).readAsString()) as Map;
    if (valueOracle['sourceSha256'] != sourceSha256 ||
        !['typed-column-pk-v1', 'typed-column-pk-v2']
            .contains(valueOracle['contract'])) {
      throw StateError(
          'Value oracle does not match the current source/contract');
    }
  }
  if (args.length >= 6) {
    complexOracle = jsonDecode(await File(args[5]).readAsString()) as Map;
    if (complexOracle['sourceSha256'] != sourceSha256) {
      throw StateError('Complex oracle does not match current source');
    }
  }
  if (args.length >= 7) {
    allScalarOracle = jsonDecode(await File(args[6]).readAsString()) as Map;
    if (allScalarOracle['sourceSha256'] != sourceSha256 ||
        allScalarOracle['contract'] != 'typed-column-pk-v2') {
      throw StateError('All-scalar oracle does not match source/v2 contract');
    }
  }
  final env = Platform.environment;
  final user = env['ACCESS_TO_DART_TEST_PG_USER'];
  final password = env['ACCESS_TO_DART_TEST_PG_PASSWORD'];
  if (user == null || password == null) {
    throw StateError('Test PG credentials required');
  }
  final host = env['ACCESS_TO_DART_TEST_PG_HOST'] ?? 'localhost';
  final port = env['ACCESS_TO_DART_TEST_PG_PORT'] ?? '5432';
  final name = 'access_siga_audit_${DateTime.now().microsecondsSinceEpoch}';
  String connection(String db) =>
      'Host=$host;Port=$port;Database=$db;Username=$user;Password=$password;SSL Mode=Disable';
  final admin = DpgsqlConnection(connection('postgres'));
  await admin.open();
  var created = false;
  final checks = <Map<String, Object?>>[];
  try {
    await admin
        .createCommand('CREATE DATABASE "$name" TEMPLATE template0')
        .executeNonQuery();
    created = true;
    final code = await run([
      'migrate',
      '--analysis',
      args[0],
      '--output',
      args[1],
      '--backend-password',
      env['ACCESS_TO_DART_TEST_ACCESS_PASSWORD'] ?? '',
      '--not-null-mode',
      'strict',
      '--unique-mode',
      'strict',
      '--auto-number-mode',
      'sequence',
      '--pg',
      Uri(
          scheme: 'postgresql',
          userInfo:
              '${Uri.encodeComponent(user)}:${Uri.encodeComponent(password)}',
          host: host,
          port: int.parse(port),
          path: name,
          queryParameters: {'sslmode': 'disable'}).toString(),
    ], out: stdout, err: stderr);
    if (code != 0) {
      throw StateError('Complete migration failed with exit $code');
    }
    final pg = DpgsqlConnection(connection(name));
    await pg.open();
    try {
      const policy =
          MigrationIdentifierPolicy(style: MigrationIdentifierStyle.snakeAscii);
      for (final table in (analysis['tables'] as List).cast<Map>()) {
        final tableName = table['name'] as String;
        final reader = await pg.executeReader(
            'SELECT count(*) FROM ${policy.quotedTableName(tableName)}');
        int actual;
        try {
          await reader.read();
          actual = int.parse(reader.getValue(0).toString());
        } finally {
          await reader.close();
        }
        checks.add({
          'table': tableName,
          'expectedCatalogRows': table['rowCount'],
          'actualPostgresRows': actual,
          'expectedDaoRows': daoCounts[tableName],
          'catalogMatches': actual == table['rowCount'],
          'match': actual == (daoCounts[tableName] ?? table['rowCount'])
        });
      }
      if (valueOracle != null) {
        valueReport = await auditPostgresValueHashes(
            connection: pg,
            analysis: analysis,
            oracle: valueOracle,
            identifiers: policy,
            sourceSha256: sourceSha256!);
      }
      if (allScalarOracle != null) {
        allScalarReport = await auditPostgresValueHashes(
            connection: pg,
            analysis: analysis,
            oracle: allScalarOracle,
            identifiers: policy,
            sourceSha256: sourceSha256!);
      }
      if (complexOracle != null) {
        complexReport = await auditPostgresComplexValues(
          connection: pg,
          analysis: analysis,
          oracle: complexOracle,
          identifiers: policy,
          sourceSha256: sourceSha256!,
        );
      }
    } finally {
      await pg.close();
    }
    final report = {
      'scope':
          oracle == null ? 'catalog_row_counts_only' : 'dao_row_counts_only',
      if (oracle != null) 'source': oracle['source'],
      'tables': checks,
      'allCountsMatch':
          checks.isNotEmpty && checks.every((t) => t['match'] == true)
    };
    await File('${args[1]}/row-count-audit.json')
        .writeAsString(const JsonEncoder.withIndent('  ').convert(report));
    stdout.writeln(
        'Checked ${checks.length} table counts; mismatches: ${checks.where((t) => t['match'] != true).length}');
    if (valueReport != null) {
      await File('${args[1]}/postgres-value-audit.json').writeAsString(
          const JsonEncoder.withIndent('  ').convert(valueReport));
      stdout.writeln(
          'PostgreSQL values match DAO: ${valueReport['allValuesMatch']}');
    }
    if (allScalarReport != null) {
      await File('${args[1]}/postgres-all-scalar-audit.json').writeAsString(
          const JsonEncoder.withIndent('  ').convert(allScalarReport));
      stdout.writeln(
          'PostgreSQL all scalar values match DAO: ${allScalarReport['allValuesMatch']}');
      if (allScalarReport['allValuesMatch'] != true) {
        throw StateError('All-scalar v2 value hash audit mismatch');
      }
    }
    if (complexReport != null) {
      await File('${args[1]}/postgres-complex-audit.json').writeAsString(
          const JsonEncoder.withIndent('  ').convert(complexReport));
      stdout.writeln(
          'PostgreSQL complex values match DAO: ${complexReport['allValuesMatch']}');
      if (complexReport['allValuesMatch'] != true) {
        throw StateError('Complex value hash audit mismatch');
      }
    }
    if (report['allCountsMatch'] != true) {
      throw StateError('Row count audit mismatch');
    }
    if (valueReport != null && valueReport['allValuesMatch'] != true) {
      throw StateError(
          'PostgreSQL value hash audit mismatch; see private report');
    }
    if (args.length >= 4) {
      await _smokeBackend(args[3], name, host, port, user, password,
          daoCounts['TbPessoa'] ?? -1, args[1]);
    }
    final handoffPath = env['ACCESS_TO_DART_TEST_PG_HANDOFF_FILE'];
    if (handoffPath != null && valueReport?['allValuesMatch'] == true) {
      final handoff = File(handoffPath);
      final release = File('$handoffPath.release');
      if (await release.exists()) await release.delete();
      await handoff.parent.create(recursive: true);
      final deadline = DateTime.now().toUtc().add(const Duration(minutes: 15));
      await handoff.writeAsString(jsonEncode({
        'database': name,
        'host': host,
        'port': port,
        'expiresUtc': deadline.toIso8601String(),
        'readOnlyBrowser': true,
        'releaseFile': release.absolute.path,
      }));
      stdout.writeln('Validated database ready for read-only browser handoff');
      try {
        while (!await release.exists() &&
            DateTime.now().toUtc().isBefore(deadline)) {
          await Future<void>.delayed(const Duration(seconds: 1));
        }
      } finally {
        if (await handoff.exists()) await handoff.delete();
        if (await release.exists()) await release.delete();
      }
    }
  } finally {
    try {
      if (created) {
        await admin
            .createCommand('DROP DATABASE "$name" WITH (FORCE)')
            .executeNonQuery();
      }
    } finally {
      await admin.close();
    }
  }
}

Future<String> _sha256(String path) async {
  final result = Platform.isWindows
      ? await Process.run(
          'certutil', ['-hashfile', File(path).absolute.path, 'SHA256'])
      : await Process.run('shasum', ['-a', '256', path]);
  final match = RegExp(r'[0-9a-fA-F]{64}').firstMatch(result.stdout.toString());
  if (result.exitCode != 0 || match == null) {
    throw StateError('Cannot hash Access source');
  }
  return match.group(0)!.toLowerCase();
}

Future<void> _smokeBackend(
    String executable,
    String database,
    String host,
    String port,
    String user,
    String password,
    int expectedRows,
    String output) async {
  if (expectedRows < 0) {
    throw StateError('TbPessoa DAO count required for HTTP smoke');
  }
  final socket = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
  final httpPort = socket.port;
  await socket.close();
  final server = await Process.start(File(executable).absolute.path,
      ['--address', '127.0.0.1', '--port', '$httpPort'],
      workingDirectory: File(executable).absolute.parent.path,
      environment: {
        'ACCESS_TO_DART_DB_HOST': host,
        'ACCESS_TO_DART_DB_PORT': port,
        'ACCESS_TO_DART_DB_NAME': database,
        'ACCESS_TO_DART_DB_USER': user,
        'ACCESS_TO_DART_DB_PASSWORD': password,
      });
  unawaited(server.stdout.drain<void>());
  unawaited(server.stderr.drain<void>());
  final client = HttpClient()..connectionTimeout = const Duration(seconds: 3);
  try {
    final deadline = DateTime.now().add(const Duration(seconds: 40));
    while (true) {
      try {
        final request = await client
            .getUrl(Uri.parse('http://127.0.0.1:$httpPort/api/v1/tb_pessoa'));
        final response =
            await request.close().timeout(const Duration(seconds: 30));
        final body = await response
            .transform(utf8.decoder)
            .join()
            .timeout(const Duration(seconds: 30));
        if (response.statusCode != 200) {
          throw StateError('Backend HTTP status ${response.statusCode}');
        }
        final rows = jsonDecode(body) as List;
        if (rows.length != expectedRows) {
          throw StateError('Backend row count differs from DAO');
        }
        await File('$output/backend-http-audit.json').writeAsString(jsonEncode({
          'scope': 'generated_backend_read_only_person_list',
          'status': response.statusCode,
          'rowCount': rows.length,
          'expectedDaoRows': expectedRows,
          'writes': 0,
        }));
        stdout.writeln(
            'Generated backend HTTP verified: ${rows.length} person rows; no writes.');
        break;
      } on SocketException {
        if (DateTime.now().isAfter(deadline)) rethrow;
        await Future<void>.delayed(const Duration(milliseconds: 250));
      }
    }
  } finally {
    client.close(force: true);
    server.kill();
    await server.exitCode.timeout(const Duration(seconds: 10));
  }
}
