import 'dart:io';

import 'package:access_to_dart/src/accdb_analyzer.dart';
import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';

void main() {
  test(
      'analise binaria do SIGAsul promove reports tipados e preserva forms no catalogo canonico',
      () async {
    final fixture = File('fixtures${Platform.pathSeparator}SIGAsul.accdb');
    if (!fixture.existsSync()) {
      return;
    }

    final database = await AccessDatabase.openPath(fixture.path);
    addTearDown(database.close);

    final catalog = AccessCatalog(
      format: database.format,
      pageChannel: database.pageChannel,
    );
    final model = await catalog.read(fixture.path);
    final analysis = await AccdbAnalyzer(model: model, db: database).analyze();
    final canonical =
        (analysis['canonical_analysis'] as Map<String, dynamic>?) ??
            const <String, dynamic>{};
    final forms = (canonical['forms'] as List<dynamic>? ?? const <dynamic>[])
        .whereType<Map>()
        .map((entry) => entry.cast<String, dynamic>())
        .toList(growable: false);
    final reports =
        (canonical['reports'] as List<dynamic>? ?? const <dynamic>[])
            .whereType<Map>()
            .map((entry) => entry.cast<String, dynamic>())
            .toList(growable: false);

    expect(forms, isNotEmpty);
    expect(reports, isNotEmpty);

    final richReport = reports.firstWhere(
      (report) {
        final components =
            (report['components'] as Map?)?.cast<String, dynamic>() ??
                const <String, dynamic>{};
        return ((components['sections'] as List?) ?? const []).isNotEmpty;
      },
      orElse: () => const <String, dynamic>{},
    );

    expect(richReport, isNotEmpty);

    final reportComponents =
        (richReport['components'] as Map).cast<String, dynamic>();
    final reportSections =
        (reportComponents['sections'] as List).cast<Map<String, dynamic>>();

    expect(
      forms.any((form) => (form['name'] as String?)?.trim().isNotEmpty == true),
      isTrue,
    );
    expect(
      reportSections.any(
        (section) =>
            section['kind'] == 'detail' || section['kind'] == 'pageHeader',
      ),
      isTrue,
    );
  }, timeout: const Timeout(Duration(minutes: 10)));
}
