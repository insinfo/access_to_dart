import 'analysis_model.dart';
import 'access_src_model.dart';
import 'migration_identifier_style.dart';
import 'migration_not_null_mode.dart';
import 'migration_statement_builder.dart';

class AnalysisOverlayMerger {
  Map<String, dynamic> mergeSourceOverlay(
    Map<String, dynamic> analysis,
    AccessSrcProject sourceProject,
  ) {
    _mergeForms(analysis, sourceProject.forms);
    if (sourceProject.reports.isNotEmpty) {
      analysis['reports'] = _mergeReportRecords(
        (analysis['reports'] as List?) ?? const [],
        sourceProject.reports.map((report) => report.toJson()).toList(),
      );
      final summary = analysis['summary'];
      if (summary is Map) {
        analysis['summary'] = <String, dynamic>{
          ...summary.cast<String, dynamic>(),
          'reports': (analysis['reports'] as List).length,
        };
      }
    }
    final rawTables = ((analysis['tables'] as List?) ?? const [])
        .whereType<Map>()
        .map((table) => table.cast<String, dynamic>())
        .toList(growable: false);
    if (rawTables.isEmpty || sourceProject.tables.isEmpty) {
      return analysis;
    }

    final sourceTablesByKey = <String, AccessSrcTable>{
      for (final table in sourceProject.tables) _lookupKey(table.name): table,
    };

    final mergedTables = rawTables.map((table) {
      final sourceTable = sourceTablesByKey[_lookupKey(table['name'] as String? ?? '')];
      if (sourceTable == null) {
        return table;
      }
      return _mergeTable(table, sourceTable);
    }).toList(growable: false);

    analysis['tables'] = mergedTables;

    final mergedProject = AnalysisProject.fromJson(analysis);
    final ddlBuilder = MigrationStatementBuilder(
      notNullMode: MigrationNotNullMode.strict,
      identifierPolicy: const MigrationIdentifierPolicy(
        style: MigrationIdentifierStyle.snakeAscii,
      ),
    );

    for (var index = 0; index < mergedTables.length; index++) {
      mergedTables[index]['postgres_ddl'] =
          ddlBuilder.buildCreateTableStatement(mergedProject.tables[index]);
    }

    return analysis;
  }

  // Relatórios, seções e controles mantêm a ordem do export e os metadados
  // binários que não têm equivalente no texto, inclusive identificadores.
  List<Map<String, dynamic>> _mergeReportRecords(
    List<Object?> binaryRecords,
    List<Map<String, Object?>> sourceRecords,
  ) {
    final binary = binaryRecords
        .whereType<Map>()
        .map((record) => Map<String, dynamic>.from(record))
        .toList();
    final result = <Map<String, dynamic>>[];
    final consumed = <int>{};
    for (var sourceIndex = 0;
        sourceIndex < sourceRecords.length;
        sourceIndex++) {
      final source = sourceRecords[sourceIndex];
      final name = source['name'] as String?;
      var index = -1;
      for (var i = 0; i < binary.length; i++) {
        if (consumed.contains(i)) continue;
        final match = name == null
            ? i == sourceIndex &&
                binary[i]['name'] == null &&
                binary[i]['type'] == source['type']
            : (binary[i]['name'] as String? ?? '').toLowerCase() ==
                name.toLowerCase();
        if (match) {
          index = i;
          break;
        }
      }
      final target = index < 0 ? <String, dynamic>{} : binary[index];
      if (index >= 0) consumed.add(index);
      for (final entry in source.entries) {
        final value = entry.value;
        if (value == null) continue;
        if (entry.key == 'name' && target['name'] != null) continue;
        if (entry.key == 'controls' ||
            entry.key == 'sections' ||
            entry.key == 'groupLevels') {
          final records = (value as List)
              .whereType<Map>()
              .map((record) => record.cast<String, Object?>())
              .toList();
          target[entry.key] = _mergeReportRecords(
              (target[entry.key] as List?) ?? const [], records);
        } else if (entry.key == 'macros' || entry.key == 'properties' ||
            entry.key == 'macroDefinitions' || entry.key == 'events') {
          target[entry.key] = <String, dynamic>{
            ...((target[entry.key] as Map?)?.cast<String, dynamic>() ??
                const {}),
            ...(value as Map).cast<String, dynamic>(),
          };
        } else {
          target[entry.key] = value;
        }
      }
      result.add(target);
    }
    for (var i = 0; i < binary.length; i++) {
      if (!consumed.contains(i)) result.add(binary[i]);
    }
    return result;
  }

