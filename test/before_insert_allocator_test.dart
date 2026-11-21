import 'dart:convert';
import 'dart:io';
import 'package:test/test.dart';
import 'support/family_allocator_fixture.dart';

void main() {
  Future<Map<String, dynamic>> manifest(Map<String, dynamic> data) async {
    final temp = await Directory.systemTemp.createTemp('family_allocator_');
    addTearDown(() => temp.delete(recursive: true));
    final app = await generateFamilyAllocator(data, temp);
    return jsonDecode(await File(
            '${app.path}/frontend/lib/src/modules/cad_residencia/access_behaviors.json')
        .readAsString()) as Map<String, dynamic>;
  }

  test(
      'recognizes full real BeforeInsert with disabled source control provenance',
      () async {
    final data = await familyAllocatorFixture();
    final form = (data['forms'] as List).single as Map;
    final control = (form['controls'] as List)
        .cast<Map>()
        .singleWhere((c) => c['name'] == 'CodResid');
    expect(control['properties']['Enabled'], 'NotDefault');
    final rule = (await manifest(data))['beforeInsertAllocator'] as Map;
    expect(rule['kind'], 'domain_count_max_plus_one');
    expect(rule['column'], 'cod_fam');
    expect(rule['procedureSha256'], matches(RegExp(r'^[a-f0-9]{64}$')));
    expect(rule['controlProperties']['Enabled'], 'NotDefault');
    expect(rule['otherVbaEventsImplemented'], false);
  });
  for (final variant in [
    'extra-statement',
    'domain-mismatch',
    'increment',
    'missing-event',
    'enabled-control',
    'missing-properties',
    'auto-number',
    'duplicate-procedure'
  ]) {
    test('refuses incomplete or altered BeforeInsert: $variant', () async {
      final data = await familyAllocatorFixture();
      final form = (data['forms'] as List).single as Map;
      final control = (form['controls'] as List)
          .cast<Map>()
          .singleWhere((c) => c['name'] == 'CodResid');
      var code = form['rawVbaCode'] as String;
      if (variant == 'extra-statement')
        code =
            code.replaceFirst('Me.CodFam = 1', 'Me.CodFam = 1\nCancel = True');
      if (variant == 'domain-mismatch')
        code = code.replaceFirst(
            'DMax("CodFam", "CadResidencia")', 'DMax("CodFam", "OtherTable")');
      if (variant == 'increment')
        code = code.replaceFirst('DMax("CodFam", "CadResidencia") + 1',
            'DMax("CodFam", "CadResidencia") + 2');
      if (variant == 'missing-event') form['events'].remove('BeforeInsert');
      if (variant == 'enabled-control')
        control['properties']['Enabled'] = 'True';
      if (variant == 'missing-properties') control.remove('properties');
      if (variant == 'auto-number')
        data['tables'][0]['columns'][0]['isAutoNumber'] = true;
      if (variant == 'duplicate-procedure')
        code += '\nPrivate Sub Form_BeforeInsert(Cancel As Integer)\nEnd Sub';
      form['rawVbaCode'] = code;
      expect((await manifest(data))['beforeInsertAllocator'], isNull);
    });
  }
  test('persists isolated family scaffold when explicitly requested', () async {
    final path = Platform.environment['ACCESS_FAMILY_OUTPUT'];
    if (path == null) return;
    await generateFamilyAllocator(
        await familyAllocatorFixture(), Directory(path));
  });
}
