import 'package:test/test.dart';
import '../tools/audit_reader_value_hashes.dart' show canonical;

void main() {
  test('audit preserves null, empty, whitespace and Unicode distinctions', () {
    expect(canonical(null, 'Text'), 'N');
    expect(canonical('', 'Text'), 'S');
    expect(canonical(' A ', 'Text'), 'S A ');
    expect(canonical('é', 'Text'), isNot(canonical('e\u0301', 'Text')));
    expect(canonical(false, 'Boolean'), 'B0');
    expect(() => canonical(0, 'Boolean'), throwsStateError);
  });
  test('audit uses civil microseconds and rejects wrong scalar types', () {
    expect(canonical(DateTime.utc(2020, 2, 3, 4, 5, 6, 7, 8), 'DateTime'),
        'T2020-02-03T04:05:06.007008');
    expect(canonical(12.3456, 'Money'), 'M12.3456');
    expect(canonical(-1, 'Long'), 'I-1');
    expect(() => canonical(1.0, 'Long'), throwsStateError);
  });
}
