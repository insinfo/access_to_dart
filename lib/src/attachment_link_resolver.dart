/// The attachment payload type defines its own fields (including FileFlags).
/// A flat table additionally has one parent complex-value key and its own
/// autonumber row key. Renaming the parent field need not rename those keys.
String? inferAttachmentLinkColumn({
  required Iterable<({String name, int typeCode, bool isAutoNumber})>
      flatColumns,
  required Iterable<String> payloadColumnNames,
}) {
  final payloadNames =
      payloadColumnNames.map((name) => name.toLowerCase()).toSet();
  final candidates = flatColumns
      .where((column) =>
          column.typeCode == 4 &&
          !column.isAutoNumber &&
          !payloadNames.contains(column.name.toLowerCase()))
      .toList();
  return candidates.length == 1 ? candidates.single.name : null;
}
