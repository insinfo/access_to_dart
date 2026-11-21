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
    final toolDir = Directory(p.join(frontendDir.path, 'tool'));
    await toolDir.create(recursive: true);
    await File(p.join(toolDir.path, 'build_release.dart')).writeAsString(
      _renderTemplateAsset('frontend/build_release.dart.mustache', const {}),
    );
    await File(p.join(frontendDir.path, 'README.md')).writeAsString(
      _renderTemplateAsset('frontend/readme.md.mustache', const {}),
    );
  }
}
