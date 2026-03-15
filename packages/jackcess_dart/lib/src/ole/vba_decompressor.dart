import 'dart:typed_data';

/// Descompressor nativo e direto para o formato de compressão MS-OVBA.
/// Não utiliza bibliotecas C externas ou regex, operando puramente em nível de bit/byte.
class VbaDecompressor {
  /// Descomprime o payload binário VBA extraído do OLE Stream.
  static List<int> decompress(Uint8List compressedData) {
    if (compressedData.isEmpty) return [];

    // Signature byte (0x01)
    int signature = compressedData[0];
    if (signature != 0x01) {
      throw FormatException('A assinatura do MS-OVBA deve ser 0x01. Encontrado: $signature');
    }

    List<int> decompressed = [];
    int offset = 1;

    while (offset < compressedData.length) {
      // Chunk Header
      if (offset + 2 > compressedData.length) break;
      int chunkHeader = compressedData[offset] | (compressedData[offset + 1] << 8);
      offset += 2;

      // Extrai flags do Chunk Header
      int size = (chunkHeader & 0x0FFF) + 3;
      int isCompressed = (chunkHeader & 0x8000) >> 15;
      
      int chunkEnd = offset + size;
      int chunkDecompressedStart = decompressed.length;

      if (isCompressed == 0) {
        // Raw chunk (uncompressed) - 4096 bytes data max
        while (offset < chunkEnd && offset < compressedData.length) {
          decompressed.add(compressedData[offset]);
          offset++;
        }
      } else {
        // Compressed chunk
        while (offset < chunkEnd && offset < compressedData.length) {
          int flagByte = compressedData[offset];
          offset++;

          for (int bitIndex = 0; bitIndex < 8; bitIndex++) {
            if (offset >= chunkEnd || offset >= compressedData.length) break;   

            int bit = (flagByte >> bitIndex) & 1;

            if (bit == 0) {
              // Raw token
              decompressed.add(compressedData[offset]);
              offset++;
            } else {
              // CopyToken (2 bytes)
              if (offset + 1 >= compressedData.length) {
                  offset += 2;
                  break;
              }
              int copyToken = compressedData[offset] | (compressedData[offset + 1] << 8);
              offset += 2;

              int decompressedChunkSize = decompressed.length - chunkDecompressedStart;
              
              int offsetBits = 4;
              while ((1 << offsetBits) < decompressedChunkSize) {
                  offsetBits++;
              }
              int lengthBits = 16 - offsetBits;
              int lengthMask = (1 << lengthBits) - 1; // Equivalente a 0xFFFF >> offsetBits se usado como bits limpos
              int offsetMask = (~lengthMask) & 0xFFFF;

              int copyLength = (copyToken & lengthMask) + 3;
              int copyOffset = ((copyToken & offsetMask) >> lengthBits) + 1;

              int copySource = decompressed.length - copyOffset;
              for (int i = 0; i < copyLength; i++) {
                if (copySource + i >= 0 && copySource + i < decompressed.length) {
                  decompressed.add(decompressed[copySource + i]);
                } else {
                  // Fallback se overflow
                  decompressed.add(0);
                }
              }
            }
          }
        }
      }
    }

    return decompressed;
  }
}
