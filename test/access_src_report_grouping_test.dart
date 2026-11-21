import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/analysis_overlay_merger.dart';
import 'package:test/test.dart';

void main() {
  test('exports reais preservam sort, group e OrderBy sem defaults', () async {
    final source =
        await AccessSrcReader().readDirectory('fixtures/SIGAsul.accdb.src');
    final grouped = source.reports.singleWhere(
        (r) => r.name == 'FICHA CADASTRO OU ATUALIZACAO BENEFICIO');
    final level = grouped.groupLevels.single.toJson();
    expect(level['controlSource'], 'MáxDeDATA ATUALIZ');
    expect(level['sortOrder'], 'NotDefault');
    expect(level['groupHeader'], 'NotDefault');
    expect(level['groupOn'], '3');
    expect(level['groupInterval'], isNull);
    expect(level['groupFooter'], isNull);
    final ordered = source.reports
        .singleWhere((r) => r.name == 'RLT SISC SCFV EXTERNO-GERAL');
    expect(ordered.orderBy, '[SISC EXTERNO RELATORIO GERAL].[nomeusuario]');
    expect(ordered.orderByOn, 'NotDefault');
    expect(grouped.orderBy, isNull);
    expect(grouped.orderByOn, isNull);
  });

  test('overlay preserva metadados binarios ausentes do export e ordem',
      () async {
    final dir = await Directory.systemTemp.createTemp('report_groups_');
    addTearDown(() => dir.delete(recursive: true));
    await Directory('${dir.path}/reports').create();
    await File('${dir.path}/reports/lista.bas').writeAsString('''Begin Report
  OrderBy ="[Nome] DESC"
  OrderByOn =0
  OrderByOnLoad = NotDefault
  Begin
    Begin BreakLevel
      ControlSource ="=Left([Nome],1)"
      GroupHeader = NotDefault
      GroupInterval =2
      FutureAccessProperty =17
    End
    Begin BreakLevel
      ControlSource ="Nome"
      SortOrder =0
      KeepTogether =2
    End
  End
End
''');
    await File('${dir.path}/reports/semGrupos.bas')
        .writeAsString('Begin Report\nEnd\n');
    final source = await AccessSrcReader().readDirectory(dir.path);
    final analysis = <String, dynamic>{
      'summary': {},
      'reports': [
        {
          'name': 'lista',
          'groupLevels': [
            {
              'binaryId': 17,
              'groupFooter': 'NotDefault',
              'properties': {'BinaryOnly': '2'}
            },
            {'binaryId': 18, 'controlSource': 'OldBinaryExpression'}
          ]
        },
        {
          'name': 'semGrupos',
          'orderBy': '[ID]',
          'orderByOn': 'NotDefault',
          'groupLevels': [
            {'controlSource': 'ID', 'binaryId': 19}
          ]
        }
      ]
    };
    AnalysisOverlayMerger().mergeSourceOverlay(analysis, source);
    final reports = (analysis['reports'] as List).cast<Map>();
    final report = reports.singleWhere((r) => r['name'] == 'lista');
    expect(report['orderBy'], '[Nome] DESC');
    expect(report['orderByOn'], '0');
    expect(report['orderByOnLoad'], 'NotDefault');
    final levels = (report['groupLevels'] as List).cast<Map>();
    expect(levels.map((l) => l['controlSource']), ['=Left([Nome],1)', 'Nome']);
    expect(levels.first['binaryId'], 17);
    expect(levels.first['groupFooter'], 'NotDefault');
    expect(levels.first['groupInterval'], '2');
    expect(levels.first['properties']['FutureAccessProperty'], '17');
    expect(levels.first['properties']['BinaryOnly'], '2');
    expect(levels.last['binaryId'], 18);
    expect(levels.last['sortOrder'], '0');
    expect(levels.last['keepTogether'], '2');
    final missing = reports.singleWhere((r) => r['name'] == 'semGrupos');
    expect(missing['orderBy'], '[ID]');
    expect(missing['orderByOn'], 'NotDefault');
    expect(missing['groupLevels'], [
      {'controlSource': 'ID', 'binaryId': 19}
    ]);
  });
}
