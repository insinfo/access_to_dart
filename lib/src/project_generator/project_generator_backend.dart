part of 'project_generator.dart';

extension _ProjectGeneratorBackend on ProjectGenerator {
  Future<void> _writeBackend(AnalysisProject project, Directory root) async {
    final backendDir =
        Directory('${root.path}${Platform.pathSeparator}backend');

    // Cria a estrutura de pastas profissional
    final dirs = [
      'bin',
      'lib/src/db',
      'lib/src/di',
      'lib/src/modules/api/di',
      'lib/src/public/api/controllers',
      'lib/src/public/api/routes',
      'lib/src/shared/extensions',
      'lib/src/shared/utils',
      'lib/src/shared',
      'lib/src/routes',
      'lib/src/modules',
    ];
    for (final dir in dirs) {
      await Directory('${backendDir.path}${Platform.pathSeparator}$dir')
          .create(recursive: true);
    }

    // Escreve os arquivos base do backend
    await File('${backendDir.path}${Platform.pathSeparator}pubspec.yaml')
        .writeAsString(_backendPubspec(project));

    await File('${backendDir.path}/bin/server.dart')
        .writeAsString(_backendServerBin(project));

    await File('${backendDir.path}/bin/public_backend.dart')
      .writeAsString(_backendPublicServerBin(project));

    await File('${backendDir.path}/lib/src/db/database_service.dart')
        .writeAsString(_backendDatabaseService(project));

    await File('${backendDir.path}/lib/src/db/with_database_shelf.dart')
        .writeAsString(_backendWithDbShelf(project));

    await File('${backendDir.path}/lib/src/shared/utils/api_utils.dart')
        .writeAsString(_backendApiUtils(project));

    await File('${backendDir.path}/lib/src/shared/app_config.dart')
      .writeAsString(_backendAppConfig(project));

    await File('${backendDir.path}/lib/src/generated_data.dart')
      .writeAsString(_backendGeneratedData(project));

    await File(
            '${backendDir.path}/lib/src/shared/extensions/request_extension.dart')
        .writeAsString(_backendRequestExtension(project));

    // Escreve os módulos para cada tabela
    for (final table in project.tables) {
      final modDir =
          '${backendDir.path}/lib/src/modules/${table.normalizedName}';
      await Directory('$modDir/controllers').create(recursive: true);
      await Directory('$modDir/repositories').create(recursive: true);
      await Directory('$modDir/services').create(recursive: true);
      await Directory('$modDir/routes').create(recursive: true);

      await File('$modDir/repositories/${table.normalizedName}_repository.dart')
          .writeAsString(_backendRepository(project, table));

      await File('$modDir/services/${table.normalizedName}_service.dart')
        .writeAsString(_backendService(project, table));

      await File('$modDir/controllers/${table.normalizedName}_controller.dart')
          .writeAsString(_backendController(project, table));

      await File('$modDir/routes/${table.normalizedName}_routes.dart')
          .writeAsString(_backendModuleRoutes(project, table));
    }

    // Arquivos globais dinâmicos (DI e Rotas Principais)
    await File('${backendDir.path}/lib/src/di/dependency_injector.dart')
        .writeAsString(_backendDI(project));

    await File('${backendDir.path}/lib/src/modules/api/di/dependency_injector.dart')
      .writeAsString(_backendModuleApiDI(project));

    await File('${backendDir.path}/lib/src/routes/api_routes.dart')
        .writeAsString(_backendApiRoutes(project));

    await File('${backendDir.path}/lib/src/public/api/routes/public_api_routes.dart')
      .writeAsString(_backendPublicApiRoutes(project));

    await File('${backendDir.path}/lib/src/public/api/controllers/public_api_controller.dart')
      .writeAsString(_backendPublicApiController(project));
  }

