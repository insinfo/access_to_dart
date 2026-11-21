import 'dart:io';
import 'dart:convert';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  for (final type in ['Money', 'Currency', 'SmallMoney']) {
    test(
        'migrate maps Access $type to NUMERIC(19,4) and preserves numeric scale',
        () async {
      final tempDir = await Directory.systemTemp.createTemp('access_money_');
      addTearDown(() => tempDir.delete(recursive: true));

      final analysisFile = await writeMoneyAnalysisFixture(tempDir);
      final model =
          jsonDecode(await analysisFile.readAsString()) as Map<String, dynamic>;
      ((model['tables'] as List).first['columns'] as List).first['typeName'] =
          type;
      await analysisFile.writeAsString(jsonEncode(model));
      final outputDir =
          '${tempDir.path}${Platform.pathSeparator}migration_assets';
      final out = StringBuffer();
      final err = StringBuffer();

      final exitCode = await run(
        [
          'migrate',
          '--not-null-mode',
          'strict',
          '--analysis',
          analysisFile.path,
          '--output',
          outputDir
        ],
        out: out,
        err: err,
      );

      expect(exitCode, 0);
      expect(err.toString(), isEmpty);

      final schemaFile = File('$outputDir${Platform.pathSeparator}schema.sql');
      final schema = await schemaFile.readAsString();
      expect(schema, contains('"valor_moeda" NUMERIC(19,4)'));
      expect(
          schema, contains('"valor_moeda" NUMERIC(19,4) NOT NULL DEFAULT 0'));
      expect(schema, contains('"taxa" NUMERIC(18,6)'));
      expect(schema, contains('"taxa" NUMERIC(18,6) DEFAULT 1.5'));
      expect(schema, isNot(contains('DOUBLE PRECISION')));
    });
  }
}
