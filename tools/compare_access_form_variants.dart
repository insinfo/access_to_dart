import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:args/args.dart';
import 'package:jackcess_dart/jackcess_dart.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption(
      'baseline',
      abbr: 'b',
      help: 'Arquivo .accdb base.',
    )
    ..addOption(
      'modified',
      abbr: 'm',
      help: 'Arquivo .accdb modificado.',
    )
    ..addOption(
      'password',
      help: 'Senha opcional para ambos os .accdb.',
    )
    ..addOption(
      'output',
      abbr: 'o',
      help: 'Arquivo de saida markdown/json. Se omitido, imprime em stdout.',
    )
    ..addOption(
      'format',
      allowed: const ['markdown', 'json'],
      defaultsTo: 'markdown',
      help: 'Formato do relatorio.',
    )
    ..addOption(
      'focus-object',
      defaultsTo: 'frmDiffProbe',
      help: 'Objeto principal a destacar em MSysObjects.',
    )
    ..addOption(
      'max-byte-diffs',
      defaultsTo: '24',
      help: 'Quantidade maxima de offsets diferentes por stream.',
    )
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Mostra esta ajuda.',
    );

  final args = parser.parse(arguments);
  final baselinePath = args['baseline'] as String?;
  final modifiedPath = args['modified'] as String?;
  if (args['help'] as bool || baselinePath == null || modifiedPath == null) {
    stdout.writeln(parser.usage);
    return;
  }

  final password = args['password'] as String?;
  final outputPath = args['output'] as String?;
  final format = args['format'] as String;
  final focusObject = args['focus-object'] as String;
  final maxByteDiffs = int.tryParse(args['max-byte-diffs'] as String? ?? '24') ?? 24;

  final baselineDb = await AccessDatabase.openPath(baselinePath, password: password);
  final modifiedDb = await AccessDatabase.openPath(modifiedPath, password: password);
  try {
    final report = await _buildComparisonReport(
      baselineDb: baselineDb,
      modifiedDb: modifiedDb,
      baselinePath: baselinePath,
      modifiedPath: modifiedPath,
      focusObject: focusObject,
      maxByteDiffs: maxByteDiffs,
    );
    final output = format == 'json'
        ? const JsonEncoder.withIndent('  ').convert(report)
        : _renderMarkdown(report);

    if (outputPath == null || outputPath.trim().isEmpty) {
      stdout.writeln(output);
    } else {
      final file = File(outputPath);
      file.parent.createSync(recursive: true);
      file.writeAsStringSync(output);
      stdout.writeln('Comparacao salva em: ${file.absolute.path}');
    }
  } finally {
    baselineDb.close();
    modifiedDb.close();
  }
}

Future<Map<String, dynamic>> _buildComparisonReport({
  required AccessDatabase baselineDb,
  required AccessDatabase modifiedDb,
  required String baselinePath,
  required String modifiedPath,
  required String focusObject,
  required int maxByteDiffs,
}) async {
  final baselineReader =
      TableReader(format: baselineDb.format, pageChannel: baselineDb.pageChannel);
  final modifiedReader =
      TableReader(format: modifiedDb.format, pageChannel: modifiedDb.pageChannel);

  final baselineCatalog = await baselineReader.readAllRows(2);
  final modifiedCatalog = await modifiedReader.readAllRows(2);

  final baselineStorageId = _findTableId(baselineCatalog, 'MSysAccessStorage');
  final modifiedStorageId = _findTableId(modifiedCatalog, 'MSysAccessStorage');

  final baselineStorageRows = baselineStorageId == null
      ? const <Map<String, dynamic>>[]
      : await baselineReader.readAllRows(baselineStorageId);
  final modifiedStorageRows = modifiedStorageId == null
      ? const <Map<String, dynamic>>[]
      : await modifiedReader.readAllRows(modifiedStorageId);

  final storageDiffs = _compareStorageRows(
    baselineStorageRows,
    modifiedStorageRows,
    maxByteDiffs: maxByteDiffs,
  );

  final msysObjectsFocus = _compareCatalogObject(
    baselineCatalog,
    modifiedCatalog,
    focusObject,
  );

  final msysModules = await _compareNamedTable(
    baselineCatalog: baselineCatalog,
    modifiedCatalog: modifiedCatalog,
    baselineReader: baselineReader,
    modifiedReader: modifiedReader,
    tableName: 'MSysModules',
  );
  final msysModules2 = await _compareNamedTable(
    baselineCatalog: baselineCatalog,
    modifiedCatalog: modifiedCatalog,
    baselineReader: baselineReader,
    modifiedReader: modifiedReader,
    tableName: 'MSysModules2',
  );

  return <String, dynamic>{
    'generatedAt': DateTime.now().toIso8601String(),
    'baseline': File(baselinePath).absolute.path,
    'modified': File(modifiedPath).absolute.path,
    'focusObject': focusObject,
    'storageChanges': storageDiffs,
    'focusObjectMsysObjects': msysObjectsFocus,
    'msysModules': msysModules,
    'msysModules2': msysModules2,
    'summary': _buildSummary(
      storageDiffs: storageDiffs,
      msysObjectsFocus: msysObjectsFocus,
      msysModules: msysModules,
      msysModules2: msysModules2,
    ),
  };
}

