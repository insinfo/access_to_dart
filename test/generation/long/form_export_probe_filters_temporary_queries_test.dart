import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('form export probe filtra queries temporarias e preserva VBA e layout',
      () async {
    if (!Platform.isWindows) {
      return;
    }

    final tempDir =
        await Directory.systemTemp.createTemp('access_form_export_probe_');
    addTearDown(() => tempDir.delete(recursive: true));

    final fixtureFile =
        File('${tempDir.path}${Platform.pathSeparator}form_export_probe.accdb');
    final nativeExportDir =
        Directory('${tempDir.path}${Platform.pathSeparator}native_export');
    final analysisDir =
        Directory('${tempDir.path}${Platform.pathSeparator}analysis');

    await runCheckedProcess(
      'dart',
      [
        'run',
        'tools/create_access_form_export_probe.dart',
        '--output',
        fixtureFile.path,
        '--native-export-dir',
        nativeExportDir.path,
        '--second-export-dir',
        nativeExportDir.path,
        '--no-run-vcs-export',
      ],
      description: 'create form export probe accdb',
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

    final summary =
        (analysisJson['summary'] as Map<dynamic, dynamic>).cast<String, dynamic>();
    final queries = (analysisJson['queries'] as List<dynamic>? ?? const <dynamic>[])
        .whereType<Map>()
        .map((entry) => entry.cast<String, dynamic>())
        .toList(growable: false);
    expect(
      queries.where((query) => (query['name'] as String).startsWith('~sq_')),
      isEmpty,
    );
    expect(summary['queries'], queries.length);

    final canonical =
        (analysisJson['canonical_analysis'] as Map<String, dynamic>?) ??
            const <String, dynamic>{};
    final canonicalQueries =
        (canonical['queries'] as List<dynamic>? ?? const <dynamic>[])
            .whereType<Map>()
            .map((entry) => entry.cast<String, dynamic>())
            .toList(growable: false);
    expect(
      canonicalQueries
          .where((query) => (query['name'] as String).startsWith('~sq_')),
      isEmpty,
    );

    final forms = (canonical['forms'] as List<dynamic>? ?? const <dynamic>[])
        .whereType<Map>()
        .map((entry) => entry.cast<String, dynamic>())
        .toList(growable: false);
    final form =
        forms.singleWhere((entry) => entry['name'] == 'frmDespachoAutomatico');
    expect((form['rawVbaCode'] as String?)?.contains('ProbeSummary'), isTrue);
    expect(
      (form['rawVbaCode'] as String?)?.contains('cmdProbeVba_Click'),
      isTrue,
    );

    final components =
        (form['components'] as Map<dynamic, dynamic>).cast<String, dynamic>();
    final controls = (components['controls'] as List<dynamic>? ?? const <dynamic>[])
        .whereType<Map>()
        .map((entry) => entry.cast<String, dynamic>())
        .toList(growable: false);

    final txtAssunto =
        controls.singleWhere((entry) => entry['name'] == 'txtAssunto');
    final txtAssuntoLayout =
        (txtAssunto['layout'] as Map<dynamic, dynamic>).cast<String, dynamic>();
    expect(txtAssuntoLayout['left'], 720);
    expect(txtAssuntoLayout['top'], 1710);
    expect(txtAssuntoLayout['width'], 4560);

    final cmdProbeVba =
        controls.singleWhere((entry) => entry['name'] == 'cmdProbeVba');
    final cmdProbeVbaLayout =
        (cmdProbeVba['layout'] as Map<dynamic, dynamic>).cast<String, dynamic>();
    expect(cmdProbeVba['type'], 'CommandButton');
    expect(cmdProbeVbaLayout['left'], 600);
    expect(cmdProbeVbaLayout['top'], 3000);
    expect(cmdProbeVbaLayout['width'], 1900);
    expect(cmdProbeVbaLayout['height'], 360);

    final lblTitulo =
        controls.singleWhere((entry) => entry['name'] == 'lblTitulo');
    final lblTituloLayout =
        (lblTitulo['layout'] as Map<dynamic, dynamic>).cast<String, dynamic>();
    expect(lblTitulo['type'], 'Label');
    expect(lblTituloLayout['left'], 600);
    expect(lblTituloLayout['top'], 300);
    expect(lblTituloLayout['width'], 5360);
    expect(lblTituloLayout['height'], 350);
  }, timeout: const Timeout(Duration(minutes: 10)));
}