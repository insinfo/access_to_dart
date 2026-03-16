part of '../project_generator.dart';

String _buildConsultarPageHtml({
  required String namePascal,
  required String moduleNameKebab,
}) {
  return _renderTemplateAsset(
    'frontend/consultar_page.html.mustache',
    <String, Object?>{
      'namePascal': namePascal,
      'moduleNameKebab': moduleNameKebab,
    },
  );
}

String _buildIncluirPageHtml({
  required String namePascal,
  required Iterable<Map<String, Object?>> fields,
}) {
  return _renderTemplateAsset(
    'frontend/incluir_page.html.mustache',
    <String, Object?>{
      'namePascal': namePascal,
      'fields': fields.toList(growable: false),
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
}) {
  return _renderTemplateAsset(
    'frontend/app_component.html.mustache',
    <String, Object?>{
      'projectName': projectName,
      'modules': modules.toList(growable: false),
    },
  );
}

String _buildFrontendShellScss() {
  return _renderTemplateAsset(
    'frontend/app_component.scss.mustache',
    const <String, Object?>{},
  );
}