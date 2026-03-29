import 'analysis_model.dart';

class AnalysisBackendLinker {
  Map<String, dynamic> mergeLinkedBackendAnalysis(
    Map<String, dynamic> frontendAnalysis,
    Map<String, dynamic> backendAnalysis,
  ) {
    final frontendProject = AnalysisProject.fromJson(frontendAnalysis);

    final merged = Map<String, dynamic>.from(frontendAnalysis);
    merged['backend_analysis'] = backendAnalysis;

    final localTables = ((frontendAnalysis['tables'] as List?) ?? const [])
        .whereType<Map>()
        .map((table) => Map<String, dynamic>.from(table.cast<String, dynamic>()))
        .toList(growable: true);
    final backendTables = ((backendAnalysis['tables'] as List?) ?? const [])
        .whereType<Map>()
        .map((table) => Map<String, dynamic>.from(table.cast<String, dynamic>()))
        .toList(growable: false);
    final backendRelationships = ((backendAnalysis['relationships'] as List?) ?? const [])
        .whereType<Map>()
        .map((relationship) => Map<String, dynamic>.from(relationship.cast<String, dynamic>()))
        .toList(growable: false);

    final localTableKeys = <String>{
      for (final table in frontendProject.tables) _lookupKey(table.name),
    };
    final backendTableByKey = <String, Map<String, dynamic>>{
      for (final table in backendTables) _lookupKey(table['name'] as String? ?? ''): table,
    };

    final linkedSourceByAlias = <String, String>{};
    for (final linked in frontendProject.sourceOverlayLinkedTables) {
      linkedSourceByAlias[_lookupKey(linked.name)] = linked.sourceTableName ?? linked.name;
      if (linked.sourceTableName case final sourceTableName?) {
        linkedSourceByAlias[_lookupKey(sourceTableName)] = sourceTableName;
      }
    }

    final resolvedBackendTables = <Map<String, dynamic>>[];
    final seenResolvedKeys = <String>{};
    for (final sourceName in frontendProject.effectiveRecordSources) {
      final sourceKey = _lookupKey(sourceName);
      if (sourceKey.isEmpty || localTableKeys.contains(sourceKey)) {
        continue;
      }

      final backendName = linkedSourceByAlias[sourceKey] ?? sourceName;
      final backendKey = _lookupKey(backendName);
      final backendTable = backendTableByKey[backendKey];
      if (backendTable == null || !seenResolvedKeys.add(backendKey)) {
        continue;
      }
      resolvedBackendTables.add(Map<String, dynamic>.from(backendTable));
    }

    if (localTables.isEmpty && resolvedBackendTables.isEmpty && backendTables.isNotEmpty) {
      for (final table in backendTables) {
        final key = _lookupKey(table['name'] as String? ?? '');
        if (key.isNotEmpty && seenResolvedKeys.add(key)) {
          resolvedBackendTables.add(Map<String, dynamic>.from(table));
        }
      }
    }

    final effectiveTables = <Map<String, dynamic>>[
      ...localTables,
      ...resolvedBackendTables,
    ];
    final effectiveTableNames = <String>{
      for (final table in effectiveTables) table['name'] as String? ?? '',
    }..remove('');

    final filteredRelationships = backendRelationships.where((relationship) {
      final fromTable = relationship['fromTable'] as String? ?? '';
      final toTable = relationship['toTable'] as String? ?? '';
      return effectiveTableNames.contains(fromTable) &&
          effectiveTableNames.contains(toTable);
    }).toList(growable: false);

    merged['tables'] = effectiveTables;
    merged['relationships'] = filteredRelationships;

    final mergedSummary = Map<String, dynamic>.from(
      (frontendAnalysis['summary'] as Map?)?.cast<String, dynamic>() ?? const <String, dynamic>{},
    );
    mergedSummary['tables'] = effectiveTables.length;
    mergedSummary['relationships'] = filteredRelationships.length;
    merged['summary'] = mergedSummary;

    return merged;
  }

  String _lookupKey(String value) => AnalysisProject.lookupKey(value);
}