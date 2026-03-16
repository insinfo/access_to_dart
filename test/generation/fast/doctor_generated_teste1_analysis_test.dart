import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('doctor validates the generated teste1 analysis', () async {
    final analysisFile = await ensureTeste1QuickAnalysis();

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      ['doctor', '--analysis', analysisFile.path],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);
    expect(out.toString(), contains('Doctor report'));
    expect(out.toString(), contains('[info]'));
  });
}