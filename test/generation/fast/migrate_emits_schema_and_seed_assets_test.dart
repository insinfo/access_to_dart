import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('migrate emits schema and seed sql assets', () async {
    final analysisFile = await ensureTeste1QuickAnalysis();

    final tempDir = await Directory.systemTemp.createTemp('access_migrate_');
    addTearDown(() => tempDir.delete(recursive: true));

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      ['migrate', '--analysis', analysisFile.path, '--output', tempDir.path],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);
    expect(out.toString(), contains('Migration assets written'));

    final schemaFile = File('${tempDir.path}${Platform.pathSeparator}schema.sql');
    final seedFile = File('${tempDir.path}${Platform.pathSeparator}seed.sql');
    expect(await schemaFile.exists(), isTrue);
    expect(await seedFile.exists(), isTrue);
    expect(await schemaFile.readAsString(), contains('CREATE TABLE "contatos"'));
    expect(await schemaFile.readAsString(), contains('"sobrenome" TEXT NOT NULL'));
    expect(await seedFile.readAsString(), contains('INSERT INTO "contatos"'));
  });
}