import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('combo fixture extracts row source metadata from local combo fields', () async {
    if (!Platform.isWindows) {
      return;
    }

    final tempDir = await Directory.systemTemp.createTemp('access_combo_fixture_');
    addTearDown(() => tempDir.delete(recursive: true));

    final fixtureFile = File('${tempDir.path}${Platform.pathSeparator}combo_fixture.accdb');
    final analysisDir = Directory('${tempDir.path}${Platform.pathSeparator}analysis');

    await runCheckedProcess(
      'dart',
      ['run', 'tools/create_access_combo_fixture.dart', '--output', fixtureFile.path],
      description: 'create combo fixture accdb',
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
    final tables = (analysisJson['tables'] as List<dynamic>).cast<Map<String, dynamic>>();
    final comboTable = tables.singleWhere((table) => table['name'] == 'ComboMetadados');
    final columns = (comboTable['columns'] as List<dynamic>).cast<Map<String, dynamic>>();

    final categoria = columns.singleWhere((column) => column['name'] == 'Categoria');
    expect(categoria['rowSourceType'], 'Value List');
    expect(categoria['rowSource'], '"Ativo";"Inativo";"Pendente"');
    expect(categoria['displayControl'], 111);

    final pessoaSelecionada = columns.singleWhere((column) => column['name'] == 'PessoaSelecionada');
    expect(pessoaSelecionada['rowSourceType'], 'Table/Query');
    expect(pessoaSelecionada['rowSource'], contains('SELECT [PessoasLookup].[ID], [PessoasLookup].[Nome]'));
    expect(pessoaSelecionada['displayControl'], 111);

    final tags = columns.singleWhere((column) => column['name'] == 'Tags');
    expect(tags['rowSourceType'], 'Value List');
    expect(tags['rowSource'], '"Urgente";"Revisao";"Concluido"');
    expect(tags['allowMultipleValues'], isTrue);
    expect(tags['displayControl'], 111);
  }, timeout: const Timeout(Duration(minutes: 10)));
}