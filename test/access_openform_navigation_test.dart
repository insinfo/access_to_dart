import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

Future<Map<String, dynamic>> navigationFixture() async {
  final project =
      await AccessSrcReader().readDirectory('fixtures/SIGAsul.accdb.src');
  const names = [
    'FrmAtendimento',
    'FrmBenefEmergencial',
    'FrmBeneficios',
    'FrmEncaminhamento'
  ];
  return jsonDecode(jsonEncode({
    'schema_version': '1',
    'source': 'SIGAsul.accdb',
    'format': 'ACCDB',
    'tables': [
      for (final name in [
        'TbAtend',
        'TbBeneficioEmergencial',
        'TbBeneficiosMunicipais',
        'TbEncaminhamento'
      ])
        {
          'name': name,
          'columns': [
            {'name': 'Id', 'typeName': 'Long', 'typeCode': 4}
          ],
          'indexes': [],
          'sampleRows': []
        }
    ],
    'forms': project.forms
        .where((f) => names.contains(f.name))
        .map((f) => f.toJson())
        .toList()
  })) as Map<String, dynamic>;
}

Future<Directory> generateNavigation(Map<String, dynamic> data) async {
  final temp = await Directory.systemTemp.createTemp('openform_navigation_');
  addTearDown(() => temp.delete(recursive: true));
  final input = File('${temp.path}/analysis.json');
  await input.writeAsString(jsonEncode(data));
  final errors = StringBuffer();
  expect(
      await run([
        'generate',
        '--analysis',
        input.path,
        '--output',
        '${temp.path}/app'
      ], out: StringBuffer(), err: errors),
      0,
      reason: errors.toString());
  return Directory('${temp.path}/app');
}

Future<List<Map>> commands(Directory app, String table) async =>
    (jsonDecode(await File(
                '${app.path}/frontend/lib/src/modules/$table/access_commands.json')
            .readAsString()) as List)
        .cast<Map>();

Map control(Map<String, dynamic> data, String form, String controlName) =>
    (((data['forms'] as List)
            .cast<Map>()
            .singleWhere((f) => f['name'] == form)['controls']) as List)
        .cast<Map>()
        .singleWhere((c) => c['name'] == controlName);

void main() {
  test(
      'macro real SIGAsul gera navegacao parcial e explicita destinos indisponiveis',
      () async {
    final app = await generateNavigation(await navigationFixture());
    final atendimento = await commands(app, 'tb_atend');
    final open = atendimento.singleWhere((c) => c['control'] == 'Comando703');
    expect(open['destination'], 'FrmBenefEmergencial');
    expect(open['status'], 'partial_navigation');
    expect(open['href'], '#/access-form/tb-beneficio-emergencial');
    expect(
        atendimento.singleWhere((c) => c['control'] == 'Comando673')['status'],
        'unsupported',
        reason: 'Nao descarta filtro original do destino FrmEncaminhamento.');
    final beneficios = await commands(app, 'tb_beneficios_municipais');
    expect(
        beneficios.singleWhere((c) => c['control'] == 'Comando674')['status'],
        'unsupported',
        reason: 'Formulario de impressoes nao corresponde a modulo CRUD.');
    final html = await File(
            '${app.path}/frontend/lib/src/modules/tb_atend/pages/incluir_tb_atend/incluir_tb_atend_page.html')
        .readAsString();
    expect(html, contains('href="#/access-form/tb-beneficio-emergencial"'));
    expect(html, contains('Eventos de abertura'));
    final shell = await File('${app.path}/frontend/lib/app_component.dart')
        .readAsString();
    expect(shell, contains('_moduleRoutes.contains(route)'));
    expect(shell, contains('window.onHashChange'));
    expect(shell, contains('ngOnDestroy'));
    expect(shell, isNot(contains('eval(')));
  });

  test('condicao e filtros nao geram navegacao', () async {
    final data = await navigationFixture();
    final open = control(data, 'FrmAtendimento', 'Comando703');
    final steps = open['macroDefinitions']['OnClickEmMacro'] as List;
    (steps.first as Map)['condition'] = '[Autorizado]=True';
    final filtered = control(data, 'FrmAtendimento', 'Comando673');
    final filteredSteps =
        filtered['macroDefinitions']['OnClickEmMacro'] as List;
    (filteredSteps.first as Map)['arguments'][3] = '[Id]=1';
    open['caption'] = r'<script>alert("$x")</script>';
    final app = await generateNavigation(data);
    final list = await commands(app, 'tb_atend');
    expect(list.singleWhere((c) => c['control'] == 'Comando703')['status'],
        'unsupported');
    expect(list.singleWhere((c) => c['control'] == 'Comando673')['status'],
        'unsupported');
    final html = await File(
            '${app.path}/frontend/lib/src/modules/tb_atend/pages/incluir_tb_atend/incluir_tb_atend_page.html')
        .readAsString();
    expect(html, isNot(contains('<script>')));
    expect(html, contains('&lt;script&gt;'));
  });
  for (final variant in [
    'missing-properties',
    'read-only',
    'alternate-form',
    'sequence'
  ]) {
    test('recusa OpenForm inseguro: $variant', () async {
      final data = await navigationFixture();
      final source = control(data, 'FrmAtendimento', 'Comando703');
      final steps = source['macroDefinitions']['OnClickEmMacro'] as List;
      final action =
          steps.cast<Map>().singleWhere((s) => s['action'] == 'OpenForm');
      final forms = (data['forms'] as List).cast<Map>();
      final target =
          forms.singleWhere((f) => f['name'] == 'FrmBenefEmergencial');
      if (variant == 'missing-properties') target.remove('properties');
      if (variant == 'read-only') (action['arguments'] as List)[4] = '2';
      if (variant == 'alternate-form') {
        final alternative = jsonDecode(jsonEncode(target)) as Map;
        alternative['name'] = 'OutroFormularioMesmaTabela';
        alternative['controls'] = [];
        (data['forms'] as List).add(alternative);
        (action['arguments'] as List)[0] = alternative['name'];
      }
      if (variant == 'sequence') {
        steps.add({
          'action': 'RunCommand',
          'arguments': ['97']
        });
      }
      final app = await generateNavigation(data);
      final list = await commands(app, 'tb_atend');
      expect(list.singleWhere((c) => c['control'] == 'Comando703')['status'],
          'unsupported');
    });
  }
}
