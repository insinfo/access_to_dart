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

Map<String, dynamic> _buildCspront1Analysis({
  required List<Map<String, dynamic>> reports,
  bool includeHabitColumns = false,
}) {
  const sourceHash =
      '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef';
  final extraSelect = includeHabitColumns
      ? ', CadResidencia.[Nº Comodos], CadResidencia.[Nº Dormitorios], CadResidencia.[Nº pessoas/Dormitorio], '
          '${_cspront1BoolColumns.map((c) => 'CadResidencia.[$c]').join(', ')}'
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
      'all 14 eligible CSPRONT1 prontuario reports compile with 1806 controls while prontuario1 ComboBox is rejected',
      () async {
    const origin = 'fixtures/SIGAsul.accdb.src';
    final temp = await Directory.systemTemp.createTemp('cspront1_all_reports_');
    addTearDown(() => temp.delete(recursive: true));

    final sourceDir = Directory('${temp.path}/source');
    await Directory('${sourceDir.path}/reports').create(recursive: true);
    await Directory('${sourceDir.path}/images').create(recursive: true);
    for (final path in [
      'images/logo-SUAS-ICON.json',
      'images/logo-SUAS-ICON.png',
      for (final name in _cspront1ReportNames) ...[
        'reports/$name.bas',
        'reports/$name.json',
      ],
    ]) {
      await File('$origin/$path').copy('${sourceDir.path}/$path');
    }

    final source = await AccessSrcReader().readDirectory(sourceDir.path);
    final analysis = _buildCspront1Analysis(
      reports: [
        for (var i = 0; i < _cspront1ReportNames.length; i++)
          {'name': _cspront1ReportNames[i], 'id': i + 1},
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
    expect(compiled, hasLength(14));
    final totalControls = compiled.fold<int>(
      0,
      (sum, r) => sum + (r['controls'] as List).length,
    );
    expect(totalControls, 1806);

    final diagnostics = (inventory['report_diagnostics'] as List).cast<Map>();
    expect(
      diagnostics.singleWhere((d) => d['report'] == 'prontuario1')['reason'],
      'unsupported-control-type:ComboBox',
    );

    final byKey = <String, Map>{
      for (final r in compiled) r['key'] as String: r,
    };
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
          expect(c['left'], oInt('Left'), reason: '$name:${c['name']}');
          expect(c['top'], oInt('Top'), reason: '$name:${c['name']}');
          expect(c['width'], oInt('Width'), reason: '$name:${c['name']}');
          expect(c['height'], oInt('Height'), reason: '$name:${c['name']}');
          if (c['type'] != 'CheckBox') {
            expect(c['backStyle'], oInt('BackStyle'),
                reason: '$name:${c['name']}');
            expect(c['backColor'], oInt('BackColor'),
                reason: '$name:${c['name']}');
            expect(c['borderStyle'], oInt('BorderStyle'),
                reason: '$name:${c['name']}');
            expect(c['borderColor'], oInt('BorderColor'),
                reason: '$name:${c['name']}');
          }
          if (c['type'] == 'Label' || c['type'] == 'TextBox') {
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
}
