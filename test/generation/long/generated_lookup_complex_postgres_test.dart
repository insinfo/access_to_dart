import 'dart:io';
import 'dart:math';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  for (final variant in ['join', 'filter']) {
    for (final style in ['snake_ascii', 'original']) {
      test(
          'lookup gerado consulta tabela de origem em PostgreSQL $style $variant',
          () async {
        final harness = _LocalPostgresHarness.fromEnvironment();
        // Não transforme indisponibilidade do banco em um falso teste aprovado.
        final admin = await harness.openDatabase(harness.adminDatabase);
        await admin.close();
        final database = await harness.createTempDatabase();
        addTearDown(() => harness.dropTempDatabase(database));
        final temp =
            await Directory.systemTemp.createTemp('access_lookup_complex_pg_');
        addTearDown(() => temp.delete(recursive: true));
        final analysis = await writeDropdownAnalysisFixture(temp);
        final rowSource = variant == 'join'
            ? 'SELECT Pessoas.ID, Pessoas.Nome FROM Pessoas INNER JOIN Filtros ON Pessoas.ID = Filtros.ID ORDER BY Pessoas.ID'
            : "SELECT Pessoas.ID, Pessoas.Nome FROM Pessoas WHERE (((Pessoas.Nome)='Pessoa de Referencia')) ORDER BY Pessoas.ID";
        await analysis.writeAsString((await analysis.readAsString()).replaceAll(
            'SELECT [Pessoas].[ID], [Pessoas].[Nome] FROM Pessoas ORDER BY [Nome];',
            rowSource));
        final output = '${temp.path}/generated';
        final errors = StringBuffer();
        expect(
            await run([
              'generate',
              '--analysis',
              analysis.path,
              '--output',
              output,
              '--identifier-style',
              style,
            ], out: StringBuffer(), err: errors),
            0,
            reason: errors.toString());
        final backend = '$output/backend';
        final key = style == 'original' ? 'ID' : 'id';
        final name = style == 'original' ? 'Nome' : 'nome';
        final ownerTable = style == 'original' ? 'Filtros' : 'filtros';
        final sourceTable = style == 'original' ? 'Pessoas' : 'pessoas';
        final field =
            style == 'original' ? 'PessoaSelecionada' : 'pessoa_selecionada';
        final setup = await harness.openDatabase(database);
        try {
          await setup
              .createCommand('CREATE TABLE "$ownerTable" ('
                  '"$key" BIGINT PRIMARY KEY, "$name" TEXT)')
              .executeNonQuery();
          await setup
              .createCommand('CREATE TABLE "$sourceTable" ('
                  '"$key" BIGINT PRIMARY KEY, "$name" TEXT)')
              .executeNonQuery();
          await setup
              .createCommand(
                  "INSERT INTO \"$ownerTable\" VALUES (2, 'Origem errada')")
              .executeNonQuery();
          await setup
              .createCommand(
                  "INSERT INTO \"$sourceTable\" VALUES (10, 'pessoa de referencia'), (2, 'Pessoa de Referencia'), (11, 'Pessoa de Referência'), (12, NULL)")
              .executeNonQuery();
        } finally {
          await setup.close();
        }
        final pub = await Process.run(
                Platform.resolvedExecutable, ['pub', 'get'],
                workingDirectory: backend)
            .timeout(const Duration(minutes: 2));
        expect(pub.exitCode, 0, reason: '${pub.stdout}\n${pub.stderr}');
        final probe = File('$backend/bin/lookup_postgres.dart');
        await probe.writeAsString('''
import '../lib/src/db/database_service.dart';
import '../lib/src/modules/filtros/repositories/filtros_repository.dart';
import '../lib/src/modules/filtros/services/filtros_service.dart';

Future<void> main() async {
  final db = await DatabaseService().connect();
  try {
    final service = FiltrosService(FiltrosRepository(db));
    final options = await service.lookupOptions('$field');
    if (options.length != ${variant == 'join' ? 1 : 2} || options[0]['value'] != 2 ||
        options[0]['label'] != 'Pessoa de Referencia') {
      throw StateError('Lookup JOIN/WHERE perdeu semântica');
    }
    if ('$variant' == 'filter' && (options[1]['value'] != 10 || options[1]['label'] != 'pessoa de referencia')) {
      throw StateError('Igualdade Access deve ignorar caixa e preservar acento/null');
    }
    final limited = await service.lookupOptions('$field', limit: 1);
    if (limited.length != 1 || limited.single['value'] != 2) {
      throw StateError('Limite ou ordenação não foi preservado');
    }
    var refused = false;
    try {
      await service.lookupOptions('campo_inexistente');
    } on StateError {
      refused = true;
    }
    if (!refused) throw StateError('Campo não mapeado foi aceito');
    print('POSTGRES_LOOKUP_SOURCE_OK');
  } finally {
    await db.disconnect();
  }
}
''');
        final result =
            await Process.run(Platform.resolvedExecutable, ['run', probe.path],
                workingDirectory: backend,
                environment: {
                  ...Platform.environment,
                  'ACCESS_TO_DART_DB_HOST': harness.host,
                  'ACCESS_TO_DART_DB_PORT': '${harness.port}',
                  'ACCESS_TO_DART_DB_NAME': database,
                  'ACCESS_TO_DART_DB_USER': harness.user,
                  'ACCESS_TO_DART_DB_PASSWORD': harness.password,
                }).timeout(const Duration(minutes: 2));
        expect(result.exitCode, 0,
            reason: '${result.stdout}\n${result.stderr}');
        expect(result.stdout, contains('POSTGRES_LOOKUP_SOURCE_OK'));
      }, timeout: const Timeout(Duration(minutes: 5)));
    }
  }
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
        'access_lookup_complex_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1 << 20).toRadixString(36)}';
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
