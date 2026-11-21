import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

void main() {
  late Directory temp;
  late Map<String, dynamic> baseline;
  setUpAll(() async {
    temp = await Directory.systemTemp.createTemp('migration_integrity_');
    final errors = StringBuffer();
    expect(
        await run([
          'analyze',
          '--accdb',
          'fixtures/teste1/teste1.accdb',
          '--output',
          '${temp.path}/analysis',
        ], out: StringBuffer(), err: errors),
        0,
        reason: errors.toString());
    baseline = jsonDecode(
            await File('${temp.path}/analysis/analysis.json').readAsString())
        as Map<String, dynamic>;
    expect((baseline['tables'] as List).first['tdefPage'], isA<int>());
  });
  tearDownAll(() => temp.delete(recursive: true));

  for (final corrupt in [false, true]) {
    test(
        'data migration rejects ${corrupt ? 'corrupt' : 'missing'} real source before writing assets',
        () async {
      final input =
          File('${temp.path}/${corrupt ? 'corrupt' : 'missing'}.accdb');
      if (corrupt) await input.writeAsBytes([0, 1, 2, 3]);
      final analysis = Map<String, dynamic>.from(baseline)
        ..['source'] = input.path;
      final path = '${temp.path}/case_$corrupt.json';
      await File(path).writeAsString(jsonEncode(analysis));
      final output = '${temp.path}/migration_$corrupt';
      final errors = StringBuffer();
      final code = await run([
        'migrate',
        '--analysis',
        path,
        '--output',
        output,
      ], out: StringBuffer(), err: errors);
      expect(code, isNot(0));
      expect(await File('$output/seed.sql').exists(), isFalse);
      expect(errors.toString(), isNot(contains('falling back to sampleRows')));
      // Schema-only remains usable even when the original data source is offline.
      expect(
          await run([
            'migrate',
            '--analysis',
            path,
            '--mode',
            'schema-only',
            '--output',
            '${output}_schema',
          ], out: StringBuffer(), err: StringBuffer()),
          0);
      expect(await File('${output}_schema/schema.sql').exists(), isTrue);
    });
  }
  test('linked data without backend source cannot fall back to samples',
      () async {
    final analysis = Map<String, dynamic>.from(baseline)
      ..['backend_analysis'] = {
        'source': '',
        'tables': baseline['tables'],
      };
    final path = '${temp.path}/missing_backend.json';
    await File(path).writeAsString(jsonEncode(analysis));
    final output = '${temp.path}/missing_backend_output';
    final errors = StringBuffer();
    expect(
        await run([
          'migrate',
          '--analysis',
          path,
          '--output',
          output,
        ], out: StringBuffer(), err: errors),
        isNot(0));
    expect(errors.toString(), contains('Full migration rows unavailable'));
    expect(await File('$output/seed.sql').exists(), isFalse);
  });
}
