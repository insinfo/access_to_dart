import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:access_to_dart/src/accdb_analyzer.dart';
import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';

void main() {
  late AccessDatabase database;
  late TableReader reader;
  final manifest = jsonDecode(
      File('test/fixtures/sigasul_attachment_dao_hashes.json')
          .readAsStringSync()) as Map;
  final entries = (manifest['attachments'] as List).cast<Map>();
  setUpAll(() async {
    final file = File('fixtures/SIGA2021-SUL_be_senha_4462.accdb');
    expect((await sha256.bind(file.openRead()).first).toString(),
        manifest['sourceSha256']);
    database = await AccessDatabase.openPath(file.path, password: '4462');
    reader =
        TableReader(format: database.format, pageChannel: database.pageChannel);
  });
  tearDownAll(() async {
    await database.close();
  });
  test('renamed rma1 materializes its original physical parent link', () async {
    final model = await AccessCatalog(
            format: database.format, pageChannel: database.pageChannel)
        .read('fixtures/SIGA2021-SUL_be_senha_4462.accdb');
    final analysis = await AccdbAnalyzer(model: model, db: database).analyze();
    final table = (analysis['tables'] as List)
        .cast<Map>()
        .singleWhere((table) => table['name'] == 'TbUnidade_rma1_attachment');
    expect(table['syntheticKind'], 'attachment');
    expect(table['attachmentParentColumn'], 'rma1');
    expect(table['attachmentLinkColumn'], '_imgRma');
    expect(table['tdefPage'], 11125);
    expect(table['rowCount'], 1);
    final payload =
        ((table['sampleRows'] as List).single as Map)['FileData'] as List<int>;
    final oracle = entries
        .singleWhere((entry) => entry['table'] == 'TbUnidade_rma1_attachment');
    expect(sha256.convert(payload).toString(), oracle['payloadSha256']);
  }, timeout: const Timeout(Duration(minutes: 3)));
  for (final entry in entries) {
    test(
        'original attachment payload matches independent DAO file: ${entry['table']}',
        () async {
      final rows = await reader.readAllRows(entry['tdefPage'] as int);
      expect(rows, hasLength(1));
      final row = rows.single;
      final value = row['FileData'] as List<int>;
      final raw = value is Uint8List ? value : Uint8List.fromList(value);
      // Keep the storage fingerprint alongside the independent file fingerprint.
      expect(raw.length, entry['rawLength']);
      expect(sha256.convert(raw).toString(), entry['rawSha256']);
      expect(ByteData.sublistView(raw).getUint32(0, Endian.little),
          entry['storageType']);
      final decoded = decodeAttachmentRow(row);
      final payload = decoded['FileData'] as List<int>;
      expect(payload.length, entry['payloadLength']);
      expect(sha256.convert(payload).toString(), entry['payloadSha256']);
      expect(sha256.convert(payload).toString(), isNot(entry['rawSha256']));
      for (final key in row.keys.where((key) => key != 'FileData')) {
        expect(decoded[key], row[key],
            reason: 'Attachment metadata must remain unchanged');
      }
      expect(sha256.convert(raw).toString(), entry['rawSha256']);
    }, timeout: const Timeout(Duration(minutes: 2)));
  }
}
