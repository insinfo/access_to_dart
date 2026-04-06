enum MigrationSeedFormat {
  insert('insert'),
  copy('copy');

  final String cliValue;

  const MigrationSeedFormat(this.cliValue);

  static MigrationSeedFormat parse(String raw) {
    for (final value in MigrationSeedFormat.values) {
      if (value.cliValue == raw.trim().toLowerCase()) {
        return value;
      }
    }
    throw FormatException(
      'Invalid seed format "$raw". Use one of: '
      '${MigrationSeedFormat.values.map((value) => value.cliValue).join(', ')}.',
    );
  }
}
