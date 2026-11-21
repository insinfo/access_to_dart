import 'dart:io';
import 'dart:convert';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/frontend_binding_fixture.dart';

void main() {
  test('generate escapes original keys and option values in Angular bindings',
      () async {
    final temp = await Directory.systemTemp.createTemp('access_binding_');
    addTearDown(() => temp.delete(recursive: true));
    final analysis = await writeFrontendBindingFixture(temp);
    final output = '${temp.path}/generated';
    final errors = StringBuffer();
    expect(
        await run([
          'generate',
          '--analysis',
          analysis.path,
          '--output',
          output,
          '--identifier-style',
          'original',
        ], out: StringBuffer(), err: errors),
        0,
        reason: errors.toString());
    final html = await File(
            '$output/frontend/lib/src/modules/filtros/pages/incluir_filtros/incluir_filtros_page.html')
        .readAsString();
    expect(html, contains(r"readField('Categoria d\'agua')"));
    expect(html, contains(r"lookupOptions('Pessoa d\'agua')"));
    final descriptorMatch =
        RegExp(r'''\[descriptorBase64\]="'([A-Za-z0-9+/=]+)'"''')
            .firstMatch(html);
    expect(descriptorMatch, isNotNull);
    final descriptor =
        jsonDecode(utf8.decode(base64Decode(descriptorMatch![1]!)));
    expect(descriptor['key'], "Tags d'agua");
    expect(
        descriptor['options'], ["O'Brien", r'C:\docs', r'R$ 10 & <especial>']);
    expect(html, isNot(contains('toggleFieldSelection')));
    expect(html, contains('Categoria &amp; faixa &lt;especial&gt;'));
    expect(html, isNot(contains("readField('Categoria d'agua')")));
    expect(html, isNot(contains("'O'Brien')")));
  });
}
