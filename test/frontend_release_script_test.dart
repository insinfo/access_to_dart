import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';
import 'generation/support/generation_test_utils.dart';

void main() {
  test('release gerado recusa pacote ausente, incompleto e JS vazio', () async {
    final temp = await Directory.systemTemp.createTemp('release_guard_');
    addTearDown(() => temp.delete(recursive: true));
    final analysis = await ensureTeste1QuickAnalysis();
    final errors = StringBuffer();
    expect(
        await run([
          'generate',
          '--analysis',
          analysis.path,
          '--output',
          '${temp.path}/app'
        ], out: StringBuffer(), err: errors),
        0,
        reason: errors.toString());
    final script = File('${temp.path}/app/frontend/tool/build_release.dart');
    expect(await script.exists(), isTrue);
    Future<ProcessResult> verify() => Process.run(
        Platform.resolvedExecutable, ['run', script.path, '--verify-only'],
        workingDirectory: temp.path);
    expect((await verify()).exitCode, 1,
        reason: 'Nao aceita ausencia de manifest.');
    final output = await Directory('${temp.path}/app/frontend/build').create();
    final manifest = File('${output.path}/.build.manifest');
    await manifest.writeAsString('index.html\nmain.dart.js\nasset.json\n');
    expect((await verify()).exitCode, 1,
        reason: 'Reproduz manifest sem arquivos.');
    await File('${output.path}/index.html').writeAsString('<html></html>');
    await File('${output.path}/main.dart.js')
        .writeAsString('console.log("fixture");');
    expect((await verify()).exitCode, 1,
        reason: 'Todos os assets do manifest importam.');
    await File('${output.path}/asset.json').writeAsString('{}');
    final complete = await verify();
    expect(complete.exitCode, 0, reason: complete.stderr.toString());
    await manifest.writeAsString('');
    expect((await verify()).exitCode, 1,
        reason: 'Manifest vazio nao valida arquivos antigos.');
    await manifest.writeAsString('index.html\nmain.dart.js\nasset.json\n');
    await File('${output.path}/main.dart.js').writeAsString('');
    expect((await verify()).exitCode, 1,
        reason: 'JS truncado nao e release valido.');
  });
}
