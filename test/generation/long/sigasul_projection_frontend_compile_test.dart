import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';
import 'package:access_to_dart/src/analysis_backend_linker.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('SIGAsul linked schema includes query subforms and compiles person form',
      () async {
    final temp = await Directory.systemTemp.createTemp('sigasul_projection_');
    addTearDown(() => temp.delete(recursive: true));
    final errors = StringBuffer();
    final analysisFile = File('${temp.path}/analysis/analysis.json');
    final existingAnalysis =
        Platform.environment['ACCESS_SIGASUL_ANALYSIS_INPUT'];
    if (existingAnalysis == null || existingAnalysis.isEmpty) {
      expect(
          await run([
            'analyze',
            '--accdb',
            'fixtures/SIGAsul.accdb',
            '--src',
            'fixtures/SIGAsul.accdb.src',
            '--backend-accdb',
            'fixtures/SIGA2021-SUL_be_senha_4462.accdb',
            '--backend-password',
            '4462',
            '--output',
            '${temp.path}/analysis',
          ], out: StringBuffer(), err: errors),
          0,
          reason: errors.toString());
    } else {
      final previous = jsonDecode(await File(existingAnalysis).readAsString())
          as Map<String, dynamic>;
      final merged = AnalysisBackendLinker().mergeLinkedBackendAnalysis(
          previous,
          (previous['backend_analysis'] as Map).cast<String, dynamic>());
      await analysisFile.parent.create(recursive: true);
      await analysisFile.writeAsString(jsonEncode(merged));
    }
    // Optional external audit artifact; never needed for the regression itself.
    final snapshot = Platform.environment['ACCESS_SIGASUL_ANALYSIS_SNAPSHOT'];
    if (snapshot != null && snapshot.isNotEmpty) {
      await File(snapshot).parent.create(recursive: true);
      await analysisFile.copy(snapshot);
    }
    final analysis =
        jsonDecode(await analysisFile.readAsString()) as Map<String, dynamic>;
    final tables = (analysis['tables'] as List).cast<Map>();
    expect(tables, hasLength(50));
    expect(
        tables.where((t) => t['syntheticKind'] != 'attachment'), hasLength(45));
    expect(
        tables.where((t) => t['syntheticKind'] == 'attachment'), hasLength(5));
    final backendTables =
        (analysis['backend_analysis']['tables'] as List).cast<Map>();
    expect(tables.map((t) => t['name']).toSet(),
        backendTables.map((t) => t['name']).toSet());
    expect(analysis['backend_analysis']['relationships'], hasLength(34));
    expect(analysis['relationships'], hasLength(32));
    final tableNames = tables.map((t) => t['name']).toSet();
    final rawRelations =
        (analysis['backend_analysis']['relationships'] as List).cast<Map>();
    final publicRelations = rawRelations.where((r) =>
        tableNames.contains(r['fromTable']) &&
        tableNames.contains(r['toTable']));
    expect(publicRelations, hasLength(32));
    expect(analysis['relationships'], unorderedEquals(publicRelations));
    final person = tables.singleWhere((t) => t['name'] == 'TbPessoa');
    expect(person['columns'], hasLength(59));
    final form = (analysis['source_overlay']['forms'] as List)
        .cast<Map>()
        .singleWhere((f) => f['name'] == 'COMPOSIÇÃO FAMILIAR SUBFORM');
    expect(form['recordSource'], startsWith('SELECT TbPessoa.CodPessoa'));
    // Build one real module to keep compiler regression bounded. The complete
    // linked-table and relationship coverage is checked above, before slicing.
    final slice = <String, dynamic>{
      'schema_version': analysis['schema_version'],
      'source': analysis['source'],
      'format': analysis['format'],
      'tables': [person],
      'forms': [form],
      'relationships': [],
      'linkedTables': [],
      'queries': [],
    };
    final sliceFile = File('${temp.path}/person.json');
    await sliceFile.writeAsString(jsonEncode(slice));
    final output = '${temp.path}/generated';
    expect(
        await run(
            ['generate', '--analysis', sliceFile.path, '--output', output],
            out: StringBuffer(), err: errors),
        0,
        reason: errors.toString());
    final html = await File('$output/frontend/lib/src/modules/tb_pessoa/pages/'
            'incluir_tb_pessoa/incluir_tb_pessoa_page.html')
        .readAsString();
    final namePosition = html.indexOf("readField('nome')");
    final registrationPosition = html.indexOf("readField('data_cad_pes')");
    expect(namePosition, greaterThanOrEqualTo(0));
    expect(registrationPosition, greaterThan(namePosition));
    // CodFam is a real ComboBox in the SQL-backed subform, not a plain number input.
    expect(
        RegExp(r'''<select\s+\[ngModel\]="readField\('cod_fam'\)"''')
            .hasMatch(html),
        isTrue);
    expect(html, contains("readFieldBool('situacao_rua')"));
    await runCheckedProcess('dart', ['pub', 'get'],
        workingDirectory: '$output/core', description: 'SIGAsul core pub get');
    await runCheckedProcess('dart', ['analyze', 'lib'],
        workingDirectory: '$output/core', description: 'SIGAsul core analyze');
    await runCheckedProcess('dart', ['pub', 'get'],
        workingDirectory: '$output/frontend',
        description: 'SIGAsul frontend pub get');
    await runCheckedProcess('dart', ['analyze', 'lib'],
        workingDirectory: '$output/frontend',
        description: 'SIGAsul frontend analyze');
    await runCheckedProcess('dart', ['run', 'tool/build_release.dart'],
        workingDirectory: '$output/frontend',
        description: 'SIGAsul frontend verified release build');
    await expectFrontendDistribution(Directory('$output/frontend'));
  }, timeout: const Timeout(Duration(minutes: 15)));
}
