import 'dart:convert';
import 'dart:io';

Map<String, dynamic> subformFixture() {
  Map<String, Object?> column(String name, String type) => {
        'name': name,
        'typeName': type,
        'typeCode': type == 'Text'
            ? 10
            : type == 'DateTime'
                ? 8
                : 4,
        'isAutoNumber': name == 'ID',
        'isRequired': name == 'ID',
      };
  Map<String, Object?> table(String name, List<Map<String, Object?>> columns) =>
      {
        'name': name,
        'columns': columns,
        'sampleRows': [],
        'indexes': [
          {
            'name': 'PrimaryKey',
            'isPrimaryKey': true,
            'columns': [
              {'name': 'ID'}
            ]
          }
        ],
      };
  return {
    'schema_version': '1.0',
    'source': 'subform.accdb',
    'tables': [
      table('Familia', [
        column('ID', 'Long'),
        column('Scope', 'Long'),
        column('Area', 'Text')
      ]),
      table('Pessoa', [
        column('ID', 'Long'),
        column('Family', 'Long'),
        column('Region', 'Text'),
        column('Nome', 'Text'),
        column('Data', 'DateTime')
      ]),
    ],
    'forms': [
      {
        'name': 'FrmFamilia',
        'recordSource': 'Familia',
        'controls': [
          {
            'type': 'Subform',
            'name': 'Pessoas',
            'sourceObject': 'Form.FrmPessoas',
            'linkMasterFields': 'Scope;Area',
            'linkChildFields': 'Family;Region'
          },
        ]
      },
      {
        'name': 'FrmPessoas',
        'properties': <String, String>{},
        'recordSource':
            'SELECT Pessoa.ID, Pessoa.Family, Pessoa.Region, Pessoa.Nome, Pessoa.Data FROM Pessoa;',
        'controls': [
          {'type': 'TextBox', 'name': 'txtNome', 'controlSource': 'Nome'},
          {'type': 'TextBox', 'name': 'Data', 'controlSource': 'Data'}
        ]
      },
    ],
    'relationships': [],
  };
}

Future<File> writeSubformFixture(Directory dir,
    [Map<String, dynamic>? data]) async {
  final file = File('${dir.path}/analysis.json');
  await file.writeAsString(jsonEncode(data ?? subformFixture()));
  return file;
}
