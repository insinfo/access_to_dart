import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('generate emits core backend frontend scaffold', () async {
    final analysisFile = await ensureTeste1QuickAnalysis();

    final tempDir = await Directory.systemTemp.createTemp('access_generate_');
    addTearDown(() => tempDir.delete(recursive: true));

    final outputDir = '${tempDir.path}${Platform.pathSeparator}teste1_app_generated';
    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      ['generate', '--analysis', analysisFile.path, '--output', outputDir],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);
    expect(out.toString(), contains('Generated app written'));
    expect(File('$outputDir${Platform.pathSeparator}core${Platform.pathSeparator}pubspec.yaml').existsSync(), isTrue);
    expect(File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}bin${Platform.pathSeparator}server.dart').existsSync(), isTrue);
    expect(File('$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}app_component.dart').existsSync(), isTrue);
    expect(File('$outputDir${Platform.pathSeparator}conversion-report.md').existsSync(), isTrue);

    final conversionReport = File('$outputDir${Platform.pathSeparator}conversion-report.md');
    final conversionReportContent = await conversionReport.readAsString();
    expect(conversionReportContent, contains('## Readiness'));
    expect(conversionReportContent, contains('## Inventory'));
    expect(conversionReportContent, contains('## Findings'));
    expect(conversionReportContent, contains('## Next Steps'));
    expect(conversionReportContent, contains('Level: `partial`'));
    expect(conversionReportContent, contains('query.reconciliation_clean'));

    final modelFile = File('$outputDir${Platform.pathSeparator}core${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}models${Platform.pathSeparator}contatos.dart');
    final modelContent = await modelFile.readAsString();
    expect(modelContent, contains("static const idCol = 'id';"));
    expect(modelContent, contains("static const cepCol = 'cep';"));
    expect(modelContent, contains('factory Contatos.fromMap(Map<String, dynamic> map)'));
    expect(modelContent, contains('map[idCol] as int?'));
    expect(modelContent, isNot(contains('?.toString()')));

    final dataFile = File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}generated_data.dart');
    final dataContent = await dataFile.readAsString();
    expect(dataContent, contains('"id": 1'));
    expect(dataContent, contains('"nome_do_contato": "dfs sdf"'));

    final frontendPubspec = File('$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}pubspec.yaml');
    final frontendPubspecContent = await frontendPubspec.readAsString();
    expect(frontendPubspecContent, contains('ngdart: 8.0.0-dev.4'));
    expect(frontendPubspecContent, contains('ngforms: 5.0.0-dev.3'));
    expect(frontendPubspecContent, contains('ngrouter: 4.0.0-dev.3'));
    expect(frontendPubspecContent, contains('http: ^1.2.1'));
    expect(frontendPubspecContent, contains('sass_builder: ^2.2.1'));
    expect(frontendPubspecContent, contains('webdev: ^3.7.1'));

    final frontendIndex = File('$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}web${Platform.pathSeparator}index.html');
    final frontendIndexContent = await frontendIndex.readAsString();
    expect(frontendIndexContent, contains('limitless@4.0/dist/css/all.min.css'));
    expect(frontendIndexContent, contains('limitless@4.0/dist/js/bootstrap/bootstrap.bundle.min.js'));

    final buildYamlFile = File('$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}build.yaml');
    expect(await buildYamlFile.exists(), isTrue);
    expect(await buildYamlFile.readAsString(), contains('sass_builder'));

    final sharedServiceFile = File('$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}shared${Platform.pathSeparator}services${Platform.pathSeparator}api_http_service.dart');
    expect(await sharedServiceFile.exists(), isTrue);
    final sharedServiceContent = await sharedServiceFile.readAsString();
    expect(sharedServiceContent, contains("package:http/http.dart' as http"));
    expect(sharedServiceContent, contains('Future<Object?> postJson'));
    expect(sharedServiceContent, contains('Future<Object?> putJson'));
    expect(sharedServiceContent, contains('Future<Object?> deleteJson'));

    final restServiceFile = File('$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}shared${Platform.pathSeparator}services${Platform.pathSeparator}rest_service.dart');
    expect(await restServiceFile.exists(), isTrue);
    final restServiceContent = await restServiceFile.readAsString();
    expect(restServiceContent, contains('ApiHttpService'));
    expect(restServiceContent, contains('await _api.getJson'));
    expect(restServiceContent, contains('await _api.postJson'));
    expect(restServiceContent, contains('await _api.putJson'));
    expect(restServiceContent, contains('await _api.deleteJson'));

    final appScssFile = File('$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}app_component.scss');
    expect(await appScssFile.exists(), isTrue);

    final moduleServiceFile = File('$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}services${Platform.pathSeparator}contatos_service.dart');
    expect(await moduleServiceFile.exists(), isTrue);
    final moduleServiceContent = await moduleServiceFile.readAsString();

    final modulePageFile = File('$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}pages${Platform.pathSeparator}contatos_page_component.dart');
    expect(await modulePageFile.exists(), isTrue);
    final modulePageContent = await modulePageFile.readAsString();
    expect(modulePageContent, contains('class ContatosPageComponent'));
    expect(modulePageContent, contains('ConsultarContatosPage'));

    final pageScssFile = File('$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}pages${Platform.pathSeparator}contatos_page_component.scss');
    expect(await pageScssFile.exists(), isTrue);

    final backendRepositoryFile = File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}repositories${Platform.pathSeparator}contatos_repository.dart');
    expect(await backendRepositoryFile.exists(), isTrue);
    expect(await backendRepositoryFile.readAsString(), contains('class ContatosRepository'));
    expect(await backendRepositoryFile.readAsString(), contains('Future<Map<String, dynamic>?> findById'));

    final backendServiceFile = File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}services${Platform.pathSeparator}contatos_service.dart');
    expect(await backendServiceFile.exists(), isTrue);
    expect(await backendServiceFile.readAsString(), contains('class ContatosService'));

    final backendControllerFile = File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}controllers${Platform.pathSeparator}contatos_controller.dart');
    expect(await backendControllerFile.exists(), isTrue);
    final backendControllerContent = await backendControllerFile.readAsString();
    expect(backendControllerContent, contains('class ContatosController'));
    expect(backendControllerContent, contains('final savedItem = await service.create(item);'));
    expect(backendControllerContent, contains('return responseJson(savedItem);'));

    final backendRoutesFile = File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}routes${Platform.pathSeparator}contatos_routes.dart');
    expect(await backendRoutesFile.exists(), isTrue);
    expect(await backendRoutesFile.readAsString(), contains('setupContatosRoutes'));

    final publicBackendFile = File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}bin${Platform.pathSeparator}public_backend.dart');
    expect(await publicBackendFile.exists(), isTrue);

    final dependencyInjectorFile = File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}api${Platform.pathSeparator}di${Platform.pathSeparator}dependency_injector.dart');
    expect(await dependencyInjectorFile.exists(), isTrue);

    final publicRoutesFile = File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}public${Platform.pathSeparator}api${Platform.pathSeparator}routes${Platform.pathSeparator}public_api_routes.dart');
    expect(await publicRoutesFile.exists(), isTrue);
    expect(await publicRoutesFile.readAsString(), contains('setupRoutes'));
    expect(await publicRoutesFile.readAsString(), contains('setupContatosRoutes'));

    final publicControllerFile = File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}public${Platform.pathSeparator}api${Platform.pathSeparator}controllers${Platform.pathSeparator}public_api_controller.dart');
    expect(await publicControllerFile.exists(), isTrue);
    expect(await publicControllerFile.readAsString(), contains('class PublicApiController'));

    final dbMiddlewareFile = File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}db${Platform.pathSeparator}with_database_shelf.dart');
    expect(await dbMiddlewareFile.exists(), isTrue);
    expect(await dbMiddlewareFile.readAsString(), contains("'db.connection': connection"));
    expect(await dbMiddlewareFile.readAsString(), contains('ioc.pushNewScope()'));

    final appConfigFile = File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}shared${Platform.pathSeparator}app_config.dart');
    expect(await appConfigFile.exists(), isTrue);
    expect(await appConfigFile.readAsString(), contains('class AppConfig'));

    final databaseServiceFile = File('$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}db${Platform.pathSeparator}database_service.dart');
    expect(await databaseServiceFile.exists(), isTrue);
    expect(await databaseServiceFile.readAsString(), contains('class DatabaseService'));

    expect(moduleServiceContent, contains("'/contatos'"));
    expect(moduleServiceContent, contains("'/contatos/\${entity.id}'"));
    expect(
      await File('$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}pages${Platform.pathSeparator}consultar_contatos${Platform.pathSeparator}consultar_contatos_page.dart').readAsString(),
      contains("RestConfig('/api/v1')"),
    );
  });
}