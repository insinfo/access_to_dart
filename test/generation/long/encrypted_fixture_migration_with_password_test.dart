import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

void main() {
  test('encrypted fixture analyzes and emits migration assets with password', () async {
    final fixture = File.fromUri(
      Directory.current.uri.resolve('fixtures/SIGA2021-SUL_be_senha_4462.accdb'),
    );
    expect(await fixture.exists(), isTrue);

    final tempDir = await Directory.systemTemp.createTemp('access_enc_');
    addTearDown(() => tempDir.delete(recursive: true));

    final analysisDir = Directory('${tempDir.path}${Platform.pathSeparator}analysis');
    final analyzeOut = StringBuffer();
    final analyzeErr = StringBuffer();
    final analyzeExit = await run(
      [
        'analyze',
        '--accdb',
        fixture.path,
        '--password',
        '4462',
        '--output',
        analysisDir.path,
      ],
      out: analyzeOut,
      err: analyzeErr,
    );

    expect(analyzeExit, 0, reason: analyzeErr.toString());

    final analysisFile = File('${analysisDir.path}${Platform.pathSeparator}analysis.json');
    final migrateOut = StringBuffer();
    final migrateErr = StringBuffer();
    final migrateExit = await run(
      [
        'migrate',
        '--analysis',
        analysisFile.path,
        '--password',
        '4462',
        '--identifier-style',
        'original',
        '--output',
        '${tempDir.path}${Platform.pathSeparator}migration',
      ],
      out: migrateOut,
      err: migrateErr,
    );

    expect(migrateExit, 0, reason: migrateErr.toString());
    final schemaFile = File('${tempDir.path}${Platform.pathSeparator}migration${Platform.pathSeparator}schema.sql');
    final seedFile = File('${tempDir.path}${Platform.pathSeparator}migration${Platform.pathSeparator}seed.sql');
    expect(await schemaFile.readAsString(), contains('CREATE TABLE "TbPessoa"'));
    expect(await seedFile.readAsString(), contains('INSERT INTO "TbPessoa"'));
  }, timeout: const Timeout(Duration(minutes: 10)));
}