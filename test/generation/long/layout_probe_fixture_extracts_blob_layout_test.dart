import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('layout probe fixture extracts control coordinates from blob records',
      () async {
    if (!Platform.isWindows) {
      return;
    }

    final tempDir =
        await Directory.systemTemp.createTemp('access_layout_probe_fixture_');
    addTearDown(() => tempDir.delete(recursive: true));

    final fixtureFile =
        File('${tempDir.path}${Platform.pathSeparator}layout_probe.accdb');
    final analysisDir =
        Directory('${tempDir.path}${Platform.pathSeparator}analysis');

    await runCheckedProcess(
      'dart',
      [
        'run',
        'tools/create_access_layout_probe_form.dart',
        '--output',
        fixtureFile.path,
      ],
      description: 'create layout probe fixture accdb',
    );

    final analyzeOut = StringBuffer();
    final analyzeErr = StringBuffer();
    final analyzeExit = await run(
      ['analyze', '--accdb', fixtureFile.path, '--output', analysisDir.path],
      out: analyzeOut,
      err: analyzeErr,
    );

    expect(analyzeExit, 0, reason: analyzeErr.toString());

    final analysisFile =
        File('${analysisDir.path}${Platform.pathSeparator}analysis.json');
    final analysisJson =
        jsonDecode(await analysisFile.readAsString()) as Map<String, dynamic>;
    final canonical =
        (analysisJson['canonical_analysis'] as Map<String, dynamic>?) ??
            const <String, dynamic>{};
    final forms = (canonical['forms'] as List<dynamic>? ?? const <dynamic>[])
        .whereType<Map>()
        .map((entry) => entry.cast<String, dynamic>())
        .toList(growable: false);
    final form = forms.singleWhere((entry) => entry['name'] == 'frmLayoutProbe');
    final components =
        (form['components'] as Map<dynamic, dynamic>).cast<String, dynamic>();
    final controls = (components['controls'] as List<dynamic>)
        .whereType<Map>()
        .map((entry) => entry.cast<String, dynamic>())
        .toList(growable: false);

    Map<String, dynamic> control(String name) {
      return controls.singleWhere((entry) => entry['name'] == name);
    }

    void expectLayout(
      String name,
      int left,
      int top,
      int width,
      int height,
    ) {
      final layout =
          (control(name)['layout'] as Map<dynamic, dynamic>).cast<String, dynamic>();
      expect(layout['left'], left, reason: 'left de $name');
      expect(layout['top'], top, reason: 'top de $name');
      expect(layout['width'], width, reason: 'width de $name');
      expect(layout['height'], height, reason: 'height de $name');
      expect(layout['section'], contains('Detalhe'), reason: 'section de $name');
    }

    expectLayout('lblBanner', 333, 177, 2111, 277);
    expectLayout('txtAlpha', 1234, 857, 2345, 321);
    expectLayout('txtBeta', 4321, 1388, 1543, 287);
    expectLayout('chkFlagAtivo', 2642, 2579, 444, 219);
    expectLayout('cmdApplyProbe', 5555, 3333, 1111, 377);

    final sections = (components['sections'] as List<dynamic>)
        .whereType<Map>()
        .map((entry) => entry.cast<String, dynamic>())
        .toList(growable: false);
    expect(sections, isNotEmpty);
    expect(sections.first['kind'], 'detail');
  }, timeout: const Timeout(Duration(minutes: 10)));
}