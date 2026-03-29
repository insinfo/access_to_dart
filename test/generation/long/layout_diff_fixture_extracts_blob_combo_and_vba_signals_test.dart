import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('layout diff fixture extracts combo metadata and storage VBA signals',
      () async {
    if (!Platform.isWindows) {
      return;
    }

    final tempDir =
        await Directory.systemTemp.createTemp('access_layout_diff_fixture_');
    addTearDown(() => tempDir.delete(recursive: true));

    final fixtureFile =
        File('${tempDir.path}${Platform.pathSeparator}layout_diff_probe.accdb');
    final analysisDir =
        Directory('${tempDir.path}${Platform.pathSeparator}analysis');

    await runCheckedProcess(
      'dart',
      [
        'run',
        'tools/create_access_layout_diff_fixture.dart',
        '--output',
        fixtureFile.path,
        '--control-kind',
        'combo',
        '--left',
        '1200',
        '--top',
        '900',
        '--width',
        '2200',
        '--height',
        '330',
        '--vba-message',
        'Probe combo',
      ],
      description: 'create layout diff fixture accdb',
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
    final form = forms.singleWhere((entry) => entry['name'] == 'frmDiffProbe');

    expect((form['rawVbaCode'] as String?)?.contains('Probe combo'), isTrue);
    expect((form['rawVbaCode'] as String?)?.contains('ProbeSummary'), isTrue);

    final components =
        (form['components'] as Map<dynamic, dynamic>).cast<String, dynamic>();
    final controls = (components['controls'] as List<dynamic>? ?? const <dynamic>[])
        .whereType<Map>()
        .map((entry) => entry.cast<String, dynamic>())
        .toList(growable: false);

    final ctlProbe = controls.singleWhere((entry) => entry['name'] == 'ctlProbe');
    expect(ctlProbe['type'], 'ComboBox');
    expect(ctlProbe['controlSource'], 'CampoAlpha');
    expect(ctlProbe['rowSourceType'], 'Value List');
    expect(ctlProbe['rowSource'], 'A;B;C;D');

    final layout =
        (ctlProbe['layout'] as Map<dynamic, dynamic>).cast<String, dynamic>();
    expect(layout['left'], 1200);
    expect(layout['top'], 900);
    expect(layout['width'], 2200);
    expect(layout['height'], 330);
    expect(layout['section'], 'Detalhe');

    final storageSignals =
        (components['storageSignals'] as Map<dynamic, dynamic>).cast<String, dynamic>();
    final vbaSignals =
        (storageSignals['vba'] as Map<dynamic, dynamic>).cast<String, dynamic>();
    final projectStreamNames =
        (vbaSignals['projectStreamNames'] as List<dynamic>).cast<String>();
    expect(projectStreamNames, contains('_VBA_PROJECT'));
    expect(projectStreamNames, contains('dir'));
    expect(projectStreamNames, contains('PROJECT'));

    final moduleCandidates = (vbaSignals['moduleCandidates'] as List<dynamic>)
        .whereType<Map>()
        .map((entry) => entry.cast<String, dynamic>())
        .toList(growable: false);
    expect(moduleCandidates, isNotEmpty);
  }, timeout: const Timeout(Duration(minutes: 10)));
}