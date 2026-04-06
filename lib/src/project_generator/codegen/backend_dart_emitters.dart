part of '../project_generator.dart';

String _buildBackendRepositorySource(GeneratedBackendModule module) {
  final temporalNormalizerEntries = module.fields
      .where((field) => field.isTemporalField)
      .map((field) => "      ${field.columnConstantName}: ${field.fieldName},")
      .join('\n');
  final attachmentBinaryColumns = module.attachments
      .map(
        (attachment) =>
            "    '${attachment.fieldRuntimeName}': <String>{${attachment.columns.where((column) => column.isBinary).map((column) => "'${column.runtimeName}'").join(', ')}},",
      )
      .join('\n');
  return _renderTemplateAsset(
    'backend/repository.dart.mustache',
    <String, Object?>{
      'corePackageName': module.packageName,
      'className': module.className,
      'tableRuntimeName': module.tableRuntimeName,
      'primaryKeyRuntimeName': module.primaryKeyRuntimeName,
      'primaryKeyFieldName': module.primaryKeyFieldName,
      'primaryKeyParamType': module.primaryKeyParamType,
      'primaryKeyRouteParseExpression': module.primaryKeyRouteParseExpression,
      'primaryKeyIsAutoNumber': module.primaryKeyIsAutoNumber,
      'hasTemporalFields': module.fields.any((field) => field.isTemporalField),
      'temporalNormalizerEntries': temporalNormalizerEntries,
      'attachmentBinaryColumns': attachmentBinaryColumns,
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
  final attachmentCases = module.attachments
      .map(
        (attachment) => '''
      case '${attachment.fieldRuntimeName}':
        return repository.attachmentRows(
          id,
          parentAttachmentField: '${attachment.fieldRuntimeName}',
          attachmentTable: '${attachment.attachmentTableRuntimeName}',
          attachmentLinkColumn: '${attachment.attachmentLinkColumnRuntimeName}',
          binaryColumns: _attachmentBinaryColumns['${attachment.fieldRuntimeName}'] ?? const <String>{},
        );''',
      )
      .join('\n');
  final attachmentCreateCases = module.attachments
      .map(
        (attachment) => '''
      case '${attachment.fieldRuntimeName}':
        return repository.insertAttachmentRow(
          id,
          parentAttachmentField: '${attachment.fieldRuntimeName}',
          attachmentTable: '${attachment.attachmentTableRuntimeName}',
          attachmentLinkColumn: '${attachment.attachmentLinkColumnRuntimeName}',
          payload: payload,
          binaryColumns: _attachmentBinaryColumns['${attachment.fieldRuntimeName}'] ?? const <String>{},
        );''',
      )
      .join('\n');
  final attachmentDeleteCases = module.attachments
      .map(
        (attachment) => '''
      case '${attachment.fieldRuntimeName}':
        return repository.deleteAttachmentRow(
          id,
          parentAttachmentField: '${attachment.fieldRuntimeName}',
          attachmentTable: '${attachment.attachmentTableRuntimeName}',
          attachmentLinkColumn: '${attachment.attachmentLinkColumnRuntimeName}',
          ordinal: ordinal,
        );''',
      )
      .join('\n');
  final attachmentBinaryColumns = module.attachments
      .map(
        (attachment) =>
            "    '${attachment.fieldRuntimeName}': <String>{${attachment.columns.where((column) => column.isBinary).map((column) => "'${column.runtimeName}'").join(', ')}},",
      )
      .join('\n');

  return _renderTemplateAsset(
    'backend/service.dart.mustache',
    <String, Object?>{
      'corePackageName': module.packageName,
      'className': module.className,
      'normalizedName': module.normalizedName,
      'routeName': module.routeName,
      'primaryKeyParamType': module.primaryKeyParamType,
      'lookupCases': lookupCases,
      'attachmentCases': attachmentCases,
      'attachmentCreateCases': attachmentCreateCases,
      'attachmentDeleteCases': attachmentDeleteCases,
      'attachmentBinaryColumns': attachmentBinaryColumns,
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
      'primaryKeyParamType': module.primaryKeyParamType,
      'primaryKeyRouteParseExpression': module.primaryKeyRouteParseExpression,
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
  final tables = _scaffoldTables(project);
  final imports = tables
      .expand((t) => <String>[
            "import '../modules/${t.normalizedName}/repositories/${t.normalizedName}_repository.dart';",
            "import '../modules/${t.normalizedName}/services/${t.normalizedName}_service.dart';",
          ])
      .join('\n');
  final factories = tables
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