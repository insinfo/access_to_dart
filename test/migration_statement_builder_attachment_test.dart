import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:access_to_dart/src/migration_statement_builder.dart';
import 'package:access_to_dart/src/migration_unique_mode.dart';
import 'package:test/test.dart';

void main() {
  test('gera FK sintetica para tabela auxiliar de attachment', () {
    final project = AnalysisProject(
      schemaVersion: '1.0',
      source: 'fixtures/teste1/teste1.accdb',
      format: 'VERSION_14',
      summary: const <String, dynamic>{},
      tables: [
        AnalysisTable(
          name: 'Contatos',
          tdefPageNumber: 42,
          rowCount: 0,
          postgresDdl: null,
          dartClassName: null,
          syntheticKind: null,
          attachmentParentTable: null,
          attachmentParentColumn: null,
          attachmentLinkColumn: null,
          columns: [
            AnalysisColumn(
              name: 'Anexos',
              typeName: 'ComplexType',
              typeCode: 18,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: false,
              caption: null,
              defaultValue: null,
              maxLength: null,
              calculatedExpression: null,
              validationRule: null,
              validationText: null,
              description: null,
              decimalPlaces: null,
              displayControl: null,
              textFormat: null,
              imeMode: null,
              imeSentenceMode: null,
              resultType: null,
              propertyGuid: null,
              allowMultipleValues: null,
              rowSourceType: null,
              rowSource: null,
              wssFieldId: null,
              formatString: null,
              inputMask: null,
              allowZeroLength: null,
              precision: null,
              scale: null,
              complexTypeClassification: 'attachment',
              attachmentTableName: 'Contatos_Anexos_attachment',
              attachmentLinkColumn: '_Anexos',
            ),
          ],
          indexes: [
            AnalysisIndex(
              name: 'ux_contatos_anexos',
              indexNumber: null,
              backingDataNumber: null,
              isPrimaryKey: false,
              isForeignKey: false,
              isUnique: true,
              isRequired: false,
              ignoreNulls: true,
              flags: null,
              columns: [
                AnalysisIndexColumn(
                  name: 'Anexos',
                  columnNumber: null,
                  ascending: true,
                  flags: null,
                ),
              ],
            ),
          ],
          sampleRows: const <Map<String, dynamic>>[],
        ),
        AnalysisTable(
          name: 'Contatos_Anexos_attachment',
          tdefPageNumber: 67,
          rowCount: 0,
          postgresDdl: null,
          dartClassName: null,
          syntheticKind: 'attachment',
          attachmentParentTable: 'Contatos',
          attachmentParentColumn: 'Anexos',
          attachmentLinkColumn: '_Anexos',
          columns: [
            AnalysisColumn(
              name: '_Anexos',
              typeName: 'Long',
              typeCode: 4,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: false,
              caption: null,
              defaultValue: null,
              maxLength: null,
              calculatedExpression: null,
              validationRule: null,
              validationText: null,
              description: null,
              decimalPlaces: null,
              displayControl: null,
              textFormat: null,
              imeMode: null,
              imeSentenceMode: null,
              resultType: null,
              propertyGuid: null,
              allowMultipleValues: null,
              rowSourceType: null,
              rowSource: null,
              wssFieldId: null,
              formatString: null,
              inputMask: null,
              allowZeroLength: null,
              precision: null,
              scale: null,
              complexTypeClassification: null,
              attachmentTableName: null,
              attachmentLinkColumn: null,
            ),
            AnalysisColumn(
              name: 'FileData',
              typeName: 'OLE',
              typeCode: 11,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: false,
              caption: null,
              defaultValue: null,
              maxLength: null,
              calculatedExpression: null,
              validationRule: null,
              validationText: null,
              description: null,
              decimalPlaces: null,
              displayControl: null,
              textFormat: null,
              imeMode: null,
              imeSentenceMode: null,
              resultType: null,
              propertyGuid: null,
              allowMultipleValues: null,
              rowSourceType: null,
              rowSource: null,
              wssFieldId: null,
              formatString: null,
              inputMask: null,
              allowZeroLength: null,
              precision: null,
              scale: null,
              complexTypeClassification: null,
              attachmentTableName: null,
              attachmentLinkColumn: null,
            ),
          ],
          indexes: const <AnalysisIndex>[],
          sampleRows: const <Map<String, dynamic>>[],
        ),
      ],
      linkedTables: const <AnalysisLinkedTable>[],
      relationships: const <AnalysisRelationship>[],
      forms: const <AnalysisForm>[],
      canonicalAnalysis: null,
      queryReconciliation: null,
      raw: const <String, dynamic>{},
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
    );

    final schema = builder.buildSchema(project);

    expect(schema, contains('CREATE TABLE "contatos_anexos_attachment"'));
    expect(schema, contains('"file_data" BYTEA'));
    final indexPos = schema.indexOf(
      'CREATE UNIQUE INDEX "contatos_ux_contatos_anexos" ON "contatos" ("anexos" ASC);',
    );
    final fkPos = schema.indexOf(
      'ALTER TABLE "contatos_anexos_attachment" ADD CONSTRAINT "fk_contatos_anexos_attachment_contatos_attachment" FOREIGN KEY ("anexos") REFERENCES "contatos" ("anexos");',
    );
    expect(indexPos, greaterThanOrEqualTo(0));
    expect(fkPos, greaterThan(indexPos));
    expect(
      schema,
      contains(
        'ALTER TABLE "contatos_anexos_attachment" ADD CONSTRAINT "fk_contatos_anexos_attachment_contatos_attachment" FOREIGN KEY ("anexos") REFERENCES "contatos" ("anexos");',
      ),
    );
  });

  test('relax-unique omite FK sintetica quando chave alvo nao e unica', () {
    final project = AnalysisProject(
      schemaVersion: '1.0',
      source: 'fixtures/teste1/teste1.accdb',
      format: 'VERSION_14',
      summary: const <String, dynamic>{},
      tables: [
        AnalysisTable(
          name: 'Contatos',
          rowCount: 2,
          postgresDdl: null,
          dartClassName: null,
          columns: [
            AnalysisColumn(
              name: 'Anexos',
              typeName: 'ComplexType',
              typeCode: 18,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: false,
              caption: null,
              defaultValue: null,
              maxLength: null,
              calculatedExpression: null,
              validationRule: null,
              validationText: null,
              description: null,
              decimalPlaces: null,
              displayControl: null,
              textFormat: null,
              imeMode: null,
              imeSentenceMode: null,
              resultType: null,
              propertyGuid: null,
              allowMultipleValues: null,
              rowSourceType: null,
              rowSource: null,
              wssFieldId: null,
              formatString: null,
              inputMask: null,
              allowZeroLength: null,
              precision: null,
              scale: null,
              complexTypeClassification: 'attachment',
              attachmentTableName: 'Contatos_Anexos_attachment',
              attachmentLinkColumn: '_Anexos',
            ),
          ],
          indexes: [
            AnalysisIndex(
              name: 'ux_contatos_anexos',
              indexNumber: null,
              backingDataNumber: null,
              isPrimaryKey: false,
              isForeignKey: false,
              isUnique: true,
              isRequired: false,
              ignoreNulls: true,
              flags: null,
              columns: [
                AnalysisIndexColumn(
                  name: 'Anexos',
                  columnNumber: null,
                  ascending: true,
                  flags: null,
                ),
              ],
            ),
          ],
          sampleRows: const <Map<String, dynamic>>[],
        ),
        AnalysisTable(
          name: 'Contatos_Anexos_attachment',
          rowCount: 2,
          postgresDdl: null,
          dartClassName: null,
          syntheticKind: 'attachment',
          attachmentParentTable: 'Contatos',
          attachmentParentColumn: 'Anexos',
          attachmentLinkColumn: '_Anexos',
          columns: [
            AnalysisColumn(
              name: '_Anexos',
              typeName: 'Long',
              typeCode: 4,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: false,
              caption: null,
              defaultValue: null,
              maxLength: null,
              calculatedExpression: null,
              validationRule: null,
              validationText: null,
              description: null,
              decimalPlaces: null,
              displayControl: null,
              textFormat: null,
              imeMode: null,
              imeSentenceMode: null,
              resultType: null,
              propertyGuid: null,
              allowMultipleValues: null,
              rowSourceType: null,
              rowSource: null,
              wssFieldId: null,
              formatString: null,
              inputMask: null,
              allowZeroLength: null,
              precision: null,
              scale: null,
              complexTypeClassification: null,
              attachmentTableName: null,
              attachmentLinkColumn: null,
            ),
          ],
          indexes: const <AnalysisIndex>[],
          sampleRows: const <Map<String, dynamic>>[],
        ),
      ],
      linkedTables: const <AnalysisLinkedTable>[],
      relationships: const <AnalysisRelationship>[],
      forms: const <AnalysisForm>[],
      canonicalAnalysis: null,
      queryReconciliation: null,
      raw: const <String, dynamic>{},
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      uniqueMode: MigrationUniqueMode.relaxUnique,
    );

    final schema = builder.buildSchema(
      project,
      tableRowsByName: {
        'Contatos': [
          {'Anexos': 0},
          {'Anexos': 0},
        ],
        'Contatos_Anexos_attachment': [
          {'_Anexos': 0},
        ],
      },
    );

    expect(
      schema,
      isNot(
        contains(
          'ALTER TABLE "contatos_anexos_attachment" ADD CONSTRAINT "fk_contatos_anexos_attachment_contatos_attachment" FOREIGN KEY ("anexos") REFERENCES "contatos" ("anexos");',
        ),
      ),
    );
  });
}