import 'dart:io';

import 'package:access_to_dart/src/postgres_connection_options.dart';
import 'package:dpgsql/dpgsql.dart';

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    stderr.writeln(
      'Usage: dart run tools/test_dpgsql_copy_support.dart "<postgres-url>"',
    );
    exitCode = 64;
    return;
  }

  final options = PostgresConnectionOptions.parse(arguments.first);
  final connection = NpgsqlConnection(options.toDpgsqlConnectionString());

  try {
    stdout.writeln('Opening connection...');
    await connection.open();
    stdout.writeln('OPEN_OK');

    await connection
        .createCommand('DROP TABLE IF EXISTS codex_dpgsql_copy_probe')
        .executeNonQuery();
    await connection
        .createCommand(
          'CREATE TABLE codex_dpgsql_copy_probe (id INTEGER, nome TEXT)',
        )
        .executeNonQuery();
    stdout.writeln('TABLE_OK');

    final importer = await connection.beginBinaryImport(
      'COPY codex_dpgsql_copy_probe (id, nome) FROM STDIN (FORMAT BINARY)',
    );
    await importer.startRow(2);
    await importer.write(1);
    await importer.write('copy_ok');
    await importer.startRow(2);
    await importer.write(2);
    await importer.writeNull();
    await importer.complete();
    stdout.writeln('COPY_OK');

    final reader = await connection
        .createCommand(
          'SELECT id, nome FROM codex_dpgsql_copy_probe ORDER BY id',
        )
        .executeReader();
    while (await reader.read()) {
      stdout.writeln('ROW id=${reader['id']} nome=${reader['nome']}');
    }
    await reader.close();

    await connection
        .createCommand('DROP TABLE codex_dpgsql_copy_probe')
        .executeNonQuery();
  } finally {
    await connection.close();
  }
}
