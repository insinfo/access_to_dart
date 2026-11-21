import 'dart:convert';
import 'dart:io';
import 'package:test/test.dart';
import 'support/combo_column_fixture.dart';

void main() {
  Future<List> behaviors(Map<String, dynamic> data) async {
    final dir = await Directory.systemTemp.createTemp('combo_column_');
    addTearDown(() => dir.delete(recursive: true));
    final app = await generateComboColumn(data, dir);
    final json = jsonDecode(await File(
            '${app.path}/frontend/lib/src/modules/tb_atend/access_behaviors.json')
        .readAsString());
    return json['comboColumnAssignments'] as List;
  }

  test(
      'real procedure binds both source columns, retaining form RowSource override',
      () async {
    final b = await behaviors(await comboColumnFixture());
    expect(b.length, 1);
    expect(b.single['assignments'], [
      {'target': 'nome_func', 'column': 1, 'readOnly': true},
      {'target': 'funcao_funcionario', 'column': 2, 'readOnly': true}
    ]);
    expect(b.single['procedureSha256'], matches(RegExp(r'^[a-f0-9]{64}$')));
    expect(b.single['rowSource'], contains('FUNÇÃO NO SISTEMA'));
  });
  for (final variant in [
    'extra',
    'event',
    'index',
    'target',
    'bound',
    'projection',
    'duplicate',
    'unsupported-filter',
    'grouping',
    'descending'
  ]) {
    test('refuses incomplete procedure $variant', () async {
      final data = await comboColumnFixture();
      final f = data['forms'][0];
      final c =
          (f['controls'] as List).singleWhere((c) => c['name'] == 'CodFuncTXT');
      if (variant == 'extra') {
        f['rawVbaCode'] = f['rawVbaCode'].replaceFirst(
            'Private Sub CodFuncTXT_Click()',
            'Private Sub CodFuncTXT_Click()\nDoCmd.Close');
      }
      if (variant == 'event') c['events'].remove('OnClick');
      if (variant == 'index') {
        f['rawVbaCode'] = f['rawVbaCode']
            .replaceFirst('CodFuncTXT.Column(2)', 'CodFuncTXT.Column(9)');
      }
      if (variant == 'target') {
        f['rawVbaCode'] = f['rawVbaCode']
            .replaceFirst('Me.FuncaoFuncionarioTXT.Value', 'Me.Missing.Value');
      }
      if (variant == 'bound') c['properties']['BoundColumn'] = '2';
      if (variant == 'projection') {
        c['properties']['RowSource'] =
            'SELECT CodFunc, Nome, UCase(Nome) FROM TbCadFuncionario';
      }
      if (variant == 'unsupported-filter') {
        c['properties']['RowSource'] =
            'SELECT CodFunc, Nome, [FUNÇÃO NO SISTEMA] FROM TbCadFuncionario WHERE Nome <> "X"';
      }
      if (variant == 'grouping') {
        c['properties']['RowSource'] =
            'SELECT CodFunc, Nome, [FUNÇÃO NO SISTEMA] FROM TbCadFuncionario GROUP BY CodFunc, Nome, [FUNÇÃO NO SISTEMA]';
      }
      if (variant == 'descending') {
        c['properties']['RowSource'] =
            'SELECT CodFunc, Nome, [FUNÇÃO NO SISTEMA] FROM TbCadFuncionario ORDER BY CodFunc DESC';
      }
      if (variant == 'duplicate') {
        f['rawVbaCode'] += '\nPrivate Sub CodFuncTXT_Click()\nEnd Sub';
      }
      expect(await behaviors(data), isEmpty);
    });
  }
  test('persist isolated scaffold when requested', () async {
    final path = Platform.environment['ACCESS_COMBO_OUTPUT'];
    if (path != null) {
      await generateComboColumn(await comboColumnFixture(), Directory(path));
    }
  });
}
