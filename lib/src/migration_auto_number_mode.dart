enum MigrationAutoNumberMode {
  sequence('sequence'),
  plainInt('plain-int'),
  forceSequence('force-sequence');

  final String cliValue;

  const MigrationAutoNumberMode(this.cliValue);

  static MigrationAutoNumberMode parse(String raw) {
    for (final value in MigrationAutoNumberMode.values) {
      if (value.cliValue == raw.trim().toLowerCase()) {
        return value;
      }
    }
    throw FormatException(
      'Invalid auto-number mode "$raw". Use one of: '
      '${MigrationAutoNumberMode.values.map((value) => value.cliValue).join(', ')}.',
    );
  }
}
