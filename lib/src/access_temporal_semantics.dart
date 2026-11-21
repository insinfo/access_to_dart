import 'analysis_model.dart';
import 'identifier_utils.dart';

enum AccessTemporalSemantic {
  unknown,
  timestamp,
  dateOnly,
  timeOnly,
}

AccessTemporalSemantic? inferExplicitAccessTemporalSemantic(
  AnalysisColumn column,
) {
  final normalizedType = foldToAscii(column.typeName).toLowerCase().trim();
  switch (normalizedType) {
    case 'date':
      return AccessTemporalSemantic.dateOnly;
    case 'time':
      return AccessTemporalSemantic.timeOnly;
    case 'datetime':
      final byFormat = _inferFromFormatString(column.formatString);
      if (byFormat != null) {
        return byFormat;
      }
      final byMask = _inferFromInputMask(column.inputMask);
      if (byMask != null) {
        return byMask;
      }
      final byDefault = _inferFromDefaultValue(column.defaultValue);
      if (byDefault != null) {
        return byDefault;
      }
      return null;
    default:
      return AccessTemporalSemantic.unknown;
  }
}

AccessTemporalSemantic inferAccessTemporalSemantic(AnalysisColumn column) {
  final explicit = inferExplicitAccessTemporalSemantic(column);
  if (explicit != null) {
    return explicit;
  }
  final normalizedType = foldToAscii(column.typeName).toLowerCase().trim();
  if (normalizedType == 'datetime') {
    return AccessTemporalSemantic.timestamp;
  }
  return AccessTemporalSemantic.unknown;
}

AccessTemporalSemantic inferAccessTemporalSemanticWithRows(
  AnalysisColumn column, {
  Iterable<Map<String, dynamic>>? rows,
}) {
  final explicit = inferExplicitAccessTemporalSemantic(column);
  if (explicit != null && explicit != AccessTemporalSemantic.unknown) {
    return explicit;
  }

  final normalizedType = foldToAscii(column.typeName).toLowerCase().trim();
  switch (normalizedType) {
    case 'date':
      return AccessTemporalSemantic.dateOnly;
    case 'time':
      return AccessTemporalSemantic.timeOnly;
    case 'datetime':
      final observed = _inferFromObservedRows(column, rows);
      if (observed != null) {
        return observed;
      }
      return AccessTemporalSemantic.timestamp;
    default:
      return AccessTemporalSemantic.unknown;
  }
}

// Display formats and observed samples never narrow Access DateTime storage.
AccessTemporalSemantic inferAccessTemporalStorageSemantic(AnalysisColumn column) {
  switch (foldToAscii(column.typeName).toLowerCase().trim()) {
    case 'datetime':
      return AccessTemporalSemantic.timestamp;
    case 'date':
      return AccessTemporalSemantic.dateOnly;
    case 'time':
      return AccessTemporalSemantic.timeOnly;
    default:
      return AccessTemporalSemantic.unknown;
  }
}

// Access dates are civil components, without a time zone. Retag those same
// components when a binary driver needs UTC; do not convert the instant.
DateTime accessCivilComponentsAsUtc(DateTime value) => DateTime.utc(
      value.year, value.month, value.day, value.hour, value.minute,
      value.second, value.millisecond, value.microsecond,
    );

String postgresTemporalTypeForColumn(
  AnalysisColumn column, {
  Iterable<Map<String, dynamic>>? rows,
}) {
  return switch (inferAccessTemporalStorageSemantic(column)) {
    AccessTemporalSemantic.dateOnly => 'DATE',
    AccessTemporalSemantic.timeOnly => 'TIME',
    _ => 'TIMESTAMP',
  };
}

String formatTemporalValueForSql(
  DateTime value,
  AnalysisColumn column, {
  Iterable<Map<String, dynamic>>? rows,
}) {
  return switch (inferAccessTemporalStorageSemantic(column)) {
    AccessTemporalSemantic.dateOnly => _formatDatePart(value),
    AccessTemporalSemantic.timeOnly => _formatTimeStoragePart(value),
    _ => accessCivilComponentsAsUtc(value).toIso8601String(),
  };
}

String formatTemporalValueForFrontend(DateTime value, String inputType) {
  return switch (inputType) {
    'date' => _formatDatePart(value),
    'time' => _formatTimePart(value),
    'datetime-local' => _formatDateTimeLocal(value),
    _ => value.toIso8601String(),
  };
}

String _formatDatePart(DateTime value) {
  final year = value.year.toString().padLeft(4, '0');
  final month = value.month.toString().padLeft(2, '0');
  final day = value.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}

String _formatTimePart(DateTime value) {
  final hour = value.hour.toString().padLeft(2, '0');
  final minute = value.minute.toString().padLeft(2, '0');
  final second = value.second.toString().padLeft(2, '0');
  return '$hour:$minute:$second';
}

String _formatTimeStoragePart(DateTime value) {
  final fraction = value.millisecond * 1000 + value.microsecond;
  final suffix = fraction == 0 ? '' : '.${fraction.toString().padLeft(6, '0')}';
  return '${_formatTimePart(value)}$suffix';
}

