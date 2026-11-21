import 'package:test/test.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/complex_collection_sequence.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:access_to_dart/src/migration_statement_builder.dart';
import 'support/multivalue_ui_fixture.dart';

void main() {
  test('pointer allocator is independent from normalized names and child PK',
      () async {
    expect(complexCollectionSequenceName('Ação', 'Itens'),
        isNot(complexCollectionSequenceName('Acao', 'Itens')));
    final project = AnalysisProject.fromJson(await multivalueUiFixture());
    final name = complexCollectionSequenceName('TbEncaminhamento', 'MotivoNão');
    expect(
        const MigrationIdentifierPolicy(
                style: MigrationIdentifierStyle.snakeAscii)
            .objectName(name),
        name);
    const builder = MigrationStatementBuilder(
        identifierPolicy: MigrationIdentifierPolicy(
            style: MigrationIdentifierStyle.snakeAscii));
    expect(builder.buildComplexPointerSequenceStatements(project).single,
        contains('AS INTEGER NO CYCLE'));
    expect(
        builder.buildComplexPointerSequenceOwnershipStatements(project).single,
        contains('"tb_encaminhamento"."motivo_nao"'));
    final sync =
        builder.buildComplexPointerSequenceSyncStatements(project).single;
    expect(sync, contains('UNION ALL SELECT "parent_pointer"'));
    expect(sync, contains('last_value'));
    expect(sync, isNot(contains('+ 1')));
    expect(builder.buildCreateTableStatement(project.tables.first),
        isNot(contains('nextval')),
        reason: 'generic parent insert must not allocate a pointer default');
    expect(builder.buildPreDataStatements(project).first,
        contains('CREATE SEQUENCE'));
  });
  test('ambiguous physical collection mappings do not choose the first table',
      () async {
    final raw = await multivalueUiFixture();
    raw['tables'].add({...raw['tables'][1], 'name': 'ConflictingChildren'});
    expect(multivalueSequenceBindings(AnalysisProject.fromJson(raw)), isEmpty);
  });
  test('original SQL identifiers remain quoted while allocator name is bounded',
      () async {
    final raw = await multivalueUiFixture();
    raw['tables'][0]['name'] = 'Parent";--';
    raw['tables'][1]['complexParentTable'] = 'Parent";--';
    final project = AnalysisProject.fromJson(raw);
    const builder = MigrationStatementBuilder(
        identifierPolicy: MigrationIdentifierPolicy(
            style: MigrationIdentifierStyle.original));
    expect(builder.buildComplexPointerSequenceSyncStatements(project).single,
        contains('FROM "Parent"";--"'));
    expect(complexCollectionSequenceName('Parent";--', 'MotivoNão').length,
        lessThan(63));
  });
}
