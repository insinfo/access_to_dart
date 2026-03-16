part of '../project_generator.dart';

extension _ProjectGeneratorCore on ProjectGenerator {
  Future<void> _writeCore(AnalysisProject project, Directory root) async {
    final coreDir = Directory('${root.path}${Platform.pathSeparator}core');
    final modelsDir = Directory(
      '${coreDir.path}${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}models',
    );
    final validationDir = Directory(
      '${coreDir.path}${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}validation',
    );
    await modelsDir.create(recursive: true);
    await validationDir.create(recursive: true);

    await File('${coreDir.path}${Platform.pathSeparator}pubspec.yaml')
        .writeAsString(_corePubspec(project));
    await File('${coreDir.path}${Platform.pathSeparator}lib${Platform.pathSeparator}core.dart')
        .writeAsString(_coreLibrary(project));
    await File('${coreDir.path}${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}schema.dart')
        .writeAsString(_coreSchema(project));
    await File('${validationDir.path}${Platform.pathSeparator}validation_contract.dart')
        .writeAsString(_coreValidationContract());

    for (final table in project.tables) {
      await File('${modelsDir.path}${Platform.pathSeparator}${table.fileName}')
          .writeAsString(_buildModel(table));
      await File('${validationDir.path}${Platform.pathSeparator}${table.normalizedName}_validation.dart')
          .writeAsString(_buildValidationModel(project, table));
    }
  }

  String _corePubspec(AnalysisProject project) =>
      _buildCorePubspecSource(project);

  String _coreLibrary(AnalysisProject project) =>
      _buildCoreLibrarySource(project);

  String _coreSchema(AnalysisProject project) {
    final tableEntries = project.tables
        .map(
          (table) =>
              "  '${tableRuntimeName(table)}': {'rows': ${table.rowCount}, 'columns': ${table.columns.length}},",
        )
        .join('\n');
    return _buildCoreSchemaTemplateSource(tableEntries);
  }
}