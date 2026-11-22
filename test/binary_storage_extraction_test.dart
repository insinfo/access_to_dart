
import 'dart:io';
import 'package:access_to_dart/src/accdb_analyzer.dart';
import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';

void main() {
  test(
      'binary-only AccdbAnalyzer decodes DirData, Blob layout, subforms, capabilities, reports and all VBA modules without --src',
      () async {
    final fixture = File('fixtures/SIGAsul.accdb');
    if (!fixture.existsSync()) return;

    final db = await AccessDatabase.openPath(fixture.path);
    addTearDown(db.close);
    final catalog = AccessCatalog(format: db.format, pageChannel: db.pageChannel);
    final model = await catalog.read(fixture.path);
    final analysis = await AccdbAnalyzer(model: model, db: db).analyze();

    final forms = (analysis['forms'] as List).cast<Map<String, dynamic>>();
    final reports = (analysis['reports'] as List).cast<Map<String, dynamic>>();
    expect(forms.length, 97);
    expect(reports.length, 165);

    final withFormRs =
        forms.where((f) => (f['recordSource']?.toString() ?? '').isNotEmpty).length;
    final withFormCtrls =
        forms.where((f) => ((f['controls'] as List?) ?? const []).isNotEmpty).length;
    final withFormVba =
        forms.where((f) => (f['rawVbaCode']?.toString().trim() ?? '').isNotEmpty).length;
    expect(withFormRs, greaterThanOrEqualTo(50));
    expect(withFormCtrls, 97);
    expect(withFormVba, 61);

    final frmCadGeral = forms.singleWhere((f) => f['name'] == 'FrmCadGeral');
    expect(frmCadGeral['recordSource'], 'CadResidencia');
    final subforms = ((frmCadGeral['controls'] as List?) ?? const [])
        .whereType<Map>()
        .where((c) => c['type'] == 'Subform')
        .toList();
    expect(subforms.length, 2);
    final updSub = subforms.singleWhere(
      (s) => s['name'] == 'CadResidAtualizacao subformulário',
    );
    expect(updSub['linkMasterFields'], 'CodFam');
    expect(updSub['linkChildFields'], 'CodCadResd');

    final roForm =
        forms.singleWhere((f) => f['name'] == 'BASE MUNICIPAL COMPLETA');
    expect((roForm['properties'] as Map)['AllowEdits'], 'NotDefault');
    expect((roForm['properties'] as Map)['AllowAdditions'], 'NotDefault');
    expect((roForm['properties'] as Map)['AllowDeletions'], 'NotDefault');

    final withRepCtrls = reports
        .where((r) => ((r['controls'] as List?) ?? const []).isNotEmpty)
        .length;
    expect(withRepCtrls, greaterThanOrEqualTo(160));
    final groupedRep = reports.singleWhere(
      (r) => r['name'] == 'listagem benef munic movimento ano TÉCNICO',
    );
    expect((groupedRep['groupLevels'] as List), isNotEmpty);
    expect((groupedRep['sections'] as List).any((s) => s['type'] == 'BreakHeader'), isTrue);
  }, timeout: const Timeout(Duration(minutes: 3)));
}
