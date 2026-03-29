part of '../project_generator.dart';

String _buildBackendRepositorySource(GeneratedBackendModule module) {
  return _renderTemplateAsset(
    'backend/repository.dart.mustache',
    <String, Object?>{
      'corePackageName': module.packageName,
      'className': module.className,
      'tableRuntimeName': module.tableRuntimeName,
      'primaryKeyRuntimeName': module.primaryKeyRuntimeName,
    },
  );
}

String _buildBackendServiceSource(GeneratedBackendModule module) {
  final lookupCases = module.lookups
      .map(
        (lookup) => '''
      case '${lookup.fieldRuntimeName}':
        return repository.lookupOptions(
          valueColumn: '${lookup.valueColumnRuntimeName}',
          labelColumn: '${lookup.labelColumnRuntimeName}',
          orderByColumn: ${lookup.orderByColumnRuntimeName == null ? 'null' : "'${lookup.orderByColumnRuntimeName}'"},
          limit: limit,
        );''',
      )
      .join('\n');

  return _renderTemplateAsset(
    'backend/service.dart.mustache',
    <String, Object?>{
      'corePackageName': module.packageName,
      'className': module.className,
      'normalizedName': module.normalizedName,
      'routeName': module.routeName,
      'lookupCases': lookupCases,
    },
  );
}

String _buildBackendControllerSource(GeneratedBackendModule module) {
  return _renderTemplateAsset(
    'backend/controller.dart.mustache',
    <String, Object?>{
      'corePackageName': module.packageName,
      'className': module.className,
      'normalizedName': module.normalizedName,
    },
  );
}

String _buildBackendModuleRoutesSource(GeneratedBackendModule module) {
  return _renderTemplateAsset(
    'backend/module_routes.dart.mustache',
    <String, Object?>{
      'className': module.className,
      'normalizedName': module.normalizedName,
      'routeName': module.routeName,
    },
  );
}

String _buildBackendDependencyInjectorSource(AnalysisProject project) {
  final imports = project.tables
      .expand((t) => <String>[
            "import '../modules/${t.normalizedName}/repositories/${t.normalizedName}_repository.dart';",
            "import '../modules/${t.normalizedName}/services/${t.normalizedName}_service.dart';",
          ])
      .join('\n');
  final factories = project.tables
      .expand((t) => <String>[
            "  regFactoryIfAbs<${t.className}Repository>(() => ${t.className}Repository(ioc.get<Connection>()));",
            "  regFactoryIfAbs<${t.className}Service>(() => ${t.className}Service(ioc.get<${t.className}Repository>()));",
          ])
      .join('\n');

  return _renderTemplateAsset(
    'backend/dependency_injector.dart.mustache',
    <String, Object?>{
      'imports': imports,
      'factories': factories,
    },
  );
}