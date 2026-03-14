import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/export.dart' as pc;

class AccdbEncryptionInfo {
  final int encodingKey;
  final int infoLength;
  final int versionMajor;
  final int versionMinor;
  final String? providerUri;
  final String? cipherAlgorithm;
  final String? hashAlgorithm;
  final int? keyBits;
  final int? spinCount;
  final String? xmlDescriptor;

  const AccdbEncryptionInfo({
    required this.encodingKey,
    required this.infoLength,
    required this.versionMajor,
    required this.versionMinor,
    required this.providerUri,
    required this.cipherAlgorithm,
    required this.hashAlgorithm,
    required this.keyBits,
    required this.spinCount,
    required this.xmlDescriptor,
  });

  String get versionLabel => '$versionMajor.$versionMinor';

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'encodingKey': encodingKey,
      'infoLength': infoLength,
      'versionMajor': versionMajor,
      'versionMinor': versionMinor,
      'versionLabel': versionLabel,
      'providerUri': providerUri,
      'cipherAlgorithm': cipherAlgorithm,
      'hashAlgorithm': hashAlgorithm,
      'keyBits': keyBits,
      'spinCount': spinCount,
      'xmlDescriptor': xmlDescriptor,
    };
  }
}

class UnsupportedAccdbEncryptionException implements Exception {
  final AccdbEncryptionInfo encryptionInfo;

  const UnsupportedAccdbEncryptionException(this.encryptionInfo);

  @override
  String toString() {
    final cipher = encryptionInfo.cipherAlgorithm ?? 'unknown-cipher';
    final bits =
        encryptionInfo.keyBits == null ? '' : '-${encryptionInfo.keyBits}';
    final hash = encryptionInfo.hashAlgorithm ?? 'unknown-hash';
    final spin = encryptionInfo.spinCount == null
        ? ''
        : ', spinCount=${encryptionInfo.spinCount}';
    return 'Encrypted ACCDB detected (Office ${encryptionInfo.versionLabel}, '
        '$cipher$bits, $hash$spin).';
  }
}

class _AgileEncryptionDescriptor {
  final AccdbEncryptionInfo info;
  final Uint8List encodingKey;
  final Uint8List keyDataSalt;
  final int keyDataBlockSize;
  final Uint8List passwordSalt;
  final int passwordBlockSize;
  final int passwordKeyBits;
  final Uint8List encryptedVerifierHashInput;
  final Uint8List encryptedVerifierHashValue;
  final Uint8List encryptedKeyValue;

  const _AgileEncryptionDescriptor({
    required this.info,
    required this.encodingKey,
    required this.keyDataSalt,
    required this.keyDataBlockSize,
    required this.passwordSalt,
    required this.passwordBlockSize,
    required this.passwordKeyBits,
    required this.encryptedVerifierHashInput,
    required this.encryptedVerifierHashValue,
    required this.encryptedKeyValue,
  });
}

class OfficeAgileCodec {
  static const int cryptStructureOffset = 0x299;
  static const int encodingKeyOffset = 62;
  static const int encodingKeyLength = 4;

  static final Uint8List _encVerifierInputBlock = Uint8List.fromList(<int>[
    0xfe, 0xa7, 0xd2, 0x76, 0x3b, 0x4b, 0x9e, 0x79,
  ]);
  static final Uint8List _encVerifierValueBlock = Uint8List.fromList(<int>[
    0xd7, 0xaa, 0x0f, 0x6d, 0x30, 0x61, 0x34, 0x4e,
  ]);
  static final Uint8List _encValueBlock = Uint8List.fromList(<int>[
    0x14, 0x6e, 0x0b, 0xe7, 0xab, 0xac, 0xd0, 0xd6,
  ]);

  final _AgileEncryptionDescriptor _descriptor;
  final Uint8List _packageKey;

  OfficeAgileCodec._(this._descriptor, this._packageKey);

  AccdbEncryptionInfo get info => _descriptor.info;

