import 'dart:typed_data';
import '../table_reader.dart';
import 'vba_decompressor.dart';

/// Analisador puro e nativo de projetos VBA e MS-OVBA.
/// Extrai módulos diretamente da tabela MSysAccessStorage.
class VbaProjectReader {
  final TableReader reader;

  VbaProjectReader(this.reader);

  /// Retorna um Map onde a chave é o nome do módulo VBA e o valor é o código-fonte em texto plano.
  Future<Map<String, String>> extractModules() async {
    final modules = <String, String>{};

    // 1. Encontrar o Id da tabela MSysAccessStorage no catálogo
    final catalogRows = await reader.readAllRows(2); // MSysObjects
    int storageId = -1;
    for (final row in catalogRows) {
      if (row['Name'] == 'MSysAccessStorage') {
        storageId = row['Id'] as int;
        break;
      }
    }

    if (storageId == -1) {
      return modules; // Sem VBA ou tabela de storage
    }

    // 2. Extrair as streams do MSysAccessStorage
    final storageRows = await reader.readAllRows(storageId);
    final streams = <String, List<int>>{};
    
    for (final row in storageRows) {
      final name = row['Name']?.toString();
      final lv = row['Lv'];
      if (name != null && lv is List<int> && lv.isNotEmpty) {
        streams[name] = lv;
      }
    }

    // 3. Encontrar e descompactar a stream 'dir'
    final dirCompressed = streams['dir'];
    if (dirCompressed == null || dirCompressed.isEmpty || dirCompressed.first != 0x01) {
      return modules; // Sem 'dir' válido
    }

    final dirPayload = VbaDecompressor.decompress(Uint8List.fromList(dirCompressed));

    // 4. Heurística segura para fazer o parsing do 'dir' e mapear streams para Offsets MS-OVBA
    final moduleOffsets = <String, _ModuleInfo>{};
    _ModuleInfo? currentInfo;

    for (int pos = 0; pos < dirPayload.length - 6; pos++) {
      final id = dirPayload[pos] | (dirPayload[pos + 1] << 8);
      
      if (id == 0x0019 || id == 0x001A || id == 0x0031) {
        final size = dirPayload[pos + 2] |
            (dirPayload[pos + 3] << 8) |
            (dirPayload[pos + 4] << 16) |
            (dirPayload[pos + 5] << 24);

        if (size > 0 && size < 256 && pos + 6 + size <= dirPayload.length) {
          final payload = dirPayload.sublist(pos + 6, pos + 6 + size);

          if (id == 0x0019) { // MODULE MODULENAME
            final modName = String.fromCharCodes(payload);
            currentInfo = _ModuleInfo(modName);
          } else if (id == 0x001A && currentInfo != null) { // MODULE STREAMNAME
            currentInfo.streamName = String.fromCharCodes(payload);
          } else if (id == 0x0031 && currentInfo != null && size == 4) { // MODULE OFFSET
            currentInfo.textOffset = payload[0] |
                (payload[1] << 8) |
                (payload[2] << 16) |
                (payload[3] << 24);
            
            if (currentInfo.streamName != null) {
              moduleOffsets[currentInfo.streamName!] = currentInfo;
            }
            currentInfo = null; // reset para o próximo módulo
          }
        }
      }
    }

    // 5. Extrair código fonte das streams apontadas
    for (final info in moduleOffsets.values) {
      final streamName = info.streamName!;
      final rawStream = streams[streamName];
      
      if (rawStream != null && info.textOffset < rawStream.length) {
        // Encontra onde o source comprimido começa, removendo o PerformanceCache (P-Code)
        final compressedTextParts = rawStream.sublist(info.textOffset);
        
        if (compressedTextParts.isNotEmpty && compressedTextParts.first == 0x01) {
          try {
            final plainTextBytes = VbaDecompressor.decompress(Uint8List.fromList(compressedTextParts));
            var plainText = String.fromCharCodes(plainTextBytes);
            
            // Corrige line endings de \r\n para \n (opcional) e limpa lixo nulo
            plainText = plainText.replaceAll('\r\n', '\n').replaceAll('\x00', '');
            modules[info.moduleName] = plainText;
          } catch (e) {
            // Se falhar a descompressão, skip.
          }
        }
      }
    }

    return modules;
  }
}

class _ModuleInfo {
  final String moduleName;
  String? streamName;
  int textOffset = 0;

  _ModuleInfo(this.moduleName);
}
