import 'package:access_to_dart/src/analysis_doctor.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:test/test.dart';

void main() {
  test('doctor classifica frontend vinculado como prontidao parcial', () {
    final project = AnalysisProject.fromJson({
      'schema_version': '1.0',
      'source': 'fixtures/SIGAsul.accdb',
      'format': 'VERSION_14',
      'summary': const {},
      'tables': const [],
      'linkedTables': [
        {'name': 'TbPessoa'},
      ],
      'forms': [
        {'name': 'FormA'},
      ],
      'query_reconciliation': {
        'summary': {
          'matchedNormalized': 10,
          'matchedRelaxed': 2,
          'matchedStructural': 1,
          'matchedOrderEquivalent': 3,
          'matchedJoinGraph': 0,
          'matchedSetOperation': 1,
          'mismatched': 0,
          'missingInBinary': 80,
          'missingInSource': 97,
        },
      },
    });

    final report = AnalysisDoctor().inspect(project);
    final codes = report.issues.map((issue) => issue.code).toSet();

    expect(report.readinessLevel, 'partial');
    expect(codes, contains('analysis.linked_only'));
    expect(codes, contains('query.reconciliation_clean'));
    expect(codes, contains('query.coverage_gap'));
    expect(codes, contains('forms.catalog_only'));
  });

  test('doctor marca prontidao ready quando nao ha warnings nem errors', () {
    final project = AnalysisProject.fromJson({
      'schema_version': '1.0',
      'source': 'fixtures/teste1.accdb',
      'format': 'VERSION_14',
      'summary': const {},
      'tables': [
        {
          'name': 'Contatos',
          'rowCount': 1,
          'columns': [
            {
              'name': 'Id',
              'typeName': 'Long',
              'typeCode': 4,
              'isAutoNumber': true,
              'isCalculated': false,
              'precision': null,
              'scale': null,
            },
          ],
          'indexes': [
            {
              'name': 'PrimaryKey',
              'isPrimaryKey': true,
              'columns': [
                {'name': 'Id'},
              ],
            },
          ],
          'sampleRows': [
            {'Id': 1},
          ],
        },
      ],
      'linkedTables': const [],
      'forms': const [],
      'query_reconciliation': {
        'summary': {
          'matchedNormalized': 1,
          'matchedRelaxed': 0,
          'matchedStructural': 0,
          'matchedOrderEquivalent': 0,
          'matchedJoinGraph': 0,
          'matchedSetOperation': 0,
          'mismatched': 0,
          'missingInBinary': 0,
          'missingInSource': 0,
        },
      },
    });

    final report = AnalysisDoctor().inspect(project);

    expect(report.readinessLevel, 'ready');
    expect(report.issues.any((issue) => issue.severity == 'warning'), isFalse);
    expect(report.issues.any((issue) => issue.code == 'query.reconciliation_clean'), isTrue);
  });
}