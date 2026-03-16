import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('generate supports original identifier style in runtime keys', () async {
    final analysisFile = await ensureTeste1QuickAnalysis();

    final tempDir = await Directory.systemTemp.createTemp('access_generate_');
    addTearDown(() => tempDir.delete(recursive: true));

    final outputDir = '${tempDir.path}${Platform.pathSeparator}teste1_app_generated';
    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      [
        'generate',
        '--analysis',
        analysisFile.path,
        '--output',
        outputDir,
        '--identifier-style',
        'original',
      ],
      out: out,
      err: err,
    );

    expect(exitCode, 0, reason: err.toString());
    final modelFile = File('$outputDir${Platform.pathSeparator}core${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}models${Platform.pathSeparator}contatos.dart');
    final modelContent = await modelFile.readAsString();
    expect(modelContent, contains("static const nomeDoContatoCol = 'NomeDoContato';"));

    final repositoryFile = File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}repositories${Platform.pathSeparator}contatos_repository.dart');
    expect(await repositoryFile.readAsString(), contains("db.table('Contatos')"));
  });
}