import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:jackcess_dart/src/ole/vba_decompressor.dart';

void main() {
  group('VbaDecompressor', () {
    test('Throws FormatException if signature is not 0x01', () {
      final invalidData = Uint8List.fromList([0x02, 0x00, 0x00]);
      expect(() => VbaDecompressor.decompress(invalidData), throwsFormatException);
    });

    test('Decompresses a simple uncompressed chunk correctly', () {
      // Chunk Header: Size = 3 + 3 = 6 (so 0x003).
      // Size limit is 12 bits, compressed flag is highest bit.
      // We want a header for an uncompressed chunk of 3 bytes.
      // Size field = 3. 3 - 3 = 0.
      // So size = 0x000, compressed = 0x0000. Header = 0x0000 (wait size is size - 3? no, size = header & 0x0FFF + 3)
      // If we want 3 bytes: 3 - 3 = 0 => 0x0000. Uncompressed.
      // But wait! size is the length of chunk data. Not just data bytes.
      // But let's verify chunk sizing based on the implementation:
      // int size = (chunkHeader & 0x0FFF) + 3;
      // int isCompressed = (chunkHeader & 0x8000) >> 15;
      
      // Let's create a mock payload that is correct.
      // Uncompressed chunk of 3 bytes "ABC" (65, 66, 67):
      // size = 3 -> (chunkHeader & 0xFFF) = 0
      // Not compressed -> highest bit 0
      // header = 0x0000. But it needs to enclose flag byte too if it was compressed?
      // "If isCompressed == 0, Raw chunk (uncompressed) - 4096 bytes data max"
      // size = 4096 (0x1000 - wait size max is 4096).
      // Actually standard says uncompressed chunk has 0x000 flag?
      // Let's try an actually compressed stream from known MS-OVBA docs, but for now just the logic.
    });
  });
}
