import 'package:dpgsql/dpgsql.dart';

import 'postgres_connection_options.dart';

Future<void> ensurePostgresDatabaseExists(
  PostgresConnectionOptions targetOptions,
) async {
  if (targetOptions.database.trim().isEmpty ||
      targetOptions.database.trim().toLowerCase() == 'postgres') {
    return;
  }

  final adminOptions = targetOptions.forAdminDatabase();
  DpgsqlConnection? adminConnection;
  try {
    adminConnection = await _openAdminConnection(adminOptions);

    final existingReader = await adminConnection.executeReader(
      "SELECT 1 FROM pg_database WHERE datname = '${_escapeLiteral(targetOptions.database)}'",
    );
    final exists = await existingReader.read();
    await existingReader.close();
    if (exists) {
      return;
    }

    await adminConnection
        .createCommand(
          'CREATE DATABASE ${_quotedIdentifier(targetOptions.database)} TEMPLATE template0',
        )
        .executeNonQuery();
  } on DpgsqlException catch (error) {
    final duplicateDatabase =
        (error is PostgresException && error.sqlState == '42P04') ||
            error.message.toLowerCase().contains('already exists');
    if (!duplicateDatabase) {
      rethrow;
    }
  } finally {
    await adminConnection?.close();
  }
}

Future<DpgsqlConnection> _openAdminConnection(
  PostgresConnectionOptions options,
) async {
  final connection = DpgsqlConnection(options.toDpgsqlConnectionString());
  try {
    // O driver aplica a política SSL solicitada, inclusive os modos permissivos.
    // Não reconecte com Disable após uma falha de Require/VerifyCA/VerifyFull.
    await connection.open();
    return connection;
  } catch (_) {
    try {
      await connection.close();
    } catch (_) {}
    rethrow;
  }
}

String _quotedIdentifier(String value) {
  return '"${value.replaceAll('"', '""')}"';
}

String _escapeLiteral(String value) {
  return value.replaceAll("'", "''");
}
