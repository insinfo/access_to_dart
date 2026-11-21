import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/analysis_overlay_merger.dart';
import 'package:test/test.dart';

void main() {
  test('SIGAsul preserva destino e argumentos posicionais de macro no analysis',
      () async {
    final temp = await Directory.systemTemp.createTemp('src_behavior_');
    addTearDown(() => temp.delete(recursive: true));
    final forms =
        await Directory('${temp.path}/source/forms').create(recursive: true);
    await File('fixtures/SIGAsul.accdb.src/forms/FrmBeneficios.bas')
        .copy('${forms.path}/FrmBeneficios.bas');
    final errors = StringBuffer();
    expect(
        await run([
          'analyze',
          '--accdb',
          'fixtures/teste1/teste1.accdb',
          '--src',
          '${temp.path}/source',
          '--output',
          '${temp.path}/analysis'
        ], out: StringBuffer(), err: errors),
        0,
        reason: errors.toString());
    final analysis = jsonDecode(
            await File('${temp.path}/analysis/analysis.json').readAsString())
        as Map;
    for (final list in [
      analysis['forms'],
      analysis['source_overlay']['forms']
    ]) {
      final form = (list as List)
          .cast<Map>()
          .singleWhere((f) => f['name'] == 'FrmBeneficios');
      final control = (form['controls'] as List)
          .cast<Map>()
          .singleWhere((c) => c['name'] == 'Comando674');
      expect(control['macros']['OnClickEmMacro'], ['OpenForm']);
      final steps =
          (control['macroDefinitions']['OnClickEmMacro'] as List).cast<Map>();
      final action = steps.singleWhere((s) => s['action'] == 'OpenForm');
      expect(action['arguments'],
          ['Impressões Referentes a Benefícios', '0', '', '', '-1', '0']);
    }
  });

  test('SIGAsul preserva condicoes de erro e ligacoes VBA sem inferir execucao',
      () async {
    final project =
        await AccessSrcReader().readDirectory('fixtures/SIGAsul.accdb.src');
    var macroCount = 0;
    var actionCount = 0;
    var bindingCount = 0;
    for (final sourceForm in project.forms) {
      final json = sourceForm.toJson();
      for (final node in [json, ...(json['controls'] as List).cast<Map>()]) {
        final definitions = node['macroDefinitions'] as Map;
        macroCount += definitions.length;
        void countSteps(List steps) {
          for (final step in steps.cast<Map>()) {
            if (step['action'] != null) actionCount++;
            countSteps(step['children'] as List);
          }
        }

        for (final steps in definitions.values) {
          countSteps(steps as List);
        }
        bindingCount += (node['events'] as Map)
            .values
            .where((v) => v == '[Event Procedure]')
            .length;
      }
    }
    // Independent inventory of the checked-in SaveAsText fixture.
    expect(macroCount, 440);
    expect(actionCount, 611);
    expect(bindingCount, 296);
    expect(project.forms.where((f) => f.toJson()['rawVbaCode'] != null),
        hasLength(61));
    final form = project.forms
        .singleWhere((f) => f.name == 'FrmAcolhidaColetiva')
        .toJson();
    final controls = (form['controls'] as List).cast<Map>();
    final definitions = controls
        .where((c) => c['macroDefinitions'] is Map)
        .expand((c) => (c['macroDefinitions'] as Map).values)
        .expand((steps) => steps as List)
        .cast<Map>();
    final error =
        definitions.firstWhere((s) => s['condition'] == '[MacroError]<>0');
    expect(error['action'], 'MsgBox');
    expect(error['arguments'], isNotEmpty);
    final diario =
        project.forms.singleWhere((f) => f.name == 'DIARIO SUBFORM').toJson();
    expect(
        diario['rawVbaCode'],
        await File('fixtures/SIGAsul.accdb.src/forms/DIARIO SUBFORM.cls')
            .readAsString());
    expect(
        (diario['controls'] as List)
            .cast<Map>()
            .any((c) => (c['events'] as Map)['OnClick'] == '[Event Procedure]'),
        isTrue);
    final analysis = <String, dynamic>{
      'forms': [
        {
          'name': 'DIARIO SUBFORM',
          'id': 7,
          'events': {'OnTimer': '=Antigo()'}
        }
      ]
    };
    AnalysisOverlayMerger().mergeSourceOverlay(analysis, project);
    final merged = (analysis['forms'] as List)
        .cast<Map>()
        .singleWhere((f) => f['name'] == 'DIARIO SUBFORM');
    expect(merged['id'], 7);
    expect(merged['events']['OnTimer'], '=Antigo()');
    expect(merged['rawVbaCode'], diario['rawVbaCode']);
  });
}
