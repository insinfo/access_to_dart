part of 'project_generator.dart';

class GeneratedFieldDescriptor {
  final String runtimeName;
  final String columnConstantName;
  final String fieldName;
  final String dartType;
  final String label;
  final bool isAutoNumber;
  final String? fromMapExpression;

  const GeneratedFieldDescriptor({
    required this.runtimeName,
    required this.columnConstantName,
    required this.fieldName,
    required this.dartType,
    required this.label,
    required this.isAutoNumber,
    this.fromMapExpression,
  });

  String get inputType => dartType == 'DateTime?' ? 'date' : 'text';
}

class GeneratedBackendModule {
  final String packageName;
  final String className;
  final String normalizedName;
  final String routeName;
  final String tableRuntimeName;
  final String primaryKeyRuntimeName;

  const GeneratedBackendModule({
    required this.packageName,
    required this.className,
    required this.normalizedName,
    required this.routeName,
    required this.tableRuntimeName,
    required this.primaryKeyRuntimeName,
  });
}

class GeneratedFrontendModule {
  final String packageName;
  final String className;
  final String nameSnake;
  final String moduleNameKebab;
  final String formLogicClassName;
  final String primaryKeyField;
  final List<GeneratedFieldDescriptor> fields;

  const GeneratedFrontendModule({
    required this.packageName,
    required this.className,
    required this.nameSnake,
    required this.moduleNameKebab,
    required this.formLogicClassName,
    required this.primaryKeyField,
    required this.fields,
  });
}

class GeneratedCoreModelDescriptor {
  final String className;
  final String fileName;
  final String idWriteBackBlock;
  final List<GeneratedFieldDescriptor> fields;

  const GeneratedCoreModelDescriptor({
    required this.className,
    required this.fileName,
    required this.idWriteBackBlock,
    required this.fields,
  });
}

class GeneratedCoreValidationDescriptor {
  final String className;
  final String fileName;
  final String hintsSource;
  final List<String> validatorInvocations;
  final List<String> validatorMethods;
  final List<String> helperMethods;

  const GeneratedCoreValidationDescriptor({
    required this.className,
    required this.fileName,
    required this.hintsSource,
    required this.validatorInvocations,
    required this.validatorMethods,
    required this.helperMethods,
  });
}

extension _ProjectGeneratorIrBuilder on ProjectGenerator {
  GeneratedBackendModule _buildBackendModuleIr(
    AnalysisProject project,
    AnalysisTable table,
  ) {
    return GeneratedBackendModule(
      packageName: project.dartPackageName,
      className: table.className,
      normalizedName: table.normalizedName,
      routeName: tableRouteName(table),
      tableRuntimeName: tableRuntimeName(table),
      primaryKeyRuntimeName: primaryKeyRuntimeName(table),
    );
  }

  GeneratedFrontendModule _buildFrontendModuleIr(
    AnalysisProject project,
    AnalysisTable table,
  ) {
    return GeneratedFrontendModule(
      packageName: project.dartPackageName,
      className: table.className,
      nameSnake: table.normalizedName,
      moduleNameKebab: tableRouteSegment(table),
      formLogicClassName: '${table.className}FormLogic',
      primaryKeyField: _getPrimaryKey(table).fieldName,
      fields: table.columns
          .map(
            (column) => GeneratedFieldDescriptor(
              runtimeName: columnRuntimeName(column),
              columnConstantName: column.columnConstantName,
              fieldName: column.fieldName,
              dartType: column.dartType,
              label: column.name,
              isAutoNumber: column.isAutoNumber,
              fromMapExpression: _fromMapValue(column),
            ),
          )
          .toList(growable: false),
    );
  }

  GeneratedCoreModelDescriptor _buildCoreModelIr(AnalysisTable table) {
    return GeneratedCoreModelDescriptor(
      className: table.className,
      fileName: table.fileName,
      idWriteBackBlock: _idWriteBackBlock(table),
      fields: table.columns
          .map(
            (column) => GeneratedFieldDescriptor(
              runtimeName: columnRuntimeName(column),
              columnConstantName: column.columnConstantName,
              fieldName: column.fieldName,
              dartType: column.dartType,
              label: column.name,
              isAutoNumber: column.isAutoNumber,
              fromMapExpression: _fromMapValue(column),
            ),
          )
          .toList(growable: false),
    );
  }
}