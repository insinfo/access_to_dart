part of '../project_generator.dart';

String _buildConsultarPageHtml({
  required String namePascal,
  required String moduleNameKebab,
  bool allowCreate = true,
  bool allowUpdate = true,
}) {
  return _renderTemplateAsset(
    'frontend/consultar_page.html.mustache',
    <String, Object?>{
      'namePascal': namePascal,
      'moduleNameKebab': moduleNameKebab,
      'allowCreate': allowCreate,
      'allowUpdate': allowUpdate,
    },
  );
}

String _buildIncluirPageHtml({
  required String namePascal,
  required Iterable<Map<String, Object?>> fields,
  Iterable<Map<String, Object?>> accessCommands = const [],
}) {
  return _renderTemplateAsset(
    'frontend/incluir_page.html.mustache',
    <String, Object?>{
      'namePascal': namePascal,
      'fields': fields.toList(growable: false),
      'accessCommands': accessCommands.toList(growable: false),
    },
  );
}

String _buildFrontendModulePageComponentHtml({
  required String moduleNameKebab,
}) {
  return _renderTemplateAsset(
    'frontend/module_page_component.html.mustache',
    <String, Object?>{'moduleNameKebab': moduleNameKebab},
  );
}

String _buildFrontendShellHtml({
  required String projectName,
  required Iterable<Map<String, Object?>> modules,
  bool hasReports = false,
  bool hasQueries = false,
  bool hasMenus = false,
}) {
  return _renderTemplateAsset(
    'frontend/app_component.html.mustache',
    <String, Object?>{
      'projectName': projectName,
      'modules': modules.toList(growable: false),
      'hasReports': hasReports,
      'hasQueries': hasQueries,
      'hasMenus': hasMenus,
    },
  );
}

String _buildFrontendShellScss() {
  return _renderTemplateAsset(
    'frontend/app_component.scss.mustache',
    const <String, Object?>{},
  );
}