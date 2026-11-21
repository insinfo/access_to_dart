part of 'project_generator.dart';

extension _ComboColumnBehaviorGenerator on ProjectGenerator {
  List<String>? _lookupProjectionColumns(AnalysisProject project, String sql) {
    final resolved = _resolveLookupSource(project, sql);
    if (resolved == null || !sql.trimLeft().toUpperCase().startsWith('SELECT ')) {
      return null;
    }
    final statement = const AccessSqlClauseParser().parse(
        const AccessSqlTokenizer().tokenize(sql, preserveStringLiterals: true));
    if (statement == null) return null;
    final result = <String>[];
    for (final expression
        in _splitTopLevelExpressions(statement.selectTokens)) {
      if (!_isLookupBaseProjection(expression, resolved.table)) return null;
      final name = _extractProjectedColumnName(expression);
      final column =
          name == null ? null : _findColumnBySqlName(resolved.table, name);
      if (column == null ||
          !const ['String?', 'int?', 'double?', 'bool?']
              .contains(column.dartType)) {
        return null;
      }
      result.add(columnRuntimeName(column));
    }
    return result;
  }

  String? _comboBehaviorLookupSql(
      AnalysisProject project, AnalysisTable table, AnalysisColumn column) {
    final matches = _comboColumnBehaviors(project, table)
        .where((b) => b['field'] == columnRuntimeName(column))
        .toList();
    return matches.length == 1 ? matches.single['rowSource'] as String : null;
  }

  List<Map<String, Object?>> _comboColumnBehaviors(
      AnalysisProject project, AnalysisTable table) {
    final selected = _resolveFrontendForm(project, table);
    if (selected == null) return const [];
    final forms = ((project.raw['forms'] as List?) ?? const [])
        .whereType<Map>()
        .where((f) => f['name'] == selected.name)
        .toList();
    if (forms.length != 1) return const [];
    final form = forms.single;
    final code = form['rawVbaCode'];
    if (code is! String) return const [];
    final controls =
        ((form['controls'] as List?) ?? const []).whereType<Map>().toList();
    final result = <Map<String, Object?>>[];
    for (final control in controls) {
      final controlName = control['name']?.toString() ?? '';
      if (!RegExp(r'^[A-Za-z_][A-Za-z0-9_]*$').hasMatch(controlName) ||
          control['type'] != 'ComboBox' ||
          (control['events'] as Map?)?['OnClick'] != '[Event Procedure]') {
        continue;
      }
      final column = table.columns
          .where((c) =>
              c.name.toLowerCase() ==
              control['controlSource']?.toString().toLowerCase())
          .toList();
      if (column.length != 1 || column.single.allowMultipleValues == true) {
        continue;
      }
      final properties = control['properties'];
      if (properties is! Map ||
          !const [null, '1'].contains(properties['BoundColumn'])) {
        continue;
      }
      final sql = properties['RowSource']?.toString();
      if (sql == null) continue;
      final projections = _lookupProjectionColumns(project, sql);
      final lookup = _resolveLookupSource(project, sql);
      if (projections == null ||
          lookup == null ||
          projections.isEmpty ||
          projections.first != columnRuntimeName(lookup.valueColumn)) {
        continue;
      }
      final procedureName = '${controlName}_Click';
      final procedures = RegExp(
              '^[ \\t]*(?:Private[ \\t]+|Public[ \\t]+)?Sub[ \\t]+${RegExp.escape(procedureName)}\\b[\\s\\S]*?^[ \\t]*End[ \\t]+Sub[ \\t]*\\r?\$',
              multiLine: true,
              caseSensitive: false)
          .allMatches(code)
          .toList();
      if (procedures.length != 1) continue;
      final procedure = procedures.single.group(0)!;
      final body = RegExp(
              '^\\s*(?:Private\\s+|Public\\s+)?Sub\\s+${RegExp.escape(procedureName)}\\s*\\(\\s*\\)\\s*([\\s\\S]*?)\\s*End\\s+Sub\\s*\$',
              caseSensitive: false)
          .firstMatch(procedure)?[1];
      if (body == null) continue;
      final assignments = <Map<String, Object?>>[];
      var valid = true;
      for (final line in body
          .split(RegExp(r'\r?\n'))
          .where((line) => line.trim().isNotEmpty)) {
        final match = RegExp(
                r'^\s*Me\.([A-Za-z_][A-Za-z0-9_]*)\.Value\s*=\s*Me\.([A-Za-z_][A-Za-z0-9_]*)\.Column\(\s*(\d+)\s*\)\s*$',
                caseSensitive: false)
            .firstMatch(line);
        if (match == null ||
            match[2]!.toLowerCase() != controlName.toLowerCase()) {
          valid = false;
          break;
        }
        final targets = controls
            .where((c) =>
                c['name']?.toString().toLowerCase() == match[1]!.toLowerCase())
            .toList();
        if (targets.length != 1) {
          valid = false;
          break;
        }
        final destinations = table.columns
            .where((c) =>
                c.name.toLowerCase() ==
                targets.single['controlSource']?.toString().toLowerCase())
            .toList();
        final index = int.parse(match[3]!);
        if (destinations.length != 1 || index >= projections.length) {
          valid = false;
          break;
        }
        final target = destinations.single;
        final origin = lookup.table.columns
            .singleWhere((c) => columnRuntimeName(c) == projections[index]);
        if (target.dartType != 'String?' ||
            origin.dartType != 'String?' ||
            target.isCalculated ||
            target.isAutoNumber ||
            table.primaryKey?.columns.any((c) => c.name == target.name) ==
                true ||
            assignments.any((a) => a['target'] == columnRuntimeName(target))) {
          valid = false;
          break;
        }
        assignments.add({
          'target': columnRuntimeName(target),
          'column': index,
          'readOnly': const ['NotDefault', '0', 'False']
              .contains((targets.single['properties'] as Map?)?['Enabled'])
        });
      }
      if (!valid || assignments.isEmpty) continue;
      result.add({
        'field': columnRuntimeName(column.single),
        'control': controlName,
        'event': 'OnClick',
        'procedure': procedureName,
        'procedureSha256': sha256.convert(utf8.encode(procedure)).toString(),
        'assignments': assignments,
        'rowSource': sql,
        'otherVbaEventsImplemented': false
      });
    }
    return result;
  }
}
