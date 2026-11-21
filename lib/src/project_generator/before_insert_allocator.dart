part of 'project_generator.dart';

/// A complete, finite BeforeInsert grammar; no inferred validators or VBA eval.
class GeneratedBeforeInsertAllocator {
  final String formName;
  final String tableRuntimeName;
  final String columnRuntimeName;
  final String sourceSha256;
  final Map<String, String> controlProperties;

  const GeneratedBeforeInsertAllocator(
      {required this.formName,
      required this.tableRuntimeName,
      required this.columnRuntimeName,
      required this.sourceSha256,
      required this.controlProperties});

  Map<String, Object?> toJson() => {
        'kind': 'domain_count_max_plus_one',
        'grammarVersion': 1,
        'form': formName,
        'event': 'BeforeInsert',
        'procedure': 'Form_BeforeInsert',
        'procedureSha256': sourceSha256,
        'table': tableRuntimeName,
        'column': columnRuntimeName,
        'controlProperties': controlProperties,
        'execution': 'insert_transaction_with_table_lock',
        'timing': 'final_identifier_on_explicit_save',
        'otherVbaEventsImplemented': false,
      };
}

extension _BeforeInsertAllocatorGenerator on ProjectGenerator {
  GeneratedBeforeInsertAllocator? _resolveBeforeInsertAllocator(
      AnalysisProject project, AnalysisTable table) {
    final selected = _resolveFrontendForm(project, table);
    if (selected == null || table.primaryKey?.columns.length != 1) return null;
    final forms = ((project.raw['forms'] as List?) ?? const [])
        .whereType<Map>()
        .where((f) => f['name'] == selected.name)
        .toList();
    if (forms.length != 1) return null;
    final form = forms.single;
    if ((form['events'] as Map?)?['BeforeInsert'] != '[Event Procedure]' ||
        (form['recordSource']?.toString() ?? '').toLowerCase() !=
            table.name.toLowerCase()) {
      return null;
    }
    final source = form['rawVbaCode'];
    if (source is! String) return null;
    final procedures = RegExp(
            r'^[ \t]*(?:Private[ \t]+|Public[ \t]+)?Sub[ \t]+Form_BeforeInsert\b[\s\S]*?^[ \t]*End[ \t]+Sub[ \t]*\r?$',
            multiLine: true,
            caseSensitive: false)
        .allMatches(source)
        .toList();
    if (procedures.length != 1) return null;
    final procedure = procedures.single.group(0)!;
    // Match every statement, including signature, both branches and End Sub.
    // Unsupported syntax/comments/extra actions are refused, never discarded.
    final match = RegExp(
            r'^\s*(?:Private\s+|Public\s+)?Sub\s+Form_BeforeInsert\s*\(\s*Cancel\s+As\s+Integer\s*\)\s+'
            r'If\s+DCount\s*\(\s*"\*"\s*,\s*"([A-Za-z_][A-Za-z0-9_]*)"\s*\)\s*<\s*1\s+Then\s+'
            r'Me\.([A-Za-z_][A-Za-z0-9_]*)\s*=\s*1\s+Else\s+'
            r'Me\.([A-Za-z_][A-Za-z0-9_]*)\s*=\s*DMax\s*\(\s*"([A-Za-z_][A-Za-z0-9_]*)"\s*,\s*"([A-Za-z_][A-Za-z0-9_]*)"\s*\)\s*\+\s*1\s+'
            r'End\s+If\s+End\s+Sub\s*$',
            caseSensitive: false)
        .firstMatch(procedure);
    if (match == null) return null;
    final key = _getPrimaryKey(table);
    bool same(String? value, String expected) =>
        value?.toLowerCase() == expected.toLowerCase();
    if (!same(match[1], table.name) ||
        !same(match[5], table.name) ||
        !same(match[2], key.name) ||
        !same(match[3], key.name) ||
        !same(match[4], key.name) ||
        key.isAutoNumber ||
        key.isCalculated ||
        _routeParameterType(key) != 'int' ||
        (key.validationRule?.trim().isNotEmpty ?? false)) {
      return null;
    }
    final controls = ((form['controls'] as List?) ?? const [])
        .whereType<Map>()
        .where((c) => same(c['controlSource']?.toString(), key.name))
        .toList();
    if (controls.length != 1) return null;
    final properties = controls.single['properties'];
    // Access default Enabled=True; NotDefault was verified as False by COM export.
    // Do not infer editability when source property provenance is absent.
    if (properties is! Map ||
        !const ['NotDefault', '0', 'False'].contains(properties['Enabled'])) {
      return null;
    }
    return GeneratedBeforeInsertAllocator(
      formName: selected.name,
      tableRuntimeName: tableRuntimeName(table),
      columnRuntimeName: columnRuntimeName(key),
      sourceSha256: sha256.convert(utf8.encode(procedure)).toString(),
      controlProperties: Map<String, String>.fromEntries(properties.entries
          .where((e) => e.key == 'Enabled' || e.key == 'Locked')
          .map((e) => MapEntry(e.key.toString(), e.value.toString()))),
    );
  }
}

String _quotedBehaviorIdentifier(String name) =>
    '"${name.replaceAll('"', '""')}"';

Map<String, Object?> _beforeInsertTemplateContext(
    GeneratedBackendModule module) {
  final allocator = module.beforeInsertAllocator;
  if (allocator == null) return const {'hasBeforeInsertAllocator': false};
  final table = _quotedBehaviorIdentifier(allocator.tableRuntimeName);
  final column = _quotedBehaviorIdentifier(allocator.columnRuntimeName);
  return {
    'hasBeforeInsertAllocator': true,
    'allocatorColumnLiteral': _dartStringLiteral(allocator.columnRuntimeName),
    'allocatorLockStatement':
        _dartStringLiteral('LOCK TABLE $table IN SHARE ROW EXCLUSIVE MODE'),
    'allocatorNextQuery': _dartStringLiteral(
        'SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE MAX($column) + 1 END AS next_id FROM $table'),
    'allocatorSourceSha256': allocator.sourceSha256,
  };
}
