import 'dart:typed_data';
import 'package:test/test.dart';
import '../tools/audit_reader_value_hashes.dart' show canonical;
import '../tools/audit_postgres_value_hashes.dart' show canonicalPostgresText;

void main() {
  test('v2 preserves IEEE64 bits including signed zero and adjacent values',
      () {
    expect(canonical(0.0, 'Double'), 'D0000000000000000');
    expect(canonical(-0.0, 'Double'), 'D8000000000000000');
    expect(canonical(1.0, 'Double'), 'D3ff0000000000000');
    final next = (ByteData(8)..setUint64(0, 0x3ff0000000000001)).getFloat64(0);
    expect(canonical(next, 'Double'), 'D3ff0000000000001');
    expect(canonical(next, 'Double'), isNot(canonical(1.0, 'Double')));
    expect(() => canonical(1, 'Double'), throwsStateError);
    expect(
        canonicalPostgresText('8000000000000000', 'Double', 'double precision'),
        canonical(-0.0, 'Double'));
    expect(() => canonicalPostgresText('8000000000000000', 'Double', 'numeric'),
        throwsStateError);
    expect(() => canonicalPostgresText('1.0', 'Double', 'double precision'),
        throwsStateError);
  });
  test('v2 keeps Int16 bounds and OLE null/empty/bytes distinct', () {
    expect(canonical(-32768, 'Integer'), 'I-32768');
    expect(canonical(32767, 'Integer'), 'I32767');
    expect(() => canonical(32768, 'Integer'), throwsStateError);
    expect(canonical(null, 'OLE'), 'N');
    expect(canonical(<int>[], 'OLE'),
        'X0:e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855');
    expect(canonicalPostgresText('000102ff', 'OLE', 'bytea'),
        canonical([0, 1, 2, 255], 'OLE'));
    expect(canonical([0, 1], 'OLE'), isNot(canonical([0, 1, 0], 'OLE')));
    expect(() => canonicalPostgresText('zz', 'OLE', 'bytea'), throwsStateError);
  });
}
