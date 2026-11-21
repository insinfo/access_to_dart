import 'dart:io';
import 'dart:math';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';

import '../support/backend_autonumber_fixture.dart';

void main() {
  for (final style in ['snake_ascii', 'original']) {
    test('CRUD gerado com autonumeracao em PostgreSQL $style', () async {
      final harness = _LocalPostgresHarness.fromEnvironment();
      // Não transforme indisponibilidade do banco em um falso teste aprovado.
      final admin = await harness.openDatabase(harness.adminDatabase);
      await admin.close();
      final database = await harness.createTempDatabase();
      addTearDown(() => harness.dropTempDatabase(database));
      final temp = await Directory.systemTemp.createTemp('access_pk_pg_');
      addTearDown(() => temp.delete(recursive: true));
      final analysis = await writeAutonumberAnalysis(temp);
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
      final key = style == 'original' ? 'CodigoCadastro' : 'codigo_cadastro';
      final name = style == 'original' ? 'Nome' : 'nome';
      final table = style == 'original' ? 'Cadastro' : 'cadastro';
      final setup = await harness.openDatabase(database);
      try {
        await setup
            .createCommand('CREATE TABLE "$table" ('
                '"$key" BIGSERIAL PRIMARY KEY, "$name" TEXT)')
            .executeNonQuery();
      } finally {
        await setup.close();
      }
      final pub = await Process.run(Platform.resolvedExecutable, ['pub', 'get'],
              workingDirectory: backend)
          .timeout(const Duration(minutes: 2));
      expect(pub.exitCode, 0, reason: '${pub.stdout}\n${pub.stderr}');
      final probe = File('$backend/bin/autonumber_postgres.dart');
      await probe.writeAsString('''
import 'package:cadastro_app_generated_core/core.dart';
import '../lib/src/db/database_service.dart';
import '../lib/src/modules/cadastro/repositories/cadastro_repository.dart';

Future<void> main() async {
  final db = await DatabaseService().connect();
  try {
    final repository = CadastroRepository(db);
    final id = await repository.insert(const Cadastro(nome: 'Ana'));
    if (id != 1) throw StateError('A sequência não gerou a primeira chave');
    final inserted = await repository.findById(id!);
    if (inserted?['$name'] != 'Ana' || inserted?['$key'] != id) {
      throw StateError('Leitura após inserção incorreta');
    }
    await repository.update(id, Cadastro(codigoCadastro: id, nome: 'Ana revisada'));
    if ((await repository.findById(id))?['$name'] != 'Ana revisada') {
      throw StateError('Atualização não persistiu');
    }
    final second = await repository.insert(const Cadastro(nome: 'Bruno'));
    if (second != 2) throw StateError('A sequência não avançou');
    final explicit = await repository.insert(
        const Cadastro(codigoCadastro: 99, nome: 'Chave explícita'));
    if (explicit != 99 || (await repository.all()).length != 3) {
      throw StateError('Chave explícita ou listagem incorreta');
    }
    await repository.delete(id);
    await repository.delete(second!);
    await repository.delete(explicit!);
    if (await repository.findById(id) != null || (await repository.all()).isNotEmpty) {
      throw StateError('Exclusão não persistiu');
    }
    print('POSTGRES_AUTONUMBER_CRUD_OK');
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
      expect(result.exitCode, 0, reason: '${result.stdout}\n${result.stderr}');
      expect(result.stdout, contains('POSTGRES_AUTONUMBER_CRUD_OK'));
    }, timeout: const Timeout(Duration(minutes: 5)));
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
      password:
          Platform.environment['ACCESS_TO_DART_TEST_PG_PASSWORD'] ?? '',
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
        'access_autonumber_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1 << 20).toRadixString(36)}';
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
