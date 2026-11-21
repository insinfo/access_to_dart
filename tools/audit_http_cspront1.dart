import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';
import 'package:crypto/crypto.dart';

String moneyText(Object value) {
  final match =
      RegExp(r'^(-?)([0-9]+)(?:\.([0-9]+))?$').firstMatch(value.toString());
  if (match == null) throw StateError('Unsupported money representation');
  final fraction = match.group(3) ?? '';
  if (fraction.length > 4 && fraction.substring(4).contains(RegExp('[1-9]'))) {
    throw StateError('Money has excess precision');
  }
  final digits = fraction.padRight(4, '0').substring(0, 4);
  final integer = BigInt.parse(match.group(2)!).toString();
  final sign = integer == '0' && digits == '0000' ? '' : match.group(1)!;
  return '$sign$integer.$digits';
}

String rowHash(List row, List<Map> columns) {
  if (row.length != columns.length) throw StateError('HTTP row shape mismatch');
  final cells = <String>[];
  for (var i = 0; i < columns.length; i++) {
    final value = row[i];
    if (value == null) {
      cells.add('N');
      continue;
    }
    final String text;
    switch (columns[i]['daoType']) {
      case 1:
        if (value is! bool) throw StateError('HTTP Boolean type mismatch');
        text = value ? 'true' : 'false';
      case 4:
        if (value is! int) throw StateError('HTTP Long type mismatch');
        text = value.toString();
      case 5:
        if (value is! String) {
          throw StateError('HTTP Money must preserve decimal text');
        }
        text = moneyText(value);
      case 8:
        if (value is! String) throw StateError('HTTP DateTime type mismatch');
        // Same civil ISO contract used by the independently captured DAO oracle.
        // No toLocal/toUtc conversion; only the UTC designator is omitted.
        if (!RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}(?:\d{3})?Z?$')
            .hasMatch(value)) {
          throw StateError(
              'Expected civil ISO timestamp without numeric timezone offset');
        }
        text = DateTime.parse(value)
            .toIso8601String()
            .replaceFirst(RegExp(r'Z$'), '');
        if (text != value.replaceFirst(RegExp(r'Z$'), '')) {
          throw StateError(
              'Non-canonical or normalized invalid calendar value');
        }
      case 10:
        if (value is! String) throw StateError('HTTP Text type mismatch');
        text = value;
      default:
        throw StateError('Unsupported DAO result type');
    }
    cells.add('V${base64Encode(utf8.encode(text))}');
  }
  return sha256.convert(utf8.encode(cells.join('|'))).toString();
}

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('url', mandatory: true)
    ..addOption('oracle', mandatory: true)
    ..addOption('shape', mandatory: true)
    ..addOption('output', mandatory: true);
  final client = HttpClient()..connectionTimeout = const Duration(seconds: 10);
  try {
    final args = parser.parse(arguments);
    final oracle =
        jsonDecode(await File(args['oracle'] as String).readAsString()) as Map;
    final shape =
        jsonDecode(await File(args['shape'] as String).readAsString()) as Map;
    final columns = (shape['columns'] as List).cast<Map>();
    final parameters = (shape['parameters'] as List).cast<Map>();
    final cases = (oracle['cases'] as List).cast<Map>();
    if (oracle['readOnly'] != true ||
        shape['readOnly'] != true ||
        oracle['sourceSha256'] != shape['sourceSha256'] ||
        shape['queryName'] != 'CSPRONT1' ||
        oracle['columnCount'] != 134 ||
        columns.length != 134 ||
        parameters.length != 1 ||
        parameters.single['daoType'] != 10 ||
        cases.length != 7) {
      throw StateError('Unexpected CSPRONT1 oracle contract');
    }
    final base = Uri.parse(args['url'] as String);
    if (!['http', 'https'].contains(base.scheme) ||
        base.host.isEmpty ||
        base.userInfo.isNotEmpty ||
        base.hasQuery ||
        base.hasFragment) {
      throw FormatException('Expected HTTP origin without credentials/query');
    }
    final reports = <Map<String, Object?>>[];
    var allMatch = true;
    var nonempty = 0;
    var totalRows = 0;
    for (var index = 0; index < cases.length; index++) {
      final sample = cases[index];
      if (sample['parameter'] is! String) {
        throw StateError('Expected DAO Text case value');
      }
      final uri = base
          .resolve('/api/v1/access-queries/cspront1')
          .replace(queryParameters: {
        'parameters': jsonEncode({'p0': sample['parameter']}),
        'limit': '100',
      });
      final response = await (await client.getUrl(uri))
          .close()
          .timeout(const Duration(seconds: 30));
      final text = await utf8.decoder
          .bind(response)
          .join()
          .timeout(const Duration(seconds: 30));
      if (response.statusCode != 200) {
        throw StateError('Unexpected query HTTP status ${response.statusCode}');
      }
      final data = jsonDecode(text) as Map;
      final actualColumns = (data['columns'] as List).cast<Map>();
      final actualParameters = (data['parameters'] as List).cast<Map>();
      if (data['query'] != 'CSPRONT1' ||
          data['readOnly'] != true ||
          data['truncated'] != false ||
          data['limit'] != 100 ||
          actualColumns.length != 134 ||
          actualParameters.length != 1 ||
          actualParameters.single['key'] != 'p0' ||
          actualParameters.single['sourceName'] != parameters.single['name'] ||
          actualParameters.single['daoType'] != 10) {
        throw StateError('HTTP result contract incomplete or truncated');
      }
      for (var i = 0; i < columns.length; i++) {
        if (actualColumns[i]['ordinal'] != i ||
            actualColumns[i]['name'] != columns[i]['name'] ||
            actualColumns[i]['daoType'] != columns[i]['daoType']) {
          throw StateError('HTTP column contract mismatch at ordinal $i');
        }
      }
      final rows = (data['rows'] as List).cast<List>();
      final actual = rows.map((r) => rowHash(r, columns)).toList()..sort();
      final expected = (sample['rowHashes'] as List).cast<String>().toList()
        ..sort();
      final match = jsonEncode(actual) == jsonEncode(expected);
      allMatch = allMatch && match;
      totalRows += rows.length;
      if (rows.isNotEmpty) nonempty++;
      reports.add({
        'caseIndex': index,
        'rows': rows.length,
        'daoRows': expected.length,
        'columns': columns.length,
        'match': match
      });
    }
    allMatch = allMatch && nonempty == 5;
    final output = File(args['output'] as String);
    await output.parent.create(recursive: true);
    await output.writeAsString(const JsonEncoder.withIndent('  ').convert({
      'contract': 'cspront1-http-dao-134-v1',
      'sourceSha256': oracle['sourceSha256'],
      'oracleSqlSha256': oracle['sqlSha256'],
      'shapeSqlSha256': shape['sqlSha256'],
      'readOnly': true,
      'httpMethod': 'GET',
      'serverStartedByAudit': false,
      'migrationPerformed': false,
      'allMatch': allMatch,
      'caseCount': reports.length,
      'nonemptyCases': nonempty,
      'rows': totalRows,
      'columns': 134,
      'cases': reports,
    }));
    stdout.writeln(
        'CSPRONT1_HTTP_CASES=${reports.length} NONEMPTY=$nonempty COLUMNS=134 ALL_MATCH=$allMatch');
    if (!allMatch) exitCode = 1;
  } catch (error) {
    stderr.writeln('CSPRONT1 HTTP audit failed: ${error.runtimeType}');
    exitCode = 65;
  } finally {
    client.close(force: true);
  }
}
