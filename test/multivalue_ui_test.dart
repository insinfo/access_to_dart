import 'dart:convert';
import 'dart:io';
import 'package:test/test.dart';
import 'support/multivalue_ui_fixture.dart';

void main() {
  Future<Directory> generate(Map<String, dynamic> data) async {
    final root = await Directory.systemTemp.createTemp('mv_ui_');
    addTearDown(() => root.delete(recursive: true));
    return generateMultivalueUi(data, root);
  }

  test(
      'real exported ComboBox becomes readonly collection with seven original options',
      () async {
    final app = await generate(await multivalueUiFixture());
    final module = '${app.path}/frontend/lib/src/modules/tb_encaminhamento';
    final descriptors =
        jsonDecode(await File('$module/access_collections.json').readAsString())
            as List;
    expect(descriptors.length, 1);
    expect(descriptors.single['control'], 'MotivoNão');
    expect(descriptors.single['controlType'], 'ComboBox');
    expect(descriptors.single['options'].length, 7);
    expect(descriptors.single['options'].first, 'FALTA DE RECURSO FINANCEIRO');
    expect(descriptors.single['readOnly'], true);
    expect(
        await Directory('${app.path}/frontend/lib/src/modules/motivo_values')
            .exists(),
        false);
    expect(
        await Directory('${app.path}/backend/lib/src/modules/motivo_values')
            .exists(),
        false);
    final routes =
        await File('${app.path}/backend/lib/src/routes/api_routes.dart')
            .readAsString();
    expect(routes, isNot(contains('motivo_values')));
    final api = jsonDecode(
        await File('${app.path}/backend/lib/src/shared/access_multivalues.json')
            .readAsString());
    expect(
        api['tb_encaminhamento']['motivo_nao']['childTable'], 'motivo_values');
    final html = await File(
            '$module/pages/incluir_tb_encaminhamento/incluir_tb_encaminhamento_page.html')
        .readAsString();
    expect(html, contains('access-multivalue-panel'));
    expect(html, isNot(contains('ngControl="motivoNao"')));
  });
  test('no invented collection controls without form export', () async {
    final data = await multivalueUiFixture();
    data['forms'] = [];
    final app = await generate(data);
    final descriptors = jsonDecode(await File(
            '${app.path}/frontend/lib/src/modules/tb_encaminhamento/access_collections.json')
        .readAsString());
    expect(descriptors, isEmpty);
  });
  test('missing physical collection mapping is explicitly unsupported',
      () async {
    final data = await multivalueUiFixture();
    (data['tables'] as List).removeLast();
    final app = await generate(data);
    final d = jsonDecode(await File(
            '${app.path}/frontend/lib/src/modules/tb_encaminhamento/access_collections.json')
        .readAsString()) as List;
    expect(d.single['unsupportedReason'], isNotEmpty);
  });
  test('persist isolated scaffold when requested', () async {
    final path = Platform.environment['ACCESS_MULTIVALUE_OUTPUT'];
    if (path != null) {
      await generateMultivalueUi(await multivalueUiFixture(), Directory(path));
    }
  });
}
