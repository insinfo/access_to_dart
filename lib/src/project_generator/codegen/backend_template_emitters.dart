part of '../project_generator.dart';

String _buildBackendPubspecSource(AnalysisProject project) {
  return _renderTemplateAsset(
    'backend/pubspec.yaml.mustache',
    <String, Object?>{'packageName': project.dartPackageName},
  );
}

String _buildBackendServerBinSource() {
  return '''
import 'dart:io';
import 'package:args/args.dart';
import 'package:shelf_static/shelf_static.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import '../lib/src/di/dependency_injector.dart';
import '../lib/src/db/with_database_shelf.dart';
import '../lib/src/routes/api_routes.dart';

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption('address', abbr: 'a', defaultsTo: '0.0.0.0')
    ..addOption('port', abbr: 'p', defaultsTo: '8080')
    ..addOption('frontend-dir', help: 'Verified frontend release directory');

  final argsParsed = parser.parse(args);
  final address = argsParsed['address'];
  final port = int.parse(argsParsed['port']);

  setupDependencies();

  final app = Router(notFoundHandler: (_) => _apiNotFound());
  setupApiRoutes(app);

  final api = Pipeline().addMiddleware(withDbShelfMiddleware()).addHandler(app);
  final frontendPath = argsParsed['frontend-dir'] as String?;
  final frontend = frontendPath == null ? null : _verifiedFrontend(frontendPath);
  final handler = Pipeline().addMiddleware(logRequests()).addHandler((request) async {
    final path = request.url.path;
    if (path == 'api' || path.startsWith('api/')) {
      final response = await api(request);
      if (response.statusCode == 404 &&
          !(response.headers['content-type'] ?? '').contains('application/json')) {
        return _apiNotFound();
      }
      return response;
    }
    if (frontend != null) return frontend(request);
    return _apiNotFound();
  });

  final server = await io.serve(handler, address, port);
  print('Serving at http://\${server.address.host}:\${server.port}');
}
${_buildFrontendServingHelpers()}
''';
}

String _buildBackendPublicServerBinSource() {
  return '''
import 'dart:io';
import 'package:args/args.dart';
import 'package:shelf_static/shelf_static.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import '../lib/src/db/with_database_shelf.dart';
import '../lib/src/modules/api/di/dependency_injector.dart';
import '../lib/src/public/api/routes/public_api_routes.dart';

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption('address', abbr: 'a', defaultsTo: '0.0.0.0')
    ..addOption('port', abbr: 'p', defaultsTo: '8080')
    ..addOption('frontend-dir', help: 'Verified frontend release directory');

  final argsParsed = parser.parse(args);
  final address = argsParsed['address'];
  final port = int.parse(argsParsed['port']);

  setupModuleApiDependencies();

  final app = Router(notFoundHandler: (_) => _apiNotFound());
  setupRoutes(app);

  final api = Pipeline().addMiddleware(withDbShelfMiddleware()).addHandler(app);
  final frontendPath = argsParsed['frontend-dir'] as String?;
  final frontend = frontendPath == null ? null : _verifiedFrontend(frontendPath);
  final handler = Pipeline().addMiddleware(logRequests()).addHandler((request) async {
    final path = request.url.path;
    if (path == 'api' || path.startsWith('api/')) {
      final response = await api(request);
      if (response.statusCode == 404 &&
          !(response.headers['content-type'] ?? '').contains('application/json')) {
        return _apiNotFound();
      }
      return response;
    }
    if (frontend != null) return frontend(request);
    return _apiNotFound();
  });

  final server = await io.serve(handler, address, port);
  print('Public backend at http://\${server.address.host}:\${server.port}');
}
${_buildFrontendServingHelpers()}
''';
}

String _buildFrontendServingHelpers() => r'''
Response _apiNotFound() => Response.notFound(
    '{"error":"not_found"}', headers: {'content-type': 'application/json'});

Handler _verifiedFrontend(String directory) {
  final root = Directory(directory).absolute;
  final manifest = File('${root.path}/.build.manifest');
  if (!manifest.existsSync()) throw StateError('Frontend manifest missing');
  final entries = manifest.readAsLinesSync().map((e) => e.trim().replaceAll(r'\', '/'))
      .where((e) => e.isNotEmpty).toSet();
  if (!entries.containsAll({'index.html', 'main.dart.js'})) {
    throw StateError('Frontend manifest must include index.html and main.dart.js');
  }
  final rootUri = root.resolveSymbolicLinksSync();
  for (final entry in entries) {
    if (entry.startsWith('/') || entry.contains(':') ||
        entry.split('/').any((s) => s == '..' || s == '.')) {
      throw StateError('Unsafe frontend manifest path');
    }
    final file = File('${root.path}/$entry');
    if (!file.existsSync()) throw StateError('Frontend asset missing: $entry');
    final resolved = file.resolveSymbolicLinksSync();
    if (!resolved.startsWith('$rootUri${Platform.pathSeparator}')) {
      throw StateError('Frontend asset outside release directory');
    }
  }
  for (final entry in ['index.html', 'main.dart.js']) {
    if (File('${root.path}/$entry').lengthSync() == 0) {
      throw StateError('Frontend entrypoint empty: $entry');
    }
  }
  final serve = createStaticHandler(root.path, defaultDocument: 'index.html');
  return (request) {
    if (request.method != 'GET' && request.method != 'HEAD') {
      return Response(405, headers: {'allow': 'GET, HEAD'});
    }
    final path = request.url.path.isEmpty ? 'index.html' : request.url.path;
    if (!entries.contains(path)) return Response.notFound('Not Found');
    return serve(request);
  };
}
''';

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
import '../shared/access_queries.dart';
import '../shared/access_reports.dart';

{{{imports}}}

void setupApiRoutes(Router app) {
  final basePath = '/api/v1';
  app.get('/api/v1/access-queries/<key>', AccessQueryController.run);
  app.get('/api/v1/access-reports', AccessReportController.list);
  app.get('/api/v1/access-reports/<key>', AccessReportController.run);
  app.get('/api/v1/access-reports/<key>/assets/<asset>', AccessReportController.asset);

{{{setups}}}
}
''',
    <String, Object?>{
      'imports': _scaffoldTables(project)
          .map((t) =>
              "import '../modules/${t.normalizedName}/routes/${t.normalizedName}_routes.dart';")
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
import '../../../shared/access_queries.dart';
import '../../../shared/access_reports.dart';
{{{imports}}}

void setupRoutes(Router app) {
  final basePath = '/api/v1';
  app.get('/api/v1/access-queries/<key>', AccessQueryController.run);
  app.get('/api/v1/access-reports', AccessReportController.list);
  app.get('/api/v1/access-reports/<key>', AccessReportController.run);
  app.get('/api/v1/access-reports/<key>/assets/<asset>', AccessReportController.asset);

  app.get('/health', PublicApiController.health);
{{{setups}}}
}
''',
    <String, Object?>{
      'imports': _scaffoldTables(project)
          .map((t) =>
              "import '../../../modules/${t.normalizedName}/routes/${t.normalizedName}_routes.dart';")
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
