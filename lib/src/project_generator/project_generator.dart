import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

import '../analysis_doctor.dart';
import '../analysis_model.dart';
import '../migration_identifier_style.dart';
import '../vba_parser/form_rule_extractor.dart';

part 'project_generator_backend.dart';
part 'project_generator_core.dart';
part 'project_generator_frontend.dart';
part 'project_generator_shared.dart';

class GeneratedProject {
  final Directory rootDirectory;

  GeneratedProject(this.rootDirectory);
}

class ProjectGenerator {
  final MigrationIdentifierPolicy identifierPolicy;

  ProjectGenerator({
    MigrationIdentifierStyle identifierStyle =
        MigrationIdentifierStyle.snakeAscii,
  }) : identifierPolicy = MigrationIdentifierPolicy(style: identifierStyle);

  Future<GeneratedProject> generate({
    required AnalysisProject project,
    required String outputDirectory,
  }) async {
    final root = Directory(outputDirectory);
    await root.create(recursive: true);

    await _writeCore(project, root);
    await _writeBackend(project, root);
    await _writeFrontend(project, root);
    await _writeReport(project, root);

    return GeneratedProject(root);
  }

  String tableRuntimeName(AnalysisTable table) => identifierPolicy.tableName(table.name);

  String tableRouteName(AnalysisTable table) => table.normalizedName;

  String tableRouteSegment(AnalysisTable table) =>
      tableRouteName(table).replaceAll('_', '-');

  String columnRuntimeName(AnalysisColumn column) =>
      identifierPolicy.columnName(column.name);

  String primaryKeyRuntimeName(AnalysisTable table) {
    final primaryKey = table.primaryKey;
    if (primaryKey != null && primaryKey.columns.isNotEmpty) {
      return identifierPolicy.columnName(primaryKey.columns.first.name);
    }
    if (table.columns.isNotEmpty) {
      return identifierPolicy.columnName(table.columns.first.name);
    }
    return 'id';
  }
}
