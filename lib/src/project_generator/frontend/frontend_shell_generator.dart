part of '../project_generator.dart';

extension _FrontendShellGenerator on ProjectGenerator {
  Future<void> _generateFrontendShell(
    AnalysisProject project,
    Directory frontendDir,
  ) async {
    final libDir = Directory(p.join(frontendDir.path, 'lib'));
    final webDir = Directory(p.join(frontendDir.path, 'web'));
    if (!libDir.existsSync()) {
      libDir.createSync(recursive: true);
    }
    if (!webDir.existsSync()) {
      webDir.createSync(recursive: true);
    }

    final tables = scaffoldTables(project);
    final modules = tables
        .map(
          (table) => <String, Object?>{
            'nameSnake': table.normalizedName,
            'namePascal': table.className,
            'routeSegment': tableRouteSegment(table),
          },
        )
        .toList(growable: false);

    final initialModule = tables.isEmpty
        ? ''
      : tableRouteSegment(tables.first);

    await File(p.join(libDir.path, 'app_component.dart')).writeAsString(
      _buildFrontendShellDartSource(
        initialModule: initialModule,
        modules: modules,
      ),
    );

    await File(p.join(libDir.path, 'app_component.html')).writeAsString(
      _buildFrontendShellHtml(
        projectName: project.projectName,
        modules: modules,
      ),
    );

    await File(p.join(libDir.path, 'app_component.scss'))
        .writeAsString(_buildFrontendShellScss());

    await File(p.join(webDir.path, 'main.dart')).writeAsString(
      _buildFrontendMainDartSource(packageName: project.dartPackageName),
    );

    await File(p.join(webDir.path, 'index.html')).writeAsString(
      _renderTemplateAsset(
        'frontend/index.html.mustache',
        <String, Object?>{'projectName': project.projectName},
      ),
    );
  }
}