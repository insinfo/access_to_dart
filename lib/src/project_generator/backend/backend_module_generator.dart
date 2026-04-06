part of '../project_generator.dart';

extension _ProjectGeneratorBackendModule on ProjectGenerator {
  String _backendRepository(AnalysisProject project, AnalysisTable table) =>
    _buildBackendRepositorySource(_buildBackendModuleIr(project, table));

  String _backendService(AnalysisProject project, AnalysisTable table) =>
    _buildBackendServiceSource(_buildBackendModuleIr(project, table));

  String _backendController(AnalysisProject project, AnalysisTable table) =>
    _buildBackendControllerSource(_buildBackendModuleIr(project, table));

  String _backendModuleRoutes(AnalysisProject project, AnalysisTable table) =>
    _buildBackendModuleRoutesSource(_buildBackendModuleIr(project, table));

  String _backendDI(AnalysisProject project) =>
      _buildBackendDependencyInjectorSource(project);

  String _backendGeneratedData(AnalysisProject project) {
    final payload = <String, Object?>{
      for (final table in scaffoldTables(project))
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
    return _buildBackendGeneratedDataSource(json);
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