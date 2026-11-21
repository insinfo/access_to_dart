import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

Future<Map<String, dynamic>> recordFixture() async {
  final source =
      await AccessSrcReader().readDirectory('fixtures/SIGAsul.accdb.src');
  final form =
      source.forms.singleWhere((f) => f.name == 'FrmNomeAcolhida').toJson();
  return jsonDecode(jsonEncode({
    'schema_version': '1',
    'source': 'SIGAsul.accdb',
    'format': 'ACCDB',
    'tables': [
      {
        'name': 'TbNomeAcolhida',
        'columns': [
          {
            'name': 'IdNome',
            'typeName': 'Long',
            'typeCode': 4,
            'isAutoNumber': true
          },
          {'name': 'Nome', 'typeName': 'Text', 'typeCode': 10, 'isRequired': true},
        ],
        'indexes': [
          {
            'name': 'PrimaryKey',
            'isPrimaryKey': true,
            'isUnique': true,
            'columns': [
              {'name': 'IdNome', 'columnNumber': 0}
            ]
          }
        ],
        'sampleRows': [],
      }
    ],
    'forms': [form],
  })) as Map<String, dynamic>;
}

Future<Directory> buildRecordFixture(Map<String, dynamic> data,
    {String? persist}) async {
  final dir = persist == null
      ? await Directory.systemTemp.createTemp('record_navigation_')
      : Directory(persist);
  await dir.create(recursive: true);
  if (persist == null) addTearDown(() => dir.delete(recursive: true));
  final input = File('${dir.path}/analysis.json');
  await input.writeAsString(jsonEncode(data));
  final err = StringBuffer();
  expect(
      await run(
          ['generate', '--analysis', input.path, '--output', '${dir.path}/app'],
          out: StringBuffer(), err: err),
      0,
      reason: err.toString());
  return Directory('${dir.path}/app');
}

Future<
    List<
        Map>> readRecordCommands(Directory app) async => (jsonDecode(await File(
            '${app.path}/frontend/lib/src/modules/tb_nome_acolhida/access_commands.json')
        .readAsString()) as List)
    .cast<Map>();

void main() {
  test('real record macros preserve exact conditional error policy',
      () async {
    final app = await buildRecordFixture(await recordFixture());
    final commands = await readRecordCommands(app);
    expect(
        commands
            .singleWhere((c) => c['control'] == 'BTPRIM')['recordOperation'],
        'first');
    expect(
        commands.singleWhere((c) => c['control'] == 'BTULT')['recordOperation'],
        'last');
    expect(commands.singleWhere((c) => c['control'] == ' BTANTER')['recordOperation'], 'previous');
    expect(commands.singleWhere((c) => c['control'] == ' BTANTER')['errorPolicy'], 'alert_macro_error');
    expect(commands.singleWhere((c) => c['control'] == 'btnovo')['recordOperation'], 'new');
    final repository = await File(
            '${app.path}/backend/lib/src/modules/tb_nome_acolhida/repositories/tb_nome_acolhida_repository.dart')
        .readAsString();
    expect(repository, contains('query.orderBy('));
  });
  for (final variant in [
    'condition',
    'sequence',
    'lifecycle',
    'filter',
    'order',
    'text-pk',
    'composite-pk',
    'missing-pk'
  ]) {
    test('reject record navigation: $variant', () async {
      final data = await recordFixture();
      final form = (data['forms'] as List).single as Map;
      final table = (data['tables'] as List).single as Map;
      final control = (form['controls'] as List)
          .cast<Map>()
          .singleWhere((c) => c['name'] == 'BTPRIM');
      final steps = control['macroDefinitions']['OnClickEmMacro'] as List;
      if (variant == 'condition') {
        (steps.first as Map)['condition'] = '[Allowed]=True';
      }
      if (variant == 'sequence') {
        steps.add({'action': 'SaveRecord', 'arguments': []});
      }
      if (variant == 'lifecycle') {
        form['events'] = {'OnCurrent': '[Event Procedure]'};
      }
      if (variant == 'filter') form['properties']['Filter'] = '[IdNome]=1';
      if (variant == 'order') form['properties']['OrderBy'] = '[Nome] DESC';
      if (variant == 'text-pk') {
        table['columns'][0]['typeName'] = 'Text';
        table['columns'][0]['typeCode'] = 10;
        table['columns'][0]['isAutoNumber'] = false;
      }
      if (variant == 'composite-pk') {
        table['indexes'][0]['columns'].add({'name': 'Nome', 'columnNumber': 1});
      }
      if (variant == 'missing-pk') table['indexes'] = [];
      final commands = await readRecordCommands(await buildRecordFixture(data));
      expect(commands.singleWhere((c) => c['control'] == 'BTPRIM')['status'],
          'unsupported');
    });
  }
  for (final variant in ['onerror-mode', 'condition', 'message', 'message-extra', 'trailing', 'children']) {
    test('reject altered error sequence: $variant', () async {
      final data = await recordFixture();
      final form = (data['forms'] as List).single as Map;
      final control = (form['controls'] as List).cast<Map>().singleWhere((c) => c['name'] == ' BTANTER');
      final steps = control['macroDefinitions']['OnClickEmMacro'] as List;
      final actions = steps.cast<Map>().where((s) => s['action'] != null).toList();
      if (variant == 'onerror-mode') actions[0]['arguments'] = ['2'];
      if (variant == 'condition') actions[2]['condition'] = '[OtherError]<>0';
      if (variant == 'message') actions[2]['arguments'][0] = 'Always show';
      if (variant == 'message-extra') (actions[2]['arguments'] as List).add('Extra');
      if (variant == 'trailing') steps.add({'action':'GoToControl','arguments':['Nome']});
      if (variant == 'children') actions[1]['children'] = [{'action':'RunCode'}];
      final commands = await readRecordCommands(await buildRecordFixture(data));
      expect(commands.singleWhere((c) => c['control'] == ' BTANTER')['status'], 'unsupported');
    });
  }
  test('persist isolated browser fixture with explicit single-action probes',
      () async {
    final output = Platform.environment['ACCESS_RECORD_NAV_OUTPUT'];
    if (output == null) return;
    final data = await recordFixture();
    final form = (data['forms'] as List).single as Map;
    for (final entry in {0: 'Previous', 1: 'Next', 5: 'New'}.entries) {
      (form['controls'] as List).add({
        'type': 'CommandButton',
        'name': 'Probe${entry.value}',
        'caption': 'Probe ${entry.value}',
        'macroDefinitions': {
          'OnClickEmMacro': [
            {
              'action': 'GoToRecord',
              'arguments': ['-1', '', entry.key.toString()],
              'children': [],
              'properties': {}
            }
          ]
        }
      });
    }
    await buildRecordFixture(data, persist: output);
  });
}
