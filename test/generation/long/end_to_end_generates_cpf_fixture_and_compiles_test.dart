import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('end-to-end generates cpf fixture with form/VBA and compiles generated app', () async {
    if (!Platform.isWindows) {
      return;
    }

    final tempDir = await Directory.systemTemp.createTemp('access_cpf_e2e_');
    addTearDown(() => tempDir.delete(recursive: true));

    final fixtureFile = File('${tempDir.path}${Platform.pathSeparator}cpf_fixture.accdb');
    final analysisDir = Directory('${tempDir.path}${Platform.pathSeparator}analysis');
    final outputDir = Directory('${tempDir.path}${Platform.pathSeparator}generated_app');

    await runCheckedProcess(
      'dart',
      ['run', 'tools/create_access_cpf_form.dart', '--output', fixtureFile.path],
      description: 'create cpf fixture accdb',
    );

    final analyzeOut = StringBuffer();
    final analyzeErr = StringBuffer();
    final analyzeExit = await run(
      ['analyze', '--accdb', fixtureFile.path, '--output', analysisDir.path],
      out: analyzeOut,
      err: analyzeErr,
    );

    expect(analyzeExit, 0, reason: analyzeErr.toString());

    final analysisFile = File('${analysisDir.path}${Platform.pathSeparator}analysis.json');
    final analysisJson = jsonDecode(await analysisFile.readAsString()) as Map<String, dynamic>;
    final forms = (analysisJson['forms'] as List<dynamic>? ?? const []);
    expect(forms, isNotEmpty);

    final generateOut = StringBuffer();
    final generateErr = StringBuffer();
    final generateExit = await run(
      ['generate', '--analysis', analysisFile.path, '--output', outputDir.path],
      out: generateOut,
      err: generateErr,
    );

    expect(generateExit, 0, reason: generateErr.toString());
    await compileGeneratedProject(outputDir.path);
  }, timeout: const Timeout(Duration(minutes: 20)));
}