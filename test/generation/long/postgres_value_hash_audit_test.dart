import 'dart:io';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';
import '../../../tools/audit_postgres_value_hashes.dart';
import '../../../tools/audit_reader_value_hashes.dart' show digest;

void main() {
  test('numeric canonicalization is exact and refuses discarded precision', () {
    expect(canonicalPostgresText('12345678901234.1234', 'Money', 'numeric'),
        'M12345678901234.1234');
    expect(canonicalPostgresText('1.23000', 'Money', 'numeric'), 'M1.2300');
    expect(() => canonicalPostgresText('1.23456', 'Money', 'numeric'),
        throwsStateError);
    expect(
        canonicalPostgresText('04:05:06', 'DateTime', 'time without time zone'),
        contains('<missing-date>'));
  });
  for (final style in MigrationIdentifierStyle.values) {
    test('PostgreSQL hashes detect temporal loss ${style.name}', () async {
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
        final table = policy.quotedTableName('Audit Samples');
        final q = policy.quotedColumnName;
        await pg
            .createCommand(
                'CREATE TABLE $table (${q('ID')} integer PRIMARY KEY, ${q('Money Amount')} numeric(20,4), ${q('When')} timestamp, ${q('Flag')} boolean, ${q('Label')} text)')
            .executeNonQuery();
        await pg
            .createCommand(
                "INSERT INTO $table VALUES (256,12345678901234.1234,'2020-02-03 04:05:06.007008',false,'O''Brien é ')")
            .executeNonQuery();
        final columns = [
          {'name': 'ID', 'typeName': 'Long'},
          {'name': 'Money Amount', 'typeName': 'Money'},
          {'name': 'When', 'typeName': 'DateTime'},
          {'name': 'Flag', 'typeName': 'Boolean'},
          {'name': 'Label', 'typeName': 'Text'}
        ];
        final values = [
          'I256',
          'M12345678901234.1234',
          'T2020-02-03T04:05:06.007008',
          'B0',
          "SO'Brien é "
        ];
        final parentTable = policy.quotedTableName('Parent Files');
        final childTable = policy.quotedTableName('Files attachment');
        await pg
            .createCommand(
                'CREATE TABLE $parentTable (${q('ID')} integer PRIMARY KEY, ${q('Files')} integer)')
            .executeNonQuery();
        await pg
            .createCommand(
                'CREATE TABLE $childTable (${q('_Files')} integer, ${q('FileData')} bytea, ${q('FileID')} integer)')
            .executeNonQuery();
        await pg
            .createCommand('INSERT INTO $parentTable VALUES (7,99)')
            .executeNonQuery();
        await pg
            .createCommand(
                "INSERT INTO $childTable VALUES (99,decode('000102ff','hex'),5)")
            .executeNonQuery();
        final oracle = {
          'sourceSha256': 'synthetic-test',
          'contract': 'typed-column-pk-v1',
          'tables': [
            {
              'table': 'Audit Samples',
              'primaryKey': 'ID',
              'rows': 1,
              'columns': [
                for (var i = 0; i < columns.length; i++)
                  {
                    'name': columns[i]['name'],
                    'type': columns[i]['typeName'],
                    'sha256': digest('4:I256${values[i].length}:${values[i]}'),
                    'nullCount': 0,
                    'submicrosecondCount': 0
                  }
              ]
            }
          ],
          'attachments': [
            {
              'table': 'Files attachment',
              'parentKeyHash': digest('I7'),
              'ordinal': 0,
              'length': 4,
              'sha256':
                  '3d1f57c984978ef98a18378c8166c1cb8ede02c03eeb6aee7e2f121dfeee3e56'
            }
          ]
        };
        final analysis = <String, dynamic>{
          'tables': <dynamic>[
            {
              'name': 'Audit Samples',
              'columns': columns,
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
        (analysis['tables'] as List).addAll([
          {
            'name': 'Parent Files',
            'columns': [
              {'name': 'ID', 'typeName': 'Long'},
              {'name': 'Files', 'typeName': 'Long'}
            ],
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
            'name': 'Files attachment',
            'syntheticKind': 'attachment',
            'attachmentParentTable': 'Parent Files',
            'attachmentParentColumn': 'Files',
            'attachmentLinkColumn': '_Files',
            'indexes': [],
            'columns': [
              {'name': '_Files', 'typeName': 'Long'},
              {'name': 'FileData', 'typeName': 'OLE'},
              {'name': 'FileID', 'typeName': 'Long'}
            ]
          }
        ]);
        Future<Map<String, Object?>> audit() => auditPostgresValueHashes(
            connection: pg!,
            analysis: analysis,
            oracle: oracle,
            identifiers: policy,
            sourceSha256: 'synthetic-test');
        expect((await audit())['allValuesMatch'], isTrue);
        await pg
            .createCommand(
                "UPDATE $childTable SET ${q('FileData')}=decode('000102','hex')")
            .executeNonQuery();
        final corrupted = await audit();
        expect(corrupted['allScalarColumnsMatch'], isTrue);
        expect(corrupted['allAttachmentPayloadsMatch'], isFalse);
        expect(corrupted['allValuesMatch'], isFalse);
        await pg
            .createCommand(
                "UPDATE $childTable SET ${q('FileData')}=decode('000102ff','hex')")
            .executeNonQuery();

        await pg
            .createCommand(
                'ALTER TABLE $table ALTER COLUMN ${q('When')} TYPE date USING ${q('When')}::date')
            .executeNonQuery();
        final dateReport = await audit();
        expect(dateReport['allValuesMatch'], isFalse);
        final dateColumns =
            ((dateReport['tables'] as List).single['columns'] as List);
        expect(dateColumns.singleWhere((c) => c['name'] == 'When')['match'],
            isFalse);
        expect(
            dateColumns
                .where((c) => c['name'] != 'When')
                .every((c) => c['match'] == true),
            isTrue);
        await pg
            .createCommand('ALTER TABLE $table DROP COLUMN ${q('When')}')
            .executeNonQuery();
        await pg
            .createCommand('ALTER TABLE $table ADD COLUMN ${q('When')} time')
            .executeNonQuery();
        await pg
            .createCommand("UPDATE $table SET ${q('When')}='04:05:06.007008'")
            .executeNonQuery();
        final timeReport = await audit();
        expect(timeReport['allValuesMatch'], isFalse);
        expect(
            (((timeReport['tables'] as List).single['columns'] as List)
                .singleWhere(
                    (c) => c['name'] == 'When'))['temporalComponentsMissing'],
            isTrue);
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
