String foldToAscii(String input) {
  final buffer = StringBuffer();
  for (final rune in input.runes) {
    buffer.write(_foldRune(rune));
  }
  return buffer.toString();
}

String toSnakeCaseIdentifier(String input) {
  final folded = foldToAscii(input);
  final buffer = StringBuffer();
  var wroteUnderscore = false;
  var previousWasLetterOrDigit = false;
  var previousWasLower = false;

  for (final rune in folded.runes) {
    final char = String.fromCharCode(rune);
    final isLetter = _isAsciiLetter(rune);
    final isDigit = _isAsciiDigit(rune);
    final isUpper = _isAsciiUpper(rune);

    if (!isLetter && !isDigit) {
      if (buffer.isNotEmpty && !wroteUnderscore) {
        buffer.write('_');
        wroteUnderscore = true;
      }
      previousWasLetterOrDigit = false;
      previousWasLower = false;
      continue;
    }

    if (isUpper && previousWasLower && !wroteUnderscore && buffer.isNotEmpty) {
      buffer.write('_');
    }

    if (isDigit &&
        previousWasLetterOrDigit &&
        !wroteUnderscore &&
        buffer.isNotEmpty &&
        previousWasLower) {
      buffer.write('_');
    }

    buffer.write(char.toLowerCase());
    wroteUnderscore = false;
    previousWasLetterOrDigit = true;
    previousWasLower = !isUpper && isLetter;
  }

  return _trimUnderscores(buffer.toString());
}

String toPascalCaseIdentifier(String input) {
  final parts = _identifierParts(input);
  final buffer = StringBuffer();
  for (final part in parts) {
    if (part.isEmpty) continue;
    buffer.write(part[0].toUpperCase());
    if (part.length > 1) {
      buffer.write(part.substring(1));
    }
  }
  return buffer.isEmpty ? 'GeneratedModel' : buffer.toString();
}

String toCamelCaseIdentifier(String input) {
  final pascal = toPascalCaseIdentifier(input);
  if (pascal.isEmpty) return 'generatedValue';
  return '${pascal[0].toLowerCase()}${pascal.substring(1)}';
}

String toKebabCaseIdentifier(String input) {
  return toSnakeCaseIdentifier(input).replaceAll('_', '-');
}

List<String> _identifierParts(String input) {
  final snake = toSnakeCaseIdentifier(input);
  final parts = <String>[];
  for (final part in snake.split('_')) {
    if (part.isEmpty) continue;
    parts.add(part);
  }
  return parts;
}

String _trimUnderscores(String input) {
  var start = 0;
  var end = input.length;
  while (start < end && input.codeUnitAt(start) == 95) {
    start++;
  }
  while (end > start && input.codeUnitAt(end - 1) == 95) {
    end--;
  }
  final trimmed = input.substring(start, end);
  return trimmed.isEmpty ? 'generated_value' : trimmed;
}

bool _isAsciiLetter(int rune) =>
    (rune >= 65 && rune <= 90) || (rune >= 97 && rune <= 122);

bool _isAsciiUpper(int rune) => rune >= 65 && rune <= 90;

bool _isAsciiDigit(int rune) => rune >= 48 && rune <= 57;

String _foldRune(int rune) {
  switch (rune) {
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 224:
    case 225:
    case 226:
    case 227:
    case 228:
    case 229:
      return 'a';
    case 199:
    case 231:
      return 'c';
    case 200:
    case 201:
    case 202:
    case 203:
    case 232:
    case 233:
    case 234:
    case 235:
      return 'e';
    case 204:
    case 205:
    case 206:
    case 207:
    case 236:
    case 237:
    case 238:
    case 239:
      return 'i';
    case 209:
    case 241:
      return 'n';
    case 210:
    case 211:
    case 212:
    case 213:
    case 214:
    case 216:
    case 242:
    case 243:
    case 244:
    case 245:
    case 246:
    case 248:
      return 'o';
    case 217:
    case 218:
    case 219:
    case 220:
    case 249:
    case 250:
    case 251:
    case 252:
      return 'u';
    case 221:
    case 253:
    case 255:
      return 'y';
    default:
      return String.fromCharCode(rune);
  }
}
