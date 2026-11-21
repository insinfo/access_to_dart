import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/analysis_overlay_merger.dart';
import 'package:test/test.dart';
import '../support/generation_test_utils.dart';

void main() {
  test('real family/person/update subforms preserve links and compile',
      () async {
    final temp = await Directory.systemTemp.createTemp('sigasul_subforms_');
    addTearDown(() => temp.delete(recursive: true));
    final errors = StringBuffer();
    var input = Platform.environment['ACCESS_SIGASUL_ANALYSIS_INPUT'];
    if (input == null || input.isEmpty) {
      expect(
          await run([
            'analyze',
            '--accdb',
            'fixtures/SIGAsul.accdb',
            '--src',
            'fixtures/SIGAsul.accdb.src',
            '--backend-accdb',
            'fixtures/SIGA2021-SUL_be_senha_4462.accdb',
            '--backend-password',
            '4462',
            '--output',
            '${temp.path}/analysis'
          ], out: StringBuffer(), err: errors),
          0,
          reason: errors.toString());
      input = '${temp.path}/analysis/analysis.json';
    }
    final analysis =
        jsonDecode(await File(input).readAsString()) as Map<String, dynamic>;
    final source =
        await AccessSrcReader().readDirectory('fixtures/SIGAsul.accdb.src');
    AnalysisOverlayMerger().mergeSourceOverlay(analysis, source);
    final tables = (analysis['tables'] as List)
        .where((t) => ['CadResidencia', 'TbPessoa', 'CadResidAtualizacao']
            .contains(t['name']))
        .toList();
    expect(tables, hasLength(3));
    final slice = <String, dynamic>{
      'source': analysis['source'],
      'tables': tables,
      'forms': analysis['forms'],
      'source_overlay': analysis['source_overlay'],
      'relationships': [],
    };
    final file = File('${temp.path}/analysis_slice.json');
    await file.writeAsString(jsonEncode(slice));
    final output = Platform.environment['ACCESS_SUBFORM_SCAFFOLD_OUTPUT'] ??
        '${temp.path}/generated';
    expect(
        await run(['generate', '--analysis', file.path, '--output', output],
            out: StringBuffer(), err: errors),
        0,
        reason: errors.toString());
    final module = '$output/frontend/lib/src/modules/cad_residencia';
    final specs =
        jsonDecode(await File('$module/access_subforms.json').readAsString())
            as List;
    expect(specs, hasLength(2));
    final people = specs.singleWhere(
        (s) => s['sourceObject'] == 'Form.COMPOSIÇÃO FAMILIAR SUBFORM');
    expect(people['unsupportedReason'], isNull);
    expect(people['parentTable'], 'cad_residencia');
    expect(people['childTable'], 'tb_pessoa');
    expect(people['links'], [
      {'master': 'cod_fam', 'child': 'cod_fam'}
    ]);
    final updates =
        specs.singleWhere((s) => s['childTable'] == 'cad_resid_atualizacao');
    expect(updates['links'], [
      {'master': 'cod_fam', 'child': 'cod_cad_resd'}
    ]);
    final html = await File(
            '$module/pages/incluir_cad_residencia/incluir_cad_residencia_page.html')
        .readAsString();
    expect('<access-subform-panel'.allMatches(html), hasLength(2));
    for (final package in ['core', 'backend', 'frontend']) {
      await runCheckedProcess('dart', ['pub', 'get'],
          workingDirectory: '$output/$package',
          description: 'subforms $package pub get');
      await runCheckedProcess('dart', ['analyze', 'lib'],
          workingDirectory: '$output/$package',
          description: 'subforms $package analyze');
    }
    await runCheckedProcess('dart', ['run', 'tool/build_release.dart'],
        workingDirectory: '$output/frontend',
        description: 'subforms verified release build');
    await expectFrontendDistribution(Directory('$output/frontend'));
  }, timeout: const Timeout(Duration(minutes: 15)));
}
