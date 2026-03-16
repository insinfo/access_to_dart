part of '../project_generator.dart';

extension _FrontendScaffoldGenerator on ProjectGenerator {
  Future<void> _generateFrontendPubspec(
    AnalysisProject project,
    Directory frontendDir,
  ) async {
    final pubspec = _renderTemplateAsset(
      'frontend/pubspec.yaml.mustache',
      <String, Object?>{
        'frontendPackageName': '${project.dartPackageName}_frontend',
        'source': project.source,
        'corePackageName': '${project.dartPackageName}_core',
      },
    );
    await File(p.join(frontendDir.path, 'pubspec.yaml')).writeAsString(pubspec);
  }

  Future<void> _generateFrontendBuildYaml(Directory frontendDir) async {
    final buildYaml = _renderTemplateAsset(
      'frontend/build.yaml.mustache',
      const <String, Object?>{},
    );
    await File(p.join(frontendDir.path, 'build.yaml')).writeAsString(buildYaml);
  }
}