  String _backendPubspec(AnalysisProject project) => '''
name: ${project.dartPackageName}_backend
publish_to: none

environment:
  sdk: ^3.6.2

dependencies:
  ${project.dartPackageName}_core:
    path: ../core
  shelf: ^1.4.2
  shelf_router: ^1.1.4
  eloquent: ^3.4.3
  get_it: ^7.7.0
  args: ^2.5.0
''';

  String _backendServerBin(AnalysisProject project) => '''
import 'dart:io';

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

  // Configura Injeção de Dependências
  setupDependencies();

  final app = Router();
  
  // Configura Rotas
  setupApiRoutes(app);

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(withDbShelfMiddleware())
      .addHandler(app);

  final server = await io.serve(handler, address, port);
  print('Serving at http://\${server.address.host}:\${server.port}');
}
''';

  String _backendPublicServerBin(AnalysisProject project) => '''
import 'dart:io';

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

  String _backendDatabaseService(AnalysisProject project) => '''
import 'package:eloquent/eloquent.dart';

import '../shared/app_config.dart';

class DatabaseService {
  late final Manager _manager = Manager()..addConnection(_baseConfig, 'default');

  Map<String, dynamic> get _baseConfig => {
        'driver': 'pgsql',
        'host': AppConfig.databaseHost,
        'port': AppConfig.databasePort,
        'database': AppConfig.databaseName,
        'username': AppConfig.databaseUser,
        'password': AppConfig.databasePassword,
        'charset': 'utf8',
        'pool': true,
        'poolsize': 10,
      };

  Future<Connection> connect([String name = 'default']) async {
    return _manager.getConnection(name);
  }
}
''';

  String _backendWithDbShelf(AnalysisProject project) => '''
import 'package:eloquent/eloquent.dart';
import 'package:shelf/shelf.dart';

import '../di/dependency_injector.dart';
import 'database_service.dart';

Middleware withDbShelfMiddleware() {
  return (Handler innerHandler) {
    return (Request request) async {
      final dbService = ioc.get<DatabaseService>();
      Connection? connection;

      try {
        ioc.pushNewScope();
        connection = await dbService.connect();
        ioc.registerSingleton<Connection>(connection);

        final newRequest = request.change(context: {
          ...request.context,
          'db.connection': connection,
        });

        return await innerHandler(newRequest);
      } finally {
        await ioc.popScope();
      }
    };
  };
}
''';

  String _backendAppConfig(AnalysisProject project) => '''
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

  String _backendApiUtils(AnalysisProject project) => '''
import 'dart:convert';
import 'package:${project.dartPackageName}_core/core.dart';
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
''';

  String _backendRequestExtension(AnalysisProject project) => '''
import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../di/dependency_injector.dart';

extension ShelfRequestDI on Request {
  T make<T extends Object>() {
    return ioc.get<T>();
  }
}

extension ShelfRequestExtension on Request {
  Future<Map<String, dynamic>> bodyAsMap() async {
    final requestBody = await readAsString();
    if (requestBody.isEmpty) return {};
    return json.decode(requestBody) as Map<String, dynamic>;
  }
}
''';

  String _backendRepository(AnalysisProject project, AnalysisTable table) => '''
import 'package:eloquent/eloquent.dart';
import 'package:${project.dartPackageName}_core/core.dart';

class ${table.className}Repository {
  final Connection db;

  ${table.className}Repository(this.db);

  Future<List<Map<String, dynamic>>> all() async {
    final query = db.table('${tableRuntimeName(table)}');
    return await query.get();
  }

  Future<Map<String, dynamic>?> findById(int id) async {
    return await db.table('${tableRuntimeName(table)}').where('${primaryKeyRuntimeName(table)}', '=', id).first();
  }

  Future<int> insert(${table.className} item) async {
    return await db.table('${tableRuntimeName(table)}').insertGetId(item.toMap()) as int;
  }

  Future<void> update(int id, ${table.className} item) async {
    await db.table('${tableRuntimeName(table)}').where('${primaryKeyRuntimeName(table)}', '=', id).update(item.toMap());
  }

  Future<void> delete(int id) async {
    await db.table('${tableRuntimeName(table)}').where('${primaryKeyRuntimeName(table)}', '=', id).delete();
  }
}
''';

