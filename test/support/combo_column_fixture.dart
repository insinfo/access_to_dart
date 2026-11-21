import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';

Future<Map<String, dynamic>> comboColumnFixture() async {
  final src =
      await AccessSrcReader().readDirectory('fixtures/SIGAsul.accdb.src');
  Map<String, dynamic> column(String name, bool text) => {
        'name': name,
        'typeCode': text ? 10 : 4,
        'typeName': text ? 'Text' : 'Long'
      };
  Map<String, dynamic> table(
          String name, String pk, List<Map<String, dynamic>> columns) =>
      {
        'name': name,
        'columns': columns,
        'sampleRows': [],
        'indexes': [
          {
            'name': 'PrimaryKey',
            'isPrimaryKey': true,
            'isUnique': true,
            'columns': [
              {'name': pk, 'columnNumber': 0}
            ]
          }
        ]
      };
  final data = {
    'schema_version': '1',
    'source': 'SIGAsul.accdb',
    'format': 'ACCDB',
    'tables': [
      table('TbAtend', 'CodAtend', [
        {...column('CodAtend', false), 'isAutoNumber': true},
        {
          ...column('CodFunc', false),
          'displayControl': 111,
          'rowSourceType': 'Table/Query',
          'rowSource':
              'SELECT [TbCadFuncionario].[CodFunc], [TbCadFuncionario].[Nome] FROM TbCadFuncionario ORDER BY [CodFunc];'
        },
        column('NomeFunc', true),
        column('FuncaoFuncionario', true),
      ]),
      table('TbCadFuncionario', 'CodFunc', [
        column('CodFunc', false),
        column('Nome', true),
        column('FUNÇÃO NO SISTEMA', true)
      ]),
    ],
    'forms': [src.forms.singleWhere((f) => f.name == 'FrmAtendimento').toJson()]
  };
  return jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
}

Future<Directory> generateComboColumn(
    Map<String, dynamic> data, Directory root) async {
  await root.create(recursive: true);
  final file = File('${root.path}/analysis.json');
  await file.writeAsString(jsonEncode(data));
  final error = StringBuffer();
  final code = await run(
      ['generate', '--analysis', file.path, '--output', '${root.path}/app'],
      out: StringBuffer(), err: error);
  if (code != 0) throw StateError(error.toString());
  return Directory('${root.path}/app');
}
