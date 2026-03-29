import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('generate suggests dropdown controls for access row sources', () async {
    final tempDir = await Directory.systemTemp.createTemp('access_dropdown_');
    addTearDown(() => tempDir.delete(recursive: true));

    final analysisFile = await writeDropdownAnalysisFixture(tempDir);
    final outputDir = '${tempDir.path}${Platform.pathSeparator}dropdown_app_generated';
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
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}filtros${Platform.pathSeparator}pages${Platform.pathSeparator}incluir_filtros${Platform.pathSeparator}incluir_filtros_page.html',
    );
    final incluirHtmlContent = await incluirHtmlFile.readAsString();

    expect(incluirHtmlContent, contains('<select'));
    expect(incluirHtmlContent, contains('title="DisplayControl Access: 111 | RowSourceType Access: Value List | RowSource Access: &quot;Ativo&quot;;&quot;Inativo&quot;;&quot;Pendente&quot;"'));
    expect(incluirHtmlContent, contains('title="DisplayControl Access: 111 | Campo multivalorado do Access. | RowSourceType Access: Value List | RowSource Access: &quot;Urgente&quot;;&quot;Revisao&quot;;&quot;Concluido&quot;"'));
    expect(incluirHtmlContent, contains('<option value="Ativo">Ativo</option>'));
    expect(incluirHtmlContent, contains('<option value="Inativo">Inativo</option>'));
    expect(incluirHtmlContent, contains("toggleFieldSelection('tags', 'Urgente', \$event.target.checked)"));
    expect(incluirHtmlContent, contains("isFieldOptionSelected('tags', 'Urgente')"));
    expect(
      incluirHtmlContent,
      contains("*ngFor=\"let option of lookupOptions('pessoa_selecionada')\""),
    );
    expect(incluirHtmlContent, contains('Selecione Categoria'));
    expect(incluirHtmlContent, contains('Selecione Pessoa selecionada'));

    final frontendServiceFile = File(
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}filtros${Platform.pathSeparator}services${Platform.pathSeparator}filtros_service.dart',
    );
    final frontendServiceContent = await frontendServiceFile.readAsString();
    expect(frontendServiceContent, contains('Future<List<LookupOption>> lookupOptions'));
    expect(frontendServiceContent, contains("'/filtros/lookups/\$fieldKey'"));

    final backendServiceFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}filtros${Platform.pathSeparator}services${Platform.pathSeparator}filtros_service.dart',
    );
    final backendServiceContent = await backendServiceFile.readAsString();
    expect(backendServiceContent, contains("case 'pessoa_selecionada':"));
    expect(backendServiceContent, contains("valueColumn: 'id'"));
    expect(backendServiceContent, contains("labelColumn: 'nome'"));

    final backendRoutesFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}filtros${Platform.pathSeparator}routes${Platform.pathSeparator}filtros_routes.dart',
    );
    final backendRoutesContent = await backendRoutesFile.readAsString();
    expect(backendRoutesContent, contains("..get('/lookups/<fieldKey>'"));
  });
}