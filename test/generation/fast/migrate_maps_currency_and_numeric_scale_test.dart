import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('migrate maps Access currency to NUMERIC(19,4) and preserves numeric scale', () async {
    final tempDir = await Directory.systemTemp.createTemp('access_money_');
    addTearDown(() => tempDir.delete(recursive: true));

    final analysisFile = await writeMoneyAnalysisFixture(tempDir);
    final outputDir = '${tempDir.path}${Platform.pathSeparator}migration_assets';
    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      ['migrate', '--analysis', analysisFile.path, '--output', outputDir],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);

    final schemaFile = File('$outputDir${Platform.pathSeparator}schema.sql');
    final schema = await schemaFile.readAsString();
    expect(schema, contains('"valor_moeda" NUMERIC(19,4)'));
    expect(schema, contains('"taxa" NUMERIC(18,6)'));
    expect(schema, isNot(contains('DOUBLE PRECISION')));
  });
}