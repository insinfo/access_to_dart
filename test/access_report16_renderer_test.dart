import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/access_query_contract.dart';
import 'package:access_to_dart/src/analysis_overlay_merger.dart';
import 'package:crypto/crypto.dart';
import 'package:test/test.dart';

void main() {
  test(
      'report16 compiles into bounded read-only renderer matching Access presentation',
      () async {
    const name = 'prontuario16-REGISTRO-SINTETICO-FR-VERSO';
    const origin = 'fixtures/SIGAsul.accdb.src';
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
    const querySql =
        'SELECT CadResidencia.CodFam, TbPessoa.NOME, TbUnidade.NOME FROM (TbUnidade INNER JOIN CadResidencia ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]) INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam WHERE (((CadResidencia.CodFam)=[Formulários]![FormProntuario]![CodFamTxt]) AND ((CadResidencia.DataDesligResid) Is Null) AND ((TbPessoa.DataDesligPes) Is Null) AND ((TbPessoa.Parentesco)="Pessoa de Referencia"))';
    const sourceHash =
        '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef';

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
          'columns': [
            {
              'name': 'CodFam',
              'typeCode': 4,
              'typeName': 'Long',
              'isRequired': true
            },
            {'name': 'CRAS Origem', 'typeCode': 4, 'typeName': 'Long'},
            {'name': 'DataDesligResid', 'typeCode': 8, 'typeName': 'DateTime'},
          ],
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
      'reports': [
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
    };

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
        'columns': [
          {'ordinal': 0, 'name': 'CodFam', 'daoType': 4},
          {'ordinal': 1, 'name': 'TbPessoa.NOME', 'daoType': 10},
          {'ordinal': 2, 'name': 'TbUnidade.NOME', 'daoType': 10},
        ],
      },
      actualSourceHash: sourceHash,
      asciiCaseInsensitiveText: true,
    );

    analysis['source_overlay'] = source.toJson();
    AnalysisOverlayMerger().mergeSourceOverlay(analysis, source);

    final analysisFile = File('${temp.path}/analysis.json');
    await analysisFile.writeAsString(jsonEncode(analysis));

    final appDir = Directory('${temp.path}/app');
    final errors = StringBuffer();
    expect(
      await run(
        [
          'generate',
          '--analysis',
          analysisFile.path,
          '--output',
          appDir.path,
        ],
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

    // Compare against the interactive native Access oracle when present locally.
    final oracleFile = File('build/codex-report16-interactive/presentation.json');
    if (await oracleFile.exists()) {
      final oracle =
          jsonDecode(await oracleFile.readAsString()) as Map<String, dynamic>;
      final oracleByName = <String, Map>{
        for (final c in (oracle['controls'] as List).cast<Map>())
          c['name'] as String: c,
      };
      expect(controls.length, oracleByName.length);
      for (final c in controls) {
        final oProps =
            (oracleByName[c['name']]!['properties'] as Map).cast<String, Map>();
        int oInt(String k) => (oProps[k]!['value'] as num).toInt();
        expect(c['controlType'], oInt('ControlType'), reason: '${c['name']}');
        expect(c['left'], oInt('Left'), reason: '${c['name']}');
        expect(c['top'], oInt('Top'), reason: '${c['name']}');
        expect(c['width'], oInt('Width'), reason: '${c['name']}');
        expect(c['height'], oInt('Height'), reason: '${c['name']}');
        expect(c['backStyle'], oInt('BackStyle'), reason: '${c['name']}');
        expect(c['backColor'], oInt('BackColor'), reason: '${c['name']}');
        expect(c['borderStyle'], oInt('BorderStyle'), reason: '${c['name']}');
        expect(c['borderColor'], oInt('BorderColor'), reason: '${c['name']}');
        if (c['type'] == 'Label' || c['type'] == 'TextBox') {
          expect(c['fontName'], oProps['FontName']!['value']);
          expect(c['fontSize'], oInt('FontSize'), reason: '${c['name']}');
          expect(c['fontWeight'], oInt('FontWeight'), reason: '${c['name']}');
          expect(c['textAlign'], oInt('TextAlign'), reason: '${c['name']}');
          expect(c['foreColor'], oInt('ForeColor'), reason: '${c['name']}');
        }
      }
    }

    // Verify generated NgDart files obey template safety rules.
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
    expect(viewerHtml, contains('/api/v1/access-reports/prontuario_16_registro_sintetico_fr_verso/assets/logo-SUAS-ICON.png'));
    expect(viewerScss, contains('.access-report-sheet-prontuario_16_registro_sintetico_fr_verso'));
    expect(viewerScss, isNot(contains('word-break: break-word')));
    expect(viewerScss, contains('.access-report-ctrl-prontuario_16_registro_sintetico_fr_verso-0'));
    expect(viewerScss, contains('.access-report-ctrl-prontuario_16_registro_sintetico_fr_verso-37'));
    expect(appHtml, contains('<access-report-viewer'));
    expect(appDart, contains('#/access-report/'));

    // Missing image file on disk must reject compilation cleanly.
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
}
