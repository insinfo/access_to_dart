import 'dart:convert';
import 'dart:io';

Future<File> writeAutonumberAnalysis(Directory temp) async {
  final analysis = File('${temp.path}/analysis.json');
  await analysis.writeAsString(jsonEncode({
    'schema_version': '1.0',
    'source': 'fixtures/cadastro.accdb',
    'format': 'VERSION_16',
    'tables': [
      {
        'name': 'Cadastro',
        'rowCount': 0,
        'columns': [
          {
            'name': 'CodigoCadastro',
            'typeName': 'Long',
            'typeCode': 4,
            'isAutoNumber': true,
            'isRequired': true,
            'isCalculated': false,
          },
          {
            'name': 'Nome',
            'typeName': 'Text',
            'typeCode': 10,
            'isAutoNumber': false,
            'isRequired': false,
            'isCalculated': false,
          },
        ],
        'indexes': [
          {
            'name': 'PrimaryKey',
            'isPrimaryKey': true,
            'columns': [
              {'name': 'CodigoCadastro'}
            ],
          },
        ],
        'sampleRows': [],
      },
    ],
    'linkedTables': [],
    'forms': [],
  }));
  return analysis;
}
