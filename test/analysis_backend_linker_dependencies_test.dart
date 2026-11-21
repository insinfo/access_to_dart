import 'package:access_to_dart/src/analysis_backend_linker.dart';
import 'package:test/test.dart';

Map<String, Object?> table(String name) => {
      'name': name,
      'columns': [
        {'name': 'ID', 'typeName': 'Long', 'typeCode': 4}
      ],
      'indexes': [],
      'sampleRows': [],
    };

void main() {
  test('materializes declared linked dependencies beyond direct form sources',
      () {
    final localRelation = {
      'name': 'local',
      'fromTable': 'Local',
      'fromColumns': ['ID'],
      'toTable': 'Existing',
      'toColumns': ['ID'],
      'flags': 1,
    };
    final linkedRelation = {
      'name': 'linked',
      'fromTable': 'QueryDependency',
      'fromColumns': ['ID'],
      'toTable': 'Existing',
      'toColumns': ['ID'],
      'flags': 0,
    };
    final frontend = <String, dynamic>{
      'source': 'frontend.accdb',
      'tables': [table('Local'), table('Existing')],
      'linkedTables': [
        {'name': 'Existing'},
        {'name': 'QueryDependency'},
        {'name': 'Missing'},
      ],
      'forms': [
        {'name': 'LocalForm', 'recordSource': 'Local', 'controls': []}
      ],
      'relationships': [localRelation],
    };
    final backend = <String, dynamic>{
      'source': 'backend.accdb',
      'tables': [
        table('Existing'),
        table('QueryDependency'),
        table('NotLinked')
      ],
      'relationships': [localRelation, linkedRelation],
    };
    final merged =
        AnalysisBackendLinker().mergeLinkedBackendAnalysis(frontend, backend);
    expect((merged['tables'] as List).map((t) => t['name']),
        ['Local', 'Existing', 'QueryDependency']);
    expect(merged['relationships'], [localRelation, linkedRelation]);
    expect(merged['summary']['tables'], 3);
    expect(merged['summary']['relationships'], 2);
  });

  test('source overlay link is materialized even without binary catalog entry',
      () {
    final merged = AnalysisBackendLinker().mergeLinkedBackendAnalysis({
      'source': 'frontend.accdb',
      'tables': [table('Local')],
      'source_overlay': {
        'tables': [
          {
            'name': 'LookupAlias',
            'isLinked': true,
            'sourceTableName': 'LookupSource'
          }
        ],
      },
    }, {
      'source': 'backend.accdb',
      'tables': [table('LookupSource')],
    });
    expect((merged['tables'] as List).map((t) => t['name']),
        ['Local', 'LookupSource']);
  });
  test('includes attachment dependencies only for materialized parent tables',
      () {
    final attachment = {
      ...table('Linked_File_attachment'),
      'syntheticKind': 'attachment',
      'attachmentParentTable': 'Linked',
    };
    final unrelated = {
      ...table('Unused_File_attachment'),
      'syntheticKind': 'attachment',
      'attachmentParentTable': 'Unused',
    };
    final relationship = {
      'name': 'files',
      'fromTable': 'Linked_File_attachment',
      'fromColumns': ['ID'],
      'toTable': 'Linked',
      'toColumns': ['ID'],
    };
    final merged = AnalysisBackendLinker().mergeLinkedBackendAnalysis({
      'source': 'frontend.accdb',
      'tables': [table('Local')],
      'linkedTables': [
        {'name': 'Linked'}
      ],
    }, {
      'source': 'backend.accdb',
      'tables': [table('Linked'), table('Unused'), attachment, unrelated],
      'relationships': [relationship],
    });
    expect((merged['tables'] as List).map((t) => t['name']),
        ['Local', 'Linked', 'Linked_File_attachment']);
    expect(merged['relationships'], [relationship]);
  });
  test('keeps distinct names and flags for relationships with same endpoints',
      () {
    final relation = {
      'name': 'One',
      'fromTable': 'Child',
      'fromColumns': ['ID'],
      'toTable': 'Parent',
      'toColumns': ['ID'],
      'flags': 0,
    };
    final differentlyNamed = {...relation, 'name': 'Two'};
    final differentFlags = {...relation, 'flags': 256};
    final merged = AnalysisBackendLinker().mergeLinkedBackendAnalysis({
      'source': 'frontend.accdb',
      'tables': [table('Child'), table('Parent')],
      'relationships': [relation],
    }, {
      'source': 'backend.accdb',
      'tables': [],
      'relationships': [relation, differentlyNamed, differentFlags],
    });
    expect(
        merged['relationships'], [relation, differentlyNamed, differentFlags]);
  });
}
