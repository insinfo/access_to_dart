import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:access_to_dart/src/postgres_connection_options.dart';
import 'package:access_to_dart/src/postgres_database_ensurer.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';

void main() {
  for (final mode in [SslMode.require, SslMode.verifyCa, SslMode.verifyFull]) {
    test('criacao de banco nao rebaixa SSL ${mode.name}', () async {
      final server = await _NoTlsServer.start();
      addTearDown(server.close);
      await expectLater(ensurePostgresDatabaseExists(_options(server, mode)),
          throwsA(isA<DpgsqlException>()));
      expect(server.connections, 1,
          reason: 'Não deve reconectar sem TLS após o servidor recusar SSL.');
      expect(server.startups, 0,
          reason:
              'Não deve enviar o startup em texto quando TLS é obrigatório.');
    });
  }

  for (final mode in [SslMode.disable, SslMode.allow, SslMode.prefer]) {
    test('criacao de banco preserva SSL permissivo ${mode.name}', () async {
      final server = await _NoTlsServer.start();
      addTearDown(server.close);
      // O servidor de teste fecha após o startup: queremos conferir apenas
      // a negociação, sem autenticação, credenciais reais ou criação de base.
      await expectLater(ensurePostgresDatabaseExists(_options(server, mode)),
          throwsA(anything));
      expect(server.startups, 1);
    });
  }
}

PostgresConnectionOptions _options(_NoTlsServer server, SslMode mode) =>
    PostgresConnectionOptions(
      host: '127.0.0.1',
      port: server.server.port,
      database: 'synthetic_conversion',
      username: 'synthetic',
      password: null,
      sslMode: mode,
    );

class _NoTlsServer {
  final ServerSocket server;
  final sockets = <Socket>[];
  int connections = 0;
  int startups = 0;

  _NoTlsServer(this.server);

  static Future<_NoTlsServer> start() async {
    final instance = _NoTlsServer(await ServerSocket.bind('127.0.0.1', 0));
    instance.server.listen(instance.accept);
    return instance;
  }

  void accept(Socket socket) {
    sockets.add(socket);
    connections++;
    final buffer = <int>[];
    socket.listen((chunk) {
      buffer.addAll(chunk);
      while (buffer.length >= 4) {
        final length = ByteData.sublistView(Uint8List.fromList(buffer))
            .getInt32(0, Endian.big);
        if (buffer.length < length) return;
        final packet = buffer.sublist(0, length);
        buffer.removeRange(0, length);
        final code = ByteData.sublistView(Uint8List.fromList(packet))
            .getInt32(4, Endian.big);
        if (code == 80877103) {
          socket.add([78]); // SSLRequest -> N (TLS indisponível).
        } else {
          startups++;
          socket.destroy();
          return;
        }
      }
    }, onError: (Object _) {});
  }

  Future<void> close() async {
    for (final socket in sockets) {
      socket.destroy();
    }
    await server.close();
  }
}
