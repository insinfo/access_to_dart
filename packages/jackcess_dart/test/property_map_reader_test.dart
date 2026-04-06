import 'dart:typed_data';

import 'package:jackcess_dart/src/property_map_reader.dart';
import 'package:test/test.dart';

void main() {
  test('reads default and named properties from a minimal property map', () {
    final reader = PropertyMapReader();
    final bytes = Uint8List.fromList(<int>[
      ..._header(),
      ..._namesBlock(['Required', 'Caption', 'AllowZeroLength', 'ValidationText']),
      ..._valuesBlock(
        null,
        [
          _propertyValue(typeCode: 0x01, nameIndex: 0, data: [1]),
          _propertyValue(typeCode: 0x01, nameIndex: 2, data: [0]),
        ],
      ),
      ..._valuesBlock(
        'Descricao',
        [
          _propertyValue(typeCode: 0x0A, nameIndex: 1, data: _utf16('Descricao amigavel')),
          _propertyValue(typeCode: 0x0C, nameIndex: 3, data: _utf16('Nao deixe vazio.')),
        ],
      ),
    ]);

    final propertyMap = reader.read(bytes);

    expect(propertyMap.defaultProperties['Required'], isTrue);
    expect(propertyMap.defaultProperties['AllowZeroLength'], isFalse);
    expect(propertyMap.forName('Descricao')['Caption'], 'Descricao amigavel');
    expect(propertyMap.forName('descricao')['ValidationText'], 'Nao deixe vazio.');
  });

  test('decodes date time guid and money property types', () {
    final reader = PropertyMapReader();
    final bytes = Uint8List.fromList(<int>[
      ..._header(),
      ..._namesBlock(['GuidProp', 'CreatedAt', 'Price']),
      ..._valuesBlock(
        'Meta',
        [
          _propertyValue(typeCode: 0x0F, nameIndex: 0, data: _guidBytes()),
          _propertyValue(typeCode: 0x08, nameIndex: 1, data: _f64(2.0)),
          _propertyValue(typeCode: 0x05, nameIndex: 2, data: _i64(123456)),
        ],
      ),
    ]);

    final propertyMap = reader.read(bytes).forName('Meta');

    expect(propertyMap['GuidProp'], '{00112233-4455-6677-8899-AABBCCDDEEFF}');
    expect(propertyMap['CreatedAt'], DateTime.utc(1900, 1, 1));
    expect(propertyMap['Price'], 12.3456);
  });

  test('decodes description and decimal places property types', () {
    final reader = PropertyMapReader();
    final bytes = Uint8List.fromList(<int>[
      ..._header(),
      ..._namesBlock(['Description', 'DecimalPlaces', 'DefaultValue']),
      ..._valuesBlock(
        'Salario',
        [
          _propertyValue(
            typeCode: 0x0C,
            nameIndex: 0,
            data: _utf16('Valor monetario mensal.'),
          ),
          _propertyValue(typeCode: 0x02, nameIndex: 1, data: [2]),
          _propertyValue(typeCode: 0x0A, nameIndex: 2, data: _utf16('0')),
        ],
      ),
    ]);

    final propertyMap = reader.read(bytes).forName('Salario');

    expect(propertyMap['Description'], 'Valor monetario mensal.');
    expect(propertyMap['DecimalPlaces'], 2);
    expect(propertyMap['DefaultValue'], '0');
  });

  test('decodes semantic property map names used by access field metadata', () {
    final reader = PropertyMapReader();
    final bytes = Uint8List.fromList(<int>[
      ..._header(),
      ..._namesBlock([
        'AllowMultipleValues',
        'RowSourceType',
        'RowSource',
        'WSSFieldID',
      ]),
      ..._valuesBlock(
        'Categoria',
        [
          _propertyValue(typeCode: 0x01, nameIndex: 0, data: [1]),
          _propertyValue(
            typeCode: 0x0A,
            nameIndex: 1,
            data: _utf16('Value List'),
          ),
          _propertyValue(
            typeCode: 0x0C,
            nameIndex: 2,
            data: _utf16('"A";"B";"C"'),
          ),
          _propertyValue(
            typeCode: 0x0A,
            nameIndex: 3,
            data: _utf16('Category'),
          ),
        ],
      ),
    ]);

    final propertyMap = reader.read(bytes).forName('Categoria');

    expect(propertyMap['AllowMultipleValues'], isTrue);
    expect(propertyMap['RowSourceType'], 'Value List');
    expect(propertyMap['RowSource'], '"A";"B";"C"');
    expect(propertyMap['WSSFieldID'], 'Category');
  });

  test('sanitiza nulos controles e surrogates quebrados em texto do PropertyMap', () {
    final reader = PropertyMapReader();
    final bytes = Uint8List.fromList(<int>[
      ..._header(),
      ..._namesBlock(['Caption']),
      ..._valuesBlock(
        'Descricao',
        [
          _propertyValue(
            typeCode: 0x0A,
            nameIndex: 0,
            data: _utf16FromUnits(<int>[0x0041, 0x0000, 0x0001, 0xD800, 0x0042]),
          ),
        ],
      ),
    ]);

    final propertyMap = reader.read(bytes).forName('Descricao');

    expect(propertyMap['Caption'], 'AB');
  });
}

