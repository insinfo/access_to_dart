import 'package:access_to_dart/src/analysis_backend_linker.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:access_to_dart/src/migration_statement_builder.dart';
import 'package:test/test.dart';

void main() {
  test('linked empty multi-value collection retains schema and parent FK', () {
    final merged = AnalysisBackendLinker().mergeLinkedBackendAnalysis({
      'tables': <Object>[],
      'linkedTables': [{'name': 'Parents'}],
    }, {
      'tables': [
        {'name': 'Parents', 'columns': [
          {'name': 'Choices', 'typeName': 'ComplexType', 'typeCode': 18},
        ]},
        {'name': 'Parents_Choices_multivalue', 'syntheticKind': 'multivalue',
          'complexParentTable': 'Parents', 'complexParentColumn': 'Choices',
          'complexLinkColumn': '_OldChoices', 'complexValueColumn': 'Value',
          'rowCount': 0, 'columns': [
            {'name': '_OldChoices', 'typeName': 'Long'},
            {'name': 'Value', 'typeName': 'Text'},
          ]},
        {'name': 'Unlinked_Choices_multivalue', 'syntheticKind': 'multivalue',
          'complexParentTable': 'Unlinked', 'columns': <Object>[]},
      ]
    });
    final project = AnalysisProject.fromJson(merged);
    expect(project.tables.map((t) => t.name),
        ['Parents', 'Parents_Choices_multivalue']);
    final child = project.tables.last;
    expect(child.isSyntheticMultiValueTable, isTrue);
    expect(child.isSyntheticAttachmentTable, isFalse);
    expect(child.complexValueColumn, 'Value');
    final builder = MigrationStatementBuilder(identifierPolicy:
        const MigrationIdentifierPolicy(style: MigrationIdentifierStyle.snakeAscii));
    expect(builder.buildForeignKeyStatements(project).single,
        contains('FOREIGN KEY ("old_choices") REFERENCES "parents" ("choices")'));
    final seed = builder.buildInsertStatements(child, [
      {'_OldChoices': 7, 'Value': 'a'},
      {'_OldChoices': 7, 'Value': 'b'},
    ]).toList();
    expect(seed, hasLength(2));
    expect(seed[0], contains("7, 'a'"));
    expect(seed[1], contains("7, 'b'"));
  });
}
