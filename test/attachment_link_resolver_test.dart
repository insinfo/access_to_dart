import 'package:access_to_dart/src/attachment_link_resolver.dart';
import 'package:test/test.dart';

void main() {
  const payload = [
    'FileData',
    'FileFlags',
    'FileName',
    'FileTimeStamp',
    'FileType',
    'FileURL'
  ];
  const fields = [
    (name: '_imgRma', typeCode: 4, isAutoNumber: false),
    (name: 'FileFlags', typeCode: 4, isAutoNumber: false),
    (name: 'TbUnidade_imgRma', typeCode: 4, isAutoNumber: true),
    (name: 'FileData', typeCode: 11, isAutoNumber: false),
  ];
  test('renamed field resolves unique nonpayload nonautonumber parent key', () {
    expect(
        inferAttachmentLinkColumn(
            flatColumns: fields, payloadColumnNames: payload),
        '_imgRma');
  });
  test('ambiguous long keys do not guess first or name-shaped key', () {
    expect(
        inferAttachmentLinkColumn(flatColumns: [
          ...fields,
          (name: '_rma1', typeCode: 4, isAutoNumber: false)
        ], payloadColumnNames: payload),
        isNull);
  });
  test('without parent key payload and autonumber are never selected', () {
    expect(
        inferAttachmentLinkColumn(
            flatColumns: fields.skip(1), payloadColumnNames: payload),
        isNull);
  });
}