String _formatDateTimeLocal(DateTime value) {
  final year = value.year.toString().padLeft(4, '0');
  final month = value.month.toString().padLeft(2, '0');
  final day = value.day.toString().padLeft(2, '0');
  final hour = value.hour.toString().padLeft(2, '0');
  final minute = value.minute.toString().padLeft(2, '0');
  final second = value.second.toString().padLeft(2, '0');
  return '$year-$month-$day''T''$hour:$minute:$second';
}

AccessTemporalSemantic? _inferFromFormatString(String? formatString) {
  final normalized = foldToAscii(formatString ?? '').toLowerCase().trim();
  if (normalized.isEmpty) {
    return null;
  }
  if (normalized.contains('general date')) {
    return AccessTemporalSemantic.timestamp;
  }
  if (normalized.contains('short date') ||
      normalized.contains('medium date') ||
      normalized.contains('long date')) {
    return AccessTemporalSemantic.dateOnly;
  }
  if (normalized.contains('short time') ||
      normalized.contains('medium time') ||
      normalized.contains('long time')) {
    return AccessTemporalSemantic.timeOnly;
  }

  final hasDate = normalized.contains('/') ||
      normalized.contains('-') ||
      normalized.contains('yyyy') ||
      normalized.contains('yy') ||
      normalized.contains('dd') ||
      normalized.contains('mmm');
  final hasTime = normalized.contains(':') ||
      normalized.contains('am/pm') ||
      normalized.contains('a/p') ||
      normalized.contains('hh') ||
      normalized.contains('nn') ||
      normalized.contains('ss');
  if (hasDate && !hasTime) {
    return AccessTemporalSemantic.dateOnly;
  }
  if (hasTime && !hasDate) {
    return AccessTemporalSemantic.timeOnly;
  }
  return null;
}

AccessTemporalSemantic? _inferFromInputMask(String? inputMask) {
  final normalized = (inputMask ?? '').trim().toLowerCase();
  if (normalized.isEmpty) {
    return null;
  }
  final pattern = normalized.split(';').first.trim();
  if (pattern.isEmpty) {
    return null;
  }
  final hasDate = pattern.contains('/') || pattern.contains('-');
  final hasTime = pattern.contains(':');
  if (hasDate && !hasTime) {
    return AccessTemporalSemantic.dateOnly;
  }
  if (hasTime && !hasDate) {
    return AccessTemporalSemantic.timeOnly;
  }
  return null;
}

AccessTemporalSemantic? _inferFromDefaultValue(String? defaultValue) {
  final normalized = foldToAscii(defaultValue ?? '').toUpperCase().trim();
  if (normalized.isEmpty) {
    return null;
  }
  if (normalized.startsWith('DATESERIAL(') || normalized == 'DATE()') {
    return AccessTemporalSemantic.dateOnly;
  }
  if (normalized.startsWith('TIMESERIAL(') || normalized == 'TIME()') {
    return AccessTemporalSemantic.timeOnly;
  }
  if (normalized.startsWith('#') && normalized.endsWith('#')) {
    return normalized.contains(':')
        ? AccessTemporalSemantic.timestamp
        : AccessTemporalSemantic.dateOnly;
  }
  return null;
}

AccessTemporalSemantic? _inferFromObservedRows(
  AnalysisColumn column,
  Iterable<Map<String, dynamic>>? rows,
) {
  if (rows == null) {
    return null;
  }

  var sawValue = false;
  var sawDateComponent = false;
  var sawTimeComponent = false;

  for (final row in rows) {
    final rawValue = _findRowValue(row, column.name);
    final value = _coerceTemporalValue(rawValue);
    if (value == null) {
      continue;
    }
    sawValue = true;
    final utc = value.toUtc();
    final hasTime = utc.hour != 0 ||
        utc.minute != 0 ||
        utc.second != 0 ||
        utc.millisecond != 0 ||
        utc.microsecond != 0;
    if (hasTime) {
      sawTimeComponent = true;
    }
    if (utc.year != 1899 || utc.month != 12 || utc.day != 30) {
      sawDateComponent = true;
    }
  }

  if (!sawValue) {
    return null;
  }
  if (sawDateComponent && !sawTimeComponent) {
    return AccessTemporalSemantic.dateOnly;
  }
  if (!sawDateComponent && sawTimeComponent) {
    return AccessTemporalSemantic.timeOnly;
  }
  return null;
}

Object? _findRowValue(Map<String, dynamic> row, String columnName) {
  final target = foldToAscii(columnName).toLowerCase();
  for (final entry in row.entries) {
    if (foldToAscii(entry.key).toLowerCase() == target) {
      return entry.value;
    }
  }
  return null;
}

DateTime? _coerceTemporalValue(Object? value) {
  if (value is DateTime) {
    return value;
  }
  if (value is String) {
    return DateTime.tryParse(value);
  }
  return null;
}