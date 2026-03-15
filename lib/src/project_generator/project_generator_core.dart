part of 'project_generator.dart';

extension _ProjectGeneratorCore on ProjectGenerator {
  Future<void> _writeCore(AnalysisProject project, Directory root) async {
    final coreDir = Directory('${root.path}${Platform.pathSeparator}core');
    final modelsDir = Directory(
      '${coreDir.path}${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}models',
    );
    await modelsDir.create(recursive: true);

    await File('${coreDir.path}${Platform.pathSeparator}pubspec.yaml')
        .writeAsString(_corePubspec(project));
    await File(
      '${coreDir.path}${Platform.pathSeparator}lib${Platform.pathSeparator}core.dart',
    ).writeAsString(_coreLibrary(project));
    await File(
      '${coreDir.path}${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}schema.dart',
    ).writeAsString(_coreSchema(project));

    for (final table in project.tables) {
      await File('${modelsDir.path}${Platform.pathSeparator}${table.fileName}')
          .writeAsString(_buildModel(table));
    }
  }

  String _corePubspec(AnalysisProject project) =>
      '''name: ${project.dartPackageName}_core
description: Generated core models for ${project.source}
publish_to: none

environment:
  sdk: ^3.6.2
''';

  String _coreLibrary(AnalysisProject project) {
    final exports = <String>[
      "export 'src/schema.dart';",
      for (final table in project.tables)
        "export 'src/models/${table.fileName}';",
    ];
    return '${exports.join('\n')}\n';
  }

  String _coreSchema(AnalysisProject project) {
    final tableEntries = project.tables
        .map(
          (table) =>
              "  '${table.normalizedName}': {'rows': ${table.rowCount}, 'columns': ${table.columns.length}},",
        )
        .join('\n');
    return 'const generatedSchema = <String, Map<String, Object>>{\n$tableEntries\n};\n';
  }

  String _buildModel(AnalysisTable table) {
    final constants = table.columns
        .map(
          (column) =>
              "  static const ${column.columnConstantName} = '${column.normalizedName}';",
        )
        .join('\n');
    final fields = table.columns
        .map((column) => '  final ${column.dartType} ${column.fieldName};')
        .join('\n');
    final constructorArgs = table.columns
        .map((column) => '    this.${column.fieldName},')
        .join('\n');
    final fromMapAssignments = table.columns
        .map((column) => '      ${column.fieldName}: ${_fromMapValue(column)},')
        .join('\n');
    final toMapEntries = table.columns
        .where((column) => !column.isAutoNumber)
        .map(
          (column) =>
              '      ${column.columnConstantName}: ${column.fieldName},',
        )
        .join('\n');
    return '''class ${table.className} {
$constants

$fields

  const ${table.className}({
$constructorArgs
  });

  factory ${table.className}.fromMap(Map<String, dynamic> map) {
    return ${table.className}(
$fromMapAssignments
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
$toMapEntries
    };
${_idWriteBackBlock(table)}
    return map;
  }
}
''';
  }
}
