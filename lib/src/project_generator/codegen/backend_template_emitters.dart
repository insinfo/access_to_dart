part of '../project_generator.dart';

String _buildBackendPubspecSource(AnalysisProject project) {
  return _renderTemplateAsset(
    'backend/pubspec.yaml.mustache',
    <String, Object?>{'packageName': project.dartPackageName},
  );
}

String _buildBackendServerBinSource() {
  return '''
import 'package:args/args.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import '../lib/src/di/dependency_injector.dart';
import '../lib/src/db/with_database_shelf.dart';
import '../lib/src/routes/api_routes.dart';

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption('address', abbr: 'a', defaultsTo: '0.0.0.0')
    ..addOption('port', abbr: 'p', defaultsTo: '8080');

  final argsParsed = parser.parse(args);
  final address = argsParsed['address'];
  final port = int.parse(argsParsed['port']);

  setupDependencies();

  final app = Router();
  setupApiRoutes(app);

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(withDbShelfMiddleware())
      .addHandler(app);

  final server = await io.serve(handler, address, port);
  print('Serving at http://\${server.address.host}:\${server.port}');
}
''';
}

String _buildBackendPublicServerBinSource() {
  return '''
import 'package:args/args.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import '../lib/src/db/with_database_shelf.dart';
import '../lib/src/modules/api/di/dependency_injector.dart';
import '../lib/src/public/api/routes/public_api_routes.dart';

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption('address', abbr: 'a', defaultsTo: '0.0.0.0')
    ..addOption('port', abbr: 'p', defaultsTo: '8080');

  final argsParsed = parser.parse(args);
  final address = argsParsed['address'];
  final port = int.parse(argsParsed['port']);

  setupModuleApiDependencies();

  final app = Router();
  setupRoutes(app);

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(withDbShelfMiddleware())
      .addHandler(app);

  final server = await io.serve(handler, address, port);
  print('Public backend at http://\${server.address.host}:\${server.port}');
}
''';
}

String _buildBackendAppConfigSource() {
  return '''
import 'dart:io';

class AppConfig {
  static const apiBasePath = '/api/v1';

  static String get databaseHost =>
      Platform.environment['ACCESS_TO_DART_DB_HOST'] ?? 'localhost';

  static int get databasePort =>
      int.tryParse(Platform.environment['ACCESS_TO_DART_DB_PORT'] ?? '') ??
      5432;

  static String get databaseName =>
      Platform.environment['ACCESS_TO_DART_DB_NAME'] ?? 'generated_db';

  static String get databaseUser =>
      Platform.environment['ACCESS_TO_DART_DB_USER'] ?? 'postgres';

  static String get databasePassword =>
      Platform.environment['ACCESS_TO_DART_DB_PASSWORD'] ?? 'password';
}
''';
}

String _buildBackendApiUtilsSource(AnalysisProject project) {
  return _renderTemplate(
    '''
import 'dart:convert';
import 'package:{{packageName}}_core/core.dart';
import 'package:shelf/shelf.dart';

final Map<String, String> defaultHeaders = {
  'Content-Type': 'application/json; charset=utf-8'
};

Response responseError(String message, {int statusCode = 400}) {
  final Map<String, dynamic> errorPayload = {
    'is_error': true,
    'status_code': statusCode,
    'message': message,
  };
  return Response(statusCode, body: jsonEncode(errorPayload), headers: defaultHeaders);
}

Response responseJson(Object? item) {
  return Response.ok(jsonEncode(item), headers: defaultHeaders);
}

Response responseValidationError(
  ValidationContract contract, {
  int statusCode = 422,
}) {
  return Response(
    statusCode,
    body: jsonEncode({
      'is_error': true,
      'status_code': statusCode,
      'message': 'Validation failed',
      'errors': contract.toJsonList(),
    }),
    headers: defaultHeaders,
  );
}
''',
    <String, Object?>{'packageName': project.dartPackageName},
    name: 'api_utils.dart',
  );
}

String _buildBackendModuleApiDiSource() {
  return '''
import '../../../di/dependency_injector.dart';

void setupModuleApiDependencies() {
  setupDependencies();
}
''';
}

String _buildBackendApiRoutesSource(AnalysisProject project) {
  return _renderTemplate(
    '''
import 'package:shelf_router/shelf_router.dart';

{{{imports}}}

void setupApiRoutes(Router app) {
  final basePath = '/api/v1';

{{{setups}}}
}
''',
    <String, Object?>{
        'imports': _scaffoldTables(project)
          .map((t) => "import '../modules/${t.normalizedName}/routes/${t.normalizedName}_routes.dart';")
          .join('\n'),
        'setups': _scaffoldTables(project)
          .map((t) => '  setup${t.className}Routes(app, basePath);')
          .join('\n'),
    },
    name: 'api_routes.dart',
  );
}

String _buildBackendPublicApiRoutesSource(AnalysisProject project) {
  return _renderTemplate(
    '''
import 'package:shelf_router/shelf_router.dart';

import '../controllers/public_api_controller.dart';
{{{imports}}}

void setupRoutes(Router app) {
  final basePath = '/api/v1';

  app.get('/health', PublicApiController.health);
{{{setups}}}
}
''',
    <String, Object?>{
        'imports': _scaffoldTables(project)
          .map((t) => "import '../../../modules/${t.normalizedName}/routes/${t.normalizedName}_routes.dart';")
          .join('\n'),
        'setups': _scaffoldTables(project)
          .map((t) => '  setup${t.className}Routes(app, basePath);')
          .join('\n'),
    },
    name: 'public_api_routes.dart',
  );
}

String _buildBackendPublicApiControllerSource(AnalysisProject project) {
  return _renderTemplate(
    '''
import 'package:shelf/shelf.dart';

import '../../../shared/utils/api_utils.dart';

class PublicApiController {
  static Future<Response> health(Request request) async {
    return responseJson({
      'status': 'ok',
      'source': '{{source}}',
    });
  }
}
''',
    <String, Object?>{'source': project.source.replaceAll("'", "\\'")},
    name: 'public_api_controller.dart',
  );
}

String _buildBackendDatabaseServiceSource() {
  return _renderTemplateAsset(
    'backend/database_service.dart.mustache',
    const <String, Object?>{},
  );
}

String _buildBackendWithDbShelfSource() {
  return _renderTemplateAsset(
    'backend/with_database_shelf.dart.mustache',
    const <String, Object?>{},
  );
}

String _buildBackendRequestExtensionSource() {
  return _renderTemplateAsset(
    'backend/request_extension.dart.mustache',
    const <String, Object?>{},
  );
}

String _buildBackendGeneratedDataSource(String generatedDataJson) {
  return _renderTemplateAsset(
    'backend/generated_data.dart.mustache',
    <String, Object?>{'generatedDataJson': generatedDataJson},
  );
}