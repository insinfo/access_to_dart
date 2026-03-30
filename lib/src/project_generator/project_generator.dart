import 'dart:convert';
import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mustache_template/mustache_template.dart';
import 'package:path/path.dart' as p;
import 'package:recase/recase.dart';

import '../access_default_semantics.dart';
import '../analysis_doctor.dart';
import '../analysis_model.dart';
import '../identifier_utils.dart';
import '../migration_identifier_style.dart';
import '../query_reconciliation/sql_clause_parser.dart';
import '../query_reconciliation/sql_token.dart';
import '../query_reconciliation/sql_tokenizer.dart';
import '../vba_parser/form_rule_extractor.dart';

part 'project_generator_form_rules.dart';
part 'project_generator_ir.dart';
part 'project_generator_shared.dart';
part 'codegen/backend_template_emitters.dart';
part 'codegen/codegen_shared.dart';
part 'codegen/core_template_emitters.dart';
part 'codegen/backend_dart_emitters.dart';
part 'codegen/core_dart_emitters.dart';
part 'codegen/frontend_dart_emitters.dart';
part 'codegen/frontend_template_emitters.dart';
part 'backend/backend_base_generator.dart';
part 'backend/backend_module_generator.dart';
part 'backend/backend_writer.dart';
part 'core/core_model_generator.dart';
part 'core/core_validation_generator.dart';
part 'core/core_writer.dart';
part 'frontend/frontend_module_generator.dart';
part 'frontend/frontend_scaffold_generator.dart';
part 'frontend/frontend_shell_generator.dart';
part 'frontend/frontend_shared_generator.dart';
part 'frontend/frontend_writer.dart';

String _dartStringLiteral(String value) {
  return jsonEncode(value).replaceAll(r'$', r'\$');
}

String _htmlTextLiteral(String value) {
  return const HtmlEscape(HtmlEscapeMode.attribute).convert(value);
}

class GeneratedProject {
  final Directory rootDirectory;

  GeneratedProject(this.rootDirectory);
}

class ProjectGenerator {
  final MigrationIdentifierPolicy identifierPolicy;
  static const AccessDefaultSemanticTranslator defaultSemanticTranslator =
      AccessDefaultSemanticTranslator();

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
      ReCase(tableRouteName(table)).paramCase;

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
