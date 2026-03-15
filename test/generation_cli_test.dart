import 'dart:io';
import 'dart:convert';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

void main() {
  test('doctor validates the generated teste1 analysis', () async {
    final analysisFile = File.fromUri(
      Directory.current.uri.resolve('build/teste1_quick/analysis.json'),
    );
    expect(await analysisFile.exists(), isTrue);

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      ['doctor', '--analysis', analysisFile.path],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);
    expect(out.toString(), contains('Doctor report'));
    expect(out.toString(), contains('[info]'));
  });

  test('migrate emits schema and seed sql assets', () async {
    final analysisFile = File.fromUri(
      Directory.current.uri.resolve('build/teste1_quick/analysis.json'),
    );
    expect(await analysisFile.exists(), isTrue);

    final tempDir = await Directory.systemTemp.createTemp('access_migrate_');
    addTearDown(() => tempDir.delete(recursive: true));

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      [
        'migrate',
        '--analysis',
        analysisFile.path,
        '--output',
        tempDir.path,
      ],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);
    expect(out.toString(), contains('Migration assets written'));

    final schemaFile =
        File('${tempDir.path}${Platform.pathSeparator}schema.sql');
    final seedFile = File('${tempDir.path}${Platform.pathSeparator}seed.sql');
    expect(await schemaFile.exists(), isTrue);
    expect(await seedFile.exists(), isTrue);
    expect(
        await schemaFile.readAsString(), contains('CREATE TABLE "contatos"'));
    expect(await seedFile.readAsString(), contains('INSERT INTO "contatos"'));
  });

  test('generate emits core backend frontend scaffold', () async {
    final analysisFile = File.fromUri(
      Directory.current.uri.resolve('build/teste1_quick/analysis.json'),
    );
    expect(await analysisFile.exists(), isTrue);

    final tempDir = await Directory.systemTemp.createTemp('access_generate_');
    addTearDown(() => tempDir.delete(recursive: true));

    final outputDir =
        '${tempDir.path}${Platform.pathSeparator}teste1_app_generated';
    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      [
        'generate',
        '--analysis',
        analysisFile.path,
        '--output',
        outputDir,
      ],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);
    expect(out.toString(), contains('Generated app written'));
    expect(
      File(
        '$outputDir${Platform.pathSeparator}core${Platform.pathSeparator}pubspec.yaml',
      ).existsSync(),
      isTrue,
    );
    expect(
      File(
        '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}bin${Platform.pathSeparator}server.dart',
      ).existsSync(),
      isTrue,
    );
    expect(
      File(
        '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}app_component.dart',
      ).existsSync(),
      isTrue,
    );
    expect(
      File('$outputDir${Platform.pathSeparator}conversion-report.md')
          .existsSync(),
      isTrue,
    );

    final modelFile = File(
      '$outputDir${Platform.pathSeparator}core${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}models${Platform.pathSeparator}contatos.dart',
    );
    final modelContent = await modelFile.readAsString();
    expect(modelContent, contains("static const idCol = 'id';"));
    expect(modelContent, contains("static const cepCol = 'cep';"));
    expect(modelContent,
        contains('factory Contatos.fromMap(Map<String, dynamic> map)'));
    expect(modelContent, contains('map[idCol] as int?'));
    expect(modelContent, isNot(contains('?.toString()')));

    final dataFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}generated_data.dart',
    );
    final dataContent = await dataFile.readAsString();
    expect(dataContent, contains('"id": 1'));
    expect(dataContent, contains('"nome_do_contato": "dfs sdf"'));

    final frontendPubspec = File(
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}pubspec.yaml',
    );
    final frontendPubspecContent = await frontendPubspec.readAsString();
    expect(frontendPubspecContent, contains('ngdart: 8.0.0-dev.4'));
    expect(frontendPubspecContent, contains('ngforms: 5.0.0-dev.3'));
    expect(frontendPubspecContent, contains('ngrouter: 4.0.0-dev.3'));
    expect(frontendPubspecContent, contains('http: ^1.2.1'));
    expect(frontendPubspecContent, contains('sass_builder: ^2.4.0+1'));

    final frontendIndex = File(
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}web${Platform.pathSeparator}index.html',
    );
    final frontendIndexContent = await frontendIndex.readAsString();
    expect(
        frontendIndexContent, contains('limitless@4.0/dist/css/all.min.css'));
    expect(frontendIndexContent,
        contains('limitless@4.0/dist/js/bootstrap/bootstrap.bundle.min.js'));

    final buildYamlFile = File(
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}build.yaml',
    );
    expect(await buildYamlFile.exists(), isTrue);
    expect(await buildYamlFile.readAsString(), contains('sass_builder'));

    final sharedServiceFile = File(
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}shared${Platform.pathSeparator}services${Platform.pathSeparator}api_http_service.dart',
    );
    expect(await sharedServiceFile.exists(), isTrue);
    expect(await sharedServiceFile.readAsString(),
        contains("package:http/http.dart' as http"));

    final appScssFile = File(
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}app_component.scss',
    );
    expect(await appScssFile.exists(), isTrue);

    final moduleServiceFile = File(
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}services${Platform.pathSeparator}contatos_service.dart',
    );
    expect(await moduleServiceFile.exists(), isTrue);

    final modulePageFile = File(
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}pages${Platform.pathSeparator}contatos_page_component.dart',
    );
    expect(await modulePageFile.exists(), isTrue);
    final modulePageContent = await modulePageFile.readAsString();
    expect(modulePageContent, contains('class ContatosPageComponent'));
    expect(modulePageContent, contains('ContatosService'));

    final pageScssFile = File(
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}pages${Platform.pathSeparator}contatos_page_component.scss',
    );
    expect(await pageScssFile.exists(), isTrue);

    final backendRepositoryFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}repositories${Platform.pathSeparator}contatos_repository.dart',
    );
    expect(await backendRepositoryFile.exists(), isTrue);
    expect(
      await backendRepositoryFile.readAsString(),
      contains('class ContatosRepository'),
    );
    expect(
      await backendRepositoryFile.readAsString(),
      contains('Future<Map<String, dynamic>?> findById'),
    );

    final backendServiceFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}services${Platform.pathSeparator}contatos_service.dart',
    );
    expect(await backendServiceFile.exists(), isTrue);
    expect(
      await backendServiceFile.readAsString(),
      contains('class ContatosService'),
    );

    final backendControllerFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}controllers${Platform.pathSeparator}contatos_controller.dart',
    );
    expect(await backendControllerFile.exists(), isTrue);
    expect(
      await backendControllerFile.readAsString(),
      contains('class ContatosController'),
    );

    final backendRoutesFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}routes${Platform.pathSeparator}contatos_routes.dart',
    );
    expect(await backendRoutesFile.exists(), isTrue);
    expect(
      await backendRoutesFile.readAsString(),
      contains('setupContatosRoutes'),
    );

    final publicBackendFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}bin${Platform.pathSeparator}public_backend.dart',
    );
    expect(await publicBackendFile.exists(), isTrue);

    final dependencyInjectorFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}api${Platform.pathSeparator}di${Platform.pathSeparator}dependency_injector.dart',
    );
    expect(await dependencyInjectorFile.exists(), isTrue);

    final publicRoutesFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}public${Platform.pathSeparator}api${Platform.pathSeparator}routes${Platform.pathSeparator}public_api_routes.dart',
    );
    expect(await publicRoutesFile.exists(), isTrue);
    expect(
      await publicRoutesFile.readAsString(),
      contains('setupRoutes'),
    );
    expect(
      await publicRoutesFile.readAsString(),
      contains('setupContatosRoutes'),
    );

    final publicControllerFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}public${Platform.pathSeparator}api${Platform.pathSeparator}controllers${Platform.pathSeparator}public_api_controller.dart',
    );
    expect(await publicControllerFile.exists(), isTrue);
    expect(
      await publicControllerFile.readAsString(),
      contains('class PublicApiController'),
    );

    final dbMiddlewareFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}db${Platform.pathSeparator}with_database_shelf.dart',
    );
    expect(await dbMiddlewareFile.exists(), isTrue);
    expect(
      await dbMiddlewareFile.readAsString(),
      contains("'db.connection': connection"),
    );
    expect(
      await dbMiddlewareFile.readAsString(),
      contains('ioc.pushNewScope()'),
    );

    final appConfigFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}shared${Platform.pathSeparator}app_config.dart',
    );
    expect(await appConfigFile.exists(), isTrue);
    expect(
      await appConfigFile.readAsString(),
      contains('class AppConfig'),
    );

    final databaseServiceFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}db${Platform.pathSeparator}database_service.dart',
    );
    expect(await databaseServiceFile.exists(), isTrue);
    expect(
      await databaseServiceFile.readAsString(),
      contains('class DatabaseService'),
    );

    expect(
      await moduleServiceFile.readAsString(),
      contains("/api/v1/contatos"),
    );
  });

  test(
      'migrate maps Access currency to NUMERIC(19,4) and preserves numeric scale',
      () async {
    final tempDir = await Directory.systemTemp.createTemp('access_money_');
    addTearDown(() => tempDir.delete(recursive: true));

    final analysisFile =
        File('${tempDir.path}${Platform.pathSeparator}analysis.json');
    await analysisFile.writeAsString(
      const JsonEncoder.withIndent('  ').convert({
        'schema_version': '1.0',
        'source': 'fixtures/money.accdb',
        'format': 'VERSION_14',
        'summary': {
          'tables': 1,
          'linkedTables': 0,
          'relationships': 0,
          'queries': 0,
          'forms': 0,
          'reports': 0,
          'macros': 0,
          'modules': 0,
        },
        'tables': [
          {
            'name': 'Lancamentos',
            'rowCount': 0,
            'columns': [
              {
                'name': 'ValorMoeda',
                'typeName': 'Currency',
                'typeCode': 5,
                'isAutoNumber': false,
                'isCalculated': false,
                'precision': null,
                'scale': null,
              },
              {
                'name': 'Taxa',
                'typeName': 'Numeric',
                'typeCode': 16,
                'isAutoNumber': false,
                'isCalculated': false,
                'precision': 18,
                'scale': 6,
              },
            ],
            'indexes': [],
            'sampleRows': [],
          },
        ],
        'linkedTables': [],
        'forms': [],
      }),
    );

    final outputDir =
        '${tempDir.path}${Platform.pathSeparator}migration_assets';
    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      [
        'migrate',
        '--analysis',
        analysisFile.path,
        '--output',
        outputDir,
      ],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);

    final schemaFile = File('$outputDir${Platform.pathSeparator}schema.sql');
    final schema = await schemaFile.readAsString();
    expect(schema, contains('"valor_moeda" NUMERIC(19,4)'));
    expect(schema, contains('"taxa" NUMERIC(18,6)'));
    expect(schema, isNot(contains('DOUBLE PRECISION')));
  });
}
