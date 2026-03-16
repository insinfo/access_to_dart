import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

void main() {
  test('migrate accepts accdb directly', () async {
    final fixture = File.fromUri(
      Directory.current.uri.resolve('fixtures/teste1/teste1.accdb'),
    );
    expect(await fixture.exists(), isTrue);

    final tempDir = await Directory.systemTemp.createTemp('access_migrate_');
    addTearDown(() => tempDir.delete(recursive: true));

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      [
        'migrate',
        '--accdb',
        fixture.path,
        '--output',
        tempDir.path,
        '--identifier-style',
        'original',
      ],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);
    expect(out.toString(), contains('Loaded '));

    final schemaFile = File('${tempDir.path}${Platform.pathSeparator}schema.sql');
    final seedFile = File('${tempDir.path}${Platform.pathSeparator}seed.sql');
    expect(await schemaFile.readAsString(), contains('CREATE TABLE "Contatos"'));
    expect(await seedFile.readAsString(), contains('INSERT INTO "Contatos"'));
  });
}