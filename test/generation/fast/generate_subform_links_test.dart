import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';
import '../support/subform_fixture.dart';

void main() {
  test('real Access export preserves family/person master-detail metadata',
      () async {
    final source =
        await AccessSrcReader().readDirectory('fixtures/SIGAsul.accdb.src');
    final subforms = source.forms
        .expand((f) => f.controls)
        .where((c) => c.type == 'Subform');
    expect(subforms, hasLength(14));
    final family = source.forms.singleWhere((f) => f.name == 'FrmCadGeral');
    final people = family.controls
        .singleWhere((c) => c.name == 'COMPOSIÇÃO FAMILIAR SUBFORM');
    expect(people.sourceObject, 'Form.COMPOSIÇÃO FAMILIAR SUBFORM');
    expect(people.linkMasterFields, 'CodFam');
    expect(people.linkChildFields, 'CodFam');
    expect(people.toJson()['sourceObject'], people.sourceObject);
    final updates = family.controls
        .singleWhere((c) => c.name == 'CadResidAtualizacao subformulário');
    expect(updates.linkMasterFields, 'CodFam');
    expect(updates.linkChildFields, 'CodCadResd');
  });

  for (final scenario in [
    'composite',
    'missing',
    'query',
    'filter',
    'unknown_field',
    'unknown_properties',
    'unbound',
    'ambiguous_form',
    'exact_form',
    'ambiguous_table',
    'exact_table',
    'exact_table_invalid_projection'
  ]) {
    test('subform scaffold $scenario is bound or explicitly unavailable',
        () async {
      final temp = await Directory.systemTemp.createTemp('subform_generate_');
      addTearDown(() => temp.delete(recursive: true));
      final data =
          jsonDecode(jsonEncode(subformFixture())) as Map<String, dynamic>;
      final parent = data['forms'][0] as Map;
      final control = parent['controls'][0] as Map;
      final child = data['forms'][1] as Map;
      if (scenario == 'ambiguous_form' || scenario == 'exact_form') {
        final other = jsonDecode(jsonEncode(child)) as Map;
        other['name'] = 'Frm Péssoas';
        other['properties'] = {'Filter': 'Family=999'};
        child['name'] = 'Frm-Pessoas';
        (data['forms'] as List).insert(1, other);
        control['sourceObject'] =
            scenario == 'exact_form' ? 'Form.frm-pessoas' : 'Form.FrmPessoas';
      }
      if (scenario == 'ambiguous_table' ||
          scenario == 'exact_table' ||
          scenario == 'exact_table_invalid_projection') {
        final other = jsonDecode(jsonEncode(data['tables'][1])) as Map;
        other['name'] = 'Pe-ssoa';
        (data['tables'] as List).insert(1, other);
        if (scenario == 'exact_table_invalid_projection') {
          (data['tables'][2]['columns'] as List)
              .removeWhere((c) => c['name'] == 'Data');
        }
        child['recordSource'] = scenario != 'ambiguous_table'
            ? 'SELECT Pessoa.ID, Pessoa.Family, Pessoa.Region, Pessoa.Nome, Pessoa.Data FROM Pessoa;'
            : 'Pe.ssoa';
      }

      if (scenario == 'unknown_properties') {
        child.remove('properties');
      }
      if (scenario == 'unbound') {
        child['controls'] = [];
      }
      if (scenario == 'missing') control['linkMasterFields'] = '';
      if (scenario == 'unknown_field') {
        control['linkChildFields'] = 'NoSuchField;Region';
      }
      if (scenario == 'query') child['recordSource'] += ' WHERE Family=1';
      if (scenario == 'filter') child['properties'] = {'Filter': 'Family=1'};
      final file = await writeSubformFixture(temp, data);
      final errors = StringBuffer();
      expect(
          await run([
            'generate',
            '--analysis',
            file.path,
            '--output',
            '${temp.path}/generated'
          ], out: StringBuffer(), err: errors),
          0,
          reason: errors.toString());
      final module = '${temp.path}/generated/frontend/lib/src/modules/familia';
      final specs =
          jsonDecode(await File('$module/access_subforms.json').readAsString())
              as List;
      expect(specs, hasLength(1));
      if (['composite', 'exact_form', 'exact_table'].contains(scenario)) {
        expect(specs.single['unsupportedReason'], isNull);
        expect(specs.single['childTable'], 'pessoa');
        expect(specs.single['links'], [
          {'master': 'scope', 'child': 'family'},
          {'master': 'area', 'child': 'region'},
        ]);
      } else {
        expect(specs.single['unsupportedReason'], isNotEmpty);
      }
      final html =
          await File('$module/pages/incluir_familia/incluir_familia_page.html')
              .readAsString();
      expect(html, contains('[parentId]="subformParentId"'));
      expect(html, contains('subformKey="subform_0"'));
      final panel = await File(
              '${temp.path}/generated/frontend/lib/src/shared/components/access_subform_panel.dart')
          .readAsString();
      expect(
          panel,
          contains(
              'Consulta vinculada aos dados salvos do registro principal'));

      final dart =
          await File('$module/pages/incluir_familia/incluir_familia_page.dart')
              .readAsString();
      expect(dart, contains('subformParentId = val?.id'));
      final backend = await File(
              '${temp.path}/generated/backend/lib/src/shared/access_subforms.dart')
          .readAsString();
      expect(backend, contains('if (value == null) return result'));
      expect(backend, contains('query.where'));
    });
  }
}