int? _findTableId(List<Map<String, dynamic>> catalogRows, String tableName) {
  for (final row in catalogRows) {
    if (row['Name']?.toString() == tableName) {
      return row['Id'] as int?;
    }
  }
  return null;
}

List<Map<String, dynamic>> _compareStorageRows(
  List<Map<String, dynamic>> baselineRows,
  List<Map<String, dynamic>> modifiedRows, {
  required int maxByteDiffs,
}) {
  final result = <Map<String, dynamic>>[];
  final maxRows = max(baselineRows.length, modifiedRows.length);

  for (var index = 0; index < maxRows; index++) {
    final baseline = index < baselineRows.length ? baselineRows[index] : null;
    final modified = index < modifiedRows.length ? modifiedRows[index] : null;

    if (baseline == null || modified == null) {
      result.add(<String, dynamic>{
        'index': index,
        'kind': 'row-count-mismatch',
        'baselineName': baseline?['Name'],
        'modifiedName': modified?['Name'],
      });
      continue;
    }

    final baselineName = baseline['Name']?.toString();
    final modifiedName = modified['Name']?.toString();
    final baselineBytes = _asBytes(baseline['Lv']);
    final modifiedBytes = _asBytes(modified['Lv']);
    final sameName = baselineName == modifiedName;
    final sameBytes = _sameBytes(baselineBytes, modifiedBytes);
    if (sameName && sameBytes) {
      continue;
    }

    result.add(<String, dynamic>{
      'index': index,
      'baselineName': baselineName,
      'modifiedName': modifiedName,
      'baselineLength': baselineBytes?.length,
      'modifiedLength': modifiedBytes?.length,
      if (!sameName) 'nameChanged': true,
      if (!sameBytes)
        'byteDiffs': _collectByteDiffs(
          baselineBytes ?? const <int>[],
          modifiedBytes ?? const <int>[],
          maxItems: maxByteDiffs,
        ),
      if (!sameBytes)
        'interestingStrings': _changedPrintableStrings(
          baselineBytes ?? const <int>[],
          modifiedBytes ?? const <int>[],
        ),
    });
  }

  return result;
}

Map<String, dynamic> _compareCatalogObject(
  List<Map<String, dynamic>> baselineCatalog,
  List<Map<String, dynamic>> modifiedCatalog,
  String objectName,
) {
  final baseline = baselineCatalog.cast<Map<String, dynamic>?>().firstWhere(
        (row) => row?['Name']?.toString() == objectName,
        orElse: () => null,
      );
  final modified = modifiedCatalog.cast<Map<String, dynamic>?>().firstWhere(
        (row) => row?['Name']?.toString() == objectName,
        orElse: () => null,
      );

  return <String, dynamic>{
    'baseline': baseline == null ? null : _selectCatalogColumns(baseline),
    'modified': modified == null ? null : _selectCatalogColumns(modified),
  };
}

Map<String, dynamic> _selectCatalogColumns(Map<String, dynamic> row) {
  return <String, dynamic>{
    'Name': row['Name'],
    'Type': row['Type'],
    'Flags': row['Flags'],
    'LvLength': _asBytes(row['Lv'])?.length,
    'LvExtraLength': _asBytes(row['LvExtra'])?.length,
    'LvModuleLength': _asBytes(row['LvModule'])?.length,
  };
}

