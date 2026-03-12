import 'dart:io';
import 'dart:convert';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

void main() {
  test('prints usage when no command is provided', () async {
    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(<String>[], out: out, err: err);

    expect(exitCode, 0);
    expect(out.toString(), contains('inspect-accdb --accdb <path-to.accdb>'));
    expect(err.toString(), isEmpty);
  });

  test('inspects the internal teste1 fixture', () async {
    final fixture = File.fromUri(
      Directory.current.uri.resolve('fixtures/teste1/teste1.accdb'),
    );
    expect(await fixture.exists(), isTrue);

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      <String>['inspect-accdb', '--accdb', fixture.path],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(out.toString(), contains('ACCDB inspection'));
    expect(out.toString(), contains('Format: VERSION_14'));
    expect(err.toString(), isEmpty);
  });

  test('fails fast when inspect-accdb is missing the file option', () async {
    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      <String>['inspect-accdb'],
      out: out,
      err: err,
    );

    expect(exitCode, 64);
    expect(out.toString(), isEmpty);
    expect(err.toString(), contains('--accdb <path-to.accdb>'));
  });

  test('reads the internal accdb.src fixture and returns parsed JSON',
      () async {
    final fixtureDir = Directory.fromUri(
      Directory.current.uri.resolve('fixtures/teste1/teste1.accdb.src/'),
    );
    expect(await fixtureDir.exists(), isTrue);

    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      <String>['read-src', '--src', fixtureDir.path],
      out: out,
      err: err,
    );

    expect(exitCode, 0);
    expect(err.toString(), isEmpty);

    final parsed = jsonDecode(out.toString()) as Map<String, dynamic>;
    final tables = parsed['tables'] as List<dynamic>;
    final queries = parsed['queries'] as List<dynamic>;
    final forms = parsed['forms'] as List<dynamic>;

    expect(
      tables.any(
          (table) => (table as Map<String, dynamic>)['name'] == 'Contatos'),
      isTrue,
    );
    expect(
      queries.any((query) =>
          (query as Map<String, dynamic>)['name'] == 'ContatosEstendidos'),
      isTrue,
    );
    expect(
      forms.any((form) =>
          (form as Map<String, dynamic>)['name'] == 'DetalhesDoContato'),
      isTrue,
    );
    expect(
      forms.any((form) =>
          (form as Map<String, dynamic>)['name'] == 'ListaDeContatos'),
      isTrue,
    );
    expect(
      forms.any((form) =>
          (form as Map<String, dynamic>)['name'] == 'FolhaDeDadosDoContato'),
      isTrue,
    );
  });
}
