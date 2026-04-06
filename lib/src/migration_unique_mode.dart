enum MigrationUniqueMode {
  strict('strict'),
  relaxUnique('relax-unique');

  final String cliValue;

  const MigrationUniqueMode(this.cliValue);

  static MigrationUniqueMode parse(String raw) {
    for (final value in MigrationUniqueMode.values) {
      if (value.cliValue == raw.trim().toLowerCase()) {
        return value;
      }
    }
    throw FormatException(
      'Invalid UNIQUE mode "$raw". Use one of: '
      '${MigrationUniqueMode.values.map((value) => value.cliValue).join(', ')}.',
    );
  }
}