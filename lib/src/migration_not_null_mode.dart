enum MigrationNotNullMode {
  strict('strict'),
  skipRow('skip-row'),
  relaxNotNull('relax-not-null'),
  fix('fix');

  final String cliValue;

  const MigrationNotNullMode(this.cliValue);

  static MigrationNotNullMode parse(String raw) {
    for (final value in MigrationNotNullMode.values) {
      if (value.cliValue == raw.trim().toLowerCase()) {
        return value;
      }
    }
    throw FormatException(
      'Invalid NOT NULL mode "$raw". Use one of: '
      '${MigrationNotNullMode.values.map((value) => value.cliValue).join(', ')}.',
    );
  }
}
