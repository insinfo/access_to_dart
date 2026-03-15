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
      'lib/src/shared/extensions',
      'lib/src/shared/utils',
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

    await File('${backendDir.path}/lib/src/db/database_service.dart')
        .writeAsString(_backendDatabaseService(project));

    await File('${backendDir.path}/lib/src/db/with_database_shelf.dart')
        .writeAsString(_backendWithDbShelf(project));

    await File('${backendDir.path}/lib/src/shared/utils/api_utils.dart')
        .writeAsString(_backendApiUtils(project));

    await File(
            '${backendDir.path}/lib/src/shared/extensions/request_extension.dart')
        .writeAsString(_backendRequestExtension(project));

    // Escreve os módulos para cada tabela
    for (final table in project.tables) {
      final modDir =
          '${backendDir.path}/lib/src/modules/${table.normalizedName}';
      await Directory('$modDir/controllers').create(recursive: true);
      await Directory('$modDir/repositories').create(recursive: true);
      await Directory('$modDir/routes').create(recursive: true);

      await File('$modDir/repositories/${table.normalizedName}_repository.dart')
          .writeAsString(_backendRepository(project, table));

      await File('$modDir/controllers/${table.normalizedName}_controller.dart')
          .writeAsString(_backendController(project, table));

      await File('$modDir/routes/${table.normalizedName}_routes.dart')
          .writeAsString(_backendModuleRoutes(project, table));
    }

    // Arquivos globais dinâmicos (DI e Rotas Principais)
    await File('${backendDir.path}/lib/src/di/dependency_injector.dart')
        .writeAsString(_backendDI(project));

    await File('${backendDir.path}/lib/src/routes/api_routes.dart')
        .writeAsString(_backendApiRoutes(project));
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

  String _backendDatabaseService(AnalysisProject project) => '''
import 'package:eloquent/eloquent.dart';

class DatabaseService {
  late final Manager _manager = Manager()..addConnection(_baseConfig, 'default');

  Map<String, dynamic> get _baseConfig => {
        'driver': 'pgsql',
        'host': 'localhost',
        'port': 5432,
        'database': 'generated_db',
        'username': 'postgres',
        'password': 'password',
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
      Connection? conn;

      try {
        ioc.pushNewScope();
        conn = await dbService.connect();
        ioc.registerSingleton<Connection>(conn);

        final newRequest = request.change(context: {
          ...request.context,
          'db_connection': conn,
        });

        return await innerHandler(newRequest);
      } finally {
        await ioc.popScope();
      }
    };
  };
}
''';

  String _backendApiUtils(AnalysisProject project) => '''
import 'dart:convert';
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
''';

  String _backendRequestExtension(AnalysisProject project) => '''
import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../di/dependency_injector.dart';

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
    final query = db.table('${table.normalizedName}');
    return await query.get();
  }

  Future<Map<String, dynamic>?> findById(int id) async {
    // Assumption: 'id' é a primary key, mude se for diferente no schema
    return await db.table('${table.normalizedName}').where('id', '=', id).first();
  }

  Future<int> insert(${table.className} item) async {
    return await db.table('${table.normalizedName}').insertGetId(item.toMap()) as int;
  }

  Future<void> update(int id, ${table.className} item) async {
    await db.table('${table.normalizedName}').where('id', '=', id).update(item.toMap());
  }

  Future<void> delete(int id) async {
    await db.table('${table.normalizedName}').where('id', '=', id).delete();
  }
}
''';

  String _backendController(AnalysisProject project, AnalysisTable table) => '''
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:${project.dartPackageName}_core/core.dart';

import '../../shared/extensions/request_extension.dart';
import '../../shared/utils/api_utils.dart';
import '../repositories/${table.normalizedName}_repository.dart';

class ${table.className}Controller {

  static Future<Response> list(Request req) async {
    try {
      final repo = req.make<${table.className}Repository>();
      final data = await repo.all();
      return responseJson(data);
    } catch (e, s) {
      print('Erro no list: \$e \$s');
      return responseError(e.toString());
    }
  }

  static Future<Response> show(Request req, String idRaw) async {
    try {
      final id = int.parse(idRaw);
      final repo = req.make<${table.className}Repository>();
      final item = await repo.findById(id);
      if (item == null) return responseError('Not found', statusCode: 404);
      return responseJson(item);
    } catch (e) {
      return responseError(e.toString());
    }
  }

  static Future<Response> create(Request req) async {
    try {
      final body = await req.bodyAsMap();
      final item = ${table.className}.fromMap(body);
      final repo = req.make<${table.className}Repository>();
      final insertedId = await repo.insert(item);
      return responseJson({'id': insertedId});
    } catch (e) {
      return responseError(e.toString());
    }
  }

  static Future<Response> update(Request req, String idRaw) async {
    try {
      final id = int.parse(idRaw);
      final body = await req.bodyAsMap();
      final item = ${table.className}.fromMap(body);
      
      final repo = req.make<${table.className}Repository>();
      await repo.update(id, item);
      
      return responseJson({'success': true});
    } catch (e) {
      return responseError(e.toString());
    }
  }

  static Future<Response> delete(Request req, String idRaw) async {
    try {
      final id = int.parse(idRaw);
      final repo = req.make<${table.className}Repository>();
      await repo.delete(id);
      
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

  app.mount('\$basePath/${table.normalizedName}', group.call);
}
''';

  String _backendDI(AnalysisProject project) {
    final imports = project.tables
        .map((t) =>
            "import '../modules/${t.normalizedName}/repositories/${t.normalizedName}_repository.dart';")
        .join('\n');
    final factories = project.tables
        .map((t) =>
            "  regFactoryIfAbs<${t.className}Repository>(() => ${t.className}Repository(ioc.get<Connection>()));")
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
}
