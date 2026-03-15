// ignore_for_file: unused_field

import 'dart:typed_data';

/// Constantes MS-CFB (Compound File Binary Format).
const _cfbSignature = [0xD0, 0xCF, 0x11, 0xE0, 0xA1, 0xB1, 0x1A, 0xE1];

/// Leitor nativo puro para OLE / MS-CFB sem regex.
/// O objetivo destas classes é extrair diretórios, storages e streams (macros, modules e forms).
class CompoundFileReader {
  final ByteData _data;
  final Uint8List _bytes;
  
  int _sectorShift = 9;
  int _miniSectorShift = 6;
  int _dirSector = 0;
  int _fatSectorCount = 0;
  int _miniFatSector = 0;
  int _miniFatSectorCount = 0;
  int _difatSector = 0;
  int _difatSectorCount = 0;

  CompoundFileReader(Uint8List bytes) 
    : _bytes = bytes,
      _data = ByteData.sublistView(bytes) {
    _validateSignature();
    _parseHeader();
  }
  
  void _validateSignature() {
    if (_bytes.length < 512) {
      throw Exception('Blob too small to be a valid OLE file.');
    }
    for (int i = 0; i < 8; i++) {
      if (_bytes[i] != _cfbSignature[i]) {
        throw Exception('Invalid MS-CFB / OLE signature.');
      }
    }
  }

  void _parseHeader() {
    // Header is 512 bytes
    _sectorShift = _data.getUint16(30, Endian.little);
    _miniSectorShift = _data.getUint16(32, Endian.little);
    _fatSectorCount = _data.getUint32(44, Endian.little);
    _dirSector = _data.getUint32(48, Endian.little);
    _miniFatSector = _data.getUint32(60, Endian.little);
    _miniFatSectorCount = _data.getUint32(64, Endian.little);
    _difatSector = _data.getUint32(68, Endian.little);
    _difatSectorCount = _data.getUint32(72, Endian.little);
  }

  int get sectorSize => 1 << _sectorShift;

  /// Lê o stream de diretórios e extrai entradas de storages (Forms, Reports) e streams (VBA Source).
  List<OleEntry> readDirectoryEntries() {
    final entries = <OleEntry>[];
    
    // Simplification for immediate extraction - read first sector of Dir stream
    // and extract Directory Entries (128 bytes each)
    if (_dirSector == 0xFFFFFFFE || _dirSector == 0xFFFFFFFF) return entries;
    
    int dirOffset = 512 + (_dirSector * sectorSize);
    if (dirOffset + sectorSize > _bytes.length) {
       return entries; // Out of bounds safety
    }
    
    // Ler as entradas do primeiro setor de diretório (apenas para prova de conceito estrutural)
    for (int i = 0; i < sectorSize ~/ 128; i++) {
      int entryOffset = dirOffset + (i * 128);
      int nameLen = _data.getUint16(entryOffset + 64, Endian.little);
      if (nameLen > 0 && nameLen <= 64) {
         String name = String.fromCharCodes(_bytes.sublist(entryOffset, entryOffset + nameLen - 2).where((c) => c != 0));
         int type = _data.getUint8(entryOffset + 66);
         int startSector = _data.getUint32(entryOffset + 116, Endian.little);
         int size = _data.getUint32(entryOffset + 120, Endian.little);
         
         entries.add(OleEntry(
           name: name,
           startingSector: startSector,
           streamSize: size,
           entryType: type,
         ));
      }
    }
    
    return entries;
  }
}

class OleEntry {
  final String name;
  final int startingSector;
  final int streamSize;
  final int entryType; // 1 = Storage, 2 = Stream, 5 = Root

  OleEntry({
    required this.name,
    required this.startingSector,
    required this.streamSize,
    required this.entryType,
  });
}