  String _backendService(AnalysisProject project, AnalysisTable table) => '''
import 'package:${project.dartPackageName}_core/core.dart';

import '../repositories/${table.normalizedName}_repository.dart';

class ${table.className}Service {
  static const resourcePath = '/api/v1/${tableRouteName(table)}';

  final ${table.className}Repository repository;

  ${table.className}Service(this.repository);

  Future<List<Map<String, dynamic>>> all() {
    return repository.all();
  }

  Future<Map<String, dynamic>?> findById(int id) {
    return repository.findById(id);
  }

  Future<int> create(${table.className} item) {
    return repository.insert(item);
  }

  Future<void> update(int id, ${table.className} item) {
    return repository.update(id, item);
  }

  Future<void> delete(int id) {
    return repository.delete(id);
  }
}
''';

  String _backendController(AnalysisProject project, AnalysisTable table) => '''
import 'package:shelf/shelf.dart';
import 'package:${project.dartPackageName}_core/core.dart';

import '../../../shared/extensions/request_extension.dart';
import '../../../shared/utils/api_utils.dart';
import '../services/${table.normalizedName}_service.dart';

class ${table.className}Controller {

  static Future<Response> list(Request req) async {
    try {
      final service = req.make<${table.className}Service>();
      final data = await service.all();
      return responseJson(data);
    } catch (e, s) {
      print('Erro no list: \$e \$s');
      return responseError(e.toString());
    }
  }

  static Future<Response> show(Request req, String idRaw) async {
    try {
      final id = int.parse(idRaw);
      final service = req.make<${table.className}Service>();
      final item = await service.findById(id);
      if (item == null) return responseError('Not found', statusCode: 404);
      return responseJson(item);
    } catch (e) {
      return responseError(e.toString());
    }
  }

  static Future<Response> create(Request req) async {
    try {
      final body = await req.bodyAsMap();
      final validation = ${table.className}ValidationContract.validateDraft(body);
      if (!validation.isValid) {
        return responseValidationError(validation);
      }
      final item = ${table.className}.fromMap(body);
      final service = req.make<${table.className}Service>();
      final insertedId = await service.create(item);
      return responseJson({'id': insertedId});
    } catch (e) {
      return responseError(e.toString());
    }
  }

  static Future<Response> update(Request req, String idRaw) async {
    try {
      final id = int.parse(idRaw);
      final body = await req.bodyAsMap();
      final validation = ${table.className}ValidationContract.validateDraft(body);
      if (!validation.isValid) {
        return responseValidationError(validation);
      }
      final item = ${table.className}.fromMap(body);
      
      final service = req.make<${table.className}Service>();
      await service.update(id, item);
      
      return responseJson({'success': true});
    } catch (e) {
      return responseError(e.toString());
    }
  }

  static Future<Response> delete(Request req, String idRaw) async {
    try {
      final id = int.parse(idRaw);
      final service = req.make<${table.className}Service>();
      await service.delete(id);
      
      return responseJson({'success': true});
    } catch (e) {
      return responseError(e.toString());
    }
  }
}
''';

  String _backendModuleRoutes(AnalysisProject project, AnalysisTable table) =>
      '''
import 'package:shelf_router/shelf_router.dart';
import '../controllers/${table.normalizedName}_controller.dart';

void setup${table.className}Routes(Router app, String basePath) {
  final group = Router()
    ..get('/', ${table.className}Controller.list)
    ..get('/<id>', ${table.className}Controller.show)
    ..post('/', ${table.className}Controller.create)
    ..put('/<id>', ${table.className}Controller.update)
    ..delete('/<id>', ${table.className}Controller.delete);

  app.mount('\$basePath/${tableRouteName(table)}', group.call);
}
''';

