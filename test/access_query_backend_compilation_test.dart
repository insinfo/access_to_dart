import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/project_generator/project_generator.dart';
import 'package:test/test.dart';

void main() {
  test(
      'generates access_queries.dart and access_queries.json with extended catalog queries while preserving strict missing-dao-contract diagnostics',
      () async {
    final temp = await Directory.systemTemp.createTemp('query_backend_ext_');
    addTearDown(() => temp.delete(recursive: true));

    final project = AnalysisProject.fromJson({
      'schema_version': '1.0',
      'source': 'synthetic.accdb',
      'format': 'VERSION_14',
      'tables': [
        {
          'name': 'People',
          'columns': [
            {'name': 'Id', 'typeCode': 4, 'isAutoNumber': true, 'isRequired': true},
            {'name': 'Nome', 'typeCode': 10, 'maxLength': 120},
            {'name': 'DataNasc', 'typeCode': 8},
            {'name': 'Ativo', 'typeCode': 1},
          ],
          'indexes': [
            {
              'name': 'PrimaryKey',
              'isPrimaryKey': true,
              'columns': [{'name': 'Id'}]
            }
          ],
        }
      ],
      'queries': [
        {
          'name': 'ResumoAtivos',
          'sqlText':
              'SELECT TOP 10 People.Nome, Int(DateDiff("d", [DataNasc], Date()) / 365.25) AS Idade FROM People WHERE People.Ativo = Yes AND People.Nome LIKE [Busca] + "*" ORDER BY People.Nome;'
        },
        {
          'name': 'UnionResumo',
          'sqlText':
              'SELECT Count(*) AS Total, 0 AS Inativos FROM People WHERE People.Ativo = Yes UNION ALL SELECT 0 AS Total, Count(*) AS Inativos FROM People WHERE People.Ativo = No;'
        },
        {
          'name': 'AtualizaNada',
          'sqlText': 'UPDATE People SET People.Ativo = No;'
        }
      ],
      'forms': [],
      'reports': [],
      'relationships': [],
    });

    final outDir = Directory('${temp.path}/out');
    await ProjectGenerator().generate(project: project, outputDirectory: outDir.path);

    final queriesJson = jsonDecode(
      await File('${outDir.path}/backend/lib/src/shared/access_queries.json')
          .readAsString(),
    ) as Map<String, dynamic>;

    final queries = queriesJson['queries'] as Map<String, dynamic>;
    expect(queries.keys, containsAll(['resumo_ativos', 'union_resumo']));
    expect(queries['resumo_ativos']['hasLimit'], isTrue);
    expect(queries['union_resumo']['isUnion'], isTrue);

    final strictDiagnostics = (queriesJson['diagnostics'] as List).cast<Map>();
    expect(strictDiagnostics.any((d) => d['status'] == 'missing-dao-contract'), isTrue);

    final extDiagnostics =
        (queriesJson['extended_diagnostics'] as List).cast<Map>();
    expect(
      extDiagnostics.singleWhere((d) => d['query'] == 'ResumoAtivos')['status'],
      'compiled-extended',
    );
    expect(
      extDiagnostics.singleWhere((d) => d['query'] == 'UnionResumo')['status'],
      'compiled-extended',
    );
    expect(
      extDiagnostics.singleWhere((d) => d['query'] == 'AtualizaNada')['status'],
      'skipped-extended',
    );

    final dartSource = await File(
      '${outDir.path}/backend/lib/src/shared/access_queries.dart',
    ).readAsString();
    expect(dartSource, contains('SELECT * FROM (\$rawSql) AS _access_q LIMIT 101'));
    expect(dartSource, contains('DD/MM/AAAA'));
  });
}
