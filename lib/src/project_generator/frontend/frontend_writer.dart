part of '../project_generator.dart';

extension FrontendGenerator on ProjectGenerator {
  Future<void> _writeFrontend(AnalysisProject project, Directory root) async {
    final frontendDir = Directory(p.join(root.path, 'frontend'));
    if (!frontendDir.existsSync()) {
      frontendDir.createSync(recursive: true);
    }

    await _generateFrontendPubspec(project, frontendDir);
    await _generateFrontendBuildYaml(frontendDir);
    await _generateFrontendShared(
      project,
      Directory(p.join(frontendDir.path, 'lib', 'src', 'shared')),
    );

    final modulesDir = Directory(p.join(frontendDir.path, 'lib', 'src', 'modules'));
    if (!modulesDir.existsSync()) {
      modulesDir.createSync(recursive: true);
    }

    for (final table in scaffoldTables(project)) {
      final moduleDir = Directory(p.join(modulesDir.path, table.normalizedName));
      if (!moduleDir.existsSync()) {
        moduleDir.createSync(recursive: true);
      }

      await _generateFormLogic(project, table, moduleDir);
      await _generateService(project, table, moduleDir);
      await _generateConsultarPage(project, table, moduleDir);
      await _generateIncluirPage(project, table, moduleDir);
      await _generateModulePageComponent(project, table, moduleDir);
    }

    await _generateFrontendShell(project, frontendDir);
  }
}