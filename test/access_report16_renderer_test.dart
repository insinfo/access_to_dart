import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/access_query_contract.dart';
import 'package:access_to_dart/src/analysis_overlay_merger.dart';
import 'package:crypto/crypto.dart';
import 'package:test/test.dart';

const _cspront1BoolColumns = <String>[
  'Resid Propria',
  'Resid Alugada',
  'Resid Cedida',
  'Resid Ocupada',
  'Alvenaria/madeira aparelhada',
  'Madeira aproveitada/taipa/outros',
  'Medidor proprio',
  'Medidor compart',
  'Sem Medidor',
  'Sem energia eletrica',
  'Agua canalizada',
  'Abast Rede geral',
  'Poço/Nascente',
  'Cisterna/Captação',
  'Carro pipa',
  'Outra forma abast',
  'Rede Coletora esgoto',
  'Fossa septica',
  'Fossa rudimentar',
  'Vala Rio Lago',
  'Sem banheiro',
  'Coleta lixo direta',
  'Coleta lixo indireta',
  'Sem Coleta lixo',
  'Domicilio tem acessib total',
  'Domicilio tem acessib interno',
  'Domicilio sem acessib',
  'Area de risco',
  'Area dif acesso geografico',
  'Area violencia',
];

const _cspront1ReportNames = <String>[
  'prontuario1',
  'prontuario3-composicao-texto',
  'prontuario4-Condi-Habit',
  'prontuario5-Condi-TRAB-RENDA-TEXTO',
  'prontuario6-Condi-SAUDE-TEXTO',
  'prontuario7-Beneficios-FRENTE-VERSO',
  'prontuario8-Condi-Educ-TEXTO',
  'prontuario9-ConvFamilComun-frente-verso',
  'prontuario10-serv-progr-projetos-fr-verso',
  'prontuario11-violenc-violacoes-fr-verso',
  'prontuario12-mse-frente-verso',
  'prontuario13-planej-evolu-frente-verso',
  'prontuario14-planej-evolu-frente-verso-2',
  'prontuario15-planej-evol-IMPRIMIR-FR-VERSO',
  'prontuario16-REGISTRO-SINTETICO-FR-VERSO',
];

const _unboundMultiSectionReportNames = <String>[
  'PROSPECTO DE BUSCA ATIVA IMPRIMIR',
  'PLANO SOCIO FAMILIAR',
  'PLANO SOCIO FAMILIAR MEDIAÇÃO',
  'PLANO SOCIO FAMILIAR-CONTINUAÇÃO',
];