Future<Map<String, dynamic>> _compareNamedTable({
  required List<Map<String, dynamic>> baselineCatalog,
  required List<Map<String, dynamic>> modifiedCatalog,
  required TableReader baselineReader,
  required TableReader modifiedReader,
  required String tableName,
}) async {
  final baselineId = _findTableId(baselineCatalog, tableName);
  final modifiedId = _findTableId(modifiedCatalog, tableName);

  final baselineRows = baselineId == null
      ? const <Map<String, dynamic>>[]
      : await baselineReader.readAllRows(baselineId);
  final modifiedRows = modifiedId == null
      ? const <Map<String, dynamic>>[]
      : await modifiedReader.readAllRows(modifiedId);

  return <String, dynamic>{
    'existsInBaseline': baselineId != null,
    'existsInModified': modifiedId != null,
    'baselineRowCount': baselineRows.length,
    'modifiedRowCount': modifiedRows.length,
    'differences': _compareTableRows(baselineRows, modifiedRows),
  };
}

List<Map<String, dynamic>> _compareTableRows(
  List<Map<String, dynamic>> baselineRows,
  List<Map<String, dynamic>> modifiedRows,
) {
  final result = <Map<String, dynamic>>[];
  final maxRows = max(baselineRows.length, modifiedRows.length);
  for (var index = 0; index < maxRows; index++) {
    final baseline = index < baselineRows.length ? baselineRows[index] : null;
    final modified = index < modifiedRows.length ? modifiedRows[index] : null;
    if (baseline == null || modified == null) {
      result.add(<String, dynamic>{
        'index': index,
        'kind': 'row-count-mismatch',
      });
      continue;
    }

    final baselineSummary = _summarizeRow(baseline);
    final modifiedSummary = _summarizeRow(modified);
    if (const DeepCollectionEqualityLite().equals(baselineSummary, modifiedSummary)) {
      continue;
    }

    result.add(<String, dynamic>{
      'index': index,
      'baseline': baselineSummary,
      'modified': modifiedSummary,
    });
  }
  return result;
}

Map<String, dynamic> _summarizeRow(Map<String, dynamic> row) {
  final result = <String, dynamic>{};
  for (final entry in row.entries) {
    final value = entry.value;
    if (value is List<int>) {
      result[entry.key] = '<bytes len=${value.length} hash=${_simpleHash(value)}>';
    } else {
      result[entry.key] = value;
    }
  }
  return result;
}

Map<String, dynamic> _buildSummary({
  required List<Map<String, dynamic>> storageDiffs,
  required Map<String, dynamic> msysObjectsFocus,
  required Map<String, dynamic> msysModules,
  required Map<String, dynamic> msysModules2,
}) {
  final changedStreamNames = <String>{};
  for (final entry in storageDiffs) {
    final name = entry['baselineName']?.toString() ?? entry['modifiedName']?.toString();
    if (name != null && name.isNotEmpty) {
      changedStreamNames.add(name);
    }
  }

  return <String, dynamic>{
    'changedStorageEntries': storageDiffs.length,
    'changedStorageNames': changedStreamNames.toList()..sort(),
    'focusObjectChanged':
        msysObjectsFocus['baseline'].toString() != msysObjectsFocus['modified'].toString(),
    'msysModulesChanged':
        ((msysModules['differences'] as List<dynamic>? ?? const <dynamic>[]).isNotEmpty),
    'msysModules2Changed':
        ((msysModules2['differences'] as List<dynamic>? ?? const <dynamic>[]).isNotEmpty),
  };
}

List<Map<String, dynamic>> _collectByteDiffs(
  List<int> baseline,
  List<int> modified, {
  required int maxItems,
}) {
  final diffs = <Map<String, dynamic>>[];
  final sharedLength = min(baseline.length, modified.length);
  for (var index = 0; index < sharedLength; index++) {
    if (baseline[index] == modified[index]) {
      continue;
    }
    diffs.add(<String, dynamic>{
      'offset': index,
      'baseline': baseline[index],
      'modified': modified[index],
    });
    if (diffs.length >= maxItems) {
      break;
    }
  }

  if (diffs.length < maxItems && baseline.length != modified.length) {
    diffs.add(<String, dynamic>{
      'offset': sharedLength,
      'baseline': '<len=${baseline.length}>',
      'modified': '<len=${modified.length}>',
    });
  }
  return diffs;
}

