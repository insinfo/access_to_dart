import 'package:test/test.dart';
import '../tools/attachment_metadata_contract.dart';

void main() {
  test('typed metadata distinguishes NULL, empty text, zero and literal N', () {
    expect(
        {
          canonical(null, 10),
          canonical('', 10),
          canonical('N', 10),
          canonical(0, 4)
        }.length,
        4);
    expect(canonical('ação.txt', 10), 'Sação.txt');
    expect(canonical('memo', 12), 'Smemo');
    expect(() => canonical('0', 4), throwsStateError);
    expect(() => canonical('2020-01-01', 8), throwsStateError);
    expect(() => canonical(1, 10), throwsStateError);
  });
  test(
      'civil timestamp keeps six fractional places without timezone conversion',
      () {
    expect(canonical(DateTime.utc(2020, 2, 3, 4, 5, 6, 7, 8), 8),
        'T2020-02-03T04:05:06.007008');
    expect(canonical(DateTime(2020, 2, 3, 4, 5, 6, 7, 8), 8),
        'T2020-02-03T04:05:06.007008');
    expect(canonical(DateTime.utc(2020), 8), 'T2020-01-01T00:00:00.000000');
  });
  test('record multiset ignores ordering but preserves duplicate attachments',
      () {
    expect(multiset(['a', 'b', 'a']), multiset(['b', 'a', 'a']));
    expect(multiset(['a', 'b', 'a']), isNot(multiset(['a', 'b'])));
    expect(multiset([]), isNot(multiset([''])));
  });
}
