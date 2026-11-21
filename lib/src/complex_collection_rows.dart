/// Separates logical collection values from unreachable physical storage rows.
/// Maps are retained unchanged so excluded storage can be preserved separately.
class ComplexCollectionRows {
  final List<Map<String, dynamic>> linkedRows;
  final List<Map<String, dynamic>> orphanRows;
  const ComplexCollectionRows(this.linkedRows, this.orphanRows);
}

ComplexCollectionRows partitionComplexCollectionRows({
  required Iterable<Map<String, dynamic>> parentRows,
  required Iterable<Map<String, dynamic>> childRows,
  required String parentColumn,
  required String linkColumn,
}) {
  final owners = <int, int>{};
  for (final row in parentRows) {
    final key = row[parentColumn];
    if (key == null) continue;
    if (key is! int) throw StateError('Invalid physical complex owner key');
    owners.update(key, (count) => count + 1, ifAbsent: () => 1);
  }
  final linked = <Map<String, dynamic>>[];
  final orphaned = <Map<String, dynamic>>[];
  for (final row in childRows) {
    final key = row[linkColumn];
    if (key != null && key is! int) {
      throw StateError('Invalid physical complex child key');
    }
    final count = owners[key] ?? 0;
    if (count > 1) throw StateError('Ambiguous physical complex owner');
    (count == 1 ? linked : orphaned).add(row);
  }
  return ComplexCollectionRows(linked, orphaned);
}
