import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';

Future<Map<String, dynamic>> familyAllocatorFixture() async {
  final source =
      await AccessSrcReader().readDirectory('fixtures/SIGAsul.accdb.src');
  return jsonDecode(jsonEncode({
    'schema_version': '1',
    'source': 'SIGAsul.accdb',
    'format': 'ACCDB',
    'tables': [
      {
        'name': 'CadResidencia',
        'columns': [
          {
            'name': 'CodFam',
            'typeName': 'Long',
            'typeCode': 4,
            'isRequired': true,
            'defaultValue': '0',
            'isAutoNumber': false
          },
          {'name': 'Complemento', 'typeName': 'Text', 'typeCode': 10},
        ],
        'indexes': [
          {
            'name': 'PrimaryKey',
            'isPrimaryKey': true,
            'isUnique': true,
            'columns': [
              {'name': 'CodFam', 'columnNumber': 0}
            ]
          }
        ],
        'sampleRows': [],
      }
    ],
    'forms': [
      source.forms.singleWhere((f) => f.name == 'FrmCadGeral').toJson()
    ],
  })) as Map<String, dynamic>;
}

Future<Directory> generateFamilyAllocator(
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
