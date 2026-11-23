import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/analysis_overlay_merger.dart';
import 'package:test/test.dart';

void main() {
  test('analyze src e generate preservam propriedades multilinha do formulario',
      () async {
    final directory = await Directory.systemTemp.createTemp('src_scaffold_');
    addTearDown(() => directory.delete(recursive: true));
    final forms = await Directory('${directory.path}/source/forms')
        .create(recursive: true);
    await File('${forms.path}/DetalhesDoContato.bas').writeAsString(r'''
Version =20
Begin Form
    Caption ="Detalhes completos "
        "do contato"
    RecordSource ="Conta"
        "tos"
    Begin Section
        Name ="Detalhe"
        Begin
            Begin TextBox
                Name ="txtFirstName"
                ControlSource ="No"
                    "me"
                Caption ="Nome completo "
                    "para correspondência"
            End
        End
    End
End
''');
    final errors = StringBuffer();
    final analysisDirectory = '${directory.path}/analysis';
    expect(
        await run([
          'analyze',
          '--accdb',
          'fixtures/teste1/teste1.accdb',
          '--src',
          '${directory.path}/source',
          '--output',
          analysisDirectory,
        ], out: StringBuffer(), err: errors),
        0,
        reason: errors.toString());
    final analysisFile = File('$analysisDirectory/analysis.json');
    final analysis = jsonDecode(await analysisFile.readAsString()) as Map;
    final form = (analysis['forms'] as List)
        .cast<Map>()
        .singleWhere((form) => form['name'] == 'DetalhesDoContato');
    expect(form['caption'], 'Detalhes completos do contato');
    expect(form['recordSource'], 'Contatos');
    expect(form['id'], isA<int>(),
        reason: 'Preserva identidade do catálogo binário.');
    final control = (form['controls'] as List)
        .cast<Map>()
        .singleWhere((c) => c['name'] == 'txtFirstName');
    expect(control['controlSource'], 'Nome');
    expect(control['caption'], 'Nome completo para correspondência');

    final output = '${directory.path}/generated';
    expect(
        await run([
          'generate',
          '--analysis',
          analysisFile.path,
          '--output',
          output,
        ], out: StringBuffer(), err: errors),
        0,
        reason: errors.toString());
    final html = await File(
            '$output/frontend/lib/src/modules/contatos/pages/incluir_contatos/incluir_contatos_page.html')
        .readAsString();
    expect(html, contains('Nome completo para correspondência'));
    expect(html, contains("readField('nome')"));
  });

  test('overlay de forms preserva metadados binarios e propriedades ausentes',
      () {
    final analysis = <String, dynamic>{
      'forms': [
        {
          'name': 'Cadastro',
          'id': 12,
          'caption': 'Título binário',
          'recordSource': 'Pessoas',
          'controls': [
            {
              'name': 'txtNome',
              'type': 'Control',
              'controlSource': 'Nome',
              'caption': 'Nome antigo',
              'left': 100,
            },
            {'name': 'ApenasBinario', 'type': 'Label', 'caption': 'Mantido'},
          ],
        },
      ],
    };
    final source = AccessSrcProject(
      sourcePath: 'fixture.src',
      tables: [],
      queries: [],
      forms: [
        AccessSrcForm(
          name: 'cadastro',
          caption: null,
          recordSource: null,
          defaultView: null,
          controls: [
            AccessSrcControl(
              type: 'TextBox',
              name: 'txtNome',
              controlSource: null,
              caption: 'Nome completo',
              macros: {},
            ),
          ],
          macros: {},
        ),
      ],
    );
    AnalysisOverlayMerger().mergeSourceOverlay(analysis, source);
    final form = (analysis['forms'] as List).single as Map;
    expect(form['name'], 'Cadastro');
    expect(form['id'], 12);
    expect(form['caption'], 'Título binário');
    expect(form['recordSource'], 'Pessoas');
    final controls = (form['controls'] as List).cast<Map>();
    expect(controls, hasLength(2));
    expect(controls.first['type'], 'TextBox');
    expect(controls.first['caption'], 'Nome completo');
    expect(controls.first['controlSource'], 'Nome');
    expect(controls.first['left'], 100);
    expect(controls.last['name'], 'ApenasBinario');
  });
}