Map<String, dynamic> _buildCspront1Analysis({
  required List<Map<String, dynamic>> reports,
  bool includeHabitColumns = false,
}) {
  const sourceHash =
      '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef';
  final extraSelect = includeHabitColumns
      ? ', CadResidencia.[Nº Comodos], CadResidencia.[Nº Dormitorios], CadResidencia.[Nº pessoas/Dormitorio], '
          '${_cspront1BoolColumns.map((c) => 'CadResidencia.[$c]').join(', ')}, '
          'CadResidencia.CRAS, TbUnidade.[Nº UNIDADE]'
      : '';
  final querySql =
      'SELECT CadResidencia.CodFam, TbPessoa.NOME, TbUnidade.NOME$extraSelect FROM (TbUnidade INNER JOIN CadResidencia ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]) INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam WHERE (((CadResidencia.CodFam)=[Formulários]![FormProntuario]![CodFamTxt]) AND ((CadResidencia.DataDesligResid) Is Null) AND ((TbPessoa.DataDesligPes) Is Null) AND ((TbPessoa.Parentesco)="Pessoa de Referencia"))';

  final cadColumns = <Map<String, dynamic>>[
    {'name': 'CodFam', 'typeCode': 4, 'typeName': 'Long', 'isRequired': true},
    {'name': 'CRAS Origem', 'typeCode': 4, 'typeName': 'Long'},
    {'name': 'DataDesligResid', 'typeCode': 8, 'typeName': 'DateTime'},
    if (includeHabitColumns) ...[
      {'name': 'Nº Comodos', 'typeCode': 4, 'typeName': 'Long'},
      {'name': 'Nº Dormitorios', 'typeCode': 4, 'typeName': 'Long'},
      {'name': 'Nº pessoas/Dormitorio', 'typeCode': 4, 'typeName': 'Long'},
      for (final col in _cspront1BoolColumns)
        {'name': col, 'typeCode': 1, 'typeName': 'Boolean'},
      {'name': 'CRAS', 'typeCode': 1, 'typeName': 'Boolean'},
    ],
  ];

  final analysis = <String, dynamic>{
    'schema_version': '1.0',
    'source': 'synthetic_sigasul.accdb',
    'format': 'VERSION_16',
    'summary': <String, dynamic>{},
    'tables': [
      {
        'name': 'TbUnidade',
        'rowCount': 1,
        'columns': [
          {
            'name': 'CodUnidade',
            'typeCode': 4,
            'typeName': 'Long',
            'isRequired': true
          },
          {
            'name': 'NOME',
            'typeCode': 10,
            'typeName': 'Text',
            'maxLength': 255
          },
          if (includeHabitColumns)
            {
              'name': 'Nº UNIDADE',
              'typeCode': 10,
              'typeName': 'Text',
              'maxLength': 50,
            },
        ],
        'indexes': [
          {
            'name': 'PrimaryKey',
            'isPrimaryKey': true,
            'isUnique': true,
            'columns': [
              {'name': 'CodUnidade'}
            ]
          }
        ]
      },
      {
        'name': 'CadResidencia',
        'rowCount': 1,
        'columns': cadColumns,
        'indexes': [
          {
            'name': 'PrimaryKey',
            'isPrimaryKey': true,
            'isUnique': true,
            'columns': [
              {'name': 'CodFam'}
            ]
          }
        ]
      },
      {
        'name': 'TbPessoa',
        'rowCount': 1,
        'columns': [
          {
            'name': 'CodPessoa',
            'typeCode': 4,
            'typeName': 'Long',
            'isRequired': true
          },
          {'name': 'CodFam', 'typeCode': 4, 'typeName': 'Long'},
          {
            'name': 'NOME',
            'typeCode': 10,
            'typeName': 'Text',
            'maxLength': 255
          },
          {
            'name': 'Parentesco',
            'typeCode': 10,
            'typeName': 'Text',
            'maxLength': 100
          },
          {'name': 'DataDesligPes', 'typeCode': 8, 'typeName': 'DateTime'},
        ],
        'indexes': [
          {
            'name': 'PrimaryKey',
            'isPrimaryKey': true,
            'isUnique': true,
            'columns': [
              {'name': 'CodPessoa'}
            ]
          }
        ]
      },
    ],
    'linkedTables': <Object?>[],
    'relationships': <Object?>[],
    'queries': [
      {'name': 'CSPRONT1', 'sqlText': querySql}
    ],
    'forms': <Object?>[],
    'reports': reports,
  };

  final contractCols = <Map<String, dynamic>>[
    {'ordinal': 0, 'name': 'CodFam', 'daoType': 4},
    {'ordinal': 1, 'name': 'TbPessoa.NOME', 'daoType': 10},
    {'ordinal': 2, 'name': 'TbUnidade.NOME', 'daoType': 10},
    if (includeHabitColumns) ...[
      {'ordinal': 3, 'name': 'Nº Comodos', 'daoType': 4},
      {'ordinal': 4, 'name': 'Nº Dormitorios', 'daoType': 4},
      {'ordinal': 5, 'name': 'Nº pessoas/Dormitorio', 'daoType': 4},
      for (var i = 0; i < _cspront1BoolColumns.length; i++)
        {'ordinal': 6 + i, 'name': _cspront1BoolColumns[i], 'daoType': 1},
      {
        'ordinal': 6 + _cspront1BoolColumns.length,
        'name': 'CRAS',
        'daoType': 1,
      },
      {
        'ordinal': 7 + _cspront1BoolColumns.length,
        'name': 'Nº UNIDADE',
        'daoType': 10,
      },
    ],
  ];

  attachDaoQueryContract(
    analysis,
    {
      'queryName': 'CSPRONT1',
      'readOnly': true,
      'sourceSha256': sourceHash,
      'sqlSha256': accessQuerySqlHash(querySql),
      'parameters': [
        {
          'name': '[Formulários]![FormProntuario]![CodFamTxt]',
          'daoType': 10,
        }
      ],
      'columns': contractCols,
    },
    actualSourceHash: sourceHash,
    asciiCaseInsensitiveText: true,
  );
  return analysis;
}

