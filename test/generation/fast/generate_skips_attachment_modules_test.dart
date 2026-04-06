import 'dart:io';
import 'dart:typed_data';

import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/project_generator/project_generator.dart';
import 'package:test/test.dart';

void main() {
  test('scaffold nao gera modulo CRUD isolado para tabela sintetica de attachment', () async {
    final project = AnalysisProject(
      schemaVersion: '1.0',
      source: 'fixtures/teste1/teste1.accdb',
      format: 'VERSION_14',
      summary: const <String, dynamic>{},
      tables: [
        AnalysisTable(
          name: 'Contatos',
          rowCount: 1,
          postgresDdl: null,
          dartClassName: null,
          columns: [
            AnalysisColumn(
              name: 'Id',
              typeName: 'Long',
              typeCode: 4,
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
              complexTypeClassification: null,
              attachmentTableName: null,
              attachmentLinkColumn: null,
            ),
            AnalysisColumn(
              name: 'Anexos',
              typeName: 'ComplexType',
              typeCode: 18,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: false,
              caption: 'Anexos',
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
              name: 'pk_contatos',
              indexNumber: null,
              backingDataNumber: null,
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
          sampleRows: const [
            {'Id': 1, 'Anexos': 10},
          ],
        ),
        AnalysisTable(
          name: 'Contatos_Anexos_attachment',
          rowCount: 1,
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
              name: 'FileName',
              typeName: 'Text',
              typeCode: 10,
              isAutoNumber: false,
              isCalculated: false,
              isRequired: false,
              caption: 'Nome do arquivo',
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
              caption: 'Conteudo',
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
          indexes: const [],
          sampleRows: [
            {
              '_Anexos': 10,
              'FileName': 'teste.pdf',
              'FileData': Uint8List.fromList([1, 2, 3]),
            },
          ],
        ),
      ],
      linkedTables: const [],
      relationships: const [],
      forms: const [],
      canonicalAnalysis: null,
      queryReconciliation: null,
      raw: const <String, dynamic>{},
    );

    final tempDir = await Directory.systemTemp.createTemp('access_attachment_scaffold_');
    addTearDown(() => tempDir.delete(recursive: true));

    final generator = ProjectGenerator();
    await generator.generate(
      project: project,
      outputDirectory: tempDir.path,
    );

    final syntheticFrontendDir = Directory(
      '${tempDir.path}${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos_anexos_attachment',
    );
    final syntheticBackendDir = Directory(
      '${tempDir.path}${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos_anexos_attachment',
    );
    final syntheticModelFile = File(
      '${tempDir.path}${Platform.pathSeparator}core${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}models${Platform.pathSeparator}contatos_anexos_attachment.dart',
    );

    expect(syntheticFrontendDir.existsSync(), isFalse);
    expect(syntheticBackendDir.existsSync(), isFalse);
    expect(syntheticModelFile.existsSync(), isFalse);

    final incluirHtmlFile = File(
      '${tempDir.path}${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}pages${Platform.pathSeparator}incluir_contatos${Platform.pathSeparator}incluir_contatos_page.html',
    );
    final incluirHtml = await incluirHtmlFile.readAsString();
    expect(incluirHtml, contains('Subrecurso de anexos'));
    expect(incluirHtml, contains("attachmentRows('anexos')"));
    expect(incluirHtml, contains("createAttachment('anexos')"));
    expect(incluirHtml, contains("removeAttachment('anexos', row['_attachmentOrdinal'])"));
    expect(incluirHtml, contains('type="file"'));
    expect(incluirHtml, contains("onAttachmentFileSelected('anexos'"));
    expect(incluirHtml, contains('Arquivo selecionado:'));
    expect(incluirHtml, contains('Contatos_Anexos_attachment'));
    expect(incluirHtml, contains('_Anexos'));

    final incluirDart = await File(
      '${tempDir.path}${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}pages${Platform.pathSeparator}incluir_contatos${Platform.pathSeparator}incluir_contatos_page.dart',
    ).readAsString();
    expect(incluirDart, contains('_attachmentPresentation'));
    expect(incluirDart, contains('attachmentRowSummary'));
    expect(incluirDart, contains('await _service.attachmentRows('));
    expect(incluirDart, contains('Future<void> createAttachment(String key) async'));
    expect(incluirDart, contains("import 'dart:html' as html;"));
    expect(incluirDart, contains('Future<void> onAttachmentFileSelected('));
    expect(incluirDart, contains('reader.readAsDataUrl(file);'));
    expect(incluirDart, contains('await _service.createAttachmentRow(id, key, payload);'));
    expect(incluirDart, contains('await _service.removeAttachmentRow(id, key, ordinal);'));

    final frontendService = await File(
      '${tempDir.path}${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}services${Platform.pathSeparator}contatos_service.dart',
    ).readAsString();
    expect(frontendService, contains('Future<List<Map<String, dynamic>>> attachmentRows'));
    expect(frontendService, contains('/contatos/\$id/attachments/\$fieldKey'));
    expect(frontendService, contains('Future<Map<String, dynamic>> createAttachmentRow'));
    expect(frontendService, contains('Future<void> removeAttachmentRow'));
    expect(frontendService, contains('/contatos/\$id/attachments/\$fieldKey/\$ordinal'));

    final backendService = await File(
      '${tempDir.path}${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}services${Platform.pathSeparator}contatos_service.dart',
    ).readAsString();
    expect(backendService, contains('Future<List<Map<String, dynamic>>> attachmentRows'));
    expect(backendService, contains('Future<Map<String, dynamic>> createAttachmentRow'));
    expect(backendService, contains('Future<void> removeAttachmentRow'));
    expect(backendService, contains("case 'anexos':"));
    expect(backendService, contains("attachmentTable: 'contatos_anexos_attachment'"));

    final backendRepository = await File(
      '${tempDir.path}${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}repositories${Platform.pathSeparator}contatos_repository.dart',
    ).readAsString();
    expect(backendRepository, contains('Future<List<Map<String, dynamic>>> attachmentRows'));
    expect(backendRepository, contains('Future<Map<String, dynamic>> insertAttachmentRow'));
    expect(backendRepository, contains('Future<void> deleteAttachmentRow'));
    expect(backendRepository, contains("'_attachmentOrdinal': ordinal"));
    expect(backendRepository, contains("'file_data'"));
    expect(backendRepository, contains("normalized['\${key}_byte_length']"));

    final backendController = await File(
      '${tempDir.path}${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}controllers${Platform.pathSeparator}contatos_controller.dart',
    ).readAsString();
    expect(backendController, contains('static Future<Response> attachments('));
    expect(backendController, contains('static Future<Response> createAttachment('));
    expect(backendController, contains('static Future<Response> deleteAttachment('));

    final backendRoutes = await File(
      '${tempDir.path}${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}contatos${Platform.pathSeparator}routes${Platform.pathSeparator}contatos_routes.dart',
    ).readAsString();
    expect(backendRoutes, contains("..get('/<id>/attachments/<fieldKey>'"));
    expect(backendRoutes, contains("..post('/<id>/attachments/<fieldKey>'"));
    expect(backendRoutes, contains("..delete('/<id>/attachments/<fieldKey>/<ordinal>'"));

    final appComponent = await File(
      '${tempDir.path}${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}app_component.dart',
    ).readAsString();
    expect(appComponent, isNot(contains('ContatosAnexosAttachment')));
  });
}