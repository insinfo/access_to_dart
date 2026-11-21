import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';

Future<Map<String, dynamic>> multivalueUiFixture() async {
  final src =
      await AccessSrcReader().readDirectory('fixtures/SIGAsul.accdb.src');
  final form = src.forms.singleWhere((f) => f.name == 'FrmEncaminhamento');
  final control = form.controls.singleWhere((c) => c.name == 'MotivoNão');
  Map<String, dynamic> col(String name, String type) => {
        'name': name,
        'typeName': type,
        'typeCode': type == 'Text'
            ? 10
            : type == 'ComplexType'
                ? 18
                : 4
      };
  List<Map<String, dynamic>> pk(String name) => [
        {
          'name': 'PrimaryKey',
          'isPrimaryKey': true,
          'isUnique': true,
          'columns': [
            {'name': name}
          ]
        }
      ];
  return jsonDecode(jsonEncode({
    'schema_version': '1',
    'source': 'synthetic_with_real_FrmEncaminhamento_export.accdb',
    'tables': [
      {
        'name': 'TbEncaminhamento',
        'columns': [
          {...col('CODENC', 'Long'), 'isAutoNumber': true},
          {
            ...col('MotivoNão', 'ComplexType'),
            'allowMultipleValues': true,
            'displayControl': 111,
            'rowSourceType': 'Value List',
            'rowSource': control.properties!['RowSource']
          }
        ],
        'indexes': pk('CODENC'),
        'sampleRows': []
      },
      {
        'name': 'MotivoValues',
        'syntheticKind': 'multivalue',
        'complexParentTable': 'TbEncaminhamento',
        'complexParentColumn': 'MotivoNão',
        'complexLinkColumn': 'ParentPointer',
        'complexValueColumn': 'Value',
        'columns': [
          {...col('ChildID', 'Long'), 'isAutoNumber': true},
          col('ParentPointer', 'Long'),
          col('Value', 'Text')
        ],
        'indexes': pk('ChildID'),
        'sampleRows': []
      },
    ],
    'forms': [form.toJson()]
  })) as Map<String, dynamic>;
}

Future<Directory> generateMultivalueUi(
    Map<String, dynamic> data, Directory root) async {
  await root.create(recursive: true);
  final input = File('${root.path}/analysis.json');
  await input.writeAsString(jsonEncode(data));
  final err = StringBuffer();
  final code = await run(
      ['generate', '--analysis', input.path, '--output', '${root.path}/app'],
      out: StringBuffer(), err: err);
  if (code != 0) throw StateError('$err');
  return Directory('${root.path}/app');
}