  void _mergeForms(
    Map<String, dynamic> analysis,
    List<AccessSrcForm> sourceForms,
  ) {
    if (sourceForms.isEmpty) return;
    // Os exports fornecem propriedades visuais; o catálogo mantém identidade e
    // metadados binários. Ausência de uma propriedade no export não a apaga.
    final forms = ((analysis['forms'] as List?) ?? const [])
        .whereType<Map>()
        .map((form) => Map<String, dynamic>.from(form))
        .toList();
    for (final source in sourceForms) {
      final index = forms.indexWhere((form) =>
          (form['name'] as String? ?? '').toLowerCase() ==
          source.name.toLowerCase());
      final form =
          index < 0 ? <String, dynamic>{'name': source.name} : forms[index];
      _copyPresentProperties(form, source.toJson(),
          const ['caption', 'recordSource', 'defaultView', 'rawVbaCode']);
      _mergeBehaviorMaps(form, source.toJson());
      if (source.macros.isNotEmpty) {
        form['macros'] = <String, dynamic>{
          ...((form['macros'] as Map?)?.cast<String, dynamic>() ?? const {}),
          ...source.macros,
        };
      }
      if (source.controls.isNotEmpty) {
        final binaryControls = ((form['controls'] as List?) ?? const [])
            .whereType<Map>()
            .map((control) => Map<String, dynamic>.from(control))
            .toList();
        final controls = <Map<String, dynamic>>[];
        final consumed = <int>{};
        // Mantém a ordem do export, sem descartar controles só do binário.
        for (final sourceControl in source.controls) {
          final controlIndex = binaryControls.indexWhere((control) =>
              (control['name'] as String? ?? '').toLowerCase() ==
              sourceControl.name.toLowerCase());
          final control = controlIndex < 0
              ? <String, dynamic>{'name': sourceControl.name}
              : binaryControls[controlIndex];
          if (controlIndex >= 0) consumed.add(controlIndex);
          _copyPresentProperties(control, sourceControl.toJson(),
              const ['type', 'controlSource', 'caption']);
          _mergeBehaviorMaps(control, sourceControl.toJson());
          if (sourceControl.macros.isNotEmpty) {
            control['macros'] = <String, dynamic>{
              ...((control['macros'] as Map?)?.cast<String, dynamic>() ??
                  const {}),
              ...sourceControl.macros,
            };
          }
          controls.add(control);
        }
        for (var index = 0; index < binaryControls.length; index++) {
          if (!consumed.contains(index)) controls.add(binaryControls[index]);
        }
        form['controls'] = controls;
      }
      if (index < 0) forms.add(form);
    }
    analysis['forms'] = forms;
    final summary = analysis['summary'];
    if (summary is Map) {
      analysis['summary'] = <String, dynamic>{
        ...summary.cast<String, dynamic>(),
        'forms': forms.length,
      };
    }
  }

  void _mergeBehaviorMaps(
      Map<String, dynamic> target, Map<String, Object?> source) {
    for (final key in const ['macroDefinitions', 'events']) {
      final values = (source[key] as Map?) ?? const {};
      if (values.isEmpty) continue;
      target[key] = <String, dynamic>{
        ...((target[key] as Map?)?.cast<String, dynamic>() ?? const {}),
        ...values.cast<String, dynamic>(),
      };
    }
  }

