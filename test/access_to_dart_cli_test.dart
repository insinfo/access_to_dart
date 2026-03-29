import 'dart:io';
import 'dart:convert';

import 'package:access_to_dart/access_to_dart.dart';
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
    expect(out.toString(), contains('System catalog row count hint: 53'));
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
    expect(out.toString(), contains('Linked Tables (38):'));
    expect(out.toString(), contains('[LINKED] TbPessoa'));
    expect(out.toString(), contains('Queries (426):'));
    expect(out.toString(), contains('Forms    (85):'));
    expect(out.toString(), contains('Reports  (147):'));
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

    expect(summary['binaryQueries'], 426);
    expect(summary['sourceQueries'], greaterThanOrEqualTo(409));
    expect(summary['matchedRelaxed'], greaterThan(0));
    expect(summary['matchedStructural'], greaterThan(0));
    expect(summary['matchedOrderEquivalent'], greaterThan(0));
    expect(summary['matchedJoinGraph'], greaterThanOrEqualTo(0));
    expect(summary['matchedFromOmitted'], greaterThanOrEqualTo(0));
    expect(summary['matchedSetOperation'], greaterThan(0));
    expect(summary['mismatched'], 0);
    expect(summary['missingInBinary'], greaterThan(0));
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
      expect(out.toString(), contains('Tables (40):'));
      expect(out.toString(), contains('[TABLE] CadResidencia'));
      expect(out.toString(), contains('[TABLE] TbPessoa'));
      expect(err.toString(), isEmpty);
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );
}
