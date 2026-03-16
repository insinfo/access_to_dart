import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('migrate supports original identifier style', () async {
    final analysisFile = await ensureTeste1QuickAnalysis();

    final tempDir = await Directory.systemTemp.createTemp('access_migrate_');
    addTearDown(() => tempDir.delete(recursive: true));

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      [
        'migrate',
        '--analysis',
        analysisFile.path,
        '--output',
        tempDir.path,
        '--identifier-style',
        'original',
      ],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);

    final schemaFile = File('${tempDir.path}${Platform.pathSeparator}schema.sql');
    final seedFile = File('${tempDir.path}${Platform.pathSeparator}seed.sql');
    final schemaContent = await schemaFile.readAsString();
    final seedContent = await seedFile.readAsString();

    expect(schemaContent, contains('CREATE TABLE "Contatos"'));
    expect(seedContent, contains('INSERT INTO "Contatos"'));
    expect(seedContent, contains('"NomeDoContato"'));
  });
}