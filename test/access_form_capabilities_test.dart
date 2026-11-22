import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/access_form_capabilities.dart';
import 'package:access_to_dart/src/analysis_overlay_merger.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/project_generator/project_generator.dart';
import 'package:test/test.dart';

void main() {
  Map<String, Object?> describe(Map<String, dynamic> properties,
          {bool exported = true}) =>
      describeAccessFormCapabilities(
          {'name': 'Synthetic', 'properties': properties},
          hasSourceExport: exported);
  test('COM defaults and property-specific NotDefault inversion', () {
    final defaults = describe({});
    expect(defaults['source_form_permissions'],
        {'create': true, 'update': true, 'delete': true});
    expect(defaults['dataEntry'], false);
    expect(defaults['recordsetType'], 0);
    final toggled = describe({
      'AllowEdits': 'NotDefault',
      'AllowAdditions': 'NotDefault',
      'AllowDeletions': 'NotDefault',
      'DataEntry': 'NotDefault',
      'AllowUpdating': '1'
    });
    expect(toggled['source_form_permissions'],
        {'create': false, 'update': false, 'delete': false});
    expect(toggled['dataEntry'], true);
    expect(toggled['recordsetType'], 1);
    expect(describe({'AllowUpdating': '2'})['source_form_permissions'],
        {'create': false, 'update': false, 'delete': false});
    expect(describe({}, exported: false)['source_form_permissions'],
        {'create': null, 'update': null, 'delete': null});
    expect(describe({'AllowEdits': 'future'})['allowEdits'], isNull);
    expect(
        describe({'AllowUpdating': '0', 'RecordsetType': '1'})[
            'source_form_permissions'],
        {'create': null, 'update': null, 'delete': null});
  });
  test('root properties and write events never leak from child controls',
      () async {
    final dir =
        await Directory.systemTemp.createTemp('access_form_capabilities_');
    addTearDown(() => dir.delete(recursive: true));
    await Directory('${dir.path}/forms').create();
    await File('${dir.path}/forms/Synthetic.bas').writeAsString('''Begin Form
 AllowEdits = NotDefault
 BeforeInsert ="[Event Procedure]"
 Begin
  Begin TextBox
   Name ="Child"
   AllowEdits =0
   BeforeUpdate ="[Event Procedure]"
  End
 End
End
''');
    final source = await AccessSrcReader().readDirectory(dir.path);
    final analysis = <String, dynamic>{
      'forms': [
        {
          'name': 'Synthetic',
          'properties': {'BinaryOnly': 'kept'}
        }
      ]
    };
    AnalysisOverlayMerger().mergeSourceOverlay(analysis, source);
    final form = (analysis['forms'] as List).single as Map<String, dynamic>;
    expect((form['properties'] as Map)['AllowEdits'], 'NotDefault');
    expect((form['properties'] as Map)['BinaryOnly'], 'kept');
    final contract =
        describeAccessFormCapabilities(form, hasSourceExport: true);
    expect(contract['allowEdits'], false);
    expect((contract['write_lifecycle_events'] as List).length, 2);
    expect((contract['write_lifecycle_events'] as List).map((e) => e['scope']),
        ['form', 'control:Child']);
  });
  test(
      'export defaults override stale binary flags while binary-only absence stays unknown',
      () async {
    final raw = <String, dynamic>{
      'schema_version': '1.0',
      'source': 'synthetic',
      'format': 'VERSION_16',
      'tables': [],
      'forms': [
        {
          'name': 'Exported',
          'properties': {'AllowEdits': 'NotDefault'}
        },
        {'name': 'BinaryOnly', 'properties': {}}
      ],
      'source_overlay': {
        'forms': [
          {'name': 'Exported', 'properties': {}}
        ]
      }
    };
    final dir =
        await Directory.systemTemp.createTemp('access_caps_provenance_');
    addTearDown(() => dir.delete(recursive: true));
    await ProjectGenerator().generate(
        project: AnalysisProject.fromJson(raw), outputDirectory: dir.path);
    final artifact = jsonDecode(
        await File('${dir.path}/access-form-capabilities.json')
            .readAsString()) as Map;
    final contracts = (artifact['forms'] as List).cast<Map>();
    expect(contracts.first['allowEdits'], true);
    expect(contracts.last['allowEdits'], isNull);
    expect(
        contracts.last['diagnostics'], contains('source_export_unavailable'));
  });
  test(
      'all 97 SIGA form root properties survive overlay and generated capability artifact',
      () async {
    final source =
        await AccessSrcReader().readDirectory('fixtures/SIGAsul.accdb.src');
    expect(source.forms.length, 97);
    final raw = <String, dynamic>{
      'schema_version': '1.0',
      'source': 'synthetic-metadata-only',
      'format': 'VERSION_16',
      'tables': [],
      'forms': [],
      'linkedTables': [],
      'summary': {}
    };
    raw['source_overlay'] = source.toJson();
    AnalysisOverlayMerger().mergeSourceOverlay(raw, source);
    final forms = (raw['forms'] as List).cast<Map<String, dynamic>>();
    for (final original in source.forms) {
      final merged = forms.singleWhere((f) => f['name'] == original.name);
      expect(merged['properties'], original.properties, reason: original.name);
    }
    final dir = await Directory.systemTemp.createTemp('access_caps_scaffold_');
    addTearDown(() => dir.delete(recursive: true));
    await ProjectGenerator().generate(
        project: AnalysisProject.fromJson(raw), outputDirectory: dir.path);
    final artifact = jsonDecode(
        await File('${dir.path}/access-form-capabilities.json')
            .readAsString()) as Map;
    final contracts = (artifact['forms'] as List).cast<Map>();
    expect(contracts.length, 97);
    expect(contracts.every((f) => f['source_export_available'] == true), true);
    for (final name in [
      'BASE MUNICIPAL COMPLETA',
      'RETORNO PARA ACOMPANHAMENTO'
    ]) {
      final contract = contracts.singleWhere((f) => f['name'] == name);
      expect(contract['source_form_permissions'],
          {'create': false, 'update': false, 'delete': false});
    }
    for (final name in [
      'COMPOSIÇÃO FAMILIAR SUBFORM',
      'CadResidAtualizacao subformulário'
    ]) {
      final contract = contracts.singleWhere((f) => f['name'] == name);
      expect(contract['source_form_permissions'],
          {'create': true, 'update': true, 'delete': true});
      expect(contract['write_lifecycle_events'], isEmpty);
      expect(contract['write_execution_status'],
          'requires_form_specific_validation');
    }
    final parent = contracts.singleWhere((f) => f['name'] == 'FrmCadGeral');
    expect(
        (parent['write_lifecycle_events'] as List)
            .any((e) => e['scope'] == 'form' && e['event'] == 'BeforeInsert'),
        true);
    expect(await File('${dir.path}/conversion-report.md').readAsString(),
        contains('access-form-capabilities.json'));
  });

  test(
      'generated backend controllers and frontend pages enforce form capabilities without overriding multi-form or binary-only tables',
      () async {
    Map<String, Object?> mkTable(String name) => {
          'name': name,
          'columns': [
            {
              'name': 'ID',
              'typeName': 'Long',
              'typeCode': 4,
              'isAutoNumber': true,
              'isRequired': true,
            },
            {
              'name': 'Titulo',
              'typeName': 'Text',
              'typeCode': 10,
              'maxLength': 80,
              'isAutoNumber': false,
              'isRequired': false,
            },
          ],
          'sampleRows': [],
          'indexes': [
            {
              'name': 'PrimaryKey',
              'isPrimaryKey': true,
              'columns': [
                {'name': 'ID'}
              ],
            }
          ],
        };

    final raw = <String, dynamic>{
      'schema_version': '1.0',
      'source': 'capabilities_enforce.accdb',
      'format': 'VERSION_16',
      'tables': [
        mkTable('SomenteLeitura'),
        mkTable('SnapshotTabela'),
        mkTable('MultiForma'),
        mkTable('SomenteBinario'),
      ],
      'forms': [
        {
          'name': 'FrmSomenteLeitura',
          'recordSource': 'SomenteLeitura',
          'properties': {
            'AllowAdditions': 'NotDefault',
            'AllowEdits': 'NotDefault',
            'AllowDeletions': 'NotDefault',
          },
          'controls': [
            {'type': 'TextBox', 'name': 'txtTitulo', 'controlSource': 'Titulo'}
          ],
        },
        {
          'name': 'FrmSnapshot',
          'recordSource': 'SnapshotTabela',
          'properties': {'RecordsetType': '2'},
          'controls': [
            {'type': 'TextBox', 'name': 'txtTitulo', 'controlSource': 'Titulo'}
          ],
        },
        {
          'name': 'FrmMultiLeitura',
          'recordSource': 'MultiForma',
          'properties': {
            'AllowAdditions': 'NotDefault',
            'AllowEdits': 'NotDefault',
            'AllowDeletions': 'NotDefault',
          },
          'controls': [],
        },
        {
          'name': 'FrmMultiEditavel',
          'recordSource': 'MultiForma',
          'properties': <String, dynamic>{},
          'controls': [
            {'type': 'TextBox', 'name': 'txtTitulo', 'controlSource': 'Titulo'}
          ],
        },
        {
          'name': 'FrmSomenteBinario',
          'recordSource': 'SomenteBinario',
          'properties': <String, dynamic>{},
          'controls': [],
        },
      ],
      'source_overlay': {
        'forms': [
          {
            'name': 'FrmSomenteLeitura',
            'properties': {
              'AllowAdditions': 'NotDefault',
              'AllowEdits': 'NotDefault',
              'AllowDeletions': 'NotDefault',
            },
          },
          {
            'name': 'FrmSnapshot',
            'properties': {'RecordsetType': '2'},
          },
          {
            'name': 'FrmMultiLeitura',
            'properties': {
              'AllowAdditions': 'NotDefault',
              'AllowEdits': 'NotDefault',
              'AllowDeletions': 'NotDefault',
            },
          },
          {
            'name': 'FrmMultiEditavel',
            'properties': <String, dynamic>{},
          },
        ],
      },
      'linkedTables': [],
      'relationships': [],
      'summary': {},
    };

    final dir = await Directory.systemTemp.createTemp('access_caps_enforce_');
    addTearDown(() => dir.delete(recursive: true));
    await ProjectGenerator().generate(
      project: AnalysisProject.fromJson(raw),
      outputDirectory: dir.path,
    );

    for (final roModule in ['somente_leitura', 'snapshot_tabela']) {
      final ctrl = await File(
        '${dir.path}/backend/lib/src/modules/$roModule/controllers/${roModule}_controller.dart',
      ).readAsString();
      expect(ctrl, contains('statusCode: 403'));
      expect(ctrl, contains('Inclusao desabilitada'));
      expect(ctrl, contains('Alteracao desabilitada'));
      expect(ctrl, contains('Exclusao desabilitada'));
      expect(ctrl, isNot(contains('_core/core.dart')));

      final consultarHtml = await File(
        '${dir.path}/frontend/lib/src/modules/$roModule/pages/consultar_$roModule/consultar_${roModule}_page.html',
      ).readAsString();
      expect(consultarHtml, isNot(contains('openCreateForm()')));
      expect(consultarHtml, contains('>Visualizar</button>'));

      final incluirDart = await File(
        '${dir.path}/frontend/lib/src/modules/$roModule/pages/incluir_$roModule/incluir_${roModule}_page.dart',
      ).readAsString();
      expect(incluirDart, contains('static const bool allowCreate = false;'));
      expect(incluirDart, contains('static const bool allowUpdate = false;'));
      expect(incluirDart, contains('if (!canSaveCurrentRecord)'));

      final incluirHtml = await File(
        '${dir.path}/frontend/lib/src/modules/$roModule/pages/incluir_$roModule/incluir_${roModule}_page.html',
      ).readAsString();
      expect(incluirHtml, contains('Modo somente leitura conforme permissoes'));
      expect(incluirHtml, contains('readonly'));
    }

    for (final rwModule in ['multi_forma', 'somente_binario']) {
      final ctrl = await File(
        '${dir.path}/backend/lib/src/modules/$rwModule/controllers/${rwModule}_controller.dart',
      ).readAsString();
      expect(ctrl, isNot(contains('statusCode: 403')));
      expect(ctrl, contains('_core/core.dart'));

      final consultarHtml = await File(
        '${dir.path}/frontend/lib/src/modules/$rwModule/pages/consultar_$rwModule/consultar_${rwModule}_page.html',
      ).readAsString();
      expect(consultarHtml, contains('openCreateForm()'));
      expect(consultarHtml, contains('>Editar</button>'));
    }
  });
}
