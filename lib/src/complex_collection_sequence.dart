import 'dart:convert';

import 'package:crypto/crypto.dart';

import 'analysis_model.dart';

/// One allocator per physical multivalue collection. Names are ASCII, bounded,
/// and independent of display-name normalization (which can collide).
String complexCollectionSequenceName(String parent, String column) {
  final digest = sha256.convert(utf8.encode(jsonEncode([parent, column])));
  // Alphabetic hex avoids the identifier policy inserting underscores at
  // letter/digit boundaries, keeping both naming styles below PostgreSQL's limit.
  final token = digest
      .toString()
      .substring(0, 32)
      .split('')
      .map((digit) => String.fromCharCode(97 + int.parse(digit, radix: 16)))
      .join();
  return 'access_mv_${token}_seq';
}

Iterable<({AnalysisTable parent, AnalysisColumn column, AnalysisTable child})>
    multivalueSequenceBindings(AnalysisProject project) sync* {
  final seen = <String>{};
  for (final child
      in project.tables.where((t) => t.isSyntheticMultiValueTable)) {
    final parents = project.tables
        .where((t) => t.name == child.collectionParentTable)
        .toList();
    if (parents.length != 1 ||
        child.collectionLinkColumn == null ||
        !child.columns.any((c) => c.name == child.collectionLinkColumn)) {
      continue;
    }
    // Ambiguous physical mappings cannot share an allocator safely.
    if (project.tables
            .where((t) =>
                t.isSyntheticMultiValueTable &&
                t.collectionParentTable == child.collectionParentTable &&
                t.collectionParentColumn == child.collectionParentColumn)
            .length !=
        1) {
      continue;
    }
    final parent = parents.single;
    final columns = parent.columns
        .where((c) => c.name == child.collectionParentColumn)
        .toList();
    if (columns.length != 1) continue;
    final column = columns.single;
    if (seen.add(complexCollectionSequenceName(parent.name, column.name))) {
      yield (parent: parent, column: column, child: child);
    }
  }
}