Map<String, dynamic> _changedPrintableStrings(List<int> baseline, List<int> modified) {
  final before = _extractPrintableStrings(baseline).take(20).toSet();
  final after = _extractPrintableStrings(modified).take(20).toSet();
  final onlyBefore = before.difference(after).toList()..sort();
  final onlyAfter = after.difference(before).toList()..sort();
  return <String, dynamic>{
    if (onlyBefore.isNotEmpty) 'onlyBaseline': onlyBefore.take(5).toList(),
    if (onlyAfter.isNotEmpty) 'onlyModified': onlyAfter.take(5).toList(),
  };
}

Iterable<String> _extractPrintableStrings(List<int> bytes) sync* {
  final emitted = <String>{};
  final ascii = StringBuffer();
  for (final byte in bytes) {
    final isPrintable = byte >= 32 && byte <= 126;
    if (isPrintable) {
      ascii.writeCharCode(byte);
      continue;
    }
    if (ascii.length >= 4) {
      final value = ascii.toString();
      if (emitted.add(value)) {
        yield value;
      }
    }
    ascii.clear();
  }
  if (ascii.length >= 4) {
    final value = ascii.toString();
    if (emitted.add(value)) {
      yield value;
    }
  }

  final wide = StringBuffer();
  for (var index = 0; index + 1 < bytes.length; index += 2) {
    final low = bytes[index];
    final high = bytes[index + 1];
    final isPrintableWide = high == 0 && low >= 32 && low <= 126;
    if (isPrintableWide) {
      wide.writeCharCode(low);
      continue;
    }
    if (wide.length >= 4) {
      final value = wide.toString();
      if (emitted.add(value)) {
        yield value;
      }
    }
    wide.clear();
  }
  if (wide.length >= 4) {
    final value = wide.toString();
    if (emitted.add(value)) {
      yield value;
    }
  }
}

List<int>? _asBytes(Object? value) {
  if (value is List<int>) {
    return value;
  }
  return null;
}

bool _sameBytes(List<int>? left, List<int>? right) {
  if (left == null || right == null) {
    return left == right;
  }
  if (left.length != right.length) {
    return false;
  }
  for (var index = 0; index < left.length; index++) {
    if (left[index] != right[index]) {
      return false;
    }
  }
  return true;
}

int _simpleHash(List<int> bytes) {
  var hash = 2166136261;
  for (final byte in bytes) {
    hash ^= byte;
    hash = (hash * 16777619) & 0xFFFFFFFF;
  }
  return hash;
}

