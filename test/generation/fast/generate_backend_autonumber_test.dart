import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/backend_autonumber_fixture.dart';

void main() {
  for (final style in ['snake_ascii', 'original']) {
    test('backend respeita coluna autonumerica no estilo $style', () async {
      final temp = await Directory.systemTemp.createTemp('access_autonumber_');
      addTearDown(() => temp.delete(recursive: true));
      final analysis = await writeAutonumberAnalysis(temp);
      final err = StringBuffer();
      final output = '${temp.path}/generated';
      expect(
          await run([
            'generate',
            '--analysis',
            analysis.path,
            '--output',
            output,
            '--identifier-style',
            style,
          ], out: StringBuffer(), err: err),
          0,
          reason: err.toString());
      final source = await File('$output/backend/lib/src/modules/cadastro/'
              'repositories/cadastro_repository.dart')
          .readAsString();
      final key = style == 'original' ? 'CodigoCadastro' : 'codigo_cadastro';
      expect(source, contains(".insertGetId(payload, '$key')"));
      expect(source, contains("if (payload['$key'] == null)"));
      expect(source, contains("payload.remove('$key')"));
    });
  }
}
