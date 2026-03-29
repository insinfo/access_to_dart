import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('display control fixture extracts list box versus combo box metadata', () async {
    if (!Platform.isWindows) {
      return;
    }

    final tempDir = await Directory.systemTemp.createTemp('access_display_control_fixture_');
    addTearDown(() => tempDir.delete(recursive: true));

    final fixtureFile = File('${tempDir.path}${Platform.pathSeparator}display_control_fixture.accdb');
    final analysisDir = Directory('${tempDir.path}${Platform.pathSeparator}analysis');

    await runCheckedProcess(
      'dart',
      ['run', 'tools/create_access_display_control_fixture.dart', '--output', fixtureFile.path],
      description: 'create display control fixture accdb',
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
    final metaTable = tables.singleWhere((table) => table['name'] == 'DisplayControlMetadados');
    final columns = (metaTable['columns'] as List<dynamic>).cast<Map<String, dynamic>>();

    final categoriaCombo = columns.singleWhere((column) => column['name'] == 'CategoriaCombo');
    expect(categoriaCombo['displayControl'], 111);
    expect(categoriaCombo['rowSourceType'], 'Value List');
    expect(categoriaCombo['rowSource'], '"A";"B";"C"');

    final categoriaLista = columns.singleWhere((column) => column['name'] == 'CategoriaLista');
    expect(categoriaLista['displayControl'], 110);
    expect(categoriaLista['rowSourceType'], 'Value List');
    expect(categoriaLista['rowSource'], '"A";"B";"C"');

    final pessoaCombo = columns.singleWhere((column) => column['name'] == 'PessoaCombo');
    expect(pessoaCombo['displayControl'], 111);
    expect(pessoaCombo['rowSourceType'], 'Table/Query');
    expect(pessoaCombo['rowSource'], contains('SELECT [OrigemLookup].[ID], [OrigemLookup].[Descricao]'));

    final pessoaLista = columns.singleWhere((column) => column['name'] == 'PessoaLista');
    expect(pessoaLista['displayControl'], 110);
    expect(pessoaLista['rowSourceType'], 'Table/Query');
    expect(pessoaLista['rowSource'], contains('SELECT [OrigemLookup].[ID], [OrigemLookup].[Descricao]'));
  }, timeout: const Timeout(Duration(minutes: 10)));
}