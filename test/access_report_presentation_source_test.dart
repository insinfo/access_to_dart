import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/analysis_overlay_merger.dart';
import 'package:crypto/crypto.dart';
import 'package:test/test.dart';

void main() {
  test(
      'report16 preserves 38 controls, source layout, print settings and shared image through generation',
      () async {
    const name = 'prontuario16-REGISTRO-SINTETICO-FR-VERSO';
    const origin = 'fixtures/SIGAsul.accdb.src';
    final temp = await Directory.systemTemp.createTemp('report_presentation_');
    addTearDown(() => temp.delete(recursive: true));
    final sourceDir = Directory('${temp.path}/source');
    await Directory('${sourceDir.path}/reports').create(recursive: true);
    await Directory('${sourceDir.path}/images').create();
    for (final path in [
      'reports/$name.bas',
      'reports/$name.json',
      'images/logo-SUAS-ICON.json',
      'images/logo-SUAS-ICON.png'
    ]) {
      await File('$origin/$path').copy('${sourceDir.path}/$path');
    }
    final source = await AccessSrcReader().readDirectory(sourceDir.path);
    final report = source.reports.single;
    expect(report.controls.length, 38);
    expect(report.controls.where((c) => c.type == 'Label').length, 34);
    expect(report.controls.where((c) => c.type == 'TextBox').length, 2);
    expect(
        report.controls.singleWhere((c) => c.name == 'Imagem96').type, 'Image');
    expect(report.controls.singleWhere((c) => c.name == 'Caixa65').type,
        'Rectangle');
    expect(report.properties['Width'], '11022');
    expect(report.controlDefaults['Image']!['SizeMode'], '3');
    expect(report.controlDefaults['Label']!['FontName'], 'Calibri');
    expect(report.sections.map((s) => s.type),
        ['PageHeader', 'Section', 'PageFooter']);
    expect(report.sections[1].height, 15285);
    expect(report.sections[1].properties['KeepTogether'], 'NotDefault');
    expect(report.sections[1].controls.length, 38);
    expect(report.printSettings!['Items']['Margins']['LeftMargin'], 0.3153);
    expect(report.printSettings!['Items']['Margins']['DefaultSize'], true);
    expect(report.images.single.status, 'resolved');
    expect(report.images.single.sourcePath, 'images/logo-SUAS-ICON.png');
    expect(
        report.images.single.sha256,
        sha256
            .convert(
                await File('$origin/images/logo-SUAS-ICON.png').readAsBytes())
            .toString());
    expect(
        report.sourceSha256,
        sha256
            .convert(await File('$origin/reports/$name.bas').readAsBytes())
            .toString());
    final analysis = <String, dynamic>{
      'source': 'synthetic-inventory',
      'summary': {},
      'tables': [],
      'reports': [
        {'name': name, 'id': 999}
      ]
    };
    AnalysisOverlayMerger().mergeSourceOverlay(analysis, source);
    final merged = (analysis['reports'] as List).single as Map;
    expect(merged['id'], 999);
    expect((merged['controls'] as List).length, 38);
    expect(merged['properties'], report.properties);
    expect(merged['images'], report.images.map((i) => i.toJson()).toList());
    final input = File('${temp.path}/analysis.json');
    await input.writeAsString(jsonEncode(analysis));
    final errors = StringBuffer();
    expect(
        await run([
          'generate',
          '--analysis',
          input.path,
          '--output',
          '${temp.path}/app'
        ], out: StringBuffer(), err: errors),
        0,
        reason: '$errors');
    final inventories = await Directory('${temp.path}/app')
        .list(recursive: true)
        .where((f) => f is File && f.path.endsWith('access-reports.json'))
        .cast<File>()
        .toList();
    final inventory =
        jsonDecode(await inventories.single.readAsString()) as Map;
    final generated = (inventory['reports'] as List).single as Map;
    expect((generated['controls'] as List).length, 38);
    expect(generated['images'], merged['images']);
    expect(generated['printSettings'], merged['printSettings']);
    expect(inventory['renderer_generated'], false);
    await File('${sourceDir.path}/images/logo-SUAS-ICON.png').delete();
    final missing =
        (await AccessSrcReader().readDirectory(sourceDir.path)).reports.single;
    expect(missing.controls.length, 38);
    expect(missing.images.single.status, 'missing-gallery-file');
    expect(missing.images.single.sha256, isNull);
  });
}
