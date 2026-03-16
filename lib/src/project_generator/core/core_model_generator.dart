part of '../project_generator.dart';

extension _ProjectGeneratorCoreModel on ProjectGenerator {
  String _buildModel(AnalysisTable table) =>
      _buildCoreModelSource(_buildCoreModelIr(table));
}