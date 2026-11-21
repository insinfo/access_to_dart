import 'package:test/test.dart';
import '../tools/audit_http_cspront1.dart';

void main() {
  test('HTTP canonical row matches independently calculated digest', () {
    expect(
        rowHash([
          null,
          true,
          '12.3456',
          '2020-01-02T03:04:05.006Z'
        ], [
          {'daoType': 10},
          {'daoType': 1},
          {'daoType': 5},
          {'daoType': 8}
        ]),
        '19f3aef3b79bd5cb541427ac324417976a1b6249b31687bfe3312882edcd9a4e');
  });
  test('Money preserves four decimal places without binary rounding', () {
    expect(moneyText('123456789012345.6789'), '123456789012345.6789');
    expect(moneyText('-0.0000'), '0.0000');
    expect(() => moneyText('1.00001'), throwsStateError);
  });
  test('rejects malformed calendar, offsets, unexpected types and short rows',
      () {
    for (final value in [
      '2020-02-31T00:00:00.000',
      '2020-01-01T00:00:00.000-03:00',
      '2020-01-01'
    ]) {
      expect(
          () => rowHash([
                value
              ], [
                {'daoType': 8}
              ]),
          throwsStateError);
    }
    expect(
        () => rowHash([
              'true'
            ], [
              {'daoType': 1}
            ]),
        throwsStateError);
    expect(
        () => rowHash([
              1.5
            ], [
              {'daoType': 4}
            ]),
        throwsStateError);
    expect(
        () => rowHash([
              12.34
            ], [
              {'daoType': 5}
            ]),
        throwsStateError);
    expect(
        () => rowHash([], [
              {'daoType': 10}
            ]),
        throwsStateError);
  });
}
