import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';
import '../support/generation_test_utils.dart';

void main() {
  test('CLI migration preserves four decimal places for Access Money',
      () async {
    final env = Platform.environment;
    final user = env['ACCESS_TO_DART_TEST_PG_USER'];
    final password = env['ACCESS_TO_DART_TEST_PG_PASSWORD'];
    if (user == null || password == null) {
      throw StateError('Session PG credentials required');
    }
    final host = env['ACCESS_TO_DART_TEST_PG_HOST'] ?? 'localhost';
    final port = env['ACCESS_TO_DART_TEST_PG_PORT'] ?? '5432';
    String conn(String db) =>
        'Host=$host;Port=$port;Database=$db;Username=$user;Password=$password;SSL Mode=Disable';
    final name = 'access_money_audit_${DateTime.now().microsecondsSinceEpoch}';
    final admin = DpgsqlConnection(conn('postgres'));
    await admin.open();
    var created = false;
    final temp = await Directory.systemTemp.createTemp('money_scale_pg_');
    try {
      await admin
          .createCommand('CREATE DATABASE "$name" TEMPLATE template0')
          .executeNonQuery();
      created = true;
      final analysis = await writeMoneyAnalysisFixture(temp);
      final data =
          jsonDecode(await analysis.readAsString()) as Map<String, dynamic>;
      final table = (data['tables'] as List).first as Map<String, dynamic>;
      (table['columns'] as List).first['typeName'] = 'Money';
      table['rowCount'] = 2;
      table['sampleRows'] = [
        {'ValorMoeda': 123.4567, 'Taxa': 1.234567},
        {'ValorMoeda': 0.0001, 'Taxa': 2.345678}
      ];
      await analysis.writeAsString(jsonEncode(data));
      final url = Uri(
          scheme: 'postgresql',
          userInfo:
              '${Uri.encodeComponent(user)}:${Uri.encodeComponent(password)}',
          host: host,
          port: int.parse(port),
          path: name,
          queryParameters: {'sslmode': 'disable'});
      final code = await run([
        'migrate',
        '--analysis',
        analysis.path,
        '--output',
        '${temp.path}/migration',
        '--not-null-mode',
        'strict',
        '--pg',
        url.toString()
      ], out: StringBuffer(), err: StringBuffer());
      expect(code, 0, reason: 'Synthetic Money migration must succeed');
      final pg = DpgsqlConnection(conn(name));
      await pg.open();
      try {
        final rows = await pg.executeReader(
            'SELECT l.valor_moeda::text FROM lancamentos l ORDER BY l.valor_moeda');
        final actual = <String>[];
        try {
          while (await rows.read()) {
            actual.add(rows.getValue(0).toString());
          }
        } finally {
          await rows.close();
        }
        expect(actual, ['0.0001', '123.4567']);
        final scale = await pg.executeScalar(
            "SELECT numeric_scale FROM information_schema.columns WHERE table_name='lancamentos' AND column_name='valor_moeda'");
        expect(scale, 4);
      } finally {
        await pg.close();
      }
    } finally {
      if (created) {
        await admin
            .createCommand('DROP DATABASE "$name" WITH (FORCE)')
            .executeNonQuery();
      }
      await admin.close();
      await temp.delete(recursive: true);
    }
  });
}
