import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('end-to-end generates fixture with tools and compiles generated app', () async {
    if (!Platform.isWindows) {
      return;
    }

    final tempDir = await Directory.systemTemp.createTemp('access_e2e_');
    addTearDown(() => tempDir.delete(recursive: true));

    final fixtureFile = File('${tempDir.path}${Platform.pathSeparator}e2e_fixture.accdb');
    final analysisDir = Directory('${tempDir.path}${Platform.pathSeparator}analysis');
    final outputDir = Directory('${tempDir.path}${Platform.pathSeparator}generated_app');

    await runCheckedProcess(
      'dart',
      ['run', 'tools/create_access_accdb.dart', '--output', fixtureFile.path, '--table', 'E2EUsers'],
      description: 'create fixture accdb',
    );

    expect(await fixtureFile.exists(), isTrue);

    final out = StringBuffer();
    final err = StringBuffer();
    final analyzeExit = await run(
      ['analyze', '--accdb', fixtureFile.path, '--output', analysisDir.path],
      out: out,
      err: err,
    );

    expect(analyzeExit, 0, reason: err.toString());

    final analysisFile = File('${analysisDir.path}${Platform.pathSeparator}analysis.json');
    expect(await analysisFile.exists(), isTrue, reason: out.toString());

    final generateOut = StringBuffer();
    final generateErr = StringBuffer();
    final generateExit = await run(
      ['generate', '--analysis', analysisFile.path, '--output', outputDir.path],
      out: generateOut,
      err: generateErr,
    );

    expect(generateExit, 0, reason: generateErr.toString());
    expect(await outputDir.exists(), isTrue, reason: generateOut.toString());

    await compileGeneratedProject(outputDir.path);
  }, timeout: const Timeout(Duration(minutes: 15)));
}