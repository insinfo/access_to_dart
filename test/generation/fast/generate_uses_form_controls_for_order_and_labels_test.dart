import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('generate uses analyzed form controls to order fields, labels and widgets', () async {
    final tempDir = await Directory.systemTemp.createTemp('access_form_controls_');
    addTearDown(() => tempDir.delete(recursive: true));

    final analysisFile = await writeFormControlsAnalysisFixture(tempDir);
    final outputDir = '${tempDir.path}${Platform.pathSeparator}form_controls_app_generated';
    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      ['generate', '--analysis', analysisFile.path, '--output', outputDir],
      out: out,
      err: err,
    );

    expect(exitCode, 0, reason: err.toString());
    expect(err.toString(), isEmpty);

    final incluirHtmlFile = File(
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}cadastro${Platform.pathSeparator}pages${Platform.pathSeparator}incluir_cadastro${Platform.pathSeparator}incluir_cadastro_page.html',
    );
    final incluirHtmlContent = await incluirHtmlFile.readAsString();

    final observacoesIndex = incluirHtmlContent.indexOf('Observações detalhadas');
    final ativoIndex = incluirHtmlContent.indexOf('Ativo no programa');
    final categoriaIndex = incluirHtmlContent.indexOf('Categoria visual');
    final unidadeIndex = incluirHtmlContent.indexOf('Unidade de referência');
    final nomeIndex = incluirHtmlContent.indexOf('Nome completo');
    final emailIndex = incluirHtmlContent.indexOf('E-mail principal');

    expect(observacoesIndex, greaterThanOrEqualTo(0));
    expect(ativoIndex, greaterThan(observacoesIndex));
    expect(categoriaIndex, greaterThan(ativoIndex));
    expect(unidadeIndex, greaterThan(categoriaIndex));
    expect(nomeIndex, greaterThan(unidadeIndex));
    expect(emailIndex, greaterThan(nomeIndex));
    expect(incluirHtmlContent, isNot(contains('Nome base')));
    expect(incluirHtmlContent, isNot(contains('Email base')));
    expect(incluirHtmlContent, isNot(contains('Observacoes base')));
    expect(incluirHtmlContent, contains('<textarea'));
    expect(incluirHtmlContent, contains("[ngModel]=\"readFieldBool('ativo')\""));
    expect(incluirHtmlContent, contains('size="6"'));
    expect(incluirHtmlContent, contains('Selecione Unidade de referência'));
  });
}