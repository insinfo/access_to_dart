import 'dart:io';

import 'package:path/path.dart' as p;

import '../analysis_doctor.dart';
import '../analysis_model.dart';

part 'project_generator_backend.dart';
part 'project_generator_core.dart';
part 'project_generator_frontend.dart';
part 'project_generator_shared.dart';

class GeneratedProject {
  final Directory rootDirectory;

  GeneratedProject(this.rootDirectory);
}

class ProjectGenerator {
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
}
