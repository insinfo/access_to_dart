import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  for (final sql in [
    'SELECT * FROM Cadastro;',
    'SELECT Cadastro.* FROM Cadastro',
    'SELECT [Cadastro].[Nome], [Cadastro].[Observacoes] FROM [Cadastro];',
  ]) {
    test('projection form metadata reaches scaffold: $sql', () async {
      final temp = await Directory.systemTemp.createTemp('projection_form_');
      addTearDown(() => temp.delete(recursive: true));
      final file = await writeFormControlsAnalysisFixture(temp);
      final data = jsonDecode(await file.readAsString()) as Map;
      final form = data['forms'][0] as Map;
      form['recordSource'] = sql;
      form['controls'] = (form['controls'] as List)
          .where((c) => ['Nome', 'Observacoes'].contains(c['controlSource']))
          .toList();
      final columns = data['tables'][0]['columns'] as List;
      final email = columns.singleWhere((c) => c['name'] == 'Email') as Map;
      email['isRequired'] = true;
      email['defaultValue'] = '"pendente"';
      await file.writeAsString(jsonEncode(data));
      final errors = StringBuffer();
      expect(
          await run([
            'generate',
            '--analysis',
            file.path,
            '--output',
            '${temp.path}/generated'
          ], err: errors, out: StringBuffer()),
          0,
          reason: errors.toString());
      final html = await File('${temp.path}/generated/frontend/lib/src/modules/'
              'cadastro/pages/incluir_cadastro/incluir_cadastro_page.html')
          .readAsString();
      expect(html, contains('Observações detalhadas'));
      expect(html, contains('Nome completo'));
      expect(html.indexOf('Observações detalhadas'),
          lessThan(html.indexOf('Nome completo')));
      // Projection metadata must not remove remaining schema fields.
      expect(html, contains('Email base'));
      final dart = await File('${temp.path}/generated/frontend/lib/src/modules/'
              'cadastro/pages/incluir_cadastro/incluir_cadastro_page.dart')
          .readAsString();
      expect(dart, contains('pendente'));
      final logic =
          await File('${temp.path}/generated/frontend/lib/src/modules/'
                  'cadastro/logic/cadastro_form_logic.dart')
              .readAsString();
      expect(logic, contains('Email base'));
    });
  }

  for (final sql in [
    'SELECT * FROM Cadastro WHERE ID = 1',
    'SELECT * FROM Cadastro ORDER BY Nome',
    'SELECT DISTINCT Nome FROM Cadastro',
    'SELECT TOP 1 Nome FROM Cadastro',
    'SELECT Nome AS Pessoa FROM Cadastro',
    'SELECT Count(*) FROM Cadastro',
    'SELECT Nome FROM Cadastro UNION SELECT Nome FROM Outra',
    'SELECT Cadastro.Nome FROM Cadastro INNER JOIN Outra ON Cadastro.ID=Outra.ID',
    'SELECT Outra.Nome FROM Cadastro',
    'SELECT CampoInexistente FROM Cadastro',
    'SELECT "FROM Cadastro" FROM Outra',
  ]) {
    test('does not discard query semantics: $sql', () async {
      final temp =
          await Directory.systemTemp.createTemp('unsupported_projection_');
      addTearDown(() => temp.delete(recursive: true));
      final file = await writeFormControlsAnalysisFixture(temp);
      final data = jsonDecode(await file.readAsString()) as Map;
      data['forms'][0]['recordSource'] = sql;
      await file.writeAsString(jsonEncode(data));
      final errors = StringBuffer();
      expect(
          await run([
            'generate',
            '--analysis',
            file.path,
            '--output',
            '${temp.path}/generated'
          ], err: errors, out: StringBuffer()),
          0,
          reason: errors.toString());
      final html = await File('${temp.path}/generated/frontend/lib/src/modules/'
              'cadastro/pages/incluir_cadastro/incluir_cadastro_page.html')
          .readAsString();
      expect(html, contains('Nome base'));
      expect(html, isNot(contains('Nome completo')));
    });
  }
}
