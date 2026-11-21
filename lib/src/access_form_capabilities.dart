/// Source-form permissions are not table permissions or proof of implemented VBA.
/// Defaults/SaveAsText aliases are verified by test_form_capabilities_access.ps1.
Map<String, Object?> describeAccessFormCapabilities(
  Map<String, dynamic> form, {
  required bool hasSourceExport,
}) {
  final raw = (form['properties'] as Map?) ?? const {};
  final diagnostics = <String>[];
  bool? flag(String name, bool defaultValue) {
    final value = raw[name]?.toString().trim();
    if (value == null) return hasSourceExport ? defaultValue : null;
    if (value == 'NotDefault') return !defaultValue;
    if (value == '-1' || value.toLowerCase() == 'true') return true;
    if (value == '0' || value.toLowerCase() == 'false') return false;
    diagnostics.add('unknown_property_value:$name');
    return null;
  }

  final edits = flag('AllowEdits', true);
  final additions = flag('AllowAdditions', true);
  final deletions = flag('AllowDeletions', true);
  final dataEntry = flag('DataEntry', false);
  final modeRaw = raw['RecordsetType'] ?? raw['AllowUpdating'];
  final mode = modeRaw == null
      ? (hasSourceExport ? 0 : null)
      : int.tryParse(modeRaw.toString());
  final knownMode = mode != null && mode >= 0 && mode <= 2;
  if (!knownMode) diagnostics.add('unknown_recordset_type');
  if (raw.containsKey('RecordsetType') &&
      raw.containsKey('AllowUpdating') &&
      raw['RecordsetType'].toString() != raw['AllowUpdating'].toString()) {
    diagnostics.add('conflicting_recordset_type_aliases');
  }
  if (!hasSourceExport) diagnostics.add('source_export_unavailable');
  final pendingEvents = <Map<String, Object?>>[];
  void collectEvents(Map owner, String scope) {
    final events = <Object?, Object?>{
      ...((owner['properties'] as Map?) ?? const {}),
      ...((owner['events'] as Map?) ?? const {}),
    };
    for (final event in [
      'BeforeInsert',
      'BeforeUpdate',
      'AfterInsert',
      'AfterUpdate',
      'OnDelete',
      'BeforeDelConfirm',
      'AfterDelConfirm'
    ]) {
      final value = events[event]?.toString();
      if (value != null && value.trim().isNotEmpty) {
        pendingEvents.add({'scope': scope, 'event': event, 'raw': value});
      }
    }
  }

  collectEvents(form, 'form');
  for (final control
      in ((form['controls'] as List?) ?? const []).whereType<Map>()) {
    collectEvents(control, 'control:${control['name'] ?? ''}');
  }
  bool? operation(bool? flag) {
    if (flag == false || mode == 2) return false;
    if (!knownMode ||
        diagnostics.contains('conflicting_recordset_type_aliases')) {
      return null;
    }
    return flag;
  }

  return {
    'name': form['name'],
    'source_export_available': hasSourceExport,
    'raw_properties': Map<String, dynamic>.from(raw),
    'allowEdits': edits,
    'allowAdditions': additions,
    'allowDeletions': deletions,
    'dataEntry': dataEntry,
    'recordsetType': knownMode ? mode : null,
    'source_form_permissions': {
      'create': operation(additions),
      'update': operation(edits),
      'delete': operation(deletions)
    },
    'write_lifecycle_events': pendingEvents,
    'diagnostics': diagnostics,
    'write_execution_status': 'requires_form_specific_validation',
    'note':
        'Source permissions do not establish query updatability, event support, control permissions, or table-wide authorization.',
  };
}
