import 'package:access_to_dart/src/postgres_connection_options.dart';
import 'package:test/test.dart';
import 'package:dpgsql/dpgsql.dart';

void main() {
  test('parses PostgreSQL URI connection strings', () {
    final options = PostgresConnectionOptions.parse(
      'postgresql://postgres:secret@localhost:5432/access_siga?sslmode=disable',
    );

    expect(options.host, 'localhost');
    expect(options.port, 5432);
    expect(options.database, 'access_siga');
    expect(options.username, 'postgres');
    expect(options.password, 'secret');
  });

  test('parses key=value PostgreSQL connection strings', () {
    final options = PostgresConnectionOptions.parse(
      'host=localhost port=5432 dbname=access_siga user=postgres password=secret sslmode=disable',
    );

    expect(options.host, 'localhost');
    expect(options.port, 5432);
    expect(options.database, 'access_siga');
    expect(options.username, 'postgres');
    expect(options.password, 'secret');
  });

  test('builds admin connection options preserving endpoint data', () {
    final options = PostgresConnectionOptions.parse(
      'postgresql://postgres:secret@localhost:5432/access_siga?sslmode=disable',
    );

    final admin = options.forAdminDatabase();

    expect(admin.host, 'localhost');
    expect(admin.port, 5432);
    expect(admin.database, 'postgres');
    expect(admin.username, 'postgres');
    expect(admin.password, 'secret');
  });

  for (final alias in ['verify-ca', 'verify_ca', 'verifyca']) {
    test('preserva SSL $alias em URI e chave valor', () {
      for (final input in [
        'postgresql://test@localhost/db?sslmode=$alias',
        'host=localhost dbname=db user=test sslmode=$alias',
      ]) {
        final options = PostgresConnectionOptions.parse(input);
        expect(options.sslMode, SslMode.verifyCa);
        expect(
            options.toDpgsqlConnectionString(), contains('SSL Mode=VerifyCA'));
        expect(options.forAdminDatabase().sslMode, SslMode.verifyCa);
      }
    });
  }

  test('recusa modo SSL desconhecido sem retornar ao padrao', () {
    for (final input in [
      'postgresql://test@localhost/db?sslmode=verfy-full',
      'host=localhost dbname=db user=test sslmode=verfy-full',
    ]) {
      expect(
          () => PostgresConnectionOptions.parse(input), throwsFormatException);
    }
  });

  test('preserva SSL nao especificado e modos permissivos explicitos', () {
    for (final mode in [SslMode.disable, SslMode.allow, SslMode.prefer]) {
      final options = PostgresConnectionOptions.parse(
          'postgresql://test@localhost/db?sslmode=${mode.name}');
      expect(options.sslMode, mode);
    }
    expect(
        PostgresConnectionOptions.parse('postgresql://test@localhost/db')
            .sslMode,
        isNull);
  });
}
