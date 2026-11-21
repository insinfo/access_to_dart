import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'package:crypto/crypto.dart';
import 'package:jackcess_dart/jackcess_dart.dart';

String digest(String value) => sha256.convert(utf8.encode(value)).toString();
String pkName(Map<String, dynamic> table) => ((table['indexes'] as List)
        .cast<Map<String, dynamic>>()
        .firstWhere((i) => i['isPrimaryKey'] == true)['columns'] as List)
    .first['name'] as String;
String canonical(dynamic value, String type) {
  if (value == null) return 'N';
  switch (type) {
    case 'Text':
    case 'Memo':
      if (value is! String) throw StateError('Unexpected text representation');
      return 'S$value';
    case 'Boolean':
      if (value is! bool) throw StateError('Unexpected boolean representation');
      return value ? 'B1' : 'B0';
    case 'Long':
      if (value is! int) throw StateError('Unexpected integer representation');
      return 'I$value';
    case 'Money':
      if (value is! num || !value.isFinite) {
        throw StateError('Unexpected currency representation');
      }
      return 'M${value.toStringAsFixed(4)}';
    case 'DateTime':
      if (value is! DateTime) {
        throw StateError('Unexpected datetime representation');
      }
      String pad(int n, int width) => n.toString().padLeft(width, '0');
      return 'T${pad(value.year, 4)}-${pad(value.month, 2)}-${pad(value.day, 2)}T${pad(value.hour, 2)}:${pad(value.minute, 2)}:${pad(value.second, 2)}.${pad(value.millisecond * 1000 + value.microsecond, 6)}';
    default:
      throw StateError('Unsupported canonical type: $type');
  }
}

