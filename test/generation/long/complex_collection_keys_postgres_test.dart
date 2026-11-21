import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';
import '../support/subform_postgres_harness.dart';

void main() {
  test(
      'physical collection keys survive analysis, migration and transactional insert',
      () async {
    const path = 'fixtures/SIGA2021-SUL_be_senha_4462.accdb';
    final source = await AccessDatabase.openPath(path, password: '4462');
    late Map<String, dynamic> analysis;
    late Map attachment;
    late AccessTableSchema attachmentSchema;
    late Map<String, dynamic> imported;
    try {
      final model = await AccessCatalog(
              format: source.format, pageChannel: source.pageChannel)
          .read(path);
      analysis = await AccdbAnalyzer(model: model, db: source).analyze();
      final collections = (analysis['tables'] as List)
          .cast<Map>()
          .where((t) => t['syntheticKind'] != null)
          .toList();
      expect(collections, hasLength(9));
      final reader =
          TableReader(format: source.format, pageChannel: source.pageChannel);
      for (final table in collections) {
        final physical = await reader.readSchema(
            table['name'] as String, table['tdefPage'] as int);
        expect(
            table['indexes'], physical.indexes.map((i) => i.toJson()).toList(),
            reason: 'Physical indexes of ${table['name']}');
        final actualAuto = (table['columns'] as List)
            .where((c) => c['isAutoNumber'] == true)
            .map((c) => c['name'])
            .toList();
        final expectedAuto = physical.columns
            .where((c) => c.isAutoNumber)
            .map((c) => c.name)
            .toList();
        expect(actualAuto, expectedAuto,
            reason: 'Physical autonumber of ${table['name']}');
        expect(expectedAuto, hasLength(1));
        expect(physical.indexes.where((i) => i.isPrimaryKey), hasLength(1));
      }
      attachment = collections
          .singleWhere((t) => t['name'] == 'TbUnidade_rma1_attachment');
      attachmentSchema = await reader.readSchema(
          attachment['name'] as String, attachment['tdefPage'] as int);
      imported =
          (await reader.readAllRows(attachment['tdefPage'] as int)).single;
    } finally {
      await source.close();
    }
    final temp = await Directory.systemTemp.createTemp('complex_keys_');
    addTearDown(() => temp.delete(recursive: true));
    analysis['tables'] = [attachment];
    analysis['linkedTables'] = [];
    analysis['relationships'] = [];
    final input = File('${temp.path}/analysis.json');
    await input.writeAsString(jsonEncode(analysis));
    final harness = SubformPostgresHarness.fromEnvironment();
    final database = await harness.createTempDatabase();
    addTearDown(() => harness.dropTempDatabase(database));
    final errors = StringBuffer();
    expect(
        await run([
          'migrate',
          '--analysis',
          input.path,
          '--password',
          '4462',
          '--auto-number-mode',
          'sequence',
          '--output',
          '${temp.path}/migration',
          '--pg',
          'host=${harness.host} port=${harness.port} dbname=$database user=${harness.user} password=${harness.password} sslmode=disable'
        ], out: StringBuffer(), err: errors),
        0,
        reason: '$errors');
    const policy =
        MigrationIdentifierPolicy(style: MigrationIdentifierStyle.snakeAscii);
    final table = policy.tableName(attachment['name'] as String);
    final pk = attachmentSchema.indexes
        .singleWhere((i) => i.isPrimaryKey)
        .columns
        .single
        .name;
    final key = policy.columnName(pk);
    final linkName = attachment['attachmentLinkColumn'] as String;
    final link = policy.columnName(linkName);
    final oldId = imported[pk] as int;
    final parent = imported[linkName] as int;
    final connection = await harness.openDatabase(database);
    try {
      expect(await scalar(connection, 'SELECT "$key" FROM "$table"'), oldId);
      final transaction = await connection.beginTransaction();
      late int rolledBackId;
      try {
        rolledBackId = (await scalar(connection,
                'INSERT INTO "$table" ("$link") VALUES ($parent) RETURNING "$key"'))
            as int;
        expect(rolledBackId, greaterThan(oldId));
      } finally {
        await transaction.rollback();
      }
      expect(await scalar(connection, 'SELECT COUNT(*) FROM "$table"'), 1);
      expect(await scalar(connection, 'SELECT "$key" FROM "$table"'), oldId);
      final committedId = await scalar(connection,
          'INSERT INTO "$table" ("$link") VALUES ($parent) RETURNING "$key"');
      expect(committedId, greaterThan(rolledBackId));
      expect(await scalar(connection, 'SELECT COUNT(*) FROM "$table"'), 2);
      expect(
          await scalar(
              connection, 'SELECT COUNT(*) FROM "$table" WHERE "$key"=$oldId'),
          1);
    } finally {
      await connection.close();
    }
  }, timeout: const Timeout(Duration(minutes: 5)));
}

Future<Object?> scalar(DpgsqlConnection connection, String sql) async {
  final reader = await connection.executeReader(sql);
  try {
    expect(await reader.read(), isTrue);
    return reader.getValue(0);
  } finally {
    await reader.close();
  }
}
