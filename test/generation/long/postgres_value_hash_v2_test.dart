import 'dart:io';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';
import '../../../tools/audit_postgres_value_hashes.dart';
import '../../../tools/audit_reader_value_hashes.dart' show digest, canonical;

void main() {
  for (final keyType in ['Long', 'Double']) {
    for (final style in MigrationIdentifierStyle.values) {
      test(
          'v2 exact binary values and complete coverage ${style.name} $keyType',
          () async {
        final env = Platform.environment;
        final user = env['ACCESS_TO_DART_TEST_PG_USER'];
        final password = env['ACCESS_TO_DART_TEST_PG_PASSWORD'];
        if (user == null || password == null) {
          throw StateError('Session PG credentials required');
        }
        final host = env['ACCESS_TO_DART_TEST_PG_HOST'] ?? 'localhost';
        final port = env['ACCESS_TO_DART_TEST_PG_PORT'] ?? '5432';
        String conn(String database) =>
            'Host=$host;Port=$port;Database=$database;Username=$user;Password=$password;SSL Mode=Disable';
        final dbName =
            'access_value_audit_${DateTime.now().microsecondsSinceEpoch}';
        final admin = DpgsqlConnection(conn('postgres'));
        await admin.open();
        var created = false;
        DpgsqlConnection? pg;
        try {
          await admin
              .createCommand('CREATE DATABASE "$dbName" TEMPLATE template0')
              .executeNonQuery();
          created = true;
          pg = DpgsqlConnection(conn(dbName));
          await pg.open();
          final policy = MigrationIdentifierPolicy(style: style);
          final table = policy.quotedTableName('Audit V2');
          final q = policy.quotedColumnName;
          final keys =
              keyType == 'Long' ? <num>[2, 10, 256] : <num>[2.25, 10.5, 256.25];
          final keySqlType = keyType == 'Long' ? 'integer' : 'double precision';
          await pg
              .createCommand(
                  'CREATE TABLE $table (${q('ID')} $keySqlType PRIMARY KEY, ${q('Double')} double precision, ${q('Small')} smallint, ${q('Blob')} bytea)')
              .executeNonQuery();
          await pg
              .createCommand(
                  "INSERT INTO $table VALUES (${keys[0]},'-0'::float8,-32768,decode('000102ff','hex')),(${keys[1]},'1.0000000000000002'::float8,32767,decode('','hex')),(${keys[2]},NULL,NULL,NULL)")
              .executeNonQuery();
          final columns = [
            {'name': 'ID', 'typeName': keyType},
            {'name': 'Double', 'typeName': 'Double'},
            {'name': 'Small', 'typeName': 'Integer'},
            {'name': 'Blob', 'typeName': 'OLE'}
          ];
          final rows = [
            [
              keys[0],
              -0.0,
              -32768,
              [0, 1, 2, 255]
            ],
            [keys[1], 1.0000000000000002, 32767, <int>[]],
            [keys[2], null, null, null]
          ];
          final oracle = {
            'sourceSha256': 'synthetic-test',
            'contract': 'typed-column-pk-v2',
            'attachments': <dynamic>[],
            'tables': [
              {
                'table': 'Audit V2',
                'primaryKey': 'ID',
                'primaryKeyType': keyType,
                'rows': 3,
                'columns': [
                  for (var i = 0; i < columns.length; i++)
                    {
                      'name': columns[i]['name'],
                      'type': columns[i]['typeName'],
                      'nullCount': i == 0 ? 0 : 1,
                      'submicrosecondCount': 0,
                      'sha256': digest(rows.map((r) {
                        final key = canonical(r[0], keyType);
                        final cell = canonical(r[i], columns[i]['typeName']!);
                        return '${key.length}:$key${cell.length}:$cell';
                      }).join())
                    }
                ]
              }
            ]
          };
          final analysis = {
            'tables': [
              {
                'name': 'Audit V2',
                'columns': [
                  ...columns,
                  {'name': 'Nested', 'typeName': 'ComplexType'}
                ],
                'indexes': [
                  {
                    'isPrimaryKey': true,
                    'columns': [
                      {'name': 'ID'}
                    ]
                  }
                ]
              }
            ]
          };
          Future<Map<String, Object?>> audit() => auditPostgresValueHashes(
              connection: pg!,
              analysis: analysis,
              oracle: oracle,
              identifiers: policy,
              sourceSha256: 'synthetic-test');
          expect((await audit())['allValuesMatch'], isTrue);
          await pg
              .createCommand(
                  'UPDATE $table SET ${q('Double')}=0 WHERE ${q('ID')}=${keys[0]}')
              .executeNonQuery();
          expect((await audit())['allValuesMatch'], isFalse);
          (analysis['tables'] as List)
              .add({'name': 'Missing table', 'columns': <dynamic>[]});
          await expectLater(audit(), throwsStateError);
          (analysis['tables'] as List).removeLast();
          final oracleColumns =
              ((oracle['tables'] as List).single as Map)['columns'] as List;
          oracleColumns[1] = oracleColumns[0];
          await expectLater(audit(), throwsStateError);
        } finally {
          if (pg != null) await pg.close();
          if (created) {
            await admin
                .createCommand('DROP DATABASE "$dbName" WITH (FORCE)')
                .executeNonQuery();
          }
          await admin.close();
        }
      });
    }
  }
}
