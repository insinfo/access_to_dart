import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/analysis_overlay_merger.dart';
import 'package:test/test.dart';

void main() {
  test('reports reais chegam ao analysis e inventario gerado com secoes',
      () async {
    final dir = await Directory.systemTemp.createTemp('src_reports_');
    addTearDown(() => dir.delete(recursive: true));
    final errors = StringBuffer();
    expect(
        await run([
          'analyze',
          '--accdb',
          'fixtures/teste1/teste1.accdb',
          '--src',
          'fixtures/teste1/teste1.accdb.src',
          '--output',
          '${dir.path}/analysis'
        ], out: StringBuffer(), err: errors),
        0,
        reason: errors.toString());
    final analysisFile = File('${dir.path}/analysis/analysis.json');
    final analysis = jsonDecode(await analysisFile.readAsString()) as Map;
    final reports = (analysis['reports'] as List).cast<Map>();
    expect(reports, hasLength(4));
    final report = reports.singleWhere((r) => r['name'] == 'ListaDeContatos');
    expect(report['id'], isA<int>());
    expect(report['caption'], 'Contact List');
    expect(report['recordSource'], 'Contatos');
    final levels = (report['groupLevels'] as List).cast<Map>();
    expect(levels.map((level) => level['controlSource']),
        ['=Left([Sobrenome],1)', 'Sobrenome', 'Nome']);
    expect(levels.first['groupHeader'], 'NotDefault');
    expect(levels.last['sortOrder'], isNull);
    final sections = (report['sections'] as List).cast<Map>();
    expect(sections.map((s) => s['type']), [
      'FormHeader',
      'PageHeader',
      'BreakHeader',
      'Section',
      'PageFooter',
      'FormFooter'
    ]);
    final detail = sections.singleWhere((s) => s['name'] == 'Detalhe');
    final controls = (detail['controls'] as List).cast<Map>();
    expect(
        controls.singleWhere(
            (c) => c['name'] == 'txtEmailAddress')['controlSource'],
        'EndereçoDeEmail');
    expect(
        controls.any((c) => (c['name'] as String).startsWith('zecEmptyCell')),
        isFalse);
    expect(
        await run([
          'generate',
          '--analysis',
          analysisFile.path,
          '--output',
          '${dir.path}/generated'
        ], out: StringBuffer(), err: errors),
        0,
        reason: errors.toString());
    final generated = await Directory('${dir.path}/generated')
        .list(recursive: true)
        .where((f) => f is File && f.path.endsWith('conversion-report.md'))
        .cast<File>()
        .toList();
    expect(generated, hasLength(1));
    expect(await generated.single.readAsString(), contains('ListaDeContatos'));
    final inventories = await Directory('${dir.path}/generated')
        .list(recursive: true)
        .where((f) => f is File && f.path.endsWith('access-reports.json'))
        .cast<File>()
        .toList();
    expect(inventories, hasLength(1));
    final inventory =
        jsonDecode(await inventories.single.readAsString()) as Map;
    final generatedReport = (inventory['reports'] as List)
        .cast<Map>()
        .singleWhere((r) => r['name'] == 'ListaDeContatos');
    expect(generatedReport['groupLevels'], levels);
    expect(generatedReport['sections'], sections);
    expect(inventory['renderer_generated'], isFalse);
  });

  test('overlay reports preserva metadados e ordem sem tabelas', () async {
    final dir = await Directory.systemTemp.createTemp('report_overlay_');
    addTearDown(() => dir.delete(recursive: true));
    await Directory('${dir.path}/reports').create();
    await File('${dir.path}/reports/lista.bas').writeAsString('''Begin Report
  Begin Section
    Name ="Detalhe"
    Height =120
    Begin TextBox
      Name ="txtNome"
      Caption ="Nome completo"
    End
  End
End
''');
    final source = await AccessSrcReader().readDirectory(dir.path);
    final analysis = <String, dynamic>{
      'summary': {},
      'reports': [
        {
          'name': 'Lista',
          'id': 42,
          'caption': 'Título',
          'recordSource': 'Pessoas',
          'sections': [
            {
              'name': 'Detalhe',
              'type': 'Section',
              'id': 7,
              'width': 1000,
              'controls': [
                {
                  'name': 'txtNome',
                  'type': 'Control',
                  'controlSource': 'Nome',
                  'left': 22
                }
              ]
            }
          ]
        },
        {'name': 'SomenteBinario', 'id': 43}
      ]
    };
    AnalysisOverlayMerger().mergeSourceOverlay(analysis, source);
    final reports = (analysis['reports'] as List).cast<Map>();
    expect(reports.map((r) => r['name']), ['Lista', 'SomenteBinario']);
    final report = reports.first;
    expect(report['id'], 42);
    expect(report['caption'], 'Título');
    expect(report['recordSource'], 'Pessoas');
    final section = (report['sections'] as List).single as Map;
    expect(section['id'], 7);
    expect(section['width'], 1000);
    expect(section['height'], 120);
    final control = (section['controls'] as List).single as Map;
    expect(control['left'], 22);
    expect(control['controlSource'], 'Nome');
    expect(control['caption'], 'Nome completo');
    expect(control['type'], 'TextBox');
    expect(analysis['summary']['reports'], 2);
  });
}