  String _backendDI(AnalysisProject project) {
    final imports = project.tables
      .expand((t) => [
          "import '../modules/${t.normalizedName}/repositories/${t.normalizedName}_repository.dart';",
          "import '../modules/${t.normalizedName}/services/${t.normalizedName}_service.dart';",
        ])
        .join('\n');
    final factories = project.tables
      .expand((t) => [
          "  regFactoryIfAbs<${t.className}Repository>(() => ${t.className}Repository(ioc.get<Connection>()));",
          "  regFactoryIfAbs<${t.className}Service>(() => ${t.className}Service(ioc.get<${t.className}Repository>()));",
        ])
        .join('\n');

    return '''
import 'package:eloquent/eloquent.dart';
import 'package:get_it/get_it.dart';

import '../db/database_service.dart';
$imports

final ioc = GetIt.instance;

void setupDependencies() {
  if (!ioc.isRegistered<DatabaseService>()) {
    ioc.registerSingleton<DatabaseService>(DatabaseService());
  }

  void regFactoryIfAbs<T extends Object>(T Function() factory) {
    if (!ioc.isRegistered<T>()) {
      ioc.registerFactory<T>(factory);
    }
  }

$factories
}
''';
  }

  String _backendModuleApiDI(AnalysisProject project) => '''
import '../../../di/dependency_injector.dart';

void setupModuleApiDependencies() {
  setupDependencies();
}
''';

  String _backendApiRoutes(AnalysisProject project) {
    final imports = project.tables
        .map((t) =>
            "import '../modules/${t.normalizedName}/routes/${t.normalizedName}_routes.dart';")
        .join('\n');
    final setups = project.tables
        .map((t) => "  setup${t.className}Routes(app, basePath);")
        .join('\n');

    return '''
import 'package:shelf_router/shelf_router.dart';

$imports

void setupApiRoutes(Router app) {
  final basePath = '/api/v1';

$setups
}
''';
  }

  String _backendPublicApiRoutes(AnalysisProject project) {
    final imports = project.tables
        .map((t) =>
        "import '../../../modules/${t.normalizedName}/routes/${t.normalizedName}_routes.dart';")
        .join('\n');
    final setups = project.tables
        .map((t) => "  setup${t.className}Routes(app, basePath);")
        .join('\n');

    return '''
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../controllers/public_api_controller.dart';
$imports

void setupRoutes(Router app) {
  final basePath = '/api/v1';

  app.get('/health', PublicApiController.health);
$setups
}
''';
  }

  String _backendPublicApiController(AnalysisProject project) => '''
import 'package:shelf/shelf.dart';

import '../../../shared/utils/api_utils.dart';

class PublicApiController {
  static Future<Response> health(Request request) async {
    return responseJson({
      'status': 'ok',
      'source': '${project.source.replaceAll("'", "\\'")}',
    });
  }
}
''';

  String _backendGeneratedData(AnalysisProject project) {
    final payload = <String, Object?>{
      for (final table in project.tables)
        tableRuntimeName(table): table.sampleRows
            .map(
              (row) => {
                for (final entry in row.entries)
                  _normalizeGeneratedKey(entry.key.toString()):
                      _jsonSafeGeneratedValue(entry.value),
              },
            )
            .toList(),
    };
    final json = const JsonEncoder.withIndent('  ').convert(payload);
    return """
import 'dart:convert';

final generatedData =
    jsonDecode(_generatedDataJson) as Map<String, dynamic>;

const _generatedDataJson = r'''$json''';
""";
  }

  Object? _jsonSafeGeneratedValue(Object? value) {
    if (value is DateTime) {
      return value.toIso8601String();
    }
    if (value is List) {
      return value.map(_jsonSafeGeneratedValue).toList();
    }
    if (value is Map) {
      return {
        for (final entry in value.entries)
          entry.key.toString(): _jsonSafeGeneratedValue(entry.value),
      };
    }
    return value;
  }

  String _normalizeGeneratedKey(String key) {
    return identifierPolicy.columnName(key);
  }
}
