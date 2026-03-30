import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('generate emits metadata hints in frontend titles', () async {
    final tempDir = await Directory.systemTemp.createTemp('access_metadata_');
    addTearDown(() => tempDir.delete(recursive: true));

    final analysisFile = await writeMoneyAnalysisFixture(tempDir);
    final outputDir = '${tempDir.path}${Platform.pathSeparator}money_app_generated';
    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      ['generate', '--analysis', analysisFile.path, '--output', outputDir],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);

    final validationFile = File(
      '$outputDir${Platform.pathSeparator}core${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}validation${Platform.pathSeparator}lancamentos_validation.dart',
    );
    final validationContent = await validationFile.readAsString();
    expect(validationContent, contains('Regra Access em Valor monetario: >=0 -> Nao deixe Valor monetario vazio.'));
    expect(validationContent, contains('Formato Access em Valor monetario: Currency'));
    expect(validationContent, contains('Mascara Access em Valor monetario: 99999.99'));
    expect(validationContent, contains('field: "valor_moeda", message: "Nao deixe Valor monetario vazio."'));

    final incluirHtmlFile = File(
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}lancamentos${Platform.pathSeparator}pages${Platform.pathSeparator}incluir_lancamentos${Platform.pathSeparator}incluir_lancamentos_page.html',
    );
    final incluirHtmlContent = await incluirHtmlFile.readAsString();
    expect(incluirHtmlContent, contains('title="Nao deixe Valor monetario vazio. | Formato Access: Currency | Mascara Access: 99999.99 | Regra Access: &gt;=0 | Default Access: 0 | Default semantico aplicado no scaffold. | Nao aceita string vazia."'));
  });
}