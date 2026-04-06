part of '../project_generator.dart';

extension _ProjectGeneratorBackend on ProjectGenerator {
  Future<void> _writeBackend(AnalysisProject project, Directory root) async {
    final backendDir = Directory('${root.path}${Platform.pathSeparator}backend');

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
    await File('${backendDir.path}/lib/src/shared/extensions/request_extension.dart')
        .writeAsString(_backendRequestExtension(project));

        for (final table in scaffoldTables(project)) {
      final modDir = '${backendDir.path}/lib/src/modules/${table.normalizedName}';
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
}