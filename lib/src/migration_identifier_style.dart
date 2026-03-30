import 'identifier_utils.dart';

enum MigrationIdentifierStyle {
  snakeAscii,
  original;

  static MigrationIdentifierStyle parse(String value) {
    switch (value.trim().toLowerCase()) {
      case 'snake_ascii':
      case 'snake-ascii':
      case 'snake':
      case 'normalized':
        return MigrationIdentifierStyle.snakeAscii;
      case 'original':
      case 'preserve':
      case 'preserved':
        return MigrationIdentifierStyle.original;
    }
    throw FormatException(
      'Invalid identifier style "$value". Use snake_ascii or original.',
    );
  }

  String get cliValue {
    switch (this) {
      case MigrationIdentifierStyle.snakeAscii:
        return 'snake_ascii';
      case MigrationIdentifierStyle.original:
        return 'original';
    }
  }
}

class MigrationIdentifierPolicy {
  final MigrationIdentifierStyle style;

  const MigrationIdentifierPolicy({required this.style});

  String tableName(String rawName) => _normalize(rawName);

  String columnName(String rawName) => _normalize(rawName);

  String objectName(String rawName) => _normalize(rawName);

  String quotedTableName(String rawName) => quoteIdentifier(tableName(rawName));

  String quotedColumnName(String rawName) =>
      quoteIdentifier(columnName(rawName));

  String quotedObjectName(String rawName) =>
      quoteIdentifier(objectName(rawName));

  String quoteIdentifier(String value) {
    return '"${value.replaceAll('"', '""')}"';
  }

  String _normalize(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return 'generated_value';
    }
    switch (style) {
      case MigrationIdentifierStyle.snakeAscii:
        return toSnakeCaseIdentifier(trimmed);
      case MigrationIdentifierStyle.original:
        return trimmed;
    }
  }
}
