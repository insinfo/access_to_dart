import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:crypto/crypto.dart';
import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';
import 'generation/support/subform_postgres_harness.dart';

void main() {
  test(
      'CLI migrates four actual Attachment payloads into BYTEA matching DAO files',
      () async {
    const source = 'fixtures/SIGA2021-SUL_be_senha_4462.accdb';
    final manifest = jsonDecode(
        await File('test/fixtures/sigasul_attachment_dao_hashes.json')
            .readAsString()) as Map;
    expect((await sha256.bind(File(source).openRead()).first).toString(),
        manifest['sourceSha256']);
    final entries = (manifest['attachments'] as List).cast<Map>();
    final database = await AccessDatabase.openPath(source, password: '4462');
    final tables = <Map<String, dynamic>>[];
    try {
      final reader = TableReader(
          format: database.format, pageChannel: database.pageChannel);
      for (final entry in entries) {
        final schema = await reader.readSchema(
            entry['table'] as String, entry['tdefPage'] as int);
        tables.add({...schema.toJson(), 'syntheticKind': 'attachment'});
      }
    } finally {
      await database.close();
    }
    final temp =
        await Directory.systemTemp.createTemp('attachment_payload_migration_');
    addTearDown(() => temp.delete(recursive: true));
    final analysis = File('${temp.path}/analysis.json');
    await analysis.writeAsString(jsonEncode({
      'schema_version': '1.0',
      'source': source,
      'tables': tables,
      'relationships': [],
    }));
    final harness = SubformPostgresHarness.fromEnvironment();
    final target = await harness.createTempDatabase();
    addTearDown(() => harness.dropTempDatabase(target));
    final uri = Uri(
        scheme: 'postgresql',
        userInfo:
            '${Uri.encodeComponent(harness.user)}:${Uri.encodeComponent(harness.password)}',
        host: harness.host,
        port: harness.port,
        path: target,
        queryParameters: {'sslmode': 'disable'});
    final errors = StringBuffer();
    expect(
        await run([
          'migrate',
          '--analysis',
          analysis.path,
          '--password',
          '4462',
          '--mode',
          'schema-and-data',
          '--seed-format',
          'copy',
          '--output',
          '${temp.path}/migration',
          '--pg',
          uri.toString()
        ], out: StringBuffer(), err: errors),
        0,
        reason: errors.toString().replaceAll(harness.password, '<redacted>'));
    final pg = await harness.openDatabase(target);
    try {
      const policy =
          MigrationIdentifierPolicy(style: MigrationIdentifierStyle.snakeAscii);
      for (final entry in entries) {
        final reader = await pg.executeReader(
            "SELECT encode(\"file_data\", 'hex') FROM ${policy.quotedTableName(entry['table'] as String)}");
        try {
          expect(await reader.read(), isTrue);
          final hex = reader.getValue(0) as String;
          final bytes = List<int>.generate(hex.length ~/ 2,
              (i) => int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16));
          expect(bytes.length, entry['payloadLength']);
          expect(sha256.convert(bytes).toString(), entry['payloadSha256']);
          expect(await reader.read(), isFalse);
        } finally {
          await reader.close();
        }
      }
    } finally {
      await pg.close();
    }
  }, timeout: const Timeout(Duration(minutes: 5)));
}
