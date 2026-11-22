import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/access_query_contract.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/analysis_overlay_merger.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:access_to_dart/src/migration_not_null_mode.dart';
import 'package:access_to_dart/src/migration_statement_builder.dart';
import 'package:crypto/crypto.dart';
import 'package:test/test.dart';

import '../support/subform_postgres_harness.dart';

void main() {
  test(
      'report16 backend HTTP, compiled NgDart release and asset parity work end-to-end with PostgreSQL',
      () async {
    const reportName = 'prontuario16-REGISTRO-SINTETICO-FR-VERSO';
    const reportKey = 'prontuario_16_registro_sintetico_fr_verso';
    const origin = 'fixtures/SIGAsul.accdb.src';

    final harness = SubformPostgresHarness.fromEnvironment();
    final database = await harness.createTempDatabase();
    addTearDown(() => harness.dropTempDatabase(database));

    final persist = Platform.environment['ACCESS_REPORT16_OUTPUT'];
    final root = persist == null
        ? await Directory.systemTemp.createTemp('report16_pg_')
        : Directory(persist).absolute;
    if (persist == null) {
      addTearDown(() => root.delete(recursive: true));
    } else {
      await root.create(recursive: true);
    }

    final sourceDir = Directory('${root.path}/source');
    await Directory('${sourceDir.path}/reports').create(recursive: true);
    await Directory('${sourceDir.path}/images').create(recursive: true);
    for (final path in [
      'reports/$reportName.bas',
      'reports/$reportName.json',
      'images/logo-SUAS-ICON.json',
      'images/logo-SUAS-ICON.png',
    ]) {
      await File('$origin/$path').copy('${sourceDir.path}/$path');
    }

    final source = await AccessSrcReader().readDirectory(sourceDir.path);
    const querySql =
        'SELECT CadResidencia.CodFam, TbPessoa.NOME, TbUnidade.NOME FROM (TbUnidade INNER JOIN CadResidencia ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]) INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam WHERE (((CadResidencia.CodFam)=[Formulários]![FormProntuario]![CodFamTxt]) AND ((CadResidencia.DataDesligResid) Is Null) AND ((TbPessoa.DataDesligPes) Is Null) AND ((TbPessoa.Parentesco)="Pessoa de Referencia"))';
    const sourceHash =
        '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef';

    final analysis = <String, dynamic>{
      'schema_version': '1.0',
      'source': 'synthetic_sigasul.accdb',
      'format': 'VERSION_16',
      'summary': <String, dynamic>{},
      'tables': [
        {
          'name': 'TbUnidade',
          'rowCount': 1,
          'columns': [
            {
              'name': 'CodUnidade',
              'typeCode': 4,
              'typeName': 'Long',
              'isRequired': true
            },
            {
              'name': 'NOME',
              'typeCode': 10,
              'typeName': 'Text',
            },
          ],
          'indexes': [
            {
              'name': 'PrimaryKey',
              'isPrimaryKey': true,
              'isUnique': true,
              'columns': [
                {'name': 'CodUnidade'}
              ]
            }
          ]
        },
        {
          'name': 'CadResidencia',
          'rowCount': 2,
          'columns': [
            {
              'name': 'CodFam',
              'typeCode': 4,
              'typeName': 'Long',
              'isRequired': true
            },
            {'name': 'CRAS Origem', 'typeCode': 4, 'typeName': 'Long'},
            {'name': 'DataDesligResid', 'typeCode': 8, 'typeName': 'DateTime'},
          ],
          'indexes': [
            {
              'name': 'PrimaryKey',
              'isPrimaryKey': true,
              'isUnique': true,
              'columns': [
                {'name': 'CodFam'}
              ]
            }
          ]
        },
        {
          'name': 'TbPessoa',
          'rowCount': 3,
          'columns': [
            {
              'name': 'CodPessoa',
              'typeCode': 4,
              'typeName': 'Long',
              'isRequired': true
            },
            {'name': 'CodFam', 'typeCode': 4, 'typeName': 'Long'},
            {
              'name': 'NOME',
              'typeCode': 10,
              'typeName': 'Text',
            },
            {
              'name': 'Parentesco',
              'typeCode': 10,
              'typeName': 'Text',
            },
            {'name': 'DataDesligPes', 'typeCode': 8, 'typeName': 'DateTime'},
          ],
          'indexes': [
            {
              'name': 'PrimaryKey',
              'isPrimaryKey': true,
              'isUnique': true,
              'columns': [
                {'name': 'CodPessoa'}
              ]
            }
          ]
        },
      ],
      'linkedTables': <Object?>[],
      'relationships': <Object?>[],
      'queries': [
        {'name': 'CSPRONT1', 'sqlText': querySql}
      ],
      'forms': <Object?>[],
      'reports': [
        {'name': reportName, 'id': 16}
      ],
    };

    attachDaoQueryContract(
      analysis,
      {
        'queryName': 'CSPRONT1',
        'readOnly': true,
        'sourceSha256': sourceHash,
        'sqlSha256': accessQuerySqlHash(querySql),
        'parameters': [
          {
            'name': '[Formulários]![FormProntuario]![CodFamTxt]',
            'daoType': 10,
          }
        ],
        'columns': [
          {'ordinal': 0, 'name': 'CodFam', 'daoType': 4},
          {'ordinal': 1, 'name': 'TbPessoa.NOME', 'daoType': 10},
          {'ordinal': 2, 'name': 'TbUnidade.NOME', 'daoType': 10},
        ],
      },
      actualSourceHash: sourceHash,
      asciiCaseInsensitiveText: true,
    );

    analysis['source_overlay'] = source.toJson();
    AnalysisOverlayMerger().mergeSourceOverlay(analysis, source);

    final analysisFile = File('${root.path}/analysis.json');
    await analysisFile.writeAsString(jsonEncode(analysis));

    final appDir = Directory('${root.path}/app');
    final errors = StringBuffer();
    expect(
      await run(
        ['generate', '--analysis', analysisFile.path, '--output', appDir.path],
        out: StringBuffer(),
        err: errors,
      ),
      0,
      reason: '$errors',
    );

    final project = AnalysisProject.fromJson(analysis);
    const ddlBuilder = MigrationStatementBuilder(
      notNullMode: MigrationNotNullMode.strict,
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
    );
    final db = await harness.openDatabase(database);
    addTearDown(() => db.close());
    for (final table in project.tables) {
      await db
          .createCommand(ddlBuilder.buildCreateTableStatement(table))
          .executeNonQuery();
    }
    for (final sql in [
      "INSERT INTO tb_unidade(cod_unidade, nome) VALUES (1, 'UNIDADE SINTETICA')",
      "INSERT INTO cad_residencia(cod_fam, cras_origem, data_deslig_resid) VALUES (4242, 1, NULL), (4243, 1, '2025-01-10T00:00:00')",
      "INSERT INTO tb_pessoa(cod_pessoa, cod_fam, nome, parentesco, data_deslig_pes) VALUES "
          "(10, 4242, 'Familia Sintetica - Teste de Fidelidade', 'Pessoa de Referencia', NULL), "
          "(11, 4242, 'Membro Secundario', 'Filho', NULL), "
          "(12, 4243, 'Familia Desligada', 'Pessoa de Referencia', NULL)",
    ]) {
      await db.createCommand(sql).executeNonQuery();
    }

    Future<void> runDart(List<String> args, Directory cwd) async {
      final result = await Process.run(
        Platform.resolvedExecutable,
        args,
        workingDirectory: cwd.path,
      ).timeout(const Duration(minutes: 5));
      expect(
        result.exitCode,
        0,
        reason: '${args.join(' ')}\n${result.stdout}\n${result.stderr}',
      );
    }

    final backendDir = Directory('${appDir.path}/backend').absolute;
    final frontendDir = Directory('${appDir.path}/frontend').absolute;
    await runDart(['pub', 'get'], backendDir);
    await runDart(['analyze', 'lib'], backendDir);
    final serverExe =
        '${backendDir.path}/bin/report16_server${Platform.isWindows ? '.exe' : ''}';
    await runDart(['compile', 'exe', 'bin/server.dart', '-o', serverExe], backendDir);

    await runDart(['pub', 'get'], frontendDir);
    await runDart(['analyze', 'lib'], frontendDir);
    await runDart(['run', 'tool/build_release.dart'], frontendDir);

    final releaseDir = Directory('${frontendDir.path}/build').absolute;
    expect(await File('${releaseDir.path}/main.dart.js').exists(), isTrue);

    final fixedPort = Platform.environment['ACCESS_REPORT16_PORT'] ?? '0';
    final process = await Process.start(
      serverExe,
      [
        '--address',
        '127.0.0.1',
        '--port',
        fixedPort,
        '--frontend-dir',
        releaseDir.path,
      ],
      workingDirectory: backendDir.path,
      environment: {
        ...Platform.environment,
        'ACCESS_TO_DART_DB_HOST': harness.host,
        'ACCESS_TO_DART_DB_PORT': '${harness.port}',
        'ACCESS_TO_DART_DB_NAME': database,
        'ACCESS_TO_DART_DB_USER': harness.user,
        'ACCESS_TO_DART_DB_PASSWORD': harness.password,
      },
    );
    addTearDown(() async {
      process.kill();
      await process.exitCode.timeout(const Duration(seconds: 10));
    });

    final ready = Completer<int>();
    final log = StringBuffer();
    process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen((line) {
      log.writeln(line);
      final match = RegExp(r'Serving at http://[^:]+:(\d+)').firstMatch(line);
      if (match != null && !ready.isCompleted) {
        ready.complete(int.parse(match[1]!));
      }
    });
    process.stderr.transform(utf8.decoder).listen(log.write);
    final port = await ready.future.timeout(
      const Duration(seconds: 20),
      onTimeout: () => throw StateError(log.toString()),
    );

    final client = HttpClient();
    addTearDown(() => client.close(force: true));

    Future<(int, String, List<int>, String?)> getRaw(String path) async {
      final response = await (await client
              .getUrl(Uri.parse('http://127.0.0.1:$port$path')))
          .close();
      final bytes = await response.fold<List<int>>(
        <int>[],
        (prev, chunk) => prev..addAll(chunk),
      );
      return (
        response.statusCode,
        utf8.decode(bytes, allowMalformed: true),
        bytes,
        response.headers.contentType?.mimeType,
      );
    }

    final (rootStatus, rootHtml, _, _) = await getRaw('/');
    expect(rootStatus, 200);
    expect(rootHtml, contains('main.dart.js'));

    final (listStatus, listBody, _, _) = await getRaw('/api/v1/access-reports');
    expect(listStatus, 200, reason: listBody);
    final listJson = jsonDecode(listBody) as Map<String, dynamic>;
    expect((listJson['reports'] as List).single['key'], reportKey);

    final encodedParams = Uri.encodeQueryComponent(jsonEncode({'p0': '4242'}));
    final (runStatus, runBody, _, _) =
        await getRaw('/api/v1/access-reports/$reportKey?parameters=$encodedParams');
    expect(runStatus, 200, reason: runBody);
    final runJson = jsonDecode(runBody) as Map<String, dynamic>;
    expect(runJson['rowCount'], 1);
    expect(runJson['controls'], hasLength(38));
    final pageValues =
        ((runJson['pages'] as List).single as Map)['values'] as Map;
    expect(pageValues['CadResidencia.CodFam'], '4242');
    expect(pageValues['Nome'], 'FAMILIA SINTETICA - TESTE DE FIDELIDADE');

    final emptyParams = Uri.encodeQueryComponent(jsonEncode({'p0': '4243'}));
    final (emptyStatus, emptyBody, _, _) =
        await getRaw('/api/v1/access-reports/$reportKey?parameters=$emptyParams');
    expect(emptyStatus, 200);
    expect((jsonDecode(emptyBody) as Map)['rowCount'], 0);

    final (badStatus, _, _, _) =
        await getRaw('/api/v1/access-reports/$reportKey?parameters=%7B%7D');
    expect(badStatus, 400);

    final (assetStatus, _, assetBytes, assetMime) = await getRaw(
        '/api/v1/access-reports/$reportKey/assets/logo-SUAS-ICON.png');
    expect(assetStatus, 200);
    expect(assetMime, 'image/png');
    final expectedLogoBytes =
        await File('$origin/images/logo-SUAS-ICON.png').readAsBytes();
    expect(
      sha256.convert(assetBytes).toString(),
      sha256.convert(expectedLogoBytes).toString(),
    );

    if (Platform.environment['ACCESS_REPORT16_BROWSER_HOLD'] == '1') {
      final done = File('${root.path}/browser.done.json');
      if (await done.exists()) await done.delete();
      await File('${root.path}/browser.ready.json')
          .writeAsString(jsonEncode({'port': port}));
      stdout.writeln('REPORT16_BROWSER_READY port=$port');
      final until = DateTime.now().add(const Duration(minutes: 4));
      while (!await done.exists() && DateTime.now().isBefore(until)) {
        await Future<void>.delayed(const Duration(milliseconds: 250));
      }
      expect(await done.exists(), isTrue, reason: 'Browser verification timeout');
      final browserResult =
          jsonDecode(await done.readAsString()) as Map<String, dynamic>;
      expect(browserResult['status'], 'passed', reason: '$browserResult');
    }
  }, timeout: const Timeout(Duration(minutes: 15)));
}