  void _copyPresentProperties(
    Map<String, dynamic> target,
    Map<String, Object?> source,
    List<String> keys,
  ) {
    for (final key in keys) {
      final value = source[key];
      if (value != null) target[key] = value;
    }
  }

  Map<String, dynamic> _mergeTable(
    Map<String, dynamic> table,
    AccessSrcTable sourceTable,
  ) {
    final merged = Map<String, dynamic>.from(table);
    final primaryKeyColumns = _extractPrimaryKeyColumns(table);
    final sourceColumnsByKey = <String, AccessSrcColumn>{
      for (final column in sourceTable.columns) _lookupKey(column.name): column,
    };

    final mergedColumns = ((table['columns'] as List?) ?? const [])
        .whereType<Map>()
        .map((column) => column.cast<String, dynamic>())
        .map((column) {
          final name = column['name'] as String? ?? '';
          final sourceColumn = sourceColumnsByKey[_lookupKey(name)];
          final updated = Map<String, dynamic>.from(column);
          final isRequired = (column['isRequired'] as bool? ?? false) ||
              primaryKeyColumns.contains(name) ||
              (sourceColumn?.required ?? false);
          updated['isRequired'] = isRequired;

          if (sourceColumn?.caption case final caption?) {
            if (caption.isNotEmpty) {
              updated['caption'] = caption;
            }
          }

          if (sourceColumn?.maxLength case final maxLength?) {
            updated['maxLength'] = maxLength;
          }

          if (sourceColumn?.defaultValue case final defaultValue?) {
            if (defaultValue.isNotEmpty) {
              updated['defaultValue'] = defaultValue;
            }
          }

          if (sourceColumn?.validationRule case final validationRule?) {
            if (validationRule.isNotEmpty) {
              updated['validationRule'] = validationRule;
            }
          }

          if (sourceColumn?.validationText case final validationText?) {
            if (validationText.isNotEmpty) {
              updated['validationText'] = validationText;
            }
          }

          if (sourceColumn?.format case final format?) {
            if (format.isNotEmpty) {
              updated['format'] = format;
            }
          }

          if (sourceColumn?.inputMask case final inputMask?) {
            if (inputMask.isNotEmpty) {
              updated['inputMask'] = inputMask;
            }
          }

          if (sourceColumn?.allowZeroLength case final allowZeroLength?) {
            updated['allowZeroLength'] = allowZeroLength;
          }

          final calculatedExpression = sourceColumn?.expression;
          if (calculatedExpression != null && calculatedExpression.isNotEmpty) {
            updated['calculatedExpression'] = calculatedExpression;
            updated['isCalculated'] = true;
          }
          return updated;
        })
        .toList(growable: false);

    merged['columns'] = mergedColumns;
    return merged;
  }

  Set<String> _extractPrimaryKeyColumns(Map<String, dynamic> table) {
    final names = <String>{};
    final indexes = ((table['indexes'] as List?) ?? const [])
        .whereType<Map>()
        .map((index) => index.cast<String, dynamic>());
    for (final index in indexes) {
      if (index['isPrimaryKey'] != true) {
        continue;
      }
      final columns = ((index['columns'] as List?) ?? const [])
          .whereType<Map>()
          .map((column) => column.cast<String, dynamic>());
      for (final column in columns) {
        final name = column['name'] as String?;
        if (name != null && name.isNotEmpty) {
          names.add(name);
        }
      }
    }
    return names;
  }

  String _lookupKey(String value) {
    final normalized = StringBuffer();
    for (final codeUnit in value.toLowerCase().codeUnits) {
      final isLetter = codeUnit >= 97 && codeUnit <= 122;
      final isDigit = codeUnit >= 48 && codeUnit <= 57;
      if (isLetter || isDigit) {
        normalized.writeCharCode(codeUnit);
      }
    }
    return normalized.toString();
  }
}