String _renderMarkdown(Map<String, dynamic> report) {
  final buffer = StringBuffer();
  final storageChanges =
      (report['storageChanges'] as List<dynamic>? ?? const <dynamic>[])
          .whereType<Map>()
          .map((entry) => Map<String, dynamic>.from(entry.cast<String, dynamic>()))
          .toList(growable: false);
  final summary = Map<String, dynamic>.from(
    (report['summary'] as Map).cast<String, dynamic>(),
  );

  buffer.writeln('# Comparacao de Variantes Access');
  buffer.writeln();
  buffer.writeln('- baseline: `${report['baseline']}`');
  buffer.writeln('- modified: `${report['modified']}`');
  buffer.writeln('- objeto foco: `${report['focusObject']}`');
  buffer.writeln('- gerado em: `${report['generatedAt']}`');
  buffer.writeln();

  buffer.writeln('## Resumo');
  buffer.writeln();
  buffer.writeln('- entradas alteradas em `MSysAccessStorage`: `${summary['changedStorageEntries']}`');
  buffer.writeln('- nomes alterados: `${(summary['changedStorageNames'] as List<dynamic>).join(', ')}`');
  buffer.writeln('- `MSysObjects` do objeto foco mudou: `${summary['focusObjectChanged']}`');
  buffer.writeln('- `MSysModules` mudou: `${summary['msysModulesChanged']}`');
  buffer.writeln('- `MSysModules2` mudou: `${summary['msysModules2Changed']}`');
  buffer.writeln();

  buffer.writeln('## MSysAccessStorage');
  buffer.writeln();
  for (final change in storageChanges) {
    buffer.writeln(
      '- indice `${change['index']}` `${change['baselineName']}` -> `${change['modifiedName']}`',
    );
    if (change['baselineLength'] != null || change['modifiedLength'] != null) {
      buffer.writeln(
        '  bytes: `${change['baselineLength']}` -> `${change['modifiedLength']}`',
      );
    }
    final byteDiffs =
        (change['byteDiffs'] as List<dynamic>? ?? const <dynamic>[])
            .whereType<Map>()
            .map((entry) => Map<String, dynamic>.from(entry.cast<String, dynamic>()))
            .toList(growable: false);
    for (final diff in byteDiffs.take(8)) {
      buffer.writeln(
        '  offset `${diff['offset']}`: `${diff['baseline']}` -> `${diff['modified']}`',
      );
    }
    final strings = change['interestingStrings'];
    if (strings is Map && strings.isNotEmpty) {
      if (strings['onlyBaseline'] is List &&
          (strings['onlyBaseline'] as List).isNotEmpty) {
        buffer.writeln(
          '  strings so baseline: `${(strings['onlyBaseline'] as List).join('`, `')}`',
        );
      }
      if (strings['onlyModified'] is List &&
          (strings['onlyModified'] as List).isNotEmpty) {
        buffer.writeln(
          '  strings so modified: `${(strings['onlyModified'] as List).join('`, `')}`',
        );
      }
    }
  }
  buffer.writeln();

  buffer.writeln('## MSysObjects');
  buffer.writeln();
  final focus = Map<String, dynamic>.from(
    (report['focusObjectMsysObjects'] as Map).cast<String, dynamic>(),
  );
  buffer.writeln('baseline: `${jsonEncode(focus['baseline'])}`');
  buffer.writeln();
  buffer.writeln('modified: `${jsonEncode(focus['modified'])}`');
  buffer.writeln();

  _appendNamedTable(buffer, 'MSysModules', report['msysModules']);
  _appendNamedTable(buffer, 'MSysModules2', report['msysModules2']);

  return buffer.toString().trimRight();
}

void _appendNamedTable(StringBuffer buffer, String name, Object? value) {
  final table = value is Map
      ? Map<String, dynamic>.from(value.cast<String, dynamic>())
      : <String, dynamic>{};
  buffer.writeln('## $name');
  buffer.writeln();
  buffer.writeln('- existe no baseline: `${table['existsInBaseline']}`');
  buffer.writeln('- existe no modified: `${table['existsInModified']}`');
  buffer.writeln('- rows baseline: `${table['baselineRowCount']}`');
  buffer.writeln('- rows modified: `${table['modifiedRowCount']}`');
  final differences =
      (table['differences'] as List<dynamic>? ?? const <dynamic>[])
          .whereType<Map>()
          .map((entry) => Map<String, dynamic>.from(entry.cast<String, dynamic>()))
          .toList(growable: false);
  if (differences.isEmpty) {
    buffer.writeln('- sem diferencas detectadas');
  } else {
    for (final diff in differences.take(6)) {
      buffer.writeln('- row `${diff['index']}` mudou');
      if (diff['baseline'] != null) {
        buffer.writeln('  baseline: `${jsonEncode(diff['baseline'])}`');
      }
      if (diff['modified'] != null) {
        buffer.writeln('  modified: `${jsonEncode(diff['modified'])}`');
      }
    }
  }
  buffer.writeln();
}

class DeepCollectionEqualityLite {
  const DeepCollectionEqualityLite();

  bool equals(Object? left, Object? right) {
    if (identical(left, right)) {
      return true;
    }
    if (left is Map && right is Map) {
      if (left.length != right.length) {
        return false;
      }
      for (final key in left.keys) {
        if (!right.containsKey(key)) {
          return false;
        }
        if (!equals(left[key], right[key])) {
          return false;
        }
      }
      return true;
    }
    if (left is List && right is List) {
      if (left.length != right.length) {
        return false;
      }
      for (var index = 0; index < left.length; index++) {
        if (!equals(left[index], right[index])) {
          return false;
        }
      }
      return true;
    }
    return left == right;
  }
}