Future<void> main(List<String> args) async {
  if (args.length != 4) {
    throw ArgumentError('source analysis dao-oracle output');
  }
  final source = File(args[0]);
  final hash = (await sha256.bind(source.openRead()).first).toString();
  final model =
      jsonDecode(await File(args[1]).readAsString()) as Map<String, dynamic>;
  final oracle =
      jsonDecode(await File(args[2]).readAsString()) as Map<String, dynamic>;
  if (oracle['sourceSha256'] != hash ||
      oracle['contract'] != 'typed-column-pk-v1') {
    throw StateError('Oracle source/contract mismatch');
  }
  final tables = (model['tables'] as List).cast<Map<String, dynamic>>();
  final db = await AccessDatabase.openPath(source.path,
      password: Platform.environment['ACCESS_DAO_PASSWORD']);
  final reports = <Map<String, dynamic>>[];
  final attachments = <Map<String, dynamic>>[];
  try {
    final reader = TableReader(format: db.format, pageChannel: db.pageChannel);
    for (final name in ['TbPessoa', 'CadResidencia', 'TbAtend']) {
      final table = tables.firstWhere((t) => t['name'] == name);
      final pk = pkName(table);
      final rows = await reader.readAllRows(table['tdefPage'] as int);
      rows.sort((a, b) => (a[pk] as int).compareTo(b[pk] as int));
      if (rows.map((r) => r[pk]).toSet().length != rows.length) {
        throw StateError('Duplicate reader primary keys');
      }
      final expected = (oracle['tables'] as List)
          .cast<Map<String, dynamic>>()
          .firstWhere((t) => t['table'] == name);
      final columns = <Map<String, dynamic>>[];
      for (final col
          in (table['columns'] as List).cast<Map<String, dynamic>>()) {
        final buffer = StringBuffer();
        var nulls = 0;
        var nonScale4 = 0;
        double maxResidual = 0;
        for (final row in rows) {
          final key = canonical(row[pk], 'Long');
          final value = row[col['name']];
          if (value == null) nulls++;
          if (col['typeName'] == 'Money' && value is num) {
            final scaled = value.toDouble() * 10000;
            if (!scaled.isFinite || scaled.abs() > 9007199254740991) {
              nonScale4++;
            } else {
              final residual = (scaled - scaled.roundToDouble()).abs();
              maxResidual = math.max(maxResidual, residual);
              // Only tolerate the binary representation error, never a decimal fraction.
              if (residual >
                  math.max(1e-8, scaled.abs() * 2.220446049250313e-16 * 2)) {
                nonScale4++;
              }
            }
          }
          final cell = canonical(value, col['typeName'] as String);
          buffer.write('${key.length}:$key${cell.length}:$cell');
        }
        final actual = digest(buffer.toString());
        final expectedCol = (expected['columns'] as List)
            .cast<Map<String, dynamic>>()
            .firstWhere((c) => c['name'] == col['name']);
        columns.add({
          'name': col['name'],
          'type': col['typeName'],
          'sha256': actual,
          'daoSha256': expectedCol['sha256'],
          'nullCount': nulls,
          'daoNullCount': expectedCol['nullCount'],
          'currencyNonScale4Count': nonScale4,
          'currencyMaxBinaryScaledResidual': maxResidual,
          'daoSubmicrosecondCount': expectedCol['submicrosecondCount'],
          'match': actual == expectedCol['sha256'] &&
              nonScale4 == 0 &&
              expectedCol['submicrosecondCount'] == 0
        });
      }
      reports.add({
        'table': name,
        'rows': rows.length,
        'daoRows': expected['rows'],
        'columns': columns
      });
      stdout.writeln(
          'HASHED_TABLE=$name ROWS=${rows.length} MISMATCH_COLUMNS=${columns.where((c) => c['match'] != true).length}');
    }
    for (final table
        in tables.where((t) => t['syntheticKind'] == 'attachment')) {
      final parent =
          tables.firstWhere((t) => t['name'] == table['attachmentParentTable']);
      final parentRows = await reader.readAllRows(parent['tdefPage'] as int);
      final pk = pkName(parent);
      final keys = {
        for (final row in parentRows)
          row[table['attachmentParentColumn']]:
              digest(canonical(row[pk], 'Long'))
      };
      final childRows = await reader.readAllRows(table['tdefPage'] as int);
      final ordinals = <String, int>{};
      for (final row in childRows) {
        final key = keys[row[table['attachmentLinkColumn']]];
        if (key == null) throw StateError('Attachment parent mapping missing');
        final ordinal = ordinals.update(key, (n) => n + 1, ifAbsent: () => 0);
        final bytes = row['FileData'];
        if (bytes is! List<int>) {
          throw StateError('Attachment binary representation unsupported');
        }
        final actual = sha256.convert(bytes).toString();
        final decoded = decodeAttachmentFileData(bytes);
        final decodedHash = sha256.convert(decoded).toString();
        final expected = (oracle['attachments'] as List)
            .cast<Map<String, dynamic>>()
            .where((a) =>
                a['table'] == table['name'] &&
                a['parentKeyHash'] == key &&
                a['ordinal'] == ordinal)
            .toList();
        attachments.add({
          'table': table['name'],
          'parentKeyHash': key,
          'ordinal': ordinal,
          'readerRawLength': bytes.length,
          'readerDecodedLength': decoded.length,
          'readerDecodedSha256': decodedHash,
          'decodedMatchesDaoPayload':
              expected.length == 1 && decodedHash == expected.single['sha256'],
          'readerRawSha256': actual,
          'daoPayloadLength':
              expected.isEmpty ? null : expected.single['length'],
          'daoPayloadSha256':
              expected.isEmpty ? null : expected.single['sha256'],
          'rawMatchesDaoPayload':
              expected.length == 1 && actual == expected.single['sha256']
        });
      }
    }
  } finally {
    await db.close();
  }
  if ((await sha256.bind(source.openRead()).first).toString() != hash) {
    throw StateError('Source changed');
  }
  final scalarMatch = reports.every((t) =>
      t['rows'] == t['daoRows'] &&
      (t['columns'] as List).every((c) => c['match'] == true));
  final payloadMatch =
      attachments.length == (oracle['attachments'] as List).length &&
          attachments.every((a) => a['decodedMatchesDaoPayload'] == true);
  final result = {
    'sourceSha256': hash,
    'contract': 'typed-column-pk-v1',
    'allScalarColumnsMatch': scalarMatch,
    'allDecodedAttachmentPayloadsMatch': payloadMatch,
    'allRawAttachmentPayloadsMatch':
        attachments.every((a) => a['rawMatchesDaoPayload'] == true),
    'currencyRule':
        'fixed4, fail nonScale4 beyond max(1e-8,2ULPscaled) or unsafe scaled integer; residual explicitly reported',
    'tables': reports,
    'attachments': attachments
  };
  final out = File(args[3]);
  await out.parent.create(recursive: true);
  await out.writeAsString(const JsonEncoder.withIndent('  ').convert(result));
  stdout.writeln(
      'ATTACHMENTS=${attachments.length} RAW_PAYLOAD_MISMATCHES=${attachments.where((a) => a['rawMatchesDaoPayload'] != true).length} DECODED_PAYLOAD_MISMATCHES=${attachments.where((a) => a['decodedMatchesDaoPayload'] != true).length}');
  exitCode = scalarMatch && payloadMatch ? 0 : 1;
}
