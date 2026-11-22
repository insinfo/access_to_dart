import 'dart:io';
import 'dart:convert';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:crypto/crypto.dart';
import 'package:test/test.dart';

void main() {
  test('prints usage when no command is provided', () async {
    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(<String>[], out: out, err: err);

    expect(exitCode, 0);
    expect(out.toString(), contains('inspect-accdb --accdb <path-to.accdb>'));
    expect(err.toString(), isEmpty);
  });

  test('inspects the internal teste1 fixture', () async {
    final fixture = File.fromUri(
      Directory.current.uri.resolve('fixtures/teste1/teste1.accdb'),
    );
    expect(await fixture.exists(), isTrue);

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      <String>['inspect-accdb', '--accdb', fixture.path],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(out.toString(), contains('ACCDB inspection'));
    expect(out.toString(), contains('Format: VERSION_14'));
    expect(out.toString(), contains('System catalog page: 2 (TABLE_DEF)'));
    expect(out.toString(), contains('System catalog row count hint: 54'));
    expect(err.toString(), isEmpty);
  });

  test('fails fast when inspect-accdb is missing the file option', () async {
    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      <String>['inspect-accdb'],
      out: out,
      err: err,
    );

    expect(exitCode, 64);
    expect(out.toString(), isEmpty);
    expect(err.toString(), contains('--accdb <path-to.accdb>'));
  });

  test('reads the internal accdb.src fixture and returns parsed JSON',
      () async {
    final fixtureDir = Directory.fromUri(
      Directory.current.uri.resolve('fixtures/teste1/teste1.accdb.src/'),
    );
    expect(await fixtureDir.exists(), isTrue);

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      <String>['read-src', '--src', fixtureDir.path],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);

    final parsed = jsonDecode(out.toString()) as Map<String, dynamic>;
    final tables = parsed['tables'] as List<dynamic>;
    final queries = parsed['queries'] as List<dynamic>;
    final forms = parsed['forms'] as List<dynamic>;

    expect(
      tables.any(
          (table) => (table as Map<String, dynamic>)['name'] == 'Contatos'),
      isTrue,
    );
    expect(
      queries.any((query) =>
          (query as Map<String, dynamic>)['name'] == 'ContatosEstendidos'),
      isTrue,
    );
    expect(
      forms.any((form) =>
          (form as Map<String, dynamic>)['name'] == 'DetalhesDoContato'),
      isTrue,
    );
    expect(
      forms.any((form) =>
          (form as Map<String, dynamic>)['name'] == 'ListaDeContatos'),
      isTrue,
    );
    expect(
      forms.any((form) =>
          (form as Map<String, dynamic>)['name'] == 'FolhaDeDadosDoContato'),
      isTrue,
    );
  });

  test('inspects SIGAsul frontend and reports linked tables', () async {
    final fixture = File.fromUri(
      Directory.current.uri.resolve('fixtures/SIGAsul.accdb'),
    );
    expect(await fixture.exists(), isTrue);

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      <String>['inspect-accdb', '--accdb', fixture.path],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(out.toString(), contains('Linked Tables (45):'));
    expect(out.toString(), contains('[LINKED] TbPessoa'));
    expect(out.toString(), contains('Queries (501):'));
    expect(out.toString(), contains('Forms    (97):'));
    expect(out.toString(), contains('Reports  (165):'));
    expect(err.toString(), isEmpty);
  });

  test('reads SIGAsul.accdb.src linked-table metadata and SQL overlay',
      () async {
    final fixtureDir = Directory.fromUri(
      Directory.current.uri.resolve('fixtures/SIGAsul.accdb.src/'),
    );
    expect(await fixtureDir.exists(), isTrue);

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      <String>['read-src', '--src', fixtureDir.path],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);

    final parsed = jsonDecode(out.toString()) as Map<String, dynamic>;
    final tables = parsed['tables'] as List<dynamic>;
    final queries = parsed['queries'] as List<dynamic>;

    final tbPessoa = tables
        .cast<Map<String, dynamic>>()
        .firstWhere((table) => table['name'] == 'TbPessoa');

    expect(tables.length, greaterThanOrEqualTo(38));
    expect(tbPessoa['isLinked'], isTrue);
    expect(
      tbPessoa['connect'],
      contains('SIGA2021-SUL_be_senha_4462.accdb'),
    );
    expect(tbPessoa['sourceTableName'], 'TbPessoa');
    expect(tbPessoa['primaryKey'], '[CodPessoa]');
    expect(
      queries.any(
        (query) =>
            (query as Map<String, dynamic>)['name'] ==
                'listagem benef munic movimento ano GERAL' &&
            ((query)['sql'] as String).contains('INNER JOIN TbBenfMunDet'),
      ),
      isTrue,
    );
  });

  test('analyze emits query reconciliation for SIGAsul overlay', () async {
    final fixture = File.fromUri(
      Directory.current.uri.resolve('fixtures/SIGAsul.accdb'),
    );
    final fixtureDir = Directory.fromUri(
      Directory.current.uri.resolve('fixtures/SIGAsul.accdb.src/'),
    );
    expect(await fixture.exists(), isTrue);
    expect(await fixtureDir.exists(), isTrue);

    final tempDir = await Directory.systemTemp.createTemp('sigasul_analysis_');
    addTearDown(() => tempDir.delete(recursive: true));

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      <String>[
        'analyze',
        '--accdb',
        fixture.path,
        '--src',
        fixtureDir.path,
        '--output',
        tempDir.path,
      ],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);
    expect(out.toString(), contains('Query match :'));
    expect(out.toString(), contains('Query relax :'));
    expect(out.toString(), contains('Query shape :'));
    expect(out.toString(), contains('Query order :'));
    expect(out.toString(), contains('Query join  :'));
    expect(out.toString(), contains('Query from  :'));
    expect(out.toString(), contains('Query setop :'));
    expect(out.toString(), contains('Bin SQL miss:'));

    final analysisFile =
        File('${tempDir.path}${Platform.pathSeparator}analysis.json');
    final parsed =
        jsonDecode(await analysisFile.readAsString()) as Map<String, dynamic>;
    final reconciliation =
        parsed['query_reconciliation'] as Map<String, dynamic>;
    final summary = reconciliation['summary'] as Map<String, dynamic>;
    final featureCoverage =
        reconciliation['featureCoverage'] as Map<String, dynamic>;
    final binaryCoverage = featureCoverage['binary'] as Map<String, dynamic>;
    final sourceCoverage = featureCoverage['source'] as Map<String, dynamic>;

    expect(summary['binaryQueries'], 501);
    expect(summary['sourceQueries'], 409);
    expect(summary['matchedRelaxed'], greaterThan(0));
    expect(summary['matchedStructural'], greaterThan(0));
    expect(summary['matchedOrderEquivalent'], greaterThan(0));
    expect(summary['matchedJoinGraph'], greaterThanOrEqualTo(0));
    expect(summary['matchedFromOmitted'], greaterThanOrEqualTo(0));
    expect(summary['matchedSetOperation'], greaterThan(0));
    expect(summary['mismatched'], 0);
    // Os 409 nomes do export estão no conjunto de 501 QueryDefs conferido via DAO.
    expect(summary['missingInBinary'], 0);
    expect(summary['missingInSource'], 92);
    expect(binaryCoverage['hasJoin'], greaterThan(0));
    expect(sourceCoverage['hasGroupBy'], greaterThan(0));
  }, timeout: const Timeout(Duration(minutes: 2)));

  test('analyze merges source overlay column metadata into tables', () async {
    final fixture = File.fromUri(
      Directory.current.uri.resolve('fixtures/teste1/teste1.accdb'),
    );
    final fixtureDir = Directory.fromUri(
      Directory.current.uri.resolve('fixtures/teste1/teste1.accdb.src/'),
    );
    expect(await fixture.exists(), isTrue);
    expect(await fixtureDir.exists(), isTrue);

    final tempDir = await Directory.systemTemp.createTemp('teste1_analysis_');
    addTearDown(() => tempDir.delete(recursive: true));

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      <String>[
        'analyze',
        '--accdb',
        fixture.path,
        '--src',
        fixtureDir.path,
        '--output',
        tempDir.path,
      ],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);

    final analysisFile =
        File('${tempDir.path}${Platform.pathSeparator}analysis.json');
    final parsed =
        jsonDecode(await analysisFile.readAsString()) as Map<String, dynamic>;
    final contatos = (parsed['tables'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .singleWhere((table) => table['name'] == 'Contatos');
    final sobrenome = (contatos['columns'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .singleWhere((column) => column['name'] == 'Sobrenome');
    final nomeDoContato = (contatos['columns'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .singleWhere((column) => column['name'] == 'NomeDoContato');

    expect(sobrenome['isRequired'], isTrue);
    expect(
      nomeDoContato['calculatedExpression'],
      contains('IIf(IsNull([Sobrenome])'),
    );
    expect(
      contatos['postgres_ddl'],
      contains('"sobrenome" TEXT NOT NULL'),
    );
  });

  test('reports encrypted backend metadata when password is missing', () async {
    final fixture = File.fromUri(
      Directory.current.uri
          .resolve('fixtures/SIGA2021-SUL_be_senha_4462.accdb'),
    );
    expect(await fixture.exists(), isTrue);

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      <String>['inspect-accdb', '--accdb', fixture.path],
      out: out,
      err: err,
    );

    expect(exitCode, 65);
    expect(out.toString(), isEmpty);
    expect(err.toString(), contains('Encrypted ACCDB detected'));
    expect(err.toString(), contains('Retry with --password'));
  });

  test(
    'inspects encrypted SIGA backend when password is provided',
    () async {
      final fixture = File.fromUri(
        Directory.current.uri
            .resolve('fixtures/SIGA2021-SUL_be_senha_4462.accdb'),
      );
      expect(await fixture.exists(), isTrue);

      final out = StringBuffer();
      final err = StringBuffer();

      final exitCode = await run(
        <String>[
          'inspect-accdb',
          '--accdb',
          fixture.path,
          '--password',
          '4462',
        ],
        out: out,
        err: err,
      );

      expect(exitCode, 0);
      expect(out.toString(), contains('Encryption: Office 4.4 AES-256'));
      expect(out.toString(), contains('Tables (45):'));
      expect(out.toString(), contains('[TABLE] CadResidencia'));
      expect(out.toString(), contains('[TABLE] TbPessoa'));
      expect(err.toString(), isEmpty);
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  test(
    'analyze validates --dao-query-shape paths, source hashes and invokes contract verification',
    () async {
      final cpfFixture = File.fromUri(
        Directory.current.uri.resolve('fixtures/cpf_demo.accdb'),
      );
      expect(await cpfFixture.exists(), isTrue);
      final tempDir =
          await Directory.systemTemp.createTemp('cli_dao_shape_contract_');
      addTearDown(() => tempDir.delete(recursive: true));

      final missingErr = StringBuffer();
      final missingCode = await run(
        <String>[
          'analyze',
          '--accdb',
          cpfFixture.path,
          '--dao-query-shape',
          '${tempDir.path}/does_not_exist.json',
          '--output',
          '${tempDir.path}/missing_out',
        ],
        out: StringBuffer(),
        err: missingErr,
      );
      expect(missingCode, 66);
      expect(missingErr.toString(), contains('Missing DAO query shape file'));

      final mismatchedShapeFile = File('${tempDir.path}/bad_shape.json');
      await mismatchedShapeFile.writeAsString(jsonEncode({
        'sourceSha256': 'f' * 64,
        'queryName': 'CSPRONT1',
        'sqlSha256': '0' * 64,
        'readOnly': true,
        'parameters': const <Object?>[],
        'columns': const <Object?>[],
      }));
      final badErr = StringBuffer();
      final badCode = await run(
        <String>[
          'analyze',
          '--accdb',
          cpfFixture.path,
          '--dao-query-shape',
          mismatchedShapeFile.path,
          '--output',
          '${tempDir.path}/bad_out',
        ],
        out: StringBuffer(),
        err: badErr,
      );
      expect(badCode, 65);
      expect(badErr.toString(), contains('mismatch'));

      final cpfHash = (await sha256.bind(cpfFixture.openRead()).first).toString();
      final unknownQueryShape = File('${tempDir.path}/unknown_query.json');
      await unknownQueryShape.writeAsString(jsonEncode({
        'sourceSha256': cpfHash,
        'queryName': 'QueryInexistente',
        'sqlSha256': '0' * 64,
        'readOnly': true,
        'parameters': const <Object?>[],
        'columns': const <Object?>[],
      }));
      final contractErr = StringBuffer();
      final contractCode = await run(
        <String>[
          'analyze',
          '--accdb',
          cpfFixture.path,
          '--dao-query-shape',
          unknownQueryShape.path,
          '--output',
          '${tempDir.path}/unknown_out',
        ],
        out: StringBuffer(),
        err: contractErr,
      );
      expect(contractCode, 1);
      expect(contractErr.toString(), contains('Expected exactly one named query'));
    },
  );

  test(
    'analyze extracts binary database_properties and MSysResources without --src on teste1',
    () async {
      final fixture = File.fromUri(
        Directory.current.uri.resolve('fixtures/teste1/teste1.accdb'),
      );
      expect(await fixture.exists(), isTrue);
      final tempDir =
          await Directory.systemTemp.createTemp('cli_binary_res_teste1_');
      addTearDown(() => tempDir.delete(recursive: true));

      final err = StringBuffer();
      final exitCode = await run(
        <String>[
          'analyze',
          '--accdb',
          fixture.path,
          '--output',
          tempDir.path,
        ],
        out: StringBuffer(),
        err: err,
      );
      expect(exitCode, 0, reason: '$err');

      final analysis = jsonDecode(
        await File('${tempDir.path}/analysis.json').readAsString(),
      ) as Map<String, dynamic>;
      final dbProps = analysis['database_properties'] as Map<String, dynamic>;
      expect(dbProps['Theme Resource Name'], 'Tema do Office');

      final resources = (analysis['resources'] as List).cast<Map>();
      final thmx = resources.firstWhere((r) => r['type'] == 'thmx');
      expect(thmx['name'], 'Tema do Office');
      expect(base64Decode(thmx['dataBase64'] as String), isNotEmpty);

      final img = resources.firstWhere(
        (r) =>
            r['type'] == 'img' &&
            r['name'] == 'OutlookSearchMagnifyingGlassHS',
      );
      expect(base64Decode(img['dataBase64'] as String), isNotEmpty);
    },
  );

  test(
    'analyze links SIGAsul binary-only frontend and backend without --src',
    () async {
      final frontend = File.fromUri(
        Directory.current.uri.resolve('fixtures/SIGAsul.accdb'),
      );
      final backend = File.fromUri(
        Directory.current.uri
            .resolve('fixtures/SIGA2021-SUL_be_senha_4462.accdb'),
      );
      expect(await frontend.exists(), isTrue);
      expect(await backend.exists(), isTrue);
      final tempDir =
          await Directory.systemTemp.createTemp('cli_binary_sigasul_');
      addTearDown(() => tempDir.delete(recursive: true));

      final err = StringBuffer();
      final exitCode = await run(
        <String>[
          'analyze',
          '--accdb',
          frontend.path,
          '--backend-accdb',
          backend.path,
          '--backend-password',
          '4462',
          '--output',
          tempDir.path,
        ],
        out: StringBuffer(),
        err: err,
      );
      expect(exitCode, 0, reason: '$err');

      final analysis = jsonDecode(
        await File('${tempDir.path}/analysis.json').readAsString(),
      ) as Map<String, dynamic>;
      final linkedTables = (analysis['linkedTables'] as List).cast<Map>();
      expect(linkedTables, hasLength(45));
      expect(linkedTables.first['foreignName'], isA<String>());
      expect(linkedTables.first['sourceTableName'], isA<String>());
      expect(
        linkedTables.first['database']?.toString(),
        contains('SIGA2021-SUL_be_senha_4462.accdb'),
      );
      expect(linkedTables.first['connect'], 'MS Access;PWD=4462;');

      expect((analysis['tables'] as List), hasLength(54));
      final dbProps = analysis['database_properties'] as Map<String, dynamic>;
      expect(dbProps['Theme Resource Name'], 'Tema do Office');

      final resources = (analysis['resources'] as List).cast<Map>();
      expect(resources, hasLength(194));
      expect(
        resources.any(
            (r) => r['type'] == 'thmx' && r['name'] == 'Tema do Office'),
        isTrue,
      );
      expect(resources.any((r) => r['type'] == 'img'), isTrue);
    },
    timeout: const Timeout(Duration(minutes: 4)),
  );
}
