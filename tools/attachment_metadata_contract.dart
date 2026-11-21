import 'dart:convert';
import 'package:crypto/crypto.dart';

String digest(String text) => sha256.convert(utf8.encode(text)).toString();
String encoded(String text) => base64Encode(utf8.encode(text));
String canonical(Object? value, int type) {
  if (value == null) return 'N';
  switch (type) {
    case 4:
      if (value is! int) throw StateError('Expected physical Long');
      return 'I$value';
    case 8:
      if (value is! DateTime) throw StateError('Expected physical DateTime');
      String pad(int n, int width) => n.toString().padLeft(width, '0');
      return 'T${pad(value.year, 4)}-${pad(value.month, 2)}-${pad(value.day, 2)}T${pad(value.hour, 2)}:${pad(value.minute, 2)}:${pad(value.second, 2)}.${pad(value.millisecond * 1000 + value.microsecond, 6)}';
    case 10:
    case 12:
      if (value is! String) throw StateError('Expected physical text/memo');
      return 'S$value';
    default:
      throw StateError('Unsupported metadata type');
  }
}

String multiset(Iterable<String> records) {
  final sorted = records.toList()..sort();
  return digest(
      sorted.map((record) => '${utf8.encode(record).length}:$record').join());
}
