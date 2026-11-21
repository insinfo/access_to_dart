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
}
