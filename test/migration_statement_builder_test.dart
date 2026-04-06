import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/migration_auto_number_mode.dart';
import 'package:access_to_dart/src/migration_identifier_style.dart';
import 'package:access_to_dart/src/migration_not_null_mode.dart';
import 'package:access_to_dart/src/migration_seed_format.dart';
import 'package:access_to_dart/src/migration_statement_builder.dart';
import 'package:access_to_dart/src/migration_unique_mode.dart';
import 'package:test/test.dart';

void main() {
  test('preserva defaults semanticos do Access no schema PostgreSQL', () {
    final project = AnalysisProject(
      schemaVersion: '1.0',
      source: 'fixtures/demo.accdb',
      format: 'VERSION_16',
      summary: const <String, dynamic>{},
      tables: [
        AnalysisTable(
          name: 'Clientes',
          rowCount: 0,
          postgresDdl: null,
          dartClassName: null,
          columns: [
            AnalysisColumn(
              name: 'IdExterno',
              typeName: 'GUID',
              typeCode: 0,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: true,
              caption: null,
              defaultValue: 'GenGUID()',
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
            ),
            AnalysisColumn(
              name: 'Status',
              typeName: 'Text',
              typeCode: 0,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: false,
              caption: null,
              defaultValue: 'NEW',
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
            ),
            AnalysisColumn(
              name: 'CriadoEm',
              typeName: 'DateTime',
              typeCode: 0,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: false,
              caption: null,
              defaultValue: '#1/1/1900#',
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
            ),
            AnalysisColumn(
              name: 'Codigo',
              typeName: 'Long',
              typeCode: 0,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: false,
              caption: null,
              defaultValue: 'Int(13.9)',
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
            ),
            AnalysisColumn(
              name: 'DataAgenda',
              typeName: 'DateTime',
              typeCode: 0,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: false,
              caption: null,
              defaultValue: 'DateSerial(2024, 2, 30)',
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
            ),
            AnalysisColumn(
              name: 'HorarioBase',
              typeName: 'DateTime',
              typeCode: 0,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: false,
              caption: null,
              defaultValue: 'TimeSerial(15, 57, 34)',
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
            ),
            AnalysisColumn(
              name: 'StatusNormalizado',
              typeName: 'Text',
              typeCode: 0,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: false,
              caption: null,
              defaultValue: 'Trim("  ativo  ")',
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
            ),
          ],
          indexes: const [],
          sampleRows: const [],
        ),
      ],
      linkedTables: const [],
      relationships: const [],
      forms: const [],
      canonicalAnalysis: null,
      queryReconciliation: null,
      raw: const <String, dynamic>{},
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      notNullMode: MigrationNotNullMode.strict,
    );

    final schema = builder.buildSchema(project);

    expect(schema, contains('CREATE EXTENSION IF NOT EXISTS pgcrypto;'));
    expect(schema, contains('"id_externo" UUID NOT NULL DEFAULT gen_random_uuid()'));
    expect(schema, contains('"status" TEXT DEFAULT \'NEW\''));
    expect(schema, contains('"criado_em" DATE DEFAULT \'1/1/1900\''));
    expect(schema, contains('"codigo" INTEGER DEFAULT FLOOR(13.9)'));
    expect(schema, contains('"data_agenda" DATE DEFAULT ((MAKE_DATE(CASE WHEN (2024) BETWEEN 0 AND 29 THEN 2000 + (2024) WHEN (2024) BETWEEN 30 AND 99 THEN 1900 + (2024) ELSE (2024) END, 1, 1) + ((2) - 1) * INTERVAL \'1 month\' + ((30) - 1) * INTERVAL \'1 day\'))::date'));
    expect(schema, contains('"horario_base" TIME DEFAULT ((TIME \'00:00:00\' + (15) * INTERVAL \'1 hour\' + (57) * INTERVAL \'1 minute\' + (34) * INTERVAL \'1 second\'))::time'));
    expect(schema, contains('"status_normalizado" TEXT DEFAULT BTRIM(\'  ativo  \')'));
  });

  test('adianta sequences antes do seed quando ha autonumber explicito', () {
    final project = AnalysisProject(
      schemaVersion: '1.0',
      source: 'fixtures/demo.accdb',
      format: 'VERSION_16',
      summary: const <String, dynamic>{},
      tables: [
        AnalysisTable(
          name: 'Pedidos',
          rowCount: 3,
          postgresDdl: null,
          dartClassName: null,
          columns: [
            AnalysisColumn(
              name: 'CodPedido',
              typeName: 'Long',
              typeCode: 0,
              isAutoNumber: true,
              isCalculated: false,
              isRequired: true,
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
            ),
            AnalysisColumn(
              name: 'Nome',
              typeName: 'Text',
              typeCode: 0,
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
            ),
          ],
          indexes: [
            AnalysisIndex(
              name: 'PrimaryKey',
              indexNumber: 0,
              backingDataNumber: 0,
              isPrimaryKey: true,
              isForeignKey: false,
              isUnique: true,
              isRequired: true,
              ignoreNulls: false,
              flags: null,
              columns: [
                AnalysisIndexColumn(
                  name: 'CodPedido',
                  columnNumber: 0,
                  ascending: true,
                  flags: null,
                ),
              ],
            ),
          ],
          sampleRows: const [],
        ),
      ],
      linkedTables: const [],
      relationships: const [],
      forms: const [],
      canonicalAnalysis: null,
      queryReconciliation: null,
      raw: const <String, dynamic>{},
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      autoNumberMode: MigrationAutoNumberMode.sequence,
    );

    final statements = builder.buildPreInsertStatements(
      project,
      tableRowsByName: const {
        'Pedidos': [
          {'CodPedido': 7, 'Nome': 'A'},
          {'Nome': 'B'},
          {'CodPedido': 11, 'Nome': 'C'},
        ],
      },
    );

    expect(
      statements,
      contains(
        'SELECT setval(\'"pedidos_cod_pedido_seq"\'::regclass, 11, true);',
      ),
    );
  });

  test('infere date-only por format do PropertyMap no DDL e no seed', () {
    final table = AnalysisTable(
      name: 'Gestacao',
      rowCount: 0,
      postgresDdl: null,
      dartClassName: null,
      columns: [
        AnalysisColumn(
          name: 'Dpp',
          typeName: 'DateTime',
          typeCode: 8,
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
          formatString: 'Short Date',
          inputMask: '99/99/0000;0;_',
          allowZeroLength: null,
          precision: null,
          scale: null,
        ),
        AnalysisColumn(
          name: 'DpSaida',
          typeName: 'DateTime',
          typeCode: 8,
          isAutoNumber: false,
          isCalculated: true,
          isRequired: false,
          caption: null,
          defaultValue: null,
          maxLength: null,
          calculatedExpression: '([Dpp] + 180)',
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
          formatString: 'Short Date',
          inputMask: '99/99/0000;0;_',
          allowZeroLength: null,
          precision: null,
          scale: null,
        ),
      ],
      indexes: const [],
      sampleRows: const [],
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
    );

    final ddl = builder.buildCreateTableStatement(table);
    expect(ddl, contains('"dpp" DATE'));
    expect(
      ddl,
      contains('"dp_saida" DATE GENERATED ALWAYS AS ((('),
    );
    expect(ddl, contains('* INTERVAL \'1 day\'))::date'));

    final inserts = builder.buildInsertStatements(table, [
      {'Dpp': DateTime.utc(2021, 8, 2, 13, 45, 12)},
    ]).toList();
    expect(
      inserts.single,
      contains("VALUES ('2021-08-02');"),
    );
  });

  test('infere date-only por valores observados sem pista explicita de format', () {
    final table = AnalysisTable(
      name: 'TbGestDet',
      rowCount: 2,
      postgresDdl: null,
      dartClassName: null,
      columns: [
        AnalysisColumn(
          name: 'DPP',
          typeName: 'DateTime',
          typeCode: 8,
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
          resultType: 0,
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
        ),
        AnalysisColumn(
          name: 'DPSaida',
          typeName: 'DateTime',
          typeCode: 8,
          isAutoNumber: false,
          isCalculated: true,
          isRequired: false,
          caption: null,
          defaultValue: null,
          maxLength: null,
          calculatedExpression: '[TbGestDet].[DPP]+180',
          validationRule: null,
          validationText: null,
          description: null,
          decimalPlaces: null,
          displayControl: 109,
          textFormat: null,
          imeMode: null,
          imeSentenceMode: null,
          resultType: 8,
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
        ),
      ],
      indexes: const [],
      sampleRows: const [],
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
    );

    final rows = [
      {
        'DPP': DateTime.utc(2021, 8, 2),
        'DPSaida': DateTime.utc(2022, 1, 29),
      },
      {
        'DPP': DateTime.utc(2021, 5, 24),
        'DPSaida': DateTime.utc(2021, 11, 20),
      },
    ];

    final ddl = builder.buildCreateTableStatement(table, rows: rows);
    expect(ddl, contains('"dpp" DATE'));
    expect(
      ddl,
      contains('"dpsaida" DATE GENERATED ALWAYS AS ((("dpp" + (180) * INTERVAL \'1 day\'))::date) STORED'),
    );

    final inserts = builder.buildInsertStatements(table, rows).toList();
    expect(inserts.first, contains("VALUES ('2021-08-02');"));
  });

  test('omite autonumber invalido para deixar a sequence assumir', () {
    final table = AnalysisTable(
      name: 'Pedidos',
      rowCount: 0,
      postgresDdl: null,
      dartClassName: null,
      columns: [
        AnalysisColumn(
          name: 'CodPedido',
          typeName: 'Long',
          typeCode: 0,
          isAutoNumber: true,
          isCalculated: false,
          isRequired: true,
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
        ),
        AnalysisColumn(
          name: 'Nome',
          typeName: 'Text',
          typeCode: 0,
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
        ),
      ],
      indexes: const [],
      sampleRows: const [],
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      autoNumberMode: MigrationAutoNumberMode.sequence,
    );

    final statements = builder.buildInsertStatements(table, const [
      {'CodPedido': 0, 'Nome': 'A'},
    ]).toList();

    expect(
      statements.single,
      'INSERT INTO "pedidos" ("nome") VALUES (\'A\');',
    );
  });

  test('plain-int nao cria sequence para autonumber', () {
    final table = AnalysisTable(
      name: 'Pedidos',
      rowCount: 0,
      postgresDdl: null,
      dartClassName: null,
      columns: [
        AnalysisColumn(
          name: 'CodPedido',
          typeName: 'Long',
          typeCode: 0,
          isAutoNumber: true,
          isCalculated: false,
          isRequired: true,
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
        ),
      ],
      indexes: const [],
      sampleRows: const [],
    );
    final project = AnalysisProject(
      schemaVersion: '1.0',
      source: 'fixtures/demo.accdb',
      format: 'VERSION_16',
      summary: const <String, dynamic>{},
      tables: [table],
      linkedTables: const [],
      relationships: const [],
      forms: const [],
      canonicalAnalysis: null,
      queryReconciliation: null,
      raw: const <String, dynamic>{},
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      autoNumberMode: MigrationAutoNumberMode.plainInt,
      notNullMode: MigrationNotNullMode.strict,
    );

    final schema = builder.buildSchema(project);

    expect(schema, isNot(contains('CREATE SEQUENCE')));
    expect(schema, contains('"cod_pedido" INTEGER NOT NULL'));
    expect(schema, isNot(contains('nextval(')));
  });

  test('force-sequence omite autonumber explicito mesmo quando positivo', () {
    final table = AnalysisTable(
      name: 'Pedidos',
      rowCount: 0,
      postgresDdl: null,
      dartClassName: null,
      columns: [
        AnalysisColumn(
          name: 'CodPedido',
          typeName: 'Long',
          typeCode: 0,
          isAutoNumber: true,
          isCalculated: false,
          isRequired: true,
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
        ),
        AnalysisColumn(
          name: 'Nome',
          typeName: 'Text',
          typeCode: 0,
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
        ),
      ],
      indexes: const [],
      sampleRows: const [],
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      autoNumberMode: MigrationAutoNumberMode.forceSequence,
    );

    final statements = builder.buildInsertStatements(table, const [
      {'CodPedido': 42, 'Nome': 'A'},
    ]).toList();

    expect(
      statements.single,
      'INSERT INTO "pedidos" ("nome") VALUES (\'A\');',
    );
  });

  test('skip-row descarta linha com required nulo', () {
    final table = AnalysisTable(
      name: 'Pessoas',
      rowCount: 0,
      postgresDdl: null,
      dartClassName: null,
      columns: [
        AnalysisColumn(
          name: 'Nome',
          typeName: 'Text',
          typeCode: 0,
          isAutoNumber: false,
          isCalculated: false,
          isRequired: true,
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
        ),
      ],
      indexes: const [],
      sampleRows: const [],
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      notNullMode: MigrationNotNullMode.skipRow,
    );

    final statements = builder.buildInsertStatements(table, const [
      {'Nome': ''},
    ]).toList();

    expect(statements, isEmpty);
  });

  test('relax-not-null remove NOT NULL de coluna requerida nao PK', () {
    final table = AnalysisTable(
      name: 'Pessoas',
      rowCount: 0,
      postgresDdl: null,
      dartClassName: null,
      columns: [
        AnalysisColumn(
          name: 'Nome',
          typeName: 'Text',
          typeCode: 0,
          isAutoNumber: false,
          isCalculated: false,
          isRequired: true,
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
        ),
      ],
      indexes: const [],
      sampleRows: const [],
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      notNullMode: MigrationNotNullMode.relaxNotNull,
    );

    final sql = builder.buildCreateTableStatement(table);

    expect(sql, contains('"nome" TEXT'));
    expect(sql, isNot(contains('"nome" TEXT NOT NULL')));
  });

  test('relax-not-null afrouxa PK quando os dados violam a chave', () {
    final table = AnalysisTable(
      name: 'TbAcompDet',
      rowCount: 0,
      postgresDdl: null,
      dartClassName: null,
      columns: [
        AnalysisColumn(
          name: 'CodAcompDet',
          typeName: 'Long',
          typeCode: 0,
          isAutoNumber: false,
          isCalculated: false,
          isRequired: true,
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
        ),
        AnalysisColumn(
          name: 'ServAcol',
          typeName: 'YesNo',
          typeCode: 0,
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
        ),
      ],
      indexes: [
        AnalysisIndex(
          name: 'PrimaryKey',
          indexNumber: 0,
          backingDataNumber: 0,
          isPrimaryKey: true,
          isForeignKey: false,
          isUnique: true,
          isRequired: true,
          ignoreNulls: false,
          flags: 0,
          columns: [
            AnalysisIndexColumn(
              name: 'CodAcompDet',
              columnNumber: 0,
              ascending: true,
              flags: 0,
            ),
          ],
        ),
      ],
      sampleRows: const [],
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      notNullMode: MigrationNotNullMode.relaxNotNull,
    );

    final sql = builder.buildCreateTableStatement(
      table,
      rows: const [
        {'ServAcol': true},
      ],
    );

    expect(sql, contains('"cod_acomp_det" INTEGER'));
    expect(sql, isNot(contains('"cod_acomp_det" INTEGER NOT NULL')));
    expect(sql, isNot(contains('PRIMARY KEY')));
  });

  test('relax-unique rebaixa indice unico quando os dados violam unicidade', () {
    final project = AnalysisProject(
      schemaVersion: '1.0',
      source: 'fixtures/demo.accdb',
      format: 'VERSION_16',
      summary: const <String, dynamic>{},
      tables: [
        AnalysisTable(
          name: 'TbAtend',
          rowCount: 3,
          postgresDdl: null,
          dartClassName: null,
          columns: [
            AnalysisColumn(
              name: 'CodAtend',
              typeName: 'Long',
              typeCode: 4,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: true,
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
            ),
          ],
          indexes: [
            AnalysisIndex(
              name: 'cod_atend',
              indexNumber: null,
              backingDataNumber: null,
              isPrimaryKey: false,
              isForeignKey: false,
              isUnique: true,
              isRequired: true,
              ignoreNulls: false,
              flags: null,
              columns: [
                AnalysisIndexColumn(
                  name: 'CodAtend',
                  columnNumber: null,
                  ascending: true,
                  flags: null,
                ),
              ],
            ),
          ],
          sampleRows: const <Map<String, dynamic>>[],
        ),
      ],
      linkedTables: const [],
      relationships: const [],
      forms: const [],
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
        'TbAtend': [
          {'CodAtend': 0},
          {'CodAtend': 0},
          {'CodAtend': 12},
        ],
      },
    );

    expect(
      schema,
      contains('CREATE INDEX "tb_atend_cod_atend" ON "tb_atend" ("cod_atend" ASC);'),
    );
    expect(
      schema,
      isNot(contains('CREATE UNIQUE INDEX "tb_atend_cod_atend"')),
    );
  });

  test('strict preserva indice unico mesmo com dados duplicados', () {
    final project = AnalysisProject(
      schemaVersion: '1.0',
      source: 'fixtures/demo.accdb',
      format: 'VERSION_16',
      summary: const <String, dynamic>{},
      tables: [
        AnalysisTable(
          name: 'TbAtend',
          rowCount: 2,
          postgresDdl: null,
          dartClassName: null,
          columns: [
            AnalysisColumn(
              name: 'CodAtend',
              typeName: 'Long',
              typeCode: 4,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: true,
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
            ),
          ],
          indexes: [
            AnalysisIndex(
              name: 'cod_atend',
              indexNumber: null,
              backingDataNumber: null,
              isPrimaryKey: false,
              isForeignKey: false,
              isUnique: true,
              isRequired: true,
              ignoreNulls: false,
              flags: null,
              columns: [
                AnalysisIndexColumn(
                  name: 'CodAtend',
                  columnNumber: null,
                  ascending: true,
                  flags: null,
                ),
              ],
            ),
          ],
          sampleRows: const <Map<String, dynamic>>[],
        ),
      ],
      linkedTables: const [],
      relationships: const [],
      forms: const [],
      canonicalAnalysis: null,
      queryReconciliation: null,
      raw: const <String, dynamic>{},
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      uniqueMode: MigrationUniqueMode.strict,
    );

    final schema = builder.buildSchema(
      project,
      tableRowsByName: {
        'TbAtend': [
          {'CodAtend': 0},
          {'CodAtend': 0},
        ],
      },
    );

    expect(
      schema,
      contains('CREATE UNIQUE INDEX "tb_atend_cod_atend" ON "tb_atend" ("cod_atend" ASC);'),
    );
  });

  test('relax-not-null preserva row sem PK ao gerar inserts', () {
    final table = AnalysisTable(
      name: 'TbAcompDet',
      rowCount: 0,
      postgresDdl: null,
      dartClassName: null,
      columns: [
        AnalysisColumn(
          name: 'CodAcompDet',
          typeName: 'Long',
          typeCode: 0,
          isAutoNumber: false,
          isCalculated: false,
          isRequired: true,
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
        ),
        AnalysisColumn(
          name: 'ServAcol',
          typeName: 'YesNo',
          typeCode: 0,
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
        ),
      ],
      indexes: [
        AnalysisIndex(
          name: 'PrimaryKey',
          indexNumber: 0,
          backingDataNumber: 0,
          isPrimaryKey: true,
          isForeignKey: false,
          isUnique: true,
          isRequired: true,
          ignoreNulls: false,
          flags: 0,
          columns: [
            AnalysisIndexColumn(
              name: 'CodAcompDet',
              columnNumber: 0,
              ascending: true,
              flags: 0,
            ),
          ],
        ),
      ],
      sampleRows: const [],
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      notNullMode: MigrationNotNullMode.relaxNotNull,
    );

    final inserts = builder.buildInsertStatements(table, const [
      {'ServAcol': true},
    ]).toList();

    expect(inserts, hasLength(1));
    expect(inserts.single, 'INSERT INTO "tb_acomp_det" ("serv_acol") VALUES (TRUE);');
  });

  test('fix preenche required nulo com valor sintetico', () {
    final table = AnalysisTable(
      name: 'Pessoas',
      rowCount: 0,
      postgresDdl: null,
      dartClassName: null,
      columns: [
        AnalysisColumn(
          name: 'Nome',
          typeName: 'Text',
          typeCode: 0,
          isAutoNumber: false,
          isCalculated: false,
          isRequired: true,
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
        ),
        AnalysisColumn(
          name: 'Idade',
          typeName: 'Long',
          typeCode: 0,
          isAutoNumber: false,
          isCalculated: false,
          isRequired: true,
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
        ),
      ],
      indexes: const [],
      sampleRows: const [],
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      notNullMode: MigrationNotNullMode.fix,
    );

    final statements = builder.buildInsertStatements(table, const [
      {'Nome': '', 'Idade': null},
    ]).toList();

    expect(
      statements.single,
      'INSERT INTO "pessoas" ("nome", "idade") VALUES (\'\', -1);',
    );
  });

  test('fix repara chave primaria duplicada com valor sintetico', () {
    final table = AnalysisTable(
      name: 'Itens',
      rowCount: 0,
      postgresDdl: null,
      dartClassName: null,
      columns: [
        AnalysisColumn(
          name: 'Id',
          typeName: 'Long',
          typeCode: 0,
          isAutoNumber: false,
          isCalculated: false,
          isRequired: true,
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
        ),
        AnalysisColumn(
          name: 'Nome',
          typeName: 'Text',
          typeCode: 0,
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
        ),
      ],
      indexes: [
        AnalysisIndex(
          name: 'PrimaryKey',
          indexNumber: 0,
          backingDataNumber: 0,
          isPrimaryKey: true,
          isForeignKey: false,
          isUnique: true,
          isRequired: true,
          ignoreNulls: false,
          flags: null,
          columns: [
            AnalysisIndexColumn(
              name: 'Id',
              columnNumber: 0,
              ascending: true,
              flags: null,
            ),
          ],
        ),
      ],
      sampleRows: const [],
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      notNullMode: MigrationNotNullMode.fix,
    );

    final statements = builder.buildInsertStatements(table, const [
      {'Id': 0, 'Nome': 'A'},
      {'Id': 0, 'Nome': 'B'},
    ]).toList();

    expect(
      statements,
      equals([
        'INSERT INTO "itens" ("id", "nome") VALUES (0, \'A\');',
        'INSERT INTO "itens" ("id", "nome") VALUES (-1, \'B\');',
      ]),
    );
  });

  test('remove nulos controles invalidos e surrogates quebrados do texto SQL', () {
    final table = AnalysisTable(
      name: 'Observacoes',
      rowCount: 1,
      postgresDdl: null,
      dartClassName: null,
      columns: [
        AnalysisColumn(
          name: 'Descricao',
          typeName: 'Text',
          typeCode: 10,
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
        ),
      ],
      indexes: const [],
      sampleRows: const [],
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
    );

    final rawText = String.fromCharCodes(<int>[
      0x0041,
      0x0000,
      0x0001,
      0xD800,
      0x0042,
      0x0009,
      0x000A,
      0x0043,
    ]);

    final statements = builder.buildInsertStatements(table, [
      {'Descricao': rawText},
    ]).toList();

    expect(
      statements.single,
      'INSERT INTO "observacoes" ("descricao") VALUES (\'AB\t\nC\');',
    );
  });

  test('gera seed em COPY quando solicitado', () {
    final project = AnalysisProject(
      schemaVersion: '1.0',
      source: 'fixtures/demo.accdb',
      format: 'VERSION_16',
      summary: const <String, dynamic>{},
      tables: [
        AnalysisTable(
          name: 'Pessoas',
          rowCount: 2,
          postgresDdl: null,
          dartClassName: null,
          columns: [
            AnalysisColumn(
              name: 'Id',
              typeName: 'Long',
              typeCode: 0,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: true,
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
            ),
            AnalysisColumn(
              name: 'Nome',
              typeName: 'Text',
              typeCode: 0,
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
            ),
          ],
          indexes: const [],
          sampleRows: const [],
        ),
      ],
      linkedTables: const [],
      relationships: const [],
      forms: const [],
      canonicalAnalysis: null,
      queryReconciliation: null,
      raw: const <String, dynamic>{},
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
    );

    final seed = builder.buildSeed(
      project,
      seedFormat: MigrationSeedFormat.copy,
      tableRowsByName: const {
        'Pessoas': [
          {'Id': 1, 'Nome': 'Ana\tMaria'},
          {'Id': 2, 'Nome': null},
        ],
      },
    );

    expect(seed, contains('-- Seed format: copy'));
    expect(seed, contains('COPY "pessoas" ("id", "nome") FROM STDIN;'));
    expect(seed, contains('1\tAna\\tMaria'));
    expect(seed, contains('2\t\\N'));
    expect(seed, contains(r'\.'));
  });

  test('copy faz fallback para INSERT em sequence mode com autonumber', () {
    final project = AnalysisProject(
      schemaVersion: '1.0',
      source: 'fixtures/demo.accdb',
      format: 'VERSION_16',
      summary: const <String, dynamic>{},
      tables: [
        AnalysisTable(
          name: 'Pedidos',
          rowCount: 1,
          postgresDdl: null,
          dartClassName: null,
          columns: [
            AnalysisColumn(
              name: 'CodPedido',
              typeName: 'Long',
              typeCode: 0,
              isAutoNumber: true,
              isCalculated: false,
              isRequired: true,
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
            ),
            AnalysisColumn(
              name: 'Nome',
              typeName: 'Text',
              typeCode: 0,
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
            ),
          ],
          indexes: const [],
          sampleRows: const [],
        ),
      ],
      linkedTables: const [],
      relationships: const [],
      forms: const [],
      canonicalAnalysis: null,
      queryReconciliation: null,
      raw: const <String, dynamic>{},
    );

    const builder = MigrationStatementBuilder(
      identifierPolicy: MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
      autoNumberMode: MigrationAutoNumberMode.sequence,
    );

    final seed = builder.buildSeed(
      project,
      seedFormat: MigrationSeedFormat.copy,
      tableRowsByName: const {
        'Pedidos': [
          {'CodPedido': 7, 'Nome': 'A'},
        ],
      },
    );

    expect(seed, contains('COPY skipped for Pedidos'));
    expect(
      seed,
      contains('INSERT INTO "pedidos" ("cod_pedido", "nome") VALUES (7, \'A\');'),
    );
    expect(seed, isNot(contains('COPY "pedidos"')));
  });
}
