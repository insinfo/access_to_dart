part of '../project_generator.dart';

extension _ProjectGeneratorBackendBase on ProjectGenerator {
  String _backendPubspec(AnalysisProject project) =>
      _buildBackendPubspecSource(project);

  String _backendServerBin(AnalysisProject project) =>
      _buildBackendServerBinSource();

  String _backendPublicServerBin(AnalysisProject project) =>
      _buildBackendPublicServerBinSource();

  String _backendDatabaseService(AnalysisProject project) =>
      _buildBackendDatabaseServiceSource();

  String _backendWithDbShelf(AnalysisProject project) =>
      _buildBackendWithDbShelfSource();

  String _backendAppConfig(AnalysisProject project) =>
      _buildBackendAppConfigSource();

  String _backendApiUtils(AnalysisProject project) =>
      _buildBackendApiUtilsSource(project);

  String _backendRequestExtension(AnalysisProject project) =>
      _buildBackendRequestExtensionSource();

  String _backendModuleApiDI(AnalysisProject project) =>
      _buildBackendModuleApiDiSource();

  String _backendApiRoutes(AnalysisProject project) =>
      _buildBackendApiRoutesSource(project);

  String _backendPublicApiRoutes(AnalysisProject project) =>
      _buildBackendPublicApiRoutesSource(project);

  String _backendPublicApiController(AnalysisProject project) =>
      _buildBackendPublicApiControllerSource(project);
}