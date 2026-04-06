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
  NpgsqlConnection? adminConnection;
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
  } on NpgsqlException catch (error) {
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

Future<NpgsqlConnection> _openAdminConnection(
  PostgresConnectionOptions options,
) async {
  final primary = NpgsqlConnection(options.toDpgsqlConnectionString());
  try {
    await primary.open();
    return primary;
  } on NpgsqlException catch (error) {
    final message = error.message.toLowerCase();
    final requiresDisabledSsl = message.contains('server does not support ssl');
    if (!requiresDisabledSsl || options.sslMode == SslMode.disable) {
      try {
        await primary.close();
      } catch (_) {}
      rethrow;
    }
    try {
      await primary.close();
    } catch (_) {}
    final retry = NpgsqlConnection(
      options.copyWith(sslMode: SslMode.disable).toDpgsqlConnectionString(),
    );
    await retry.open();
    return retry;
  }
}

String _quotedIdentifier(String value) {
  return '"${value.replaceAll('"', '""')}"';
}

String _escapeLiteral(String value) {
  return value.replaceAll("'", "''");
}