import 'dart:convert';
import 'package:access_to_dart/src/access_query_contract.dart';
import 'package:test/test.dart';

void main() {
  const sql =
      'SELECT People.Id, People.Name FROM People WHERE People.Id=[Forms]![Search]![Key]';
  final hash = List.filled(64, 'a').join();
  Map<String, dynamic> model() => {
        'source': 'fixture.accdb',
        'queries': [
          {'name': 'PeopleQuery', 'sqlText': sql}
        ],
        'tables': [
          {
            'name': 'People',
            'columns': [
              {'name': 'Id', 'typeCode': 4},
              {'name': 'Name', 'typeCode': 10}
            ]
          }
        ]
      };
  Map<String, dynamic> shape() => {
        'queryName': 'PeopleQuery',
        'readOnly': true,
        'sourceSha256': hash,
        'sqlSha256': accessQuerySqlHash(sql),
        'parameters': [
          {'name': '[Forms]![Search]![Key]', 'daoType': 10}
        ],
        'columns': [
          {'ordinal': 0, 'name': 'Id', 'daoType': 4},
          {'ordinal': 1, 'name': 'Name', 'daoType': 10}
        ]
      };
  test(
      'imports verified metadata and emits driver placeholders without SQL reparse',
      () {
    final analysis = model();
    attachDaoQueryContract(analysis, shape(),
        actualSourceHash: hash, asciiCaseInsensitiveText: false);
    final query = (analysis['queries'] as List).single as Map<String, dynamic>;
    final plan = compileContractQuery(
        analysis, query, query['executionContract'],
        questionMarkParameters: true);
    expect(plan.sql, contains('CAST(? AS INTEGER)'));
    expect(
        plan.bindingDescriptors.single['parameter'], '[Forms]![Search]![Key]');
    expect(plan.bind({'[Forms]![Search]![Key]': '17'}), [17]);
  });
  test(
      'refuses mismatched source, SQL, types, ordinal and parameter declarations',
      () {
    for (final mutate in <void Function(Map<String, dynamic>)>[
      (s) => s['sourceSha256'] = 'wrong',
      (s) => s['sqlSha256'] = 'wrong',
      (s) => (s['columns'] as List)[0]['daoType'] = 10,
      (s) => (s['columns'] as List)[0]['ordinal'] = 1,
      (s) => (s['parameters'] as List)[0]['daoType'] = 4,
      (s) => s['parameters'] = [],
    ]) {
      final s = shape();
      mutate(s);
      expect(
          () => attachDaoQueryContract(model(), s,
              actualSourceHash: hash, asciiCaseInsensitiveText: false),
          throwsFormatException);
    }
  });
  test('rejects stale SQL/schema after import', () {
    final analysis = model();
    attachDaoQueryContract(analysis, shape(),
        actualSourceHash: hash, asciiCaseInsensitiveText: false);
    for (final mutate in <void Function(Map<String, dynamic>)>[
      (a) => (a['queries'] as List)[0]['sqlText'] = '$sql;',
      (a) => (a['tables'] as List)[0]['columns'][0]['typeCode'] = 10,
    ]) {
      final copy = jsonDecode(jsonEncode(analysis)) as Map<String, dynamic>;
      mutate(copy);
      final q = (copy['queries'] as List).single as Map<String, dynamic>;
      expect(() => compileContractQuery(copy, q, q['executionContract']),
          throwsFormatException);
    }
  });
}
