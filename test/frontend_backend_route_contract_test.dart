import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';
import 'generation/support/subform_fixture.dart';

void main() {
  test('frontend API paths match backend routes for compound table names',
      () async {
    final temp = await Directory.systemTemp.createTemp('route_contract_');
    addTearDown(() => temp.delete(recursive: true));
    final analysis = subformFixture();
    (analysis['tables'] as List).first['name'] = 'Cadastro Geral';
    (analysis['forms'] as List).first['recordSource'] = 'Cadastro Geral';
    final input = await writeSubformFixture(temp, analysis);
    final output = '${temp.path}/generated';
    final errors = StringBuffer();
    expect(
        await run(['generate', '--analysis', input.path, '--output', output],
            out: StringBuffer(), err: errors),
        0,
        reason: '$errors');
    final service = await File(
            '$output/frontend/lib/src/modules/cadastro_geral/services/cadastro_geral_service.dart')
        .readAsString();
    final routes = await File('$output/backend/lib/src/routes/api_routes.dart')
        .readAsString();
    final moduleRoutes = await File(
            '$output/backend/lib/src/modules/cadastro_geral/routes/cadastro_geral_routes.dart')
        .readAsString();
    expect(routes, contains('setupCadastroGeralRoutes'));
    expect(moduleRoutes, contains(r"$basePath/cadastro_geral"));
    expect('/cadastro_geral'.allMatches(service), hasLength(9));
    expect(service, isNot(contains('/cadastro-geral')));
    final controller =
        await File('$output/backend/lib/src/shared/access_subforms.dart')
            .readAsString();
    final encoded = RegExp(r'jsonDecode\(("(?:\\.|[^"\\])*")\)')
        .firstMatch(controller)!
        .group(1)!;
    final specs = jsonDecode(jsonDecode(encoded) as String) as Map;
    expect(specs.containsKey('cadastro_geral'), isTrue);
    expect(specs.containsKey('cadastro-geral'), isFalse);
    expect((specs['cadastro_geral'] as Map).containsKey('subform_0'), isTrue);
    final editor = await File(
            '$output/frontend/lib/src/modules/cadastro_geral/pages/incluir_cadastro_geral/incluir_cadastro_geral_page.html')
        .readAsString();
    expect(editor, contains('module="cadastro_geral"'));
    expect(editor, isNot(contains('module="cadastro-geral"')));
    final shell =
        await File('$output/frontend/lib/app_component.html').readAsString();
    expect(shell, contains('cadastro-geral-page'),
        reason: 'Component/hash names keep their separate HTML convention');
  });
}
