import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';
import 'package:crypto/crypto.dart';
import 'package:jackcess_dart/jackcess_dart.dart';
import 'attachment_metadata_contract.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('source', mandatory: true)
    ..addOption('analysis', mandatory: true)
    ..addOption('oracle', mandatory: true)
    ..addOption('output', mandatory: true);
  try {
    final args = parser.parse(arguments);
    final sourceFile = File(args['source'] as String);
    final before = (await sha256.bind(sourceFile.openRead()).first).toString();
    final analysis =
        jsonDecode(await File(args['analysis'] as String).readAsString())
            as Map;
    final oracle =
        jsonDecode(await File(args['oracle'] as String).readAsString()) as Map;
    if (oracle['contract'] != 'attachment-metadata-parent-v1' ||
        oracle['sourceSha256'] != before ||
        oracle['sourceUnchanged'] != true ||
        oracle['readOnly'] != true) {
      throw StateError('Oracle/source contract mismatch');
    }
    final tables = (analysis['tables'] as List).cast<Map>();
    final specs =
        tables.where((t) => t['syntheticKind'] == 'attachment').toList();
    final expectedCollections = (oracle['collections'] as List).cast<Map>();
    if (specs.length != expectedCollections.length) {
      throw StateError('Attachment inventory mismatch');
    }
    final database = await AccessDatabase.openPath(sourceFile.path,
        password: Platform.environment['ACCESS_DAO_PASSWORD']);
    final reports = <Map<String, Object?>>[];
    var allMatch = true;
    var total = 0;
    try {
      final reader = TableReader(
          format: database.format, pageChannel: database.pageChannel);
      for (final spec in specs) {
        final parent = tables
            .singleWhere((t) => t['name'] == spec['attachmentParentTable']);
        final expected = expectedCollections.singleWhere((c) =>
            c['table'] == parent['name'] &&
            c['column'] == spec['attachmentParentColumn']);
        final pk = expected['primaryKey'] as String;
        final schema = await reader.readSchema(
            spec['name'] as String, spec['tdefPage'] as int);
        final visible = (expected['childSchema'] as List).cast<Map>();
        final metadata = visible.where((f) => f['name'] != 'FileData').toList();
        const fieldOrder = [
          'FileName',
          'FileType',
          'FileTimeStamp',
          'FileFlags',
          'FileURL'
        ];
        if (metadata.length != fieldOrder.length ||
            !metadata.map((f) => f['name']).toSet().containsAll(fieldOrder)) {
          throw StateError('Unexpected DAO-visible child fields');
        }
        for (final field in visible) {
          final physical =
              schema.columns.where((c) => c.name == field['name']).toList();
          if (physical.length != 1 ||
              physical.single.typeCode != field['daoType']) {
            throw StateError('DAO/physical child schema mismatch');
          }
        }
        final rows = await reader.readAllRows(spec['tdefPage'] as int);
        final parents = await reader.readAllRows(parent['tdefPage'] as int);
        final links = rows.map((r) => r[spec['attachmentLinkColumn']]).toSet();
        if (links.contains(null)) {
          throw StateError('Missing physical attachment link');
        }
        final owners = <Object?, String>{};
        for (final row in parents) {
          final pointer = row[spec['attachmentParentColumn']];
          if (!links.contains(pointer)) continue;
          if (owners.containsKey(pointer)) {
            throw StateError('Ambiguous physical attachment parent pointer');
          }
          if (row[pk] == null) throw StateError('Missing physical parent key');
          owners[pointer] =
              digest(canonical(row[pk], expected['parentDaoType'] as int));
        }
        final actual = <Map<String, dynamic>>[];
        for (final row in rows) {
          final parentHash = owners[row[spec['attachmentLinkColumn']]];
          if (parentHash == null) {
            throw StateError('Orphan physical attachment');
          }
          final association = digest(
              '${encoded(parent['name'] as String)}\n${encoded(spec['attachmentParentColumn'] as String)}\n$parentHash');
          final raw = row['FileData'];
          if (raw is! List<int>) throw StateError('Missing attachment payload');
          final payload = decodeAttachmentFileData(raw);
          final payloadHash = sha256.convert(payload).toString();
          final cells = <Map<String, Object?>>[];
          for (final name in fieldOrder) {
            final field = metadata.singleWhere((f) => f['name'] == name);
            final text = canonical(row[name], field['daoType'] as int);
            cells.add({
              'name': name,
              'daoType': field['daoType'],
              'isNull': text == 'N',
              'valueSha256': digest(text)
            });
          }
          final record = digest(
              '$association\n$payloadHash\n${cells.map((c) => c['valueSha256']).join('\n')}');
          actual.add({
            'associationSha256': association,
            'payloadSha256': payloadHash,
            'payloadLength': payload.length,
            'metadata': cells,
            'recordSha256': record
          });
        }
        final expectedRows = (expected['records'] as List).cast<Map>();
        final associationMatch = multiset(actual.map((r) =>
                '${r['associationSha256']}:${r['payloadSha256']}:${r['payloadLength']}')) ==
            multiset(expectedRows.map((r) =>
                '${r['associationSha256']}:${r['payloadSha256']}:${r['payloadLength']}'));
        final fields = <Map<String, Object?>>[];
        for (final name in fieldOrder) {
          String fieldRecord(Map row) {
            final cell = (row['metadata'] as List)
                .cast<Map>()
                .singleWhere((c) => c['name'] == name);
            return '${row['associationSha256']}:${row['payloadSha256']}:${cell['valueSha256']}';
          }

          final match = multiset(actual.map(fieldRecord)) ==
              multiset(expectedRows.map(fieldRecord));
          fields.add({
            'name': name,
            'daoType':
                metadata.singleWhere((f) => f['name'] == name)['daoType'],
            'match': match,
            'nullCount': actual
                .where((r) =>
                    (r['metadata'] as List)
                        .cast<Map>()
                        .singleWhere((c) => c['name'] == name)['isNull'] ==
                    true)
                .length,
            'daoNullCount': expectedRows
                .where((r) =>
                    (r['metadata'] as List)
                        .cast<Map>()
                        .singleWhere((c) => c['name'] == name)['isNull'] ==
                    true)
                .length
          });
        }
        final recordMatch =
            multiset(actual.map((r) => r['recordSha256'] as String)) ==
                multiset(expectedRows.map((r) => r['recordSha256'] as String));
        final match = fields.every((f) =>
                f['match'] == true && f['nullCount'] == f['daoNullCount']) &&
            recordMatch &&
            associationMatch &&
            parents.length == expected['parentRows'] &&
            actual.length == expectedRows.length;
        allMatch = allMatch && match;
        total += actual.length;
        reports.add({
          'table': parent['name'],
          'column': spec['attachmentParentColumn'],
          'rows': actual.length,
          'daoRows': expectedRows.length,
          'parentRows': parents.length,
          'daoParentRows': expected['parentRows'],
          'associationAndPayloadMatch': associationMatch,
          'recordMultisetMatch': recordMatch,
          'fields': fields,
          'match': match,
          'daoVisibleChildFields': visible,
          'hiddenChildIdsCompared': false
        });
      }
    } finally {
      await database.close();
    }
    final after = (await sha256.bind(sourceFile.openRead()).first).toString();
    if (after != before) {
      throw StateError('Source changed during reader comparison');
    }
    final output = File(args['output'] as String);
    await output.parent.create(recursive: true);
    await output.writeAsString(const JsonEncoder.withIndent('  ').convert({
      'contract': 'attachment-metadata-parent-v1',
      'sourceSha256': before,
      'sourceUnchanged': true,
      'attachmentRecords': total,
      'allMatch': allMatch,
      'collections': reports
    }));
    stdout.writeln(
        'ATTACHMENT_METADATA_RECORDS=$total COLLECTIONS=${reports.length} ALL_MATCH=$allMatch SOURCE_UNCHANGED=true');
    if (!allMatch) exitCode = 1;
  } catch (error) {
    stderr.writeln('Attachment metadata audit failed: ${error.runtimeType}');
    exitCode = 65;
  }
}
