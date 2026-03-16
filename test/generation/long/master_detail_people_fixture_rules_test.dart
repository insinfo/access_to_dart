import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('master-detail people fixture recovers form VBA and generates frontend rules', () async {
    if (!Platform.isWindows) {
      return;
    }

    final tempDir = await Directory.systemTemp.createTemp('access_people_form_');
    addTearDown(() => tempDir.delete(recursive: true));

    final fixtureFile = File('${tempDir.path}${Platform.pathSeparator}people_fixture.accdb');
    final analysisDir = Directory('${tempDir.path}${Platform.pathSeparator}analysis');
    final outputDir = Directory('${tempDir.path}${Platform.pathSeparator}generated_app');

    await runCheckedProcess(
      'dart',
      ['run', 'tools/create_access_people_master_detail_form.dart', '--output', fixtureFile.path],
      description: 'create master-detail people fixture accdb',
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
    final summary = analysisJson['summary'] as Map<String, dynamic>;
    expect(summary['tables'], greaterThanOrEqualTo(3));
    expect(summary['relationships'], greaterThanOrEqualTo(2));
    expect(summary['forms'], greaterThanOrEqualTo(2));

    final canonicalAnalysis = analysisJson['canonical_analysis'] as Map<String, dynamic>;
    final canonicalForms = (canonicalAnalysis['forms'] as List<dynamic>? ?? const <dynamic>[]);
    final pessoasForm = canonicalForms.cast<Map<String, dynamic>>().firstWhere(
      (form) => form['name'] == 'frmPessoasCadastro',
    );
    expect((pessoasForm['rawVbaCode'] as String?)?.isNotEmpty, isTrue);
    expect((pessoasForm['rawVbaCode'] as String).contains('Informe o CPF.'), isTrue);
    final pessoasComponents = (pessoasForm['components'] as Map?)?.cast<String, dynamic>() ?? const <String, dynamic>{};
    expect(pessoasComponents['recordSource'], 'Pessoas');
    final subforms = (pessoasComponents['subforms'] as List<dynamic>? ?? const <dynamic>[]).cast<Map<String, dynamic>>();
    expect(subforms, hasLength(2));

    final enderecosSubform = subforms.firstWhere((subform) => subform['name'] == 'subfrmEnderecos');
    expect(enderecosSubform['sourceObject'], 'Form.frmPessoaEnderecos');
    expect(enderecosSubform['recordSource'], 'PessoaEnderecos');
    expect(enderecosSubform['linkMasterFields'], 'ID');
    expect(enderecosSubform['linkChildFields'], 'PessoaID');

    final telefonesSubform = subforms.firstWhere((subform) => subform['name'] == 'subfrmTelefones');
    expect(telefonesSubform['sourceObject'], 'Form.frmPessoaTelefones');
    expect(telefonesSubform['recordSource'], 'Telefones');
    expect(telefonesSubform['linkMasterFields'], 'ID');
    expect(telefonesSubform['linkChildFields'], 'PessoaID');

    final generateOut = StringBuffer();
    final generateErr = StringBuffer();
    final generateExit = await run(
      ['generate', '--analysis', analysisFile.path, '--output', outputDir.path],
      out: generateOut,
      err: generateErr,
    );

    expect(generateExit, 0, reason: generateErr.toString());

    final formLogicFile = File('${outputDir.path}${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}pessoas${Platform.pathSeparator}logic${Platform.pathSeparator}pessoas_form_logic.dart');
    expect(await formLogicFile.exists(), isTrue);
    final formLogicSource = await formLogicFile.readAsString();
    expect(formLogicSource, contains('Informe o nome da pessoa.'));
    expect(formLogicSource, contains('CPF invalido.'));
    expect(formLogicSource, contains('Email invalido.'));
    expect(Directory('${outputDir.path}${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}pessoa_enderecos').existsSync(), isTrue);
    expect(Directory('${outputDir.path}${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}telefones').existsSync(), isTrue);
  }, timeout: const Timeout(Duration(minutes: 10)));
}