List<int> _header() => const [0x4D, 0x52, 0x32, 0x00];

List<int> _namesBlock(List<String> names) {
  final payload = <int>[];
  for (final name in names) {
    final encoded = _utf16(name);
    payload.addAll(_u16(encoded.length));
    payload.addAll(encoded);
  }
  return [..._u32(payload.length + 6), ..._u16(0x80), ...payload];
}

List<int> _valuesBlock(String? name, List<List<int>> properties) {
  final namePayload = name == null
      ? [..._u32(4)]
      : [..._u32(_utf16(name).length + 6), ..._u16(_utf16(name).length), ..._utf16(name)];
  final payload = <int>[...namePayload];
  for (final property in properties) {
    payload.addAll(property);
  }
  return [..._u32(payload.length + 6), ..._u16(0), ...payload];
}

List<int> _propertyValue({
  required int typeCode,
  required int nameIndex,
  required List<int> data,
}) {
  return [
    ..._u16(data.length + 8),
    0,
    typeCode,
    ..._u16(nameIndex),
    ..._u16(data.length),
    ...data,
  ];
}

List<int> _utf16(String value) {
  final bytes = <int>[];
  for (final codeUnit in value.codeUnits) {
    bytes.add(codeUnit & 0xFF);
    bytes.add((codeUnit >> 8) & 0xFF);
  }
  return bytes;
}

List<int> _utf16FromUnits(List<int> units) {
  final bytes = <int>[];
  for (final codeUnit in units) {
    bytes.add(codeUnit & 0xFF);
    bytes.add((codeUnit >> 8) & 0xFF);
  }
  return bytes;
}

List<int> _u16(int value) => [value & 0xFF, (value >> 8) & 0xFF];

List<int> _u32(int value) => [
      value & 0xFF,
      (value >> 8) & 0xFF,
      (value >> 16) & 0xFF,
      (value >> 24) & 0xFF,
    ];

List<int> _i64(int value) => [
      value & 0xFF,
      (value >> 8) & 0xFF,
      (value >> 16) & 0xFF,
      (value >> 24) & 0xFF,
      (value >> 32) & 0xFF,
      (value >> 40) & 0xFF,
      (value >> 48) & 0xFF,
      (value >> 56) & 0xFF,
    ];

List<int> _f64(double value) {
  final data = ByteData(8)..setFloat64(0, value, Endian.little);
  return data.buffer.asUint8List();
}

List<int> _guidBytes() => const [
      0x33, 0x22, 0x11, 0x00, 0x55, 0x44, 0x77, 0x66,
      0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF,
    ];