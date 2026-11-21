import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';
import '../support/generation_test_utils.dart';

void main() {
  for (final clause in [
    'FROM Pessoas WHERE ID > 1 ORDER BY Nome',
    'FROM Pessoas LEFT JOIN Filtros ON Pessoas.ID = Filtros.ID',
    'FROM Pessoas ORDER BY Nome DESC',
    'FROM Pessoas ORDER BY Nome, ID',
    'FROM Pessoas GROUP BY ID, Nome',
    "FROM Pessoas WHERE Pessoas.Nome='x' OR Pessoas.Nome='y'",
    "FROM Pessoas WHERE Pessoas.Unknown='x'",
    "FROM Pessoas WHERE Pessoas.ID='2'",
    'FROM Pessoas INNER JOIN Filtros ON Pessoas.Unknown = Filtros.ID',
    'FROM Pessoas INNER JOIN Filtros ON Pessoas.ID = Filtros.ID AND Pessoas.ID > 0',
  ]) {
    test('lookup does not discard unsupported semantics: $clause', () async {
      final temp = await Directory.systemTemp.createTemp('lookup_semantics_');
      addTearDown(() => temp.delete(recursive: true));
      final analysis = await writeDropdownAnalysisFixture(temp);
      await analysis.writeAsString((await analysis.readAsString())
          .replaceAll('FROM Pessoas ORDER BY [Nome];', '$clause;'));
      final output = '${temp.path}/generated';
      final errors = StringBuffer();
      expect(
          await run(
              ['generate', '--analysis', analysis.path, '--output', output],
              out: StringBuffer(), err: errors),
          0,
          reason: errors.toString());
      final service = await File(
              '$output/backend/lib/src/modules/filtros/services/filtros_service.dart')
          .readAsString();
      expect(service, isNot(contains("case 'pessoa_selecionada':")));
    });
  }
  test('single-column lookup keeps its projected label', () async {
    final temp = await Directory.systemTemp.createTemp('lookup_single_');
    addTearDown(() => temp.delete(recursive: true));
    final analysis = await writeDropdownAnalysisFixture(temp);
    await analysis.writeAsString((await analysis.readAsString()).replaceAll(
        'SELECT [Pessoas].[ID], [Pessoas].[Nome]', 'SELECT [Pessoas].[ID]'));
    final output = '${temp.path}/generated';
    expect(
        await run(['generate', '--analysis', analysis.path, '--output', output],
            out: StringBuffer(), err: StringBuffer()),
        0);
    final service = await File(
            '$output/backend/lib/src/modules/filtros/services/filtros_service.dart')
        .readAsString();
    expect(service, contains('sourceTable: "pessoas"'));
    expect(service, contains("labelColumn: 'id'"));
  });
  test('lookup filter preserves and binds literal content', () async {
    final temp = await Directory.systemTemp.createTemp('lookup_literal_');
    addTearDown(() => temp.delete(recursive: true));
    final analysis = await writeDropdownAnalysisFixture(temp);
    await analysis.writeAsString((await analysis.readAsString()).replaceAll(
        'FROM Pessoas ORDER BY [Nome];',
        "FROM Pessoas WHERE Pessoas.Nome='O''Brien' ORDER BY [Nome];"));
    final output = '${temp.path}/generated';
    expect(
        await run(['generate', '--analysis', analysis.path, '--output', output],
            out: StringBuffer(), err: StringBuffer()),
        0);
    final service = await File(
            '$output/backend/lib/src/modules/filtros/services/filtros_service.dart')
        .readAsString();
    expect(service, contains('filterValue: "O\'Brien"'));
    final repository = await File(
            '$output/backend/lib/src/modules/filtros/repositories/filtros_repository.dart')
        .readAsString();
    expect(repository, contains("LOWER(?)', [filterValue]"));
    expect(repository, isNot(contains("O'Brien")));
  });
}
