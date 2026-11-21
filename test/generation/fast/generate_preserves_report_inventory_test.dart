import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

void main() {
  test('generate preserva inventario completo e metadados de reports',
      () async {
    final reports = List<Map<String, Object?>>.generate(
        30, (index) => {'name': 'Report$index', 'catalogId': 100 + index});
    reports[0].addAll({
      'caption': 'Relatório "detalhado"\ncom acentuação',
      'recordSource': 'SELECT * FROM Cadastro ORDER BY Nome',
      'sections': [
        {'type': 'ReportHeader', 'name': 'Cabecalho', 'height': 500},
        {
          'type': 'Section',
          'name': 'Detalhe',
          'height': 300,
          'controls': [
            {'type': 'TextBox', 'name': 'txtNome'}
          ],
        },
      ],
      'controls': [
        {'type': 'Label', 'name': 'lblTitulo', 'caption': r'Total $'},
        {'type': 'TextBox', 'name': 'txtNome', 'controlSource': 'Nome'},
      ],
      'groupLevels': [
        {
          'controlSource': 'Cidade',
          'sortOrder': '0',
          'groupHeader': 'NotDefault'
        },
        {'controlSource': 'Nome', 'sortOrder': '1', 'groupInterval': '1'},
      ],
      'orderBy': '[Cidade], [Nome] DESC',
      'orderByOn': 'NotDefault',
      'orderByOnLoad': '0',
      'futureMetadata': {
        'flags': [1, 2],
        'unknown': null
      },
      'macros': {
        'OnFormat': ['DoSomething']
      },
    });
    reports[1].addAll({
      'sections': <Object?>[],
      'controls': [
        {'type': 'Label', 'name': 'Legenda'}
      ],
      'groupLevels': <Object?>[],
    });
    final overlay = [
      {
        'name': 'Report0',
        'sourceFile': 'reports/Report0.bas',
        'extra': 'preservar'
      },
    ];
    final canonical = [
      {
        'name': 'Report0',
        'components': {
          'controls': [
            {'name': 'txtNome'}
          ]
        },
        'futureCanonicalMetadata': true,
      },
    ];
    final root = await _generate({
      'reports': reports,
      'source_overlay': {'reports': overlay},
      'canonical_analysis': {'reports': canonical},
    });
    final artifact = await _readInventory(root);
    expect(artifact['artifact'], 'access_report_inventory');
    expect(artifact['analysis_schema_version'], '1.0');
    expect(artifact['status'], 'inventory_only');
    expect(artifact['renderer_generated'], isFalse);
    expect(artifact['reports'], equals(reports));
    expect(artifact['source_overlay_reports'], equals(overlay));
    expect(artifact['canonical_reports'], equals(canonical));
    expect((artifact['reports'] as List).last['name'], 'Report29');
    expect(artifact['summary'], {
      'sections': {'available_reports': 2, 'total': 2},
      'controls': {'available_reports': 2, 'total': 3},
      'groupLevels': {'available_reports': 2, 'total': 2},
    });
    final markdown =
        await File('${root.path}/conversion-report.md').readAsString();
    expect(markdown, contains('[access-reports.json](access-reports.json)'));
    expect(markdown, contains('Seções: `2` em `2` reports'));
    expect(markdown, contains('Controles: `3` em `2` reports'));
    expect(markdown, contains('Níveis de agrupamento: `2` em `2` reports'));
    expect(markdown, contains('não gera um renderer'));
    expect(
        markdown,
        isNot(contains(
            'extração estruturada de controles e secoes ainda precisa')));
  });

  test('catalogo sem estrutura nao afirma ausencia de controles', () async {
    final root = await _generate({
      'reports': [
        {'name': 'CatalogOnly'}
      ]
    });
    final artifact = await _readInventory(root);
    expect(artifact['reports'], [
      {'name': 'CatalogOnly'}
    ]);
    expect(
        artifact['summary']['controls'], {'available_reports': 0, 'total': 0});
    final markdown =
        await File('${root.path}/conversion-report.md').readAsString();
    expect(markdown,
        contains('Controles: não informados nos reports principais.'));
  });

  test('overlay sem catalogo principal tambem fica preservado', () async {
    final overlay = [
      {
        'name': 'OverlayOnly',
        'controls': [
          {'name': 'Campo'}
        ]
      }
    ];
    final root = await _generate({
      'source_overlay': {'reports': overlay}
    });
    final artifact = await _readInventory(root);
    expect(artifact['reports'], isEmpty);
    expect(artifact['source_overlay_reports'], equals(overlay));
    expect(artifact['canonical_reports'], isEmpty);
    expect(artifact['renderer_generated'], isFalse);
    final markdown =
        await File('${root.path}/conversion-report.md').readAsString();
    expect(markdown, contains('[access-reports.json](access-reports.json)'));
    expect(markdown, contains('não gera um renderer'));
  });
}

Future<Directory> _generate(Map<String, Object?> reportData) async {
  final temp =
      await Directory.systemTemp.createTemp('access_report_inventory_');
  addTearDown(() => temp.delete(recursive: true));
  final input = File('${temp.path}/analysis.json');
  await input.writeAsString(jsonEncode({
    'schema_version': '1.0',
    'source': 'reports.accdb',
    'format': 'VERSION_16',
    'tables': [],
    'linkedTables': [],
    'forms': [],
    ...reportData,
  }));
  final output = Directory('${temp.path}/generated');
  final errors = StringBuffer();
  expect(
      await run(['generate', '--analysis', input.path, '--output', output.path],
          out: StringBuffer(), err: errors),
      0,
      reason: errors.toString());
  return output;
}

Future<Map<String, dynamic>> _readInventory(Directory root) async =>
    jsonDecode(await File('${root.path}/access-reports.json').readAsString())
        as Map<String, dynamic>;
