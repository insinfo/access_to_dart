import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/analysis_backend_linker.dart';
import 'package:test/test.dart';

void main() {
  test('generate materializes modules from linked frontend forms using backend schema', () async {
    final tempDir = await Directory.systemTemp.createTemp('access_linked_backend_');
    addTearDown(() => tempDir.delete(recursive: true));

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
            'rawVbaCode': 'Private Sub txtNome_BeforeUpdate()\nEnd Sub',
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
        'relationships': 0,
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
              'isRequired': true,
              'caption': 'Nome completo',
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
      'relationships': const [],
      'queries': const [],
      'forms': const [],
    };

    final merged = AnalysisBackendLinker().mergeLinkedBackendAnalysis(frontend, backend);
    final analysisFile = File('${tempDir.path}${Platform.pathSeparator}analysis.json');
    await analysisFile.writeAsString(const JsonEncoder.withIndent('  ').convert(merged));

    final outputDir = '${tempDir.path}${Platform.pathSeparator}generated';
    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      ['generate', '--analysis', analysisFile.path, '--output', outputDir],
      out: out,
      err: err,
    );

    expect(exitCode, 0, reason: err.toString());
    expect(err.toString(), isEmpty);
    expect(File('$outputDir${Platform.pathSeparator}core${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}models${Platform.pathSeparator}tb_pessoa.dart').existsSync(), isTrue);
    expect(Directory('$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}tb_pessoa').existsSync(), isTrue);
  });
}