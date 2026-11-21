import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/access_select_compiler.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:crypto/crypto.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';
import '../support/subform_postgres_harness.dart';

void main() {
  test('CSPRONT1 compiled query matches DAO hashes of every projected cell',
      () async {
    final analysis = jsonDecode(
        File('build/codex-sigasul-goal/analysis-complex-complete/analysis.json')
            .readAsStringSync()) as Map<String, dynamic>;
    final shape = jsonDecode(
        File('build/codex-sigasul-goal/query-audit/cspront1-shape.json')
            .readAsStringSync()) as Map;
    final oracle = jsonDecode(
        File('build/codex-sigasul-goal/query-audit/cspront1-results.json')
            .readAsStringSync()) as Map;
    expect(
        oracle['sourceSha256'],
        sha256
            .convert(File('fixtures/SIGA2021-SUL_be_senha_4462.accdb')
                .readAsBytesSync())
            .toString());
    expect(
        oracle['sqlSha256'],
        sha256
            .convert(utf8.encode(
                File('fixtures/SIGAsul.accdb.src/queries/CSPRONT1.sql')
                    .readAsStringSync()))
            .toString());
    final tables = (analysis['tables'] as List)
        .cast<Map>()
        .where((v) =>
            ['TbPessoa', 'CadResidencia', 'TbUnidade'].contains(v['name']))
        .toList();
    expect(tables.length, 3);
    final parameter = (shape['parameters'] as List).single['name'] as String;
    final plan = AccessSelectCompiler(tables
            .map((v) => AnalysisTable.fromJson(v.cast<String, dynamic>()))
            .toList())
        .compile(
            File('fixtures/SIGAsul.accdb.src/queries/CSPRONT1.sql')
                .readAsStringSync(),
            parameterTypes: {parameter: 10},
            outputNames: (shape['columns'] as List)
                .map((c) => c['name'] as String)
                .toList(),
            asciiCaseInsensitiveText: true);
    analysis['tables'] = tables;
    analysis['linkedTables'] = [];
    analysis['relationships'] = [];
    final temp = await Directory.systemTemp.createTemp('cspront1_parity_');
    addTearDown(() => temp.delete(recursive: true));
    final file = File('${temp.path}/analysis.json');
    await file.writeAsString(jsonEncode(analysis));
    final harness = SubformPostgresHarness.fromEnvironment();
    final database = await harness.createTempDatabase();
    addTearDown(() => harness.dropTempDatabase(database));
    final errors = StringBuffer();
    expect(
        await run([
          'migrate',
          '--analysis',
          file.path,
          '--password',
          '4462',
          '--backend-password',
          '4462',
          '--output',
          '${temp.path}/migration',
          '--pg',
          'host=${harness.host} port=${harness.port} dbname=$database user=${harness.user} password=${harness.password} sslmode=disable'
        ], out: StringBuffer(), err: errors),
        0,
        reason: '$errors');
    final connection = await harness.openDatabase(database);
    try {
      var nonempty = 0;
      for (final sample in oracle['cases'] as List) {
        final values = plan.bind({parameter: sample['parameter']});
        final parameters = DpgsqlParameterCollection();
        for (var i = 0; i < values.length; i++) {
          parameters.addWithValue('p$i', values[i]);
        }
        final reader = await connection.executeReader(plan.sql,
            parameters: parameters, rewriteParameters: false);
        final hashes = <String>[];
        try {
          while (await reader.read()) {
            final cells = <String>[];
            for (var i = 0; i < plan.outputs.length; i++) {
              final value = reader.getValue(i);
              if (value == null) {
                cells.add('N');
                continue;
              }
              final String text;
              switch (plan.outputs[i].typeCode) {
                case 1:
                  text = value == true ? 'true' : 'false';
                case 4:
                  text = value.toString();
                case 5:
                  text = moneyText(value);
                case 8:
                  text = (value as DateTime)
                      .toIso8601String()
                      .replaceFirst(RegExp(r'Z$'), '');
                case 10:
                  text = value as String;
                default:
                  throw StateError('Unexpected result type');
              }
              cells.add('V${base64Encode(utf8.encode(text))}');
            }
            hashes.add(sha256.convert(utf8.encode(cells.join('|'))).toString());
          }
        } finally {
          await reader.close();
        }
        hashes.sort();
        expect(hashes, sample['rowHashes'],
            reason:
                'DAO result parity for case index ${(oracle['cases'] as List).indexOf(sample)}');
        if (hashes.isNotEmpty) nonempty++;
      }
      expect(nonempty, greaterThanOrEqualTo(5));
    } finally {
      await connection.close();
    }
  }, timeout: const Timeout(Duration(minutes: 8)));
}

String moneyText(Object value) {
  final match =
      RegExp(r'^(-?)([0-9]+)(?:\.([0-9]+))?$').firstMatch(value.toString());
  if (match == null) throw StateError('Unexpected money representation');
  final fraction = match.group(3) ?? '';
  if (fraction.length > 4 && fraction.substring(4).contains(RegExp('[1-9]'))) {
    throw StateError('Money result has more than four decimal places');
  }
  final digits = fraction.padRight(4, '0').substring(0, 4);
  final integer = BigInt.parse(match.group(2)!).toString();
  final sign = integer == '0' && digits == '0000' ? '' : match.group(1)!;
  return '$sign$integer.$digits';
}
