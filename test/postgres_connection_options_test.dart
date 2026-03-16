import 'package:access_to_dart/src/postgres_connection_options.dart';
import 'package:test/test.dart';

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
}