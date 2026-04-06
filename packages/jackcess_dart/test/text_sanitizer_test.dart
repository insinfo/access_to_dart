import 'dart:typed_data';

import 'package:jackcess_dart/src/text_sanitizer.dart';
import 'package:test/test.dart';

void main() {
  test('remove nulos controles invalidos e surrogate quebrado ao sanitizar texto', () {
    final text = String.fromCharCodes(<int>[
      0x0041,
      0x0000,
      0x0001,
      0x0009,
      0x000A,
      0xD800,
      0x0042,
    ]);

    expect(sanitizeDecodedText(text), 'A\t\nB');
  });

  test('decodifica UTF-16 LE descartando code units invalidos', () {
    final bytes = Uint8List.fromList(<int>[
      0x41, 0x00,
      0x00, 0x00,
      0x01, 0x00,
      0x3D, 0xD8,
      0x42, 0x00,
    ]);

    expect(decodeSanitizedUtf16Le(bytes, 0, bytes.length), 'AB');
  });
}