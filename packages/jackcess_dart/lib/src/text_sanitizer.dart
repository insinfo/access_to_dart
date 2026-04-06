String sanitizeDecodedText(String value) {
  final buffer = StringBuffer();
  final units = value.codeUnits;
  for (var index = 0; index < units.length; index++) {
    final unit = units[index];
    if (_isHighSurrogate(unit)) {
      if (index + 1 >= units.length) {
        continue;
      }
      final nextUnit = units[index + 1];
      if (!_isLowSurrogate(nextUnit)) {
        continue;
      }
      final scalar = 0x10000 + ((unit - 0xD800) << 10) + (nextUnit - 0xDC00);
      if (_isDisallowedScalar(scalar)) {
        index++;
        continue;
      }
      buffer.write(String.fromCharCodes(<int>[unit, nextUnit]));
      index++;
      continue;
    }
    if (_isLowSurrogate(unit) || _isDisallowedScalar(unit)) {
      continue;
    }
    buffer.writeCharCode(unit);
  }
  return buffer.toString();
}

String decodeSanitizedUtf16Le(List<int> bytes, int offset, int length) {
  final evenLength = length - (length % 2);
  final units = <int>[];
  for (var index = 0; index < evenLength; index += 2) {
    units.add(bytes[offset + index] | (bytes[offset + index + 1] << 8));
  }
  return sanitizeDecodedText(String.fromCharCodes(units));
}

bool _isHighSurrogate(int value) => value >= 0xD800 && value <= 0xDBFF;

bool _isLowSurrogate(int value) => value >= 0xDC00 && value <= 0xDFFF;

bool _isDisallowedScalar(int value) {
  if (value == 0) {
    return true;
  }
  final isAllowedControl = value == 0x09 || value == 0x0A || value == 0x0D;
  if (value < 0x20 && !isAllowedControl) {
    return true;
  }
  if (value >= 0xFDD0 && value <= 0xFDEF) {
    return true;
  }
  return (value & 0xFFFE) == 0xFFFE;
}