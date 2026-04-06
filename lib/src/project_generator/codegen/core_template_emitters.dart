part of '../project_generator.dart';

String _buildCorePubspecSource(AnalysisProject project) {
  return _renderTemplateAsset(
    'core/pubspec.yaml.mustache',
    <String, Object?>{
      'packageName': project.dartPackageName,
      'source': project.source,
    },
  );
}

String _buildCoreLibrarySource(AnalysisProject project) {
  final tables = _scaffoldTables(project);
  final exports = <String>[
    "export 'src/schema.dart';",
    "export 'src/validation/validation_contract.dart';",
    for (final table in tables) "export 'src/models/${table.fileName}';",
    for (final table in tables)
      "export 'src/validation/${table.normalizedName}_validation.dart';",
  ];
  return '${exports.join('\n')}\n';
}

String _buildCoreValidationContractSource() {
  return _renderTemplateAsset(
    'core/validation_contract.dart.mustache',
    const <String, Object?>{},
  );
}

String _buildCoreSchemaTemplateSource(String tableEntries) {
  return _renderTemplateAsset(
    'core/schema.dart.mustache',
    <String, Object?>{'tableEntries': tableEntries},
  );
}