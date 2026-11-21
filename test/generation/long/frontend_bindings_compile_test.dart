import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/frontend_binding_fixture.dart';
import '../support/generation_test_utils.dart';

void main() {
  test('frontend compila bindings com aspas em nomes e opcoes Access',
      () async {
    final temp = await Directory.systemTemp.createTemp('access_binding_build_');
    addTearDown(() => temp.delete(recursive: true));
    final analysis = await writeFrontendBindingFixture(temp);
    final output = '${temp.path}/generated';
    final errors = StringBuffer();
    expect(
        await run([
          'generate',
          '--analysis',
          analysis.path,
          '--output',
          output,
          '--identifier-style',
          'original',
        ], out: StringBuffer(), err: errors),
        0,
        reason: errors.toString());
    await runCheckedProcess('dart', ['pub', 'get'],
        workingDirectory: '$output/core', description: 'core pub get');
    await runCheckedProcess('dart', ['analyze', 'lib'],
        workingDirectory: '$output/core', description: 'core analyze lib');
    final frontend = '$output/frontend';
    await runCheckedProcess('dart', ['pub', 'get'],
        workingDirectory: frontend, description: 'frontend pub get');
    await runCheckedProcess('dart', ['analyze', 'lib'],
        workingDirectory: frontend, description: 'frontend analyze lib');
    await runCheckedProcess('dart', ['run', 'tool/build_release.dart'],
        workingDirectory: frontend,
        description: 'frontend verified release build');
    await expectFrontendDistribution(Directory(frontend));
  }, timeout: const Timeout(Duration(minutes: 15)));
}
