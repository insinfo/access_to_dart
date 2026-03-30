enum MigrationExportMode {
  schemaOnly,
  schemaAndData;

  static MigrationExportMode parse(String value) {
    switch (value.trim().toLowerCase()) {
      case 'schema':
      case 'schema-only':
      case 'ddl':
        return MigrationExportMode.schemaOnly;
      case 'full':
      case 'schema-and-data':
      case 'data':
        return MigrationExportMode.schemaAndData;
    }
    throw FormatException(
      'Invalid migration mode "$value". Use schema-only or schema-and-data.',
    );
  }

  String get cliValue {
    switch (this) {
      case MigrationExportMode.schemaOnly:
        return 'schema-only';
      case MigrationExportMode.schemaAndData:
        return 'schema-and-data';
    }
  }

  bool get includesData => this == MigrationExportMode.schemaAndData;
}