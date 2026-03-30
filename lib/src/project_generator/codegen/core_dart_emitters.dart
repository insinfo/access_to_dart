part of '../project_generator.dart';

String _buildCoreModelSource(GeneratedCoreModelDescriptor model) {
  return _renderTemplateAsset(
    'core/model.dart.mustache',
    <String, Object?>{
      'className': model.className,
      'constants': model.fields
          .map(
            (field) => <String, Object?>{
              'constantName': field.columnConstantName,
              'runtimeName': field.runtimeName,
            },
          )
          .toList(growable: false),
      'fields': model.fields
          .map(
            (field) => <String, Object?>{
              'dartType': field.dartType,
              'fieldName': field.fieldName,
            },
          )
          .toList(growable: false),
      'constructorArgs': model.fields
          .map((field) => <String, Object?>{'fieldName': field.fieldName})
          .toList(growable: false),
      'defaultEntries': model.fields
          .where((field) => field.hasSemanticDefault)
          .map(
            (field) => <String, Object?>{
              'constantName': field.columnConstantName,
              'expression': field.semanticDefaultExpression,
            },
          )
          .toList(growable: false),
      'hasDefaults': model.fields.any((field) => field.hasSemanticDefault),
      'defaultHelperMethods': model.defaultHelperMethods,
      'fromMapAssignments': model.fields
          .map(
            (field) => <String, Object?>{
              'fieldName': field.fieldName,
              'expression': field.fromMapExpression ?? 'null',
            },
          )
          .toList(growable: false),
      'toMapEntries': model.fields
          .where((field) => !field.isAutoNumber)
          .map(
            (field) => <String, Object?>{
              'constantName': field.columnConstantName,
              'fieldName': field.fieldName,
            },
          )
          .toList(growable: false),
      'idWriteBackBlock': model.idWriteBackBlock,
    },
  );
}

String _buildCoreValidationModelSource({
  required GeneratedCoreValidationDescriptor descriptor,
}) {
  return _renderTemplateAsset(
    'core/validation_model.dart.mustache',
    <String, Object?>{
      'fileName': descriptor.fileName,
      'className': descriptor.className,
      'hintsSource': descriptor.hintsSource,
      'validatorInvocations': descriptor.validatorInvocations,
      'validatorMethods': descriptor.validatorMethods,
      'helperMethods': descriptor.helperMethods,
    },
  );
}