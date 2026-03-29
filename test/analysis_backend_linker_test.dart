import 'package:access_to_dart/src/analysis_backend_linker.dart';
import 'package:test/test.dart';

void main() {
  test('mergeLinkedBackendAnalysis materializes backend tables referenced by linked frontend forms', () {
    final frontend = <String, dynamic>{
      'schema_version': '1.0',
      'source': 'fixtures/SIGAsul.accdb',
      'format': 'VERSION_14',
      'summary': {
        'tables': 0,
        'linkedTables': 1,
        'relationships': 0,
        'queries': 0,
        'forms': 1,
        'reports': 0,
        'macros': 0,
        'modules': 0,
      },
      'tables': const [],
      'linkedTables': [
        {'name': 'TbPessoa'},
      ],
      'relationships': const [],
      'queries': const [],
      'forms': const [],
      'canonical_analysis': {
        'forms': [
          {
            'name': 'frmPessoa',
            'components': {'recordSource': 'TbPessoa'},
            'rawVbaCode': 'Private Sub Form_Load()\nEnd Sub',
          },
        ],
        'modules': const [],
      },
      'source_overlay': {
        'sourcePath': 'fixtures/SIGAsul.accdb.src',
        'tables': [
          {
            'name': 'TbPessoa',
            'sql': '',
            'columns': const [],
            'indexes': const [],
            'isLinked': true,
            'sourceTableName': 'TbPessoa',
            'connect': ';DATABASE=fixtures/SIGA2021-SUL_be_senha_4462.accdb',
            'primaryKey': '[CodPessoa]',
          },
        ],
        'queries': const [],
        'forms': [
          {
            'name': 'frmPessoa',
            'caption': 'Pessoa',
            'recordSource': 'TbPessoa',
            'controls': const [],
            'macros': const <String, dynamic>{},
          },
        ],
      },
    };

    final backend = <String, dynamic>{
      'schema_version': '1.0',
      'source': 'fixtures/SIGA2021-SUL_be_senha_4462.accdb',
      'format': 'VERSION_14',
      'summary': {
        'tables': 1,
        'linkedTables': 0,
        'relationships': 1,
        'queries': 0,
        'forms': 0,
        'reports': 0,
        'macros': 0,
        'modules': 0,
      },
      'tables': [
        {
          'name': 'TbPessoa',
          'rowCount': 0,
          'columns': [
            {
              'name': 'CodPessoa',
              'typeName': 'Long',
              'typeCode': 4,
              'isAutoNumber': true,
              'isCalculated': false,
              'isRequired': true,
              'precision': null,
              'scale': null,
            },
            {
              'name': 'Nome',
              'typeName': 'Text',
              'typeCode': 10,
              'isAutoNumber': false,
              'isCalculated': false,
              'isRequired': false,
              'caption': 'Nome',
              'maxLength': 120,
              'precision': null,
              'scale': null,
            },
          ],
          'indexes': [
            {
              'name': 'PrimaryKey',
              'isPrimaryKey': true,
              'columns': [
                {'name': 'CodPessoa'},
              ],
            },
          ],
          'sampleRows': const [],
          'postgres_ddl': 'CREATE TABLE "tb_pessoa" ();',
          'dart_class_name': 'TbPessoa',
        },
      ],
      'linkedTables': const [],
      'relationships': [
        {
          'name': 'RelPessoaTeste',
          'fromTable': 'TbPessoa',
          'fromColumns': ['CodPessoa'],
          'toTable': 'TbPessoa',
          'toColumns': ['CodPessoa'],
        },
      ],
      'queries': const [],
      'forms': const [],
    };

    final merged = AnalysisBackendLinker().mergeLinkedBackendAnalysis(frontend, backend);

    expect((merged['tables'] as List<dynamic>), hasLength(1));
    expect(((merged['tables'] as List<dynamic>).single as Map<String, dynamic>)['name'], 'TbPessoa');
    expect((merged['relationships'] as List<dynamic>), hasLength(1));
    expect((merged['summary'] as Map<String, dynamic>)['tables'], 1);
    expect((merged['backend_analysis'] as Map<String, dynamic>)['source'], contains('SIGA2021-SUL_be_senha_4462.accdb'));
  });
}