  static AccdbEncryptionInfo? inspect(Uint8List page0) {
    if (page0.length < cryptStructureOffset + 10) {
      return null;
    }

    final bytes = ByteData.sublistView(page0);
    final encodingKey = bytes.getUint32(encodingKeyOffset, Endian.little);
    if (encodingKey == 0) {
      return null;
    }

    final infoLength = bytes.getUint16(cryptStructureOffset, Endian.little);
    final versionMinor =
        bytes.getUint16(cryptStructureOffset + 2, Endian.little);
    final versionMajor =
        bytes.getUint16(cryptStructureOffset + 4, Endian.little);

    final xmlStart = cryptStructureOffset + 10;
    String? xmlDescriptor;
    if (infoLength > 8 && (cryptStructureOffset + 2 + infoLength) <= page0.length) {
      final xmlBytes =
          page0.sublist(xmlStart, cryptStructureOffset + 2 + infoLength);
      xmlDescriptor = _decodeXmlDescriptor(xmlBytes);
    }

    if (xmlDescriptor == null ||
        !xmlDescriptor.contains('<encryption') ||
        !xmlDescriptor.contains('keyEncryptors')) {
      return null;
    }

    return AccdbEncryptionInfo(
      encodingKey: encodingKey,
      infoLength: infoLength,
      versionMajor: versionMajor,
      versionMinor: versionMinor,
      providerUri: _matchAttribute(xmlDescriptor, 'uri'),
      cipherAlgorithm: _matchAttribute(xmlDescriptor, 'cipherAlgorithm'),
      hashAlgorithm: _matchAttribute(xmlDescriptor, 'hashAlgorithm'),
      keyBits: int.tryParse(_matchAttribute(xmlDescriptor, 'keyBits') ?? ''),
      spinCount: int.tryParse(_matchAttribute(xmlDescriptor, 'spinCount') ?? ''),
      xmlDescriptor: xmlDescriptor,
    );
  }

  static OfficeAgileCodec open(Uint8List page0, String password) {
    final descriptor = _parse(page0);
    final passwordBytes = _encodeUtf16Le(password);

    final verifier = _decryptWithPasswordKey(
      passwordBytes,
      descriptor.passwordSalt,
      descriptor.info.spinCount ?? 0,
      descriptor.passwordKeyBits ~/ 8,
      _encVerifierInputBlock,
      descriptor.encryptedVerifierHashInput,
      descriptor.passwordSalt,
    );
    final verifierHash = _decryptWithPasswordKey(
      passwordBytes,
      descriptor.passwordSalt,
      descriptor.info.spinCount ?? 0,
      descriptor.passwordKeyBits ~/ 8,
      _encVerifierValueBlock,
      descriptor.encryptedVerifierHashValue,
      descriptor.passwordSalt,
    );
    final testHash = _fixToLength(
      _hash(verifier),
      ((descriptor.info.keyBits ?? 0) == 0)
          ? verifierHash.length
          : ((verifierHash.length + descriptor.passwordBlockSize - 1) ~/
                  descriptor.passwordBlockSize) *
              descriptor.passwordBlockSize,
    );

    if (!_bytesEqual(verifierHash, testHash)) {
      throw const FormatException('Incorrect password for encrypted ACCDB');
    }

    final packageKey = _decryptWithPasswordKey(
      passwordBytes,
      descriptor.passwordSalt,
      descriptor.info.spinCount ?? 0,
      descriptor.passwordKeyBits ~/ 8,
      _encValueBlock,
      descriptor.encryptedKeyValue,
      descriptor.passwordSalt,
    );

    return OfficeAgileCodec._(descriptor, packageKey);
  }

  Uint8List decryptPage(Uint8List pageBytes, int pageNumber) {
    final pageKey = _applyPageNumber(_descriptor.encodingKey, pageNumber);
    final iv = _fixToLength(
      _hashBytes(_descriptor.keyDataSalt, pageKey),
      _descriptor.keyDataBlockSize,
      0x36,
    );
    return _aesCbcDecrypt(pageBytes, _packageKey, iv);
  }

  static _AgileEncryptionDescriptor _parse(Uint8List page0) {
    final info = inspect(page0);
    if (info == null) {
      throw const FormatException('ACCDB is not encrypted');
    }
    if (info.versionMajor != 4 || info.versionMinor != 4) {
      throw UnsupportedAccdbEncryptionException(info);
    }

    final xml = info.xmlDescriptor;
    if (xml == null || xml.isEmpty) {
      throw UnsupportedAccdbEncryptionException(info);
    }

    return _AgileEncryptionDescriptor(
      info: info,
      encodingKey: page0.sublist(
        encodingKeyOffset,
        encodingKeyOffset + encodingKeyLength,
      ),
      keyDataSalt: base64Decode(_requiredAttribute(xml, 'keyData', 'saltValue')),
      keyDataBlockSize:
          int.parse(_requiredAttribute(xml, 'keyData', 'blockSize')),
      passwordSalt:
          base64Decode(_requiredAttribute(xml, 'p:encryptedKey', 'saltValue')),
      passwordBlockSize:
          int.parse(_requiredAttribute(xml, 'p:encryptedKey', 'blockSize')),
      passwordKeyBits:
          int.parse(_requiredAttribute(xml, 'p:encryptedKey', 'keyBits')),
      encryptedVerifierHashInput: base64Decode(
        _requiredAttribute(xml, 'p:encryptedKey', 'encryptedVerifierHashInput'),
      ),
      encryptedVerifierHashValue: base64Decode(
        _requiredAttribute(xml, 'p:encryptedKey', 'encryptedVerifierHashValue'),
      ),
      encryptedKeyValue: base64Decode(
        _requiredAttribute(xml, 'p:encryptedKey', 'encryptedKeyValue'),
      ),
    );
  }

