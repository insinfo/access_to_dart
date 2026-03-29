import 'package:access_to_dart/src/access_src_model.dart';
import 'package:access_to_dart/src/analysis_overlay_merger.dart';
import 'package:test/test.dart';

void main() {
  test('mergeSourceOverlay enriches caption maxLength defaultValue and ddl', () {
    final analysis = <String, dynamic>{
      'schema_version': '1.0',
      'source': 'fixtures/demo.accdb',
      'format': 'VERSION_14',
      'summary': const <String, dynamic>{},
      'tables': [
        {
          'name': 'Demo',
          'rowCount': 0,
          'columns': [
            {
              'name': 'Descricao',
              'typeName': 'Text',
              'typeCode': 10,
              'isAutoNumber': false,
              'isCalculated': false,
              'precision': null,
              'scale': null,
            },
            {
              'name': 'Ativo',
              'typeName': 'Boolean',
              'typeCode': 1,
              'isAutoNumber': false,
              'isCalculated': false,
              'precision': null,
              'scale': null,
            },
          ],
          'indexes': [],
          'sampleRows': [],
        },
      ],
      'linkedTables': const [],
      'forms': const [],
    };

    final source = AccessSrcProject(
      sourcePath: 'fixtures/demo.accdb.src',
      tables: [
        AccessSrcTable(
          name: 'Demo',
          sql: '',
          columns: const [
            AccessSrcColumn(
              name: 'Descricao',
              accessType: 'text',
              sqlType: 'nvarchar',
              caption: 'Descricao amigavel',
              defaultValue: '"Padrao"',
              required: true,
              maxLength: 50,
              validationRule: 'Len([Descricao]) > 0',
              validationText: 'Descricao obrigatoria.',
              format: '>@@@@',
              inputMask: '>LLLL',
              allowZeroLength: false,
              isAttachment: false,
              isCalculated: false,
              expression: null,
              children: [],
            ),
            AccessSrcColumn(
              name: 'Ativo',
              accessType: 'bit',
              sqlType: 'bit',
              caption: 'Ativo',
              defaultValue: '0',
              required: false,
              maxLength: null,
              isAttachment: false,
              isCalculated: false,
              expression: null,
              children: [],
            ),
          ],
          indexes: const [],
        ),
      ],
      queries: const [],
      forms: const [],
    );

    AnalysisOverlayMerger().mergeSourceOverlay(analysis, source);

    final table = (analysis['tables'] as List<dynamic>).single as Map<String, dynamic>;
    final descricao = (table['columns'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .singleWhere((column) => column['name'] == 'Descricao');
    final ativo = (table['columns'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .singleWhere((column) => column['name'] == 'Ativo');

    expect(descricao['caption'], 'Descricao amigavel');
    expect(descricao['maxLength'], 50);
    expect(descricao['defaultValue'], '"Padrao"');
    expect(descricao['isRequired'], isTrue);
    expect(descricao['validationRule'], 'Len([Descricao]) > 0');
    expect(descricao['validationText'], 'Descricao obrigatoria.');
    expect(descricao['format'], '>@@@@');
    expect(descricao['inputMask'], '>LLLL');
    expect(descricao['allowZeroLength'], isFalse);
    expect(ativo['defaultValue'], '0');
    expect(table['postgres_ddl'], contains('"descricao" TEXT NOT NULL DEFAULT \'Padrao\''));
    expect(table['postgres_ddl'], contains('"ativo" BOOLEAN DEFAULT FALSE'));
  });
}