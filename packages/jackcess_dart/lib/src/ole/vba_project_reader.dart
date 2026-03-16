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
    final moduleOffsets = _parseModuleOffsets(streams['dir']);

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

    if (modules.isEmpty) {
      modules.addAll(_recoverModulesWithoutDir(streams));
    }

    return modules;
  }

  Map<String, _ModuleInfo> _parseModuleOffsets(List<int>? dirCompressed) {
    final moduleOffsets = <String, _ModuleInfo>{};
    if (dirCompressed == null || dirCompressed.isEmpty || dirCompressed.first != 0x01) {
      return moduleOffsets;
    }

    final dirPayload = VbaDecompressor.decompress(Uint8List.fromList(dirCompressed));
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

          if (id == 0x0019) {
            currentInfo = _ModuleInfo(String.fromCharCodes(payload));
          } else if (id == 0x001A && currentInfo != null) {
            currentInfo.streamName = String.fromCharCodes(payload);
          } else if (id == 0x0031 && currentInfo != null && size == 4) {
            currentInfo.textOffset = payload[0] |
                (payload[1] << 8) |
                (payload[2] << 16) |
                (payload[3] << 24);

            if (currentInfo.streamName != null) {
              moduleOffsets[currentInfo.streamName!] = currentInfo;
            }
            currentInfo = null;
          }
        }
      }
    }
    return moduleOffsets;
  }

  Map<String, String> _recoverModulesWithoutDir(Map<String, List<int>> streams) {
    final projectStream = streams['PROJECT'];
    if (projectStream == null || projectStream.isEmpty) {
      return const <String, String>{};
    }

    final docClasses = _parseProjectDocClasses(projectStream);
    if (docClasses.isEmpty) {
      return const <String, String>{};
    }

    final explicitBindings = _parseVbaProjectBindings(
      streams['_VBA_PROJECT'],
      docClasses,
    );
    if (explicitBindings.isNotEmpty) {
      final recovered = <String, String>{};
      for (final binding in explicitBindings) {
        final rawStream = streams[binding.streamName];
        if (rawStream == null || rawStream.isEmpty) {
          continue;
        }
        final plainText = _tryRecoverCompressedSource(rawStream);
        if (plainText == null) {
          continue;
        }
        recovered[binding.moduleName] = plainText;
      }
      if (recovered.isNotEmpty) {
        return recovered;
      }
    }

    final recovered = <String, String>{};
    final candidateNames = streams.keys.where(
      (name) => _isPotentialModuleStream(name, streams[name]),
    );

    final availableDocClasses = List<String>.from(docClasses);
    for (final streamName in candidateNames) {
      final rawStream = streams[streamName];
      if (rawStream == null || rawStream.isEmpty) {
        continue;
      }
      final plainText = _tryRecoverCompressedSource(rawStream);
      if (plainText == null) {
        continue;
      }

      final moduleName = _extractModuleNameFromSource(plainText) ??
          (availableDocClasses.isNotEmpty
              ? availableDocClasses.removeAt(0)
              : streamName);
      recovered[moduleName] = plainText;
    }

    return recovered;
  }

  List<_ProjectModuleBinding> _parseVbaProjectBindings(
    List<int>? vbaProjectStream,
    List<String> docClasses,
  ) {
    if (vbaProjectStream == null || vbaProjectStream.isEmpty) {
      return const <_ProjectModuleBinding>[];
    }

    final tokens = _extractPrintableTokens(vbaProjectStream);
    if (tokens.isEmpty) {
      return const <_ProjectModuleBinding>[];
    }

    final expectedModules = <String>{...docClasses};
    final bindings = <_ProjectModuleBinding>[];
    final seenStreams = <String>{};

    for (var index = 0; index < tokens.length; index++) {
      final token = tokens[index];
      final moduleName = expectedModules.contains(token)
          ? token
          : (token.startsWith('Form_') ? token : null);
      if (moduleName == null) {
        continue;
      }

      final streamName = _findBindingStreamName(tokens, index);
      if (streamName == null || !seenStreams.add(streamName)) {
        continue;
      }
      bindings.add(
        _ProjectModuleBinding(streamName: streamName, moduleName: moduleName),
      );
    }

    return bindings;
  }

  List<String> _extractPrintableTokens(List<int> bytes) {
    final tokens = <String>[];
    final buffer = StringBuffer();

    void flush() {
      if (buffer.length >= 3) {
        tokens.add(buffer.toString());
      }
      buffer.clear();
    }

    for (final byte in bytes) {
      final isAlphaNumeric =
          (byte >= 48 && byte <= 57) ||
          (byte >= 65 && byte <= 90) ||
          (byte >= 97 && byte <= 122);
      final isAllowedPunctuation = byte == 95 || byte == 46 || byte == 45;
      if (isAlphaNumeric || isAllowedPunctuation) {
        buffer.writeCharCode(byte);
      } else {
        flush();
      }
    }
    flush();
    return tokens;
  }

  String? _findBindingStreamName(List<String> tokens, int moduleIndex) {
    final start = moduleIndex - 1;
    final end = moduleIndex - 12;
    for (var index = start; index >= 0 && index >= end; index--) {
      final candidate = tokens[index];
      if (_looksLikeExplicitStreamName(candidate)) {
        return candidate;
      }
    }
    return null;
  }

  bool _looksLikeExplicitStreamName(String value) {
    if (value.length < 12) {
      return false;
    }
    var uppercaseOrUnderscore = 0;
    for (final codeUnit in value.codeUnits) {
      final isUpper = codeUnit >= 65 && codeUnit <= 90;
      final isDigit = codeUnit >= 48 && codeUnit <= 57;
      final isUnderscore = codeUnit == 95;
      if (isUpper || isDigit || isUnderscore) {
        uppercaseOrUnderscore++;
      }
    }
    return uppercaseOrUnderscore == value.length;
  }

  List<String> _parseProjectDocClasses(List<int> projectStream) {
    final text = String.fromCharCodes(projectStream);
    final docClasses = <String>[];
    for (final line in text.split('\n')) {
      final trimmed = line.trim();
      if (!trimmed.startsWith('DocClass=')) {
        continue;
      }
      final rawValue = trimmed.substring('DocClass='.length);
      final slashIndex = rawValue.indexOf('/');
      docClasses.add(
        slashIndex == -1 ? rawValue : rawValue.substring(0, slashIndex),
      );
    }
    return docClasses;
  }

  bool _isPotentialModuleStream(String name, List<int>? stream) {
    if (stream == null || stream.isEmpty) {
      return false;
    }
    const knownNames = <String>{
      'PROJECT',
      'PROJECTwm',
      'dir',
      '_VBA_PROJECT',
      'AcessVBAData',
      'PropData',
      'DirData',
      'TypeInfo',
      'Blob',
      'BlobDelta',
      'Forms',
      'Reports',
      'Modules',
      'Scripts',
      'VBA',
      'Cmdbars',
      'DataAccessPages',
      'Databases',
      'CustomGroups',
      'ImExSpecs',
      'MSysAccessStorage_ROOT',
      'MSysAccessStorage_SCRATCH',
      '0',
      '1',
      '2',
    };
    return !knownNames.contains(name);
  }

  String? _tryRecoverCompressedSource(List<int> rawStream) {
    String? bestCandidate;
    var bestScore = -1;
    for (var offset = 0; offset < rawStream.length; offset++) {
      if (rawStream[offset] != 0x01) {
        continue;
      }
      try {
        final plainTextBytes = VbaDecompressor.decompress(
          Uint8List.fromList(rawStream.sublist(offset)),
        );
        final plainText = String.fromCharCodes(plainTextBytes)
            .replaceAll('\r\n', '\n')
            .replaceAll('\x00', '');
        final score = _vbaSourceScore(plainText);
        if (score > bestScore) {
          bestScore = score;
          bestCandidate = plainText;
        }
      } catch (_) {
        continue;
      }
    }
    if (bestCandidate == null || bestScore < 4) {
      return null;
    }
    return bestCandidate;
  }

  int _vbaSourceScore(String text) {
    var score = 0;
    if (text.contains('Attribute VB_Name')) {
      score += 3;
    }
    if (text.contains('Option Compare')) {
      score += 2;
    }
    if (text.contains('Private Sub') || text.contains('Public Sub')) {
      score += 2;
    }
    if (text.contains('End Sub')) {
      score += 1;
    }
    if (text.contains('Function ')) {
      score += 1;
    }
    if (text.contains('End Function')) {
      score += 1;
    }

    final printableRatio = _printableRatio(text);
    if (printableRatio >= 0.9) {
      score += 3;
    } else if (printableRatio >= 0.75) {
      score += 2;
    } else if (printableRatio >= 0.6) {
      score += 1;
    }
    return score;
  }

  double _printableRatio(String text) {
    if (text.isEmpty) {
      return 0;
    }
    var printable = 0;
    for (final codeUnit in text.codeUnits) {
      final isLineBreak = codeUnit == 10 || codeUnit == 13 || codeUnit == 9;
      final isPrintableAscii = codeUnit >= 32 && codeUnit <= 126;
      if (isLineBreak || isPrintableAscii) {
        printable++;
      }
    }
    return printable / text.length;
  }

  String? _extractModuleNameFromSource(String text) {
    for (final line in text.split('\n')) {
      final trimmed = line.trim();
      if (!trimmed.startsWith('Attribute VB_Name')) {
        continue;
      }
      final firstQuote = trimmed.indexOf('"');
      if (firstQuote == -1) {
        return null;
      }
      final secondQuote = trimmed.indexOf('"', firstQuote + 1);
      if (secondQuote == -1) {
        return null;
      }
      return trimmed.substring(firstQuote + 1, secondQuote);
    }
    return null;
  }
}

class _ModuleInfo {
  final String moduleName;
  String? streamName;
  int textOffset = 0;

  _ModuleInfo(this.moduleName);
}

class _ProjectModuleBinding {
  final String streamName;
  final String moduleName;

  const _ProjectModuleBinding({
    required this.streamName,
    required this.moduleName,
  });
}