  static String _requiredAttribute(
    String xml,
    String elementName,
    String attributeName,
  ) {
    final element = RegExp('<$elementName\\b([^>]+?)(/?>)', dotAll: true)
        .firstMatch(xml)
        ?.group(1);
    if (element == null) {
      throw FormatException('Missing <$elementName> in encryption descriptor');
    }
    final value = RegExp('$attributeName="([^"]+)"')
        .firstMatch(element)
        ?.group(1);
    if (value == null) {
      throw FormatException(
        'Missing $attributeName on <$elementName> in encryption descriptor',
      );
    }
    return value;
  }

  static String? _matchAttribute(String? xml, String attributeName) {
    if (xml == null || xml.isEmpty) {
      return null;
    }
    return RegExp('$attributeName="([^"]+)"')
        .firstMatch(xml)
        ?.group(1);
  }

  static String? _decodeXmlDescriptor(List<int> bytes) {
    final start = bytes.indexWhere((value) => value != 0);
    if (start < 0) {
      return null;
    }
    return utf8.decode(bytes.sublist(start)).replaceAll('\u0000', '').trim();
  }

  static Uint8List _decryptWithPasswordKey(
    Uint8List passwordBytes,
    Uint8List salt,
    int spinCount,
    int keyLength,
    Uint8List blockBytes,
    Uint8List encryptedBytes,
    Uint8List iv,
  ) {
    final baseHash = _hashBytes(salt, passwordBytes);
    var iterHash = Uint8List.fromList(baseHash);
    for (var i = 0; i < spinCount; i++) {
      iterHash = _hashBytes(_int32le(i), iterHash);
    }
    final finalHash = _hashBytes(iterHash, blockBytes);
    final key = _fixToLength(finalHash, keyLength, 0x36);
    return _aesCbcDecrypt(encryptedBytes, key, iv);
  }

  static Uint8List _hash(Uint8List bytes) => _hashBytes(bytes, null);

  static Uint8List _encodeUtf16Le(String text) {
    final units = text.codeUnits;
    final out = Uint8List(units.length * 2);
    final data = ByteData.sublistView(out);
    for (var i = 0; i < units.length; i++) {
      data.setUint16(i * 2, units[i], Endian.little);
    }
    return out;
  }

  static Uint8List _hashBytes(Uint8List bytes1, Uint8List? bytes2) {
    final digest = pc.SHA512Digest();
    digest.update(bytes1, 0, bytes1.length);
    if (bytes2 != null) {
      digest.update(bytes2, 0, bytes2.length);
    }
    final out = Uint8List(digest.digestSize);
    digest.doFinal(out, 0);
    return out;
  }

  static Uint8List _fixToLength(
    Uint8List bytes,
    int length, [
    int padByte = 0,
  ]) {
    if (bytes.length == length) {
      return Uint8List.fromList(bytes);
    }
    final out = Uint8List(length);
    final copyLength = bytes.length < length ? bytes.length : length;
    out.setRange(0, copyLength, bytes);
    for (var i = copyLength; i < length; i++) {
      out[i] = padByte;
    }
    return out;
  }

  static Uint8List _int32le(int value) {
    final out = Uint8List(4);
    ByteData.sublistView(out).setUint32(0, value, Endian.little);
    return out;
  }

  static Uint8List _applyPageNumber(Uint8List key, int pageNumber) {
    final out = Uint8List.fromList(key);
    final page = _int32le(pageNumber);
    for (var i = 0; i < 4 && i < out.length; i++) {
      out[i] = page[i] ^ key[i];
    }
    return out;
  }

  static Uint8List _aesCbcDecrypt(
    Uint8List encryptedBytes,
    Uint8List key,
    Uint8List iv,
  ) {
    final cipher = pc.CBCBlockCipher(pc.AESEngine())
      ..init(
        false,
        pc.ParametersWithIV<pc.KeyParameter>(pc.KeyParameter(key), iv),
      );
    final out = Uint8List(encryptedBytes.length);
    final blockSize = cipher.blockSize;
    for (var offset = 0; offset < encryptedBytes.length; offset += blockSize) {
      cipher.processBlock(encryptedBytes, offset, out, offset);
    }
    return out;
  }

  static bool _bytesEqual(Uint8List a, Uint8List b) {
    if (a.length != b.length) {
      return false;
    }
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }
    return true;
  }
}