void main() {
  test(
      'report16 compiles into bounded read-only renderer matching Access presentation',
      () async {
    const name = 'prontuario16-REGISTRO-SINTETICO-FR-VERSO';
    const origin = 'fixtures/SIGAsul.accdb.src';
    const sourceHash =
        '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef';
    final temp = await Directory.systemTemp.createTemp('report16_renderer_');
    addTearDown(() => temp.delete(recursive: true));

    final sourceDir = Directory('${temp.path}/source');
    await Directory('${sourceDir.path}/reports').create(recursive: true);
    await Directory('${sourceDir.path}/images').create(recursive: true);
    for (final path in [
      'reports/$name.bas',
      'reports/$name.json',
      'images/logo-SUAS-ICON.json',
      'images/logo-SUAS-ICON.png',
    ]) {
      await File('$origin/$path').copy('${sourceDir.path}/$path');
    }

    final source = await AccessSrcReader().readDirectory(sourceDir.path);
    final analysis = _buildCspront1Analysis(
      reports: [
        {'name': name, 'id': 999},
        {
          'name': 'ReportComModule',
          'hasModule': true,
          'recordSource': 'CSPRONT1',
          'sourceSha256': sourceHash,
        },
        {
          'name': 'ReportComEvento',
          'recordSource': 'CSPRONT1',
          'sourceSha256': sourceHash,
          'properties': {'Width': '11022', 'OnOpen': '[Event Procedure]'},
        },
        {
          'name': 'ReportComGrupo',
          'recordSource': 'CSPRONT1',
          'sourceSha256': sourceHash,
          'properties': {'Width': '11022'},
          'groupLevels': [
            {'controlSource': 'CodFam'}
          ],
        },
        {
          'name': 'ReportQueryDesconhecida',
          'recordSource': 'QueryNaoCompilada',
          'sourceSha256': sourceHash,
          'properties': {'Width': '11022'},
        },
      ],
    );

    analysis['source_overlay'] = source.toJson();
    AnalysisOverlayMerger().mergeSourceOverlay(analysis, source);

    final analysisFile = File('${temp.path}/analysis.json');
    await analysisFile.writeAsString(jsonEncode(analysis));

    final appDir = Directory('${temp.path}/app');
    final errors = StringBuffer();
    expect(
      await run(
        ['generate', '--analysis', analysisFile.path, '--output', appDir.path],
        out: StringBuffer(),
        err: errors,
      ),
      0,
      reason: '$errors',
    );

    final inventory = jsonDecode(
      await File('${appDir.path}/access-reports.json').readAsString(),
    ) as Map<String, dynamic>;
    expect(inventory['status'], 'partial_compiled_renderer');
    expect(inventory['renderer_generated'], isTrue);

    final compiled = (inventory['compiled_reports'] as List).cast<Map>();
    expect(compiled, hasLength(1));
    final report = compiled.single;
    expect(report['key'], 'prontuario_16_registro_sintetico_fr_verso');
    expect(report['queryKey'], 'cspront1');
    expect(report['pageSetup']['widthTwips'], 11022);
    expect(report['pageSetup']['detailHeightTwips'], 15285);
    expect(report['pageSetup']['leftMarginTwips'], 454);
    expect(report['pageSetup']['rightMarginTwips'], 240);
    expect(report['pageSetup']['topMarginTwips'], 240);
    expect(report['pageSetup']['bottomMarginTwips'], 792);

    final controls = (report['controls'] as List).cast<Map>();
    expect(controls, hasLength(38));

    final byName = <String, Map>{
      for (final c in controls) c['name'] as String: c,
    };
    expect(byName['Rótulo60']!['backColorHex'], '#bac19f');
    expect(byName['Rótulo60']!['borderStyle'], 1);
    expect(byName['Rótulo60']!['borderColorHex'], '#000000');
    expect(byName['CadResidencia.CodFam']!['backColorHex'], '#feefdf');
    expect(byName['CadResidencia.CodFam']!['columnOrdinal'], 0);
    expect(byName['Nome']!['columnOrdinal'], 1);
    expect(byName['Nome']!['format'], '>');
    expect(byName['Imagem96']!['assetName'], 'logo-SUAS-ICON.png');
    expect(byName['Imagem96']!['sizeMode'], 3);
    expect(byName['Caixa65']!['type'], 'Rectangle');
    expect(byName['Caixa65']!['backStyle'], 0);
    expect(byName['Caixa65']!['borderStyle'], 1);
    expect(byName['Caixa65']!['borderColorHex'], '#a6a6a6');

    final diagnostics = (inventory['report_diagnostics'] as List).cast<Map>();
    expect(
      diagnostics.singleWhere((d) => d['report'] == 'ReportComModule')['reason'],
      'has-vba-macros-or-events',
    );
    expect(
      diagnostics.singleWhere((d) => d['report'] == 'ReportComEvento')['reason'],
      'has-vba-macros-or-events',
    );
    expect(
      diagnostics.singleWhere((d) => d['report'] == 'ReportComGrupo')['reason'],
      'unsupported-group-levels',
    );
    expect(
      diagnostics
          .singleWhere((d) => d['report'] == 'ReportQueryDesconhecida')['reason'],
      'record-source-not-compiled-query',
    );

    final viewerHtml = await File(
            '${appDir.path}/frontend/lib/src/shared/components/access_report_viewer.html')
        .readAsString();
    final viewerScss = await File(
            '${appDir.path}/frontend/lib/src/shared/components/access_report_viewer.scss')
        .readAsString();
    final appHtml =
        await File('${appDir.path}/frontend/lib/app_component.html')
            .readAsString();
    final appDart =
        await File('${appDir.path}/frontend/lib/app_component.dart')
            .readAsString();

    expect(viewerHtml, isNot(contains('[style]')));
    expect(RegExp(r'(?<!\[attr\.)data-access-').hasMatch(viewerHtml), isFalse);
    expect(viewerHtml, contains('[attr.data-access-control]'));
    expect(viewerHtml, contains('|__| Sim\u00A0\u00A0\u00A0'));
    expect(
        viewerHtml,
        contains(
            '/api/v1/access-reports/prontuario_16_registro_sintetico_fr_verso/assets/logo-SUAS-ICON.png'));
    expect(
        viewerScss,
        contains(
            '.access-report-sheet-prontuario_16_registro_sintetico_fr_verso'));
    expect(viewerScss, isNot(contains('word-break: break-word')));
    expect(
        viewerScss,
        contains(
            '.access-report-ctrl-prontuario_16_registro_sintetico_fr_verso-0'));
    expect(
        viewerScss,
        contains(
            '.access-report-ctrl-prontuario_16_registro_sintetico_fr_verso-37'));
    expect(appHtml, contains('<access-report-viewer'));
    expect(appDart, contains('#/access-report/'));

    await File('${sourceDir.path}/images/logo-SUAS-ICON.png').delete();
    final missingDir = Directory('${temp.path}/app_missing');
    expect(
      await run(
        [
          'generate',
          '--analysis',
          analysisFile.path,
          '--output',
          missingDir.path,
        ],
        out: StringBuffer(),
        err: StringBuffer(),
      ),
      0,
    );
    final missingInventory = jsonDecode(
      await File('${missingDir.path}/access-reports.json').readAsString(),
    ) as Map<String, dynamic>;
    expect(missingInventory['renderer_generated'], isFalse);
    expect(missingInventory['compiled_reports'], isEmpty);
    final actualImageSha = sha256
        .convert(await File('$origin/images/logo-SUAS-ICON.png').readAsBytes())
        .toString();
    expect((report['assets'] as List).single['sha256'], actualImageSha);
  });

  test(
      'all 15 CSPRONT1 and 4 unbound multi-section reports compile with 2255 controls matching 852-control COM oracle',
      () async {
    const origin = 'fixtures/SIGAsul.accdb.src';
    const sourceHash =
        '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef';
    final temp = await Directory.systemTemp.createTemp('cspront1_all_reports_');
    addTearDown(() => temp.delete(recursive: true));

    final sourceDir = Directory('${temp.path}/source');
    await Directory('${sourceDir.path}/reports').create(recursive: true);
    await Directory('${sourceDir.path}/images').create(recursive: true);
    await Directory('${sourceDir.path}/themes').create(recursive: true);
    for (final path in [
      'dbs-properties.json',
      'themes/Tema do Office.thmx',
      'images/logo-SUAS-ICON.json',
      'images/logo-SUAS-ICON.png',
      'images/suas-sistema-unico-de-saude-logo-1889E2CF64-seeklogo_com.json',
      'images/suas-sistema-unico-de-saude-logo-1889E2CF64-seeklogo_com.png',
      for (final name in _cspront1ReportNames) ...[
        'reports/$name.bas',
        'reports/$name.json',
      ],
      for (final name in _unboundMultiSectionReportNames) ...[
        'reports/$name.bas',
        'reports/$name.json',
      ],
    ]) {
      await File('$origin/$path').copy('${sourceDir.path}/$path');
    }

    final allNames = [
      ..._cspront1ReportNames,
      ..._unboundMultiSectionReportNames,
    ];
    final source = await AccessSrcReader().readDirectory(sourceDir.path);
    final analysis = _buildCspront1Analysis(
      reports: [
        for (var i = 0; i < allNames.length; i++)
          {'name': allNames[i], 'id': i + 1},
        {
          'name': 'ReportComboMultiCol',
          'recordSource': 'CSPRONT1',
          'sourceSha256': sourceHash,
          'properties': {'Width': '11022'},
          'printSettings': {
            'Items': {
              'Margins': {
                'LeftMargin': 0.3,
                'RightMargin': 0.2,
                'TopMargin': 0.2,
                'BotMargin': 0.5,
              },
              'Printer': {'Orientation': 'Portrait', 'PaperSize': 'A4'},
            },
          },
          'sections': [
            {
              'type': 'Section',
              'name': 'Detalhe',
              'height': 1000,
              'controls': [
                {
                  'type': 'ComboBox',
                  'name': 'ComboMultiCol',
                  'controlSource': 'CodFam',
                  'properties': {
                    'Left': '100',
                    'Top': '100',
                    'Width': '1000',
                    'Height': '300',
                    'ControlSource': 'CodFam',
                    'ColumnCount': '2',
                    'BoundColumn': '1',
                    'ColumnWidths': '0;1440',
                  },
                }
              ],
            }
          ],
        },
        {
          'name': 'ReportUnboundWithBoundField',
          'sourceSha256': sourceHash,
          'properties': {'Width': '11022'},
          'printSettings': {
            'Items': {
              'Margins': {
                'LeftMargin': 0.3,
                'RightMargin': 0.2,
                'TopMargin': 0.2,
                'BotMargin': 0.5,
              },
              'Printer': {'Orientation': 'Portrait', 'PaperSize': 'A4'},
            },
          },
          'sections': [
            {
              'type': 'Section',
              'name': 'Detalhe',
              'height': 1000,
              'controls': [
                {
                  'type': 'TextBox',
                  'name': 'CampoLigado',
                  'controlSource': 'CodFam',
                  'properties': {
                    'Left': '100',
                    'Top': '100',
                    'Width': '1000',
                    'Height': '300',
                    'ControlSource': 'CodFam',
                  },
                }
              ],
            }
          ],
        },
        {
          'name': 'ReportMacroNaoCosmetica',
          'sourceSha256': sourceHash,
          'properties': {'Width': '11022'},
          'macros': {
            'OnOpenEmMacro': ['OpenForm'],
          },
          'macroDefinitions': {
            'OnOpenEmMacro': [
              {
                'type': '_Anonymous',
                'action': 'OpenForm',
                'condition': null,
                'arguments': ['OutraTela'],
                'properties': <String, Object?>{},
                'children': <Object?>[],
              }
            ],
          },
        },
      ],
      includeHabitColumns: true,
    );
    analysis['source_overlay'] = source.toJson();
    AnalysisOverlayMerger().mergeSourceOverlay(analysis, source);

    final analysisFile = File('${temp.path}/analysis.json');
    await analysisFile.writeAsString(jsonEncode(analysis));

    final appDir = Directory('${temp.path}/app');
    final errors = StringBuffer();
    expect(
      await run(
        ['generate', '--analysis', analysisFile.path, '--output', appDir.path],
        out: StringBuffer(),
        err: errors,
      ),
      0,
      reason: '$errors',
    );

    final inventory = jsonDecode(
      await File('${appDir.path}/access-reports.json').readAsString(),
    ) as Map<String, dynamic>;
    final compiled = (inventory['compiled_reports'] as List).cast<Map>();
    expect(compiled, hasLength(19));
    final totalControls = compiled.fold<int>(
      0,
      (sum, r) => sum + (r['controls'] as List).length,
    );
    expect(totalControls, 2255);

    final diagnostics = (inventory['report_diagnostics'] as List).cast<Map>();
    expect(
      diagnostics
          .singleWhere((d) => d['report'] == 'ReportComboMultiCol')['reason'],
      'unsupported-combobox-lookup:ComboMultiCol',
    );
    expect(
      diagnostics.singleWhere(
          (d) => d['report'] == 'ReportUnboundWithBoundField')['reason'],
      'missing-record-source',
    );
    expect(
      diagnostics
          .singleWhere((d) => d['report'] == 'ReportMacroNaoCosmetica')['reason'],
      'has-vba-macros-or-events',
    );

    final byKey = <String, Map>{
      for (final r in compiled) r['key'] as String: r,
    };
    final r1 = byKey['prontuario_1']!;
    final r1Controls = (r1['controls'] as List).cast<Map>();
    expect(r1Controls, hasLength(159));
    final codResid = r1Controls.singleWhere((c) => c['name'] == 'CodResid');
    expect(codResid['type'], 'ComboBox');
    expect(codResid['controlType'], 111);
    expect(codResid['columnOrdinal'], 0);
    expect(codResid['foreColor'], 9917743);
    expect(
      r1Controls.singleWhere((c) => c['name'] == 'Rótulo10')['foreColor'],
      2316088,
    );

    final prospecto = byKey['prospecto_de_busca_ativa_imprimir']!;
    expect(prospecto['queryKey'], '');
    expect(prospecto['parameters'], isEmpty);
    expect(prospecto['pageSetup']['sheetHeightTwips'], 1695 + 7935 + 1045);
    final prospectoControls = (prospecto['controls'] as List).cast<Map>();
    expect(prospectoControls, hasLength(115));
    final linha291 =
        prospectoControls.singleWhere((c) => c['name'] == 'Linha291');
    expect(linha291['type'], 'Line');
    expect(linha291['controlType'], 102);
    expect(linha291['section'], 0);
    expect(linha291['top'], 1140);
    expect(linha291['sheetTop'], 1695 + 1140);
    expect(linha291['height'], 0);

    final plano = byKey['plano_socio_familiar']!;
    expect(plano['queryKey'], '');
    expect(plano['pageSetup']['onOpenWindowAction'], 'Maximize');
    final planoControls = (plano['controls'] as List).cast<Map>();
    expect(planoControls, hasLength(71));
    expect(
      planoControls.singleWhere((c) => c['name'] == 'Rótulo68')['foreColor'],
      6567968,
    );
    final r4 = byKey['prontuario_4_condi_habit']!;
    final r4Controls = (r4['controls'] as List).cast<Map>();
    expect(r4Controls, hasLength(169));
    expect(r4Controls.where((c) => c['type'] == 'CheckBox'), hasLength(30));
    expect(
      r4Controls.singleWhere((c) => c['name'] == 'Rótulo91')['left'],
      0,
    );

    final r6 = byKey['prontuario_6_condi_saude_texto']!;
    expect(r6['controls'], hasLength(48));
    expect(
      (r6['controls'] as List)
          .cast<Map>()
          .singleWhere((c) => c['name'] == 'Imagem96')['top'],
      0,
    );

    final r11 = byKey['prontuario_11_violenc_violacoes_fr_verso']!;
    final r11Controls = (r11['controls'] as List).cast<Map>();
    expect(r11Controls, hasLength(252));
    expect(
      r11Controls.singleWhere((c) => c['name'] == 'Rótulo56')['left'],
      0,
    );
    expect(
      r11Controls
          .singleWhere((c) => c['name'] == 'CadResidencia.CodFam')['columnOrdinal'],
      isNull,
    );

    final multiOracleFile =
        File('build/codex-report16-interactive/cspront1-multi-presentation.json');
    if (await multiOracleFile.exists()) {
      final multiOracle =
          jsonDecode(await multiOracleFile.readAsString()) as Map<String, dynamic>;
      final compiledByName = <String, Map>{
        for (final r in compiled) r['name'] as String: r,
      };
      for (final entry in (multiOracle['reports'] as List).cast<Map>()) {
        final name = entry['reportName'] as String;
        final generatedControls =
            (compiledByName[name]!['controls'] as List).cast<Map>();
        final oracleByName = <String, Map>{
          for (final c in (entry['controls'] as List).cast<Map>())
            c['name'] as String: c,
        };
        expect(generatedControls.length, oracleByName.length, reason: name);
        for (final c in generatedControls) {
          final oProps =
              (oracleByName[c['name']]!['properties'] as Map).cast<String, Map>();
          int oInt(String k) => (oProps[k]!['value'] as num).toInt();
          expect(c['controlType'], oInt('ControlType'),
              reason: '$name:${c['name']}');
          expect(c['section'], oInt('Section'),
              reason: '$name:${c['name']}');
          expect(c['left'], oInt('Left'), reason: '$name:${c['name']}');
          expect(c['top'], oInt('Top'), reason: '$name:${c['name']}');
          expect(c['width'], oInt('Width'), reason: '$name:${c['name']}');
          expect(c['height'], oInt('Height'), reason: '$name:${c['name']}');
          if (c['type'] != 'CheckBox' && c['type'] != 'Line') {
            expect(c['backStyle'], oInt('BackStyle'),
                reason: '$name:${c['name']}');
            expect(c['backColor'], oInt('BackColor'),
                reason: '$name:${c['name']}');
          }
          if (c['type'] != 'CheckBox') {
            expect(c['borderStyle'], oInt('BorderStyle'),
                reason: '$name:${c['name']}');
            expect(c['borderColor'], oInt('BorderColor'),
                reason: '$name:${c['name']}');
          }
          if (c['type'] == 'Label' ||
              c['type'] == 'TextBox' ||
              c['type'] == 'ComboBox') {
            expect(c['fontName'], oProps['FontName']!['value'],
                reason: '$name:${c['name']}');
            expect(c['fontSize'], oInt('FontSize'),
                reason: '$name:${c['name']}');
            expect(c['fontWeight'], oInt('FontWeight'),
                reason: '$name:${c['name']}');
            expect(c['textAlign'], oInt('TextAlign'),
                reason: '$name:${c['name']}');
            expect(c['foreColor'], oInt('ForeColor'),
                reason: '$name:${c['name']}');
          }
        }
      }
    }
  });

  test('resolves theme colors dynamically from custom .thmx clrScheme XML',
      () async {
    const sourceHash =
        '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef';
    final temp = await Directory.systemTemp.createTemp('custom_thmx_theme_');
    addTearDown(() => temp.delete(recursive: true));

    final sourceDir = Directory('${temp.path}/source');
    await Directory('${sourceDir.path}/themes').create(recursive: true);
    await File('${sourceDir.path}/dbs-properties.json').writeAsString(jsonEncode({
      'Items': {
        'Theme Resource Name': {'Value': 'CustomRed', 'Type': 10},
      },
    }));

    const themeXml = '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<a:theme xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" name="CustomRed">
  <a:themeElements>
    <a:clrScheme name="CustomRed">
      <a:dk1><a:sysClr val="windowText" lastClr="000000"/></a:dk1>
      <a:lt1><a:sysClr val="window" lastClr="FFFFFF"/></a:lt1>
      <a:dk2><a:srgbClr val="112233"/></a:dk2>
      <a:lt2><a:srgbClr val="EEEEEE"/></a:lt2>
      <a:accent1><a:srgbClr val="FF0000"/></a:accent1>
      <a:accent2><a:srgbClr val="00FF00"/></a:accent2>
      <a:accent3><a:srgbClr val="0000FF"/></a:accent3>
      <a:accent4><a:srgbClr val="FFFF00"/></a:accent4>
      <a:accent5><a:srgbClr val="00FFFF"/></a:accent5>
      <a:accent6><a:srgbClr val="FF00FF"/></a:accent6>
      <a:hlink><a:srgbClr val="0000FF"/></a:hlink>
      <a:folHlink><a:srgbClr val="800080"/></a:folHlink>
    </a:clrScheme>
  </a:themeElements>
</a:theme>''';
    await File('${sourceDir.path}/themes/CustomRed.thmx').writeAsBytes(
      _buildStoredZip({'theme/theme/theme1.xml': utf8.encode(themeXml)}),
    );

    final analysis = _buildCspront1Analysis(reports: [
      {
        'name': 'CustomThemeReport',
        'sourceSha256': sourceHash,
        'properties': {'Width': '5000'},
        'printSettings': {
          'Items': {
            'Margins': {
              'LeftMargin': 0.25,
              'RightMargin': 0.25,
              'TopMargin': 0.25,
              'BotMargin': 0.25,
            },
            'Printer': {'Orientation': 'Portrait', 'PaperSize': 'A4'},
          },
        },
        'sections': [
          {
            'type': 'Section',
            'name': 'Detalhe',
            'height': 1000,
            'controls': [
              {
                'type': 'Label',
                'name': 'RedAccentShade',
                'caption': 'Custom Theme',
                'properties': {
                  'Left': '0',
                  'Top': '0',
                  'Width': '2000',
                  'Height': '400',
                  'Caption': 'Custom Theme',
                  'ForeThemeColorIndex': '4',
                  'ForeTint': '100.0',
                  'ForeShade': '50.0',
                },
              }
            ],
          }
        ],
      }
    ]);
    analysis['source_overlay'] = {'sourcePath': sourceDir.path};
    final analysisFile = File('${temp.path}/analysis.json');
    await analysisFile.writeAsString(jsonEncode(analysis));

    final appDir = Directory('${temp.path}/app');
    final err = StringBuffer();
    expect(
      await run(
        ['generate', '--analysis', analysisFile.path, '--output', appDir.path],
        out: StringBuffer(),
        err: err,
      ),
      0,
      reason: '$err',
    );
    final inventory = jsonDecode(
      await File('${appDir.path}/access-reports.json').readAsString(),
    ) as Map<String, dynamic>;
    final compiled = (inventory['compiled_reports'] as List).single as Map;
    final label = (compiled['controls'] as List).single as Map;
    // Pure red #FF0000 with 50% shade -> #800000 -> Access BGR int 128.
    expect(label['foreColor'], 128);
    expect(label['foreColorHex'], '#800000');

    final rendererCode = await File(
      'lib/src/project_generator/report_renderer_generator.dart',
    ).readAsString();
    expect(rendererCode, isNot(contains('9917743')));
    expect(rendererCode, isNot(contains('2316088')));
    expect(rendererCode, isNot(contains('8355711')));
    expect(rendererCode, isNot(contains('10921638')));
  });
}

List<int> _buildStoredZip(Map<String, List<int>> entries) {
  final out = <int>[];
  final central = <int>[];
  void write16(List<int> buf, int v) => buf.addAll([v & 0xFF, (v >> 8) & 0xFF]);
  void write32(List<int> buf, int v) => buf.addAll([
        v & 0xFF,
        (v >> 8) & 0xFF,
        (v >> 16) & 0xFF,
        (v >> 24) & 0xFF,
      ]);

  for (final e in entries.entries) {
    final nameBytes = utf8.encode(e.key);
    final data = e.value;
    final offset = out.length;
    write32(out, 0x04034b50);
    write16(out, 20);
    write16(out, 0);
    write16(out, 0);
    write16(out, 0);
    write16(out, 0);
    write32(out, 0);
    write32(out, data.length);
    write32(out, data.length);
    write16(out, nameBytes.length);
    write16(out, 0);
    out.addAll(nameBytes);
    out.addAll(data);

    write32(central, 0x02014b50);
    write16(central, 20);
    write16(central, 20);
    write16(central, 0);
    write16(central, 0);
    write16(central, 0);
    write16(central, 0);
    write32(central, 0);
    write32(central, data.length);
    write32(central, data.length);
    write16(central, nameBytes.length);
    write16(central, 0);
    write16(central, 0);
    write16(central, 0);
    write16(central, 0);
    write32(central, 0);
    write32(central, offset);
    central.addAll(nameBytes);
  }
  final cdOffset = out.length;
  out.addAll(central);
  write32(out, 0x06054b50);
  write16(out, 0);
  write16(out, 0);
  write16(out, entries.length);
  write16(out, entries.length);
  write32(out, central.length);
  write32(out, cdOffset);
  write16(out, 0);
  return out;
}
