import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:test/test.dart';
import '../../../tools/audit_postgres_complex_values.dart';

void main() {
  for (final style in MigrationIdentifierStyle.values) {
    test(
        'complex hashes detect wrong parent, orphan and duplicate loss ${style.name}',
        () async {
      final env = Platform.environment;
      final user = env['ACCESS_TO_DART_TEST_PG_USER'];
      final password = env['ACCESS_TO_DART_TEST_PG_PASSWORD'];
      if (user == null || password == null) {
        throw StateError('PG session credentials required');
      }
      String conn(String db) =>
          'Host=${env['ACCESS_TO_DART_TEST_PG_HOST'] ?? 'localhost'};Port=${env['ACCESS_TO_DART_TEST_PG_PORT'] ?? '5432'};Database=$db;Username=$user;Password=$password;SSL Mode=Disable';
      final name =
          'access_complex_audit_${DateTime.now().microsecondsSinceEpoch}';
      final admin = DpgsqlConnection(conn('postgres'));
      await admin.open();
      DpgsqlConnection? pg;
      var created = false;
      try {
        await admin
            .createCommand('CREATE DATABASE "$name" TEMPLATE template0')
            .executeNonQuery();
        created = true;
        pg = DpgsqlConnection(conn(name));
        await pg.open();
        final policy = MigrationIdentifierPolicy(style: style);
        final q = policy.quotedColumnName;
        final parent = policy.quotedTableName('Parent Rows');
        final child = policy.quotedTableName('Child Values');
        await pg
            .createCommand(
                'CREATE TABLE $parent (${q('ID')} integer PRIMARY KEY,${q('Choices')} integer)')
            .executeNonQuery();
        await pg
            .createCommand(
                'CREATE TABLE $child (${q('Owner')} integer,${q('Value')} text)')
            .executeNonQuery();
        await pg
            .createCommand('INSERT INTO $parent VALUES (2,70),(10,90)')
            .executeNonQuery();
        await pg
            .createCommand(
                "INSERT INTO $child VALUES (70,' é '),(70,' é '),(90,NULL)")
            .executeNonQuery();
        final records = <String>[];
        for (final item in [(2, 'S é '), (2, 'S é '), (10, 'N')]) {
          final key = 'I${item.$1}';
          records.add('${key.length}:$key${item.$2.length}:${item.$2}');
        }
        records.sort();
        final oracle = {
          'sourceSha256': 'synthetic',
          'columns': [
            {
              'table': 'Parent Rows',
              'column': 'Choices',
              'primaryKey': 'ID',
              'childRows': 3,
              'valueContract': 'sorted-parent-pk-text-v1',
              'valueSha256':
                  sha256.convert(utf8.encode(records.join())).toString(),
            }
          ]
        };
        final analysis = {
          'tables': [
            {
              'name': 'Parent Rows',
              'indexes': [
                {
                  'isPrimaryKey': true,
                  'columns': [
                    {'name': 'ID'}
                  ]
                }
              ]
            },
            {
              'name': 'Child Values',
              'syntheticKind': 'multivalue',
              'complexParentTable': 'Parent Rows',
              'complexParentColumn': 'Choices',
              'complexLinkColumn': 'Owner',
              'complexValueColumn': 'Value'
            },
          ]
        };
        Future<Map<String, Object?>> audit() => auditPostgresComplexValues(
            connection: pg!,
            analysis: analysis,
            oracle: oracle,
            identifiers: policy,
            sourceSha256: 'synthetic');
        expect((await audit())['allValuesMatch'], isTrue);
        await pg
            .createCommand(
                'UPDATE $child SET ${q('Owner')}=90 WHERE ${q('Owner')}=70')
            .executeNonQuery();
        expect((await audit())['allValuesMatch'], isFalse);
        await pg
            .createCommand(
                'UPDATE $child SET ${q('Owner')}=70 WHERE ${q('Value')} IS NOT NULL')
            .executeNonQuery();
        await pg
            .createCommand(
                'DELETE FROM $child WHERE ctid IN (SELECT ctid FROM $child WHERE ${q('Owner')}=70 LIMIT 1)')
            .executeNonQuery();
        expect((await audit())['allValuesMatch'], isFalse);
        await pg
            .createCommand(
                "INSERT INTO $child VALUES (70,' é '),(999,'orphan')")
            .executeNonQuery();
        final orphan = await audit();
        expect(orphan['allValuesMatch'], isFalse);
        expect(
            ((orphan['collections'] as List).single as Map)['orphanRows'], 1);
      } finally {
        if (pg != null) await pg.close();
        if (created) {
          await admin
              .createCommand('DROP DATABASE "$name" WITH (FORCE)')
              .executeNonQuery();
        }
        await admin.close();
      }
    });
  }
}
