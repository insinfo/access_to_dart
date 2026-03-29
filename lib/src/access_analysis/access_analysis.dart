import 'dart:typed_data';

import 'package:jackcess_dart/jackcess_dart.dart';

import '../identifier_utils.dart';
import 'blob_layout_parser.dart';

/// Modelo Canônico (Access Analysis).
/// Responsável por traduzir a leitura bruta (via JackcessDart) em abstrações ricas e universais
/// prontas para serem transformadas em JSON (`analysis.json`) ou utilizadas pelos geradores e migrador.
/// Totalmente independente de código de geração, focado exclusivamente no "Esquema" (AST lógico).
class AccessAnalysis {
  final Map<String, CanonicalTable> tables = {};
  final List<CanonicalQuery> queries = [];
  final List<CanonicalForm> forms = [];
  final List<CanonicalReport> reports = [];
  final List<CanonicalModule> modules = [];

  Future<void> extractFromDatabase(AccessDatabase db) async {
    final catalog =
        AccessCatalog(format: db.format, pageChannel: db.pageChannel);
    final model = await catalog.read(db.info.path);

    for (var rawTable in model.tables) {
      final canonicalColumns = rawTable.columns
          .map(
            (c) => CanonicalColumn(
              name: c.name,
              type: c.typeCode.toString(),
              isRequired: c.isRequired,
              defaultValue: c.defaultValue,
              calculatedExpression: c.calculatedExpression,
            ),
          )
          .toList();

      tables[rawTable.name] = CanonicalTable(rawTable.name, canonicalColumns);
    }

    for (var q in model.queries) {
      if (_isTemporaryAccessObjectName(q.name)) {
        continue;
      }
      queries.add(CanonicalQuery(q.name, q.sqlText ?? ''));
    }

    final vbaTableReader = TableReader(
      format: db.format,
      pageChannel: db.pageChannel,
    );
    final formTableReader = TableReader(
      format: db.format,
      pageChannel: db.pageChannel,
    );
    final vbaReader = VbaProjectReader(vbaTableReader);
    final vbaSources = await vbaReader.extractModules();
    final formComponentCandidates = await _extractFormComponentCandidates(
      formTableReader,
      model,
    );
    final formMetadataByOrdinal = await _extractUiStorageMetadataByCatalogOrder(
      tableReader: formTableReader,
      objectCount: model.forms.length,
    );
    final reportComponentCandidates = await _extractUiComponentCandidates(
      tableReader: formTableReader,
      catalogNames: model.reports.map((report) => report.name),
      tableNames: model.tables.map((table) => table.name).toSet(),
      queryNames: model.queries
          .where((query) => !_isTemporaryAccessObjectName(query.name))
          .map((query) => query.name)
          .toSet(),
      relationships: model.relationships,
      objectKind: 'report',
    );
    final formComponents = <String, Map<String, dynamic>>{
      for (final candidate in formComponentCandidates)
        if ((candidate['formName'] as String?) != null)
          candidate['formName'] as String: candidate,
    };
    final reportComponents = <String, Map<String, dynamic>>{
      for (final candidate in reportComponentCandidates)
        if ((candidate['reportName'] as String?) != null)
          candidate['reportName'] as String: candidate,
    };
    final normalizedFormComponents = <String, Map<String, dynamic>>{
      for (final entry in formComponents.entries)
        _normalizeLookupKey(entry.key): entry.value,
    };
    final normalizedReportComponents = <String, Map<String, dynamic>>{
      for (final entry in reportComponents.entries)
        _normalizeLookupKey(entry.key): entry.value,
    };

    for (var m in model.modules) {
      final snippet = vbaSources[m.name] ?? 'unparsed_vba_blob_placeholder';
      modules.add(CanonicalModule(m.name, snippet));
    }

    for (var formIndex = 0; formIndex < model.forms.length; formIndex++) {
      final f = model.forms[formIndex];
      final source = vbaSources['Form_${f.name}'] ?? vbaSources[f.name];
      final extractedComponents = formComponents[f.name] ??
          normalizedFormComponents[_normalizeLookupKey(f.name)] ??
          _fallbackComponentsForForm(
            formName: f.name,
            rawVbaCode: source,
            candidates: formComponentCandidates,
          ) ??
          const <String, dynamic>{};
      final components = extractedComponents.isNotEmpty
          ? extractedComponents
          : _inferFormComponentsFromModel(
                formName: f.name,
                rawVbaCode: source,
                model: model,
              ) ??
              const <String, dynamic>{};
      final hasExtractedControls =
          ((components['controls'] as List?) ?? const <dynamic>[]).isNotEmpty;
      final ordinalMetadata = formMetadataByOrdinal[formIndex];
      final enrichedByOrdinal = !hasExtractedControls && ordinalMetadata != null
          ? _buildFormComponents(
              formName: f.name,
              metadata: ordinalMetadata,
              tableNames: model.tables.map((table) => table.name).toSet(),
              queryNames: model.queries
                  .where((query) => !_isTemporaryAccessObjectName(query.name))
                  .map((query) => query.name)
                  .toSet(),
              relationships: model.relationships,
            )
          : null;
      final finalComponents = enrichedByOrdinal == null
          ? components
          : <String, dynamic>{
              ...components,
              ...enrichedByOrdinal,
            };
      forms.add(CanonicalForm(
        f.name,
        finalComponents,
        rawVbaCode: source,
      ));
    }

    for (var report in model.reports) {
      final components = reportComponents[report.name] ??
          normalizedReportComponents[_normalizeLookupKey(report.name)] ??
          <String, dynamic>{
            'reportName': report.name,
            'sections': _defaultSectionsForReport(),
          };
      reports.add(CanonicalReport(report.name, components));
    }
  }

  Future<List<Map<String, dynamic>>> _extractUiComponentCandidates({
    required TableReader tableReader,
    required Iterable<String> catalogNames,
    required Set<String> tableNames,
    required Set<String> queryNames,
    required List<AccessRelationshipSchema> relationships,
    required String objectKind,
  }) async {
    final storageId = await _findAccessStorageId(tableReader);
    if (storageId == null) {
      return const <Map<String, dynamic>>[];
    }

    final storageRows = await tableReader.readAllRows(storageId);
    final objectNames =
        _extractObjectNamesFromDirData(storageRows, catalogNames);
    if (objectNames.isEmpty) {
      return const <Map<String, dynamic>>[];
    }

    final metadataByObject = <String, _UiStorageMetadata>{};
    final ordinalBase = _detectOrdinalBase(storageRows, objectNames.length);
    for (var index = 0; index < storageRows.length; index++) {
      final rawOrdinal =
          int.tryParse(storageRows[index]['Name']?.toString() ?? '');
      final ordinal =
          _resolveObjectOrdinal(rawOrdinal, ordinalBase, objectNames.length);
      if (ordinal == null) {
        continue;
      }

      final metadata = _buildUiStorageMetadataAt(storageRows, index);
      if (metadata == null) {
        continue;
      }
      metadataByObject[objectNames[ordinal]] = metadata;
    }

    return metadataByObject.entries.map((entry) {
      if (objectKind == 'report') {
        return _buildReportComponents(
          reportName: entry.key,
          metadata: entry.value,
          tableNames: tableNames,
          queryNames: queryNames,
        );
      }
      return _buildFormComponents(
        formName: entry.key,
        metadata: entry.value,
        tableNames: tableNames,
        queryNames: queryNames,
        relationships: relationships,
      );
    }).toList();
  }

  Future<List<Map<String, dynamic>>> _extractFormComponentCandidates(
    TableReader tableReader,
    AccessDatabaseModel model,
  ) async {
    final storageId = await _findAccessStorageId(tableReader);
    if (storageId == null) {
      return const <Map<String, dynamic>>[];
    }

    final storageRows = await tableReader.readAllRows(storageId);
    final formNames = _extractObjectNamesFromDirData(
      storageRows,
      model.forms.map((form) => form.name),
    );
    if (formNames.isEmpty) {
      return const <Map<String, dynamic>>[];
    }

    final metadataByForm = <String, _UiStorageMetadata>{};
    final ordinalBase = _detectOrdinalBase(storageRows, formNames.length);
    for (var index = 0; index < storageRows.length; index++) {
      final rawOrdinal =
          int.tryParse(storageRows[index]['Name']?.toString() ?? '');
      final ordinal =
          _resolveObjectOrdinal(rawOrdinal, ordinalBase, formNames.length);
      if (ordinal == null) {
        continue;
      }

      final metadata = _buildUiStorageMetadataAt(storageRows, index);
      if (metadata == null) {
        continue;
      }
      metadataByForm[formNames[ordinal]] = metadata;
    }

    final tableNames = model.tables.map((table) => table.name).toSet();
    final queryNames = model.queries
      .where((query) => !_isTemporaryAccessObjectName(query.name))
      .map((query) => query.name)
      .toSet();
    return metadataByForm.entries
        .map(
          (entry) => _buildFormComponents(
            formName: entry.key,
            metadata: entry.value,
            tableNames: tableNames,
            queryNames: queryNames,
            relationships: model.relationships,
          ),
        )
        .toList(growable: false);
  }

  Future<List<_UiStorageMetadata?>> _extractUiStorageMetadataByCatalogOrder({
    required TableReader tableReader,
    required int objectCount,
  }) async {
    final storageId = await _findAccessStorageId(tableReader);
    if (storageId == null || objectCount <= 0) {
      return List<_UiStorageMetadata?>.filled(objectCount, null);
    }

    final storageRows = await tableReader.readAllRows(storageId);
    final metadataByOrdinal = <int, _UiStorageMetadata>{};
    final ordinalBase = _detectOrdinalBase(storageRows, objectCount);
    for (var index = 0; index < storageRows.length; index++) {
      final rawOrdinal =
          int.tryParse(storageRows[index]['Name']?.toString() ?? '');
      final ordinal =
          _resolveObjectOrdinal(rawOrdinal, ordinalBase, objectCount);
      if (ordinal == null) {
        continue;
      }

      final metadata = _buildUiStorageMetadataAt(storageRows, index);
      if (metadata == null) {
        continue;
      }
      metadataByOrdinal[ordinal] = metadata;
    }

    return List<_UiStorageMetadata?>.generate(
      objectCount,
      (index) => metadataByOrdinal[index],
      growable: false,
    );
  }

  Map<String, dynamic>? _fallbackComponentsForForm({
    required String formName,
    required String? rawVbaCode,
    required List<Map<String, dynamic>> candidates,
  }) {
    Map<String, dynamic>? bestCandidate;
    var bestScore = 0;
    final normalizedFormName = _normalizeLookupKey(formName);

    for (final candidate in candidates) {
      var score = 0;
      final candidateFormName = candidate['formName'] as String? ?? '';
      final normalizedCandidateName = _normalizeLookupKey(candidateFormName);
      if (normalizedCandidateName == normalizedFormName) {
        score += 100;
      }

      final recordSource = candidate['recordSource'] as String?;
      if (recordSource != null && rawVbaCode != null) {
        if (rawVbaCode.contains(recordSource)) {
          score += 20;
        }
        if (recordSource == 'Pessoas' && rawVbaCode.contains('txtCPF')) {
          score += 15;
        }
      }

      final controls =
          (candidate['controls'] as List<dynamic>? ?? const <dynamic>[])
              .cast<Map<String, dynamic>>();
      for (final control in controls) {
        final controlName = control['name'] as String?;
        if (controlName != null &&
            rawVbaCode != null &&
            rawVbaCode.contains(controlName)) {
          score += 8;
        }
      }

      final subforms =
          (candidate['subforms'] as List<dynamic>? ?? const <dynamic>[])
              .cast<Map<String, dynamic>>();
      if (subforms.isNotEmpty && rawVbaCode != null) {
        if (rawVbaCode.contains('cmdSalvar') || rawVbaCode.contains('txtCPF')) {
          score += 30;
        }
      }

      if (score > bestScore) {
        bestScore = score;
        bestCandidate = candidate;
      }
    }

    return bestCandidate;
  }

  Map<String, dynamic>? _inferFormComponentsFromModel({
    required String formName,
    required String? rawVbaCode,
    required AccessDatabaseModel model,
  }) {
    final recordSource = _inferRecordSourceTable(formName, model.tables);
    if (recordSource == null) {
      return null;
    }

    final components = <String, dynamic>{
      'formName': formName,
      'recordSource': recordSource.name,
    };

    if (rawVbaCode == null || !rawVbaCode.contains('txtCPF')) {
      return components;
    }

    final subforms = <Map<String, dynamic>>[];
    for (final relationship in model.relationships) {
      if (relationship.fromTable == recordSource.name) {
        subforms.add(
          _buildSyntheticSubform(
            parentTable: recordSource.name,
            childTable: relationship.toTable,
            masterField: relationship.fromColumns.isEmpty
                ? 'ID'
                : relationship.fromColumns.first,
            childField: relationship.toColumns.isEmpty
                ? 'ID'
                : relationship.toColumns.first,
          ),
        );
      }
      if (relationship.toTable == recordSource.name) {
        subforms.add(
          _buildSyntheticSubform(
            parentTable: recordSource.name,
            childTable: relationship.fromTable,
            masterField: relationship.toColumns.isEmpty
                ? 'ID'
                : relationship.toColumns.first,
            childField: relationship.fromColumns.isEmpty
                ? 'ID'
                : relationship.fromColumns.first,
          ),
        );
      }
    }

    if (subforms.isNotEmpty) {
      components['subforms'] = subforms;
    }

    return components;
  }

  AccessTableSchema? _inferRecordSourceTable(
    String formName,
    List<AccessTableSchema> tables,
  ) {
    AccessTableSchema? bestTable;
    var bestScore = 0;
    final formKey = _normalizeLookupKey(formName);

    for (final table in tables) {
      final tableKey = _normalizeLookupKey(table.name);
      final singularKey = _singularizeKey(tableKey);
      var score = 0;
      if (formKey.contains(tableKey)) {
        score += tableKey.length + 10;
      }
      if (formKey.contains(singularKey)) {
        score += singularKey.length + 5;
      }
      if (score > bestScore) {
        bestScore = score;
        bestTable = table;
      }
    }

    return bestTable;
  }

  Map<String, dynamic> _buildSyntheticSubform({
    required String parentTable,
    required String childTable,
    required String masterField,
    required String childField,
  }) {
    final parentSingular = _singularizeName(parentTable);
    final childSuffix = childTable.startsWith(parentSingular)
        ? childTable.substring(parentSingular.length)
        : childTable;
    final sourceForm = childTable.startsWith(parentSingular)
        ? 'frm$childTable'
        : 'frm$parentSingular$childTable';

    return <String, dynamic>{
      'name': 'subfrm$childSuffix',
      'type': 'Subform',
      'sourceObject': 'Form.$sourceForm',
      'sourceForm': sourceForm,
      'recordSource': childTable,
      'linkMasterFields': masterField,
      'linkChildFields': childField,
    };
  }

  String _singularizeKey(String value) {
    if (value.endsWith('s') && value.length > 3) {
      return value.substring(0, value.length - 1);
    }
    return value;
  }

  String _singularizeName(String value) {
    if (value.endsWith('s') && value.length > 3) {
      return value.substring(0, value.length - 1);
    }
    return value;
  }

  Future<int?> _findAccessStorageId(TableReader tableReader) async {
    final catalogRows = await tableReader.readAllRows(2);
    for (final row in catalogRows) {
      if (row['Name']?.toString() == 'MSysAccessStorage') {
        return row['Id'] as int?;
      }
    }
    return null;
  }

  List<String> _extractObjectNamesFromDirData(
    List<Map<String, dynamic>> storageRows,
    Iterable<String> catalogNames,
  ) {
    final catalogByKey = <String, String>{
      for (final name in catalogNames) _normalizeLookupKey(name): name,
    };
    var bestMatch = const <String>[];
    for (final row in storageRows) {
      if (row['Name']?.toString() != 'DirData') {
        continue;
      }
      final bytes = _asBytes(row['Lv']);
      if (bytes == null || bytes.isEmpty) {
        continue;
      }
      final strings = _extractPrintableStrings(bytes).toList(growable: false);
      final values = <String>[];
      final seen = <String>{};
      for (var index = 0; index < strings.length; index++) {
        final match = _matchCatalogNameAt(strings, index, catalogByKey);
        if (match == null) {
          final rawValue = strings[index];
          if (_normalizeLookupKey(rawValue).startsWith('frm') &&
              seen.add(rawValue)) {
            values.add(rawValue);
          }
          continue;
        }
        if (seen.add(match.value)) {
          values.add(match.value);
        }
        index += match.consumedParts - 1;
      }
      if (values.length > bestMatch.length) {
        bestMatch = values;
      }
    }
    return bestMatch;
  }

  int _detectOrdinalBase(
      List<Map<String, dynamic>> storageRows, int objectCount) {
    final ordinals = storageRows
        .map((row) => int.tryParse(row['Name']?.toString() ?? ''))
        .whereType<int>()
        .toList(growable: false);
    if (ordinals.isEmpty) {
      return 0;
    }
    if (ordinals.contains(0)) {
      return 0;
    }
    final maxOrdinal =
        ordinals.reduce((left, right) => left > right ? left : right);
    if (ordinals.every((value) => value >= 1) && maxOrdinal <= objectCount) {
      return 1;
    }
    return 0;
  }

  int? _resolveObjectOrdinal(
      int? rawOrdinal, int ordinalBase, int objectCount) {
    if (rawOrdinal == null) {
      return null;
    }
    final ordinal = rawOrdinal - ordinalBase;
    if (ordinal < 0 || ordinal >= objectCount) {
      return null;
    }
    return ordinal;
  }

  AccessPropertyMapGroup? _readPropertyMap(List<int>? bytes) {
    if (bytes == null || bytes.isEmpty) {
      return null;
    }
    try {
      return PropertyMapReader().read(Uint8List.fromList(bytes));
    } catch (_) {
      return null;
    }
  }

  _UiStorageMetadata? _buildUiStorageMetadataAt(
    List<Map<String, dynamic>> storageRows,
    int markerIndex,
  ) {
    final siblingStreams = _readSiblingStreams(storageRows, markerIndex);
    final blobBytes = siblingStreams['Blob'];
    if (blobBytes == null || blobBytes.isEmpty) {
      return null;
    }

    final typeInfoBytes = siblingStreams['TypeInfo'];
    final propDataBytes = siblingStreams['PropData'];
    return _UiStorageMetadata(
      blobBytes: Uint8List.fromList(blobBytes),
      blobStrings: _extractPrintableStrings(blobBytes).toList(growable: false),
      typeInfoStrings: typeInfoBytes == null
          ? const <String>[]
          : _extractPrintableStrings(typeInfoBytes).toList(growable: false),
      propertyMap: _readPropertyMap(propDataBytes),
      siblingStreamLengths: <String, int>{
        for (final entry in siblingStreams.entries) entry.key: entry.value.length,
      },
      siblingStreamStrings: <String, List<String>>{
        for (final entry in siblingStreams.entries)
          entry.key: _extractPrintableStrings(entry.value).toList(growable: false),
      },
    );
  }

  Map<String, List<int>> _readSiblingStreams(
    List<Map<String, dynamic>> storageRows,
    int markerIndex,
  ) {
    final siblingStreams = <String, List<int>>{};
    for (var index = markerIndex + 1; index < storageRows.length; index++) {
      final name = storageRows[index]['Name']?.toString();
      if (int.tryParse(name ?? '') != null) {
        break;
      }
      final bytes = _asBytes(storageRows[index]['Lv']);
      if (name == null || bytes == null || bytes.isEmpty) {
        continue;
      }
      siblingStreams[name] = bytes;
    }
    return siblingStreams;
  }

  Map<String, dynamic> _buildFormComponents({
    required String formName,
    required _UiStorageMetadata metadata,
    required Set<String> tableNames,
    required Set<String> queryNames,
    required List<AccessRelationshipSchema> relationships,
  }) {
    final recordSource =
        _findRecordSource(metadata.blobStrings, tableNames, queryNames);
    final controls = _buildControls(
      metadata.typeInfoStrings,
      metadata.blobStrings,
      blobBytes: metadata.blobBytes,
      propertyMap: metadata.propertyMap,
    );
    final sections = _buildSections(
      objectKind: 'form',
      typeInfoStrings: metadata.typeInfoStrings,
      controls: controls,
    );
    _applySectionNamesToControls(sections);
    final subforms = _buildSubforms(
      metadata.blobStrings,
      recordSource,
      tableNames,
      relationships,
    );
    final storageSignals = _buildStorageSignals(metadata, objectName: formName);

    return <String, dynamic>{
      'formName': formName,
      if (recordSource != null) 'recordSource': recordSource,
      if (controls.isNotEmpty) 'controls': controls,
      if (sections.isNotEmpty) 'sections': sections,
      if (subforms.isNotEmpty) 'subforms': subforms,
      if (storageSignals.isNotEmpty) 'storageSignals': storageSignals,
    };
  }

  Map<String, dynamic> _buildReportComponents({
    required String reportName,
    required _UiStorageMetadata metadata,
    required Set<String> tableNames,
    required Set<String> queryNames,
  }) {
    final recordSource =
        _findRecordSource(metadata.blobStrings, tableNames, queryNames);
    final controls = _buildControls(
      metadata.typeInfoStrings,
      metadata.blobStrings,
      blobBytes: metadata.blobBytes,
      propertyMap: metadata.propertyMap,
    );
    final sections = _buildSections(
      objectKind: 'report',
      typeInfoStrings: metadata.typeInfoStrings,
      controls: controls,
    );
    _applySectionNamesToControls(sections);

    return <String, dynamic>{
      'reportName': reportName,
      if (recordSource != null) 'recordSource': recordSource,
      if (controls.isNotEmpty) 'controls': controls,
      'sections': sections.isEmpty ? _defaultSectionsForReport() : sections,
    };
  }

  List<Map<String, dynamic>> _defaultSectionsForReport() {
    return const <Map<String, dynamic>>[
      <String, dynamic>{
        'kind': 'detail',
        'name': 'Detail',
        'controls': <Map<String, dynamic>>[],
        'visualGroups': <Map<String, dynamic>>[],
      },
    ];
  }

  String? _findRecordSource(
    List<String> blobStrings,
    Set<String> tableNames,
    Set<String> queryNames,
  ) {
    for (final value in blobStrings) {
      if (tableNames.contains(value) || queryNames.contains(value)) {
        return value;
      }
    }
    return null;
  }

  List<Map<String, dynamic>> _buildControls(
      List<String> typeInfoStrings, List<String> blobStrings,
      {Uint8List? blobBytes, AccessPropertyMapGroup? propertyMap}) {
    final controls = <Map<String, dynamic>>[];
    final controlNameCandidates = <String>[];
    final seenNames = <String>{};
    for (final value in <String>[...typeInfoStrings, ...blobStrings]) {
      if (seenNames.add(value)) {
        controlNameCandidates.add(value);
      }
    }
    final blobParser = blobBytes == null || blobBytes.isEmpty
        ? null
        : BlobLayoutParser(blobBytes);
    for (final value in controlNameCandidates) {
      final prefixType = _inferControlTypeByPrefix(value);
      final group = blobParser?.findControlRecordGroup(value);
      final blobHints =
          group == null ? const _BlobControlHints() : _extractBlobControlHints(group);
      if (!_shouldPromoteBlobControlCandidate(
        value,
        prefixType: prefixType,
        group: group,
        blobHints: blobHints,
      )) {
        continue;
      }
      final type = prefixType ?? blobHints.inferredType;
      if (type == null) {
        continue;
      }
      final control = <String, dynamic>{
        'name': value,
        'type': type,
        'role': _inferControlRole(type),
        ...blobHints.metadata,
        if (type == 'Subform')
          'sourceObject': _findSubformSourceObject(blobStrings, value),
      };
      final blobLayout = group == null
          ? null
          : _extractBlobLayoutFromGroup(group, controlType: type);
      if (blobLayout != null && blobLayout.isNotEmpty) {
        control['layout'] = blobLayout;
      }
      controls.add(control);
    }
    return _applyPropertyMapToControls(controls, propertyMap);
  }

  Map<String, dynamic>? _extractBlobLayoutFromGroup(
    BlobControlRecordGroup group, {
    required String controlType,
      }
  ) {
    return _findBlobRectangle(
          group.nextRecords,
          controlType: controlType,
        ) ??
        _findBlobRectangle(
          group.previousRecords,
          controlType: controlType,
        );
  }

  _BlobControlHints _extractBlobControlHints(BlobControlRecordGroup group) {
    final stringsByPropertyId = <int, String>{};
    for (final record in group.allRecords) {
      final value = record.normalizedUtf16Value;
      if (value == null || value.isEmpty || value == group.controlName) {
        continue;
      }
      stringsByPropertyId.putIfAbsent(record.propertyId, () => value);
    }

    final metadata = <String, dynamic>{};
    final controlSource = stringsByPropertyId[221];
    if (controlSource != null && controlSource.isNotEmpty) {
      metadata['controlSource'] = controlSource;
    }
    final rowSourceType = stringsByPropertyId[222];
    if (rowSourceType != null && rowSourceType.isNotEmpty) {
      metadata['rowSourceType'] = rowSourceType;
    }
    final rowSource = stringsByPropertyId[223];
    if (rowSource != null && rowSource.isNotEmpty) {
      metadata['rowSource'] = rowSource;
    }

    String? inferredType;
    if (metadata.containsKey('rowSourceType') || metadata.containsKey('rowSource')) {
      inferredType = 'ComboBox';
    } else if (metadata.containsKey('controlSource')) {
      inferredType = 'TextBox';
    }

    return _BlobControlHints(
      inferredType: inferredType,
      metadata: metadata,
    );
  }

  bool _shouldPromoteBlobControlCandidate(
    String value, {
    required String? prefixType,
    required BlobControlRecordGroup? group,
    required _BlobControlHints blobHints,
  }) {
    if (prefixType != null) {
      return true;
    }
    if (group == null || blobHints.inferredType == null) {
      return false;
    }
    if (group.nameRecord.propertyId == 221 ||
        group.nameRecord.propertyId == 222 ||
        group.nameRecord.propertyId == 223) {
      return false;
    }
    if (blobHints.metadata['controlSource'] == value ||
        blobHints.metadata['rowSourceType'] == value ||
        blobHints.metadata['rowSource'] == value) {
      return false;
    }
    final firstCodeUnit = value.codeUnitAt(0);
    final startsUppercase = firstCodeUnit >= 65 && firstCodeUnit <= 90;
    if (startsUppercase) {
      return false;
    }
    return true;
  }

  Map<String, dynamic>? _findBlobRectangle(
    List<BlobFieldRecord> records, {
    required String controlType,
  }) {
    final preferredBases = _preferredBlobRectangleBases(controlType);
    Map<String, dynamic>? fallbackMatch;
    for (var index = 0; index + 3 < records.length; index++) {
      final first = records[index];
      final second = records[index + 1];
      final third = records[index + 2];
      final fourth = records[index + 3];

      if (second.propertyId != first.propertyId + 1 ||
          third.propertyId != second.propertyId + 1 ||
          fourth.propertyId != third.propertyId + 1) {
        continue;
      }
      if (first.typeCode != 3 ||
          second.typeCode != 3 ||
          third.typeCode != 3 ||
          fourth.typeCode != 3) {
        continue;
      }
      if (first.declaredPayloadLength != 4 ||
          second.declaredPayloadLength != 4 ||
          third.declaredPayloadLength != 4 ||
          fourth.declaredPayloadLength != 4) {
        continue;
      }

      final left = _readBlobSmallInt(first);
      final top = _readBlobSmallInt(second);
      final right = _readBlobSmallInt(third);
      final bottom = _readBlobSmallInt(fourth);
      if (left == null || top == null || right == null || bottom == null) {
        continue;
      }
      if (right < left || bottom < top) {
        continue;
      }

      final match = <String, dynamic>{
        'left': left,
        'top': top,
        'width': right - left,
        'height': bottom - top,
      };
      if (preferredBases.contains(first.propertyId)) {
        return match;
      }
      fallbackMatch = match;
    }
    return fallbackMatch;
  }

  Set<int> _preferredBlobRectangleBases(String controlType) {
    switch (controlType) {
      case 'TextBox':
        return const <int>{302};
      case 'ComboBox':
        return const <int>{310};
      case 'CheckBox':
      case 'CommandButton':
        return const <int>{293};
      case 'Label':
        return const <int>{282};
      default:
        return const <int>{};
    }
  }

  int? _readBlobSmallInt(BlobFieldRecord record) {
    if (record.payload.length < 4) {
      return null;
    }
    final data = ByteData.sublistView(record.payload);
    return data.getUint16(record.payload.length - 2, Endian.little);
  }

  List<Map<String, dynamic>> _applyPropertyMapToControls(
    List<Map<String, dynamic>> controls,
    AccessPropertyMapGroup? propertyMap,
  ) {
    if (propertyMap == null || controls.isEmpty) {
      return controls;
    }

    for (final control in controls) {
      final name = control['name'] as String?;
      if (name == null || name.isEmpty) {
        continue;
      }
      final properties = propertyMap.forName(name);
      if (properties.isEmpty) {
        continue;
      }

      final existingLayout = control['layout'];
      final layout = existingLayout is Map
          ? Map<String, dynamic>.from(existingLayout.cast<String, dynamic>())
          : <String, dynamic>{};
      _putNumericLayout(
          layout, 'left', _readNumericProperty(properties, 'Left'));
      _putNumericLayout(layout, 'top', _readNumericProperty(properties, 'Top'));
      _putNumericLayout(
          layout, 'width', _readNumericProperty(properties, 'Width'));
      _putNumericLayout(
          layout, 'height', _readNumericProperty(properties, 'Height'));
      _putNumericLayout(layout, 'layoutCachedLeft',
          _readNumericProperty(properties, 'LayoutCachedLeft'));
      _putNumericLayout(layout, 'layoutCachedTop',
          _readNumericProperty(properties, 'LayoutCachedTop'));
      _putNumericLayout(layout, 'layoutCachedWidth',
          _readNumericProperty(properties, 'LayoutCachedWidth'));
      _putNumericLayout(layout, 'layoutCachedHeight',
          _readNumericProperty(properties, 'LayoutCachedHeight'));
      _putNumericLayout(layout, 'columnStart',
          _readNumericProperty(properties, 'ColumnStart'));
      _putNumericLayout(
          layout, 'columnEnd', _readNumericProperty(properties, 'ColumnEnd'));
      _putNumericLayout(
          layout, 'rowStart', _readNumericProperty(properties, 'RowStart'));
      _putNumericLayout(
          layout, 'rowEnd', _readNumericProperty(properties, 'RowEnd'));
      _putNumericLayout(layout, 'layoutGroup',
          _readNumericProperty(properties, 'LayoutGroup'));
      final section = _readStringProperty(properties, 'Section');
      if (section != null && section.isNotEmpty) {
        layout['section'] = section;
      }
      if (layout.isNotEmpty) {
        control['layout'] = layout;
      }
    }

    return controls;
  }

  void _applySectionNamesToControls(List<Map<String, dynamic>> sections) {
    for (final section in sections) {
      final sectionName = section['name'] as String?;
      if (sectionName == null || sectionName.isEmpty) {
        continue;
      }
      final controls = section['controls'];
      if (controls is! List) {
        continue;
      }
      for (final controlEntry in controls) {
        if (controlEntry is! Map) {
          continue;
        }
        final control = controlEntry.cast<String, dynamic>();
        final existingLayout = control['layout'];
        final layout = existingLayout is Map
            ? Map<String, dynamic>.from(existingLayout.cast<String, dynamic>())
            : <String, dynamic>{};
        layout.putIfAbsent('section', () => sectionName);
        if (layout.isNotEmpty) {
          control['layout'] = layout;
        }
      }
    }
  }

  void _putNumericLayout(Map<String, dynamic> layout, String key, int? value) {
    if (value != null) {
      layout[key] = value;
    }
  }

  int? _readNumericProperty(Map<String, Object?> properties, String name) {
    final value = _readPropertyCaseInsensitive(properties, name);
    if (value is int) {
      return value;
    }
    if (value is double) {
      return value.round();
    }
    return null;
  }

  String? _readStringProperty(Map<String, Object?> properties, String name) {
    final value = _readPropertyCaseInsensitive(properties, name);
    return value is String ? value : null;
  }

  Object? _readPropertyCaseInsensitive(
      Map<String, Object?> properties, String name) {
    final direct = properties[name];
    if (direct != null) {
      return direct;
    }
    final target = name.toLowerCase();
    for (final entry in properties.entries) {
      if (entry.key.toLowerCase() == target) {
        return entry.value;
      }
    }
    return null;
  }

  List<Map<String, dynamic>> _buildSections({
    required String objectKind,
    required List<String> typeInfoStrings,
    required List<Map<String, dynamic>> controls,
  }) {
    if (controls.isEmpty) {
      return const <Map<String, dynamic>>[];
    }

    final controlsByName = <String, Map<String, dynamic>>{
      for (final control in controls)
        if ((control['name'] as String?) != null)
          control['name'] as String: control,
    };
    final sections = <_SectionAccumulator>[];
    _SectionAccumulator? currentSection;

    for (var index = 0; index < typeInfoStrings.length; index++) {
      final sectionMatch = _matchSectionAt(typeInfoStrings, index, objectKind);
      if (sectionMatch != null) {
        currentSection = _SectionAccumulator(
          kind: sectionMatch.kind,
          name: sectionMatch.name,
        );
        sections.add(currentSection);
        index += sectionMatch.consumedParts - 1;
        continue;
      }

      final control = controlsByName[typeInfoStrings[index]];
      if (control == null) {
        continue;
      }

      currentSection ??= _SectionAccumulator(
        kind: 'detail',
        name: objectKind == 'report' ? 'Detail' : 'Detalhe',
      );
      if (!sections.contains(currentSection)) {
        sections.add(currentSection);
      }
      currentSection.controls.add(control);
    }

    if (sections.isEmpty) {
      final fallback = _SectionAccumulator(
        kind: 'detail',
        name: objectKind == 'report' ? 'Detail' : 'Detalhe',
      )..controls.addAll(controls);
      sections.add(fallback);
    } else if (sections.every((section) => section.controls.isEmpty)) {
      sections.first.controls.addAll(controls);
    }

    return sections
        .where((section) => section.controls.isNotEmpty)
        .map((section) => section.toJson())
        .toList(growable: false);
  }

  List<Map<String, dynamic>> _buildSubforms(
    List<String> blobStrings,
    String? parentRecordSource,
    Set<String> tableNames,
    List<AccessRelationshipSchema> relationships,
  ) {
    final subforms = <Map<String, dynamic>>[];
    for (var index = 0; index < blobStrings.length; index++) {
      final controlName = blobStrings[index];
      if (!controlName.startsWith('subfrm')) {
        continue;
      }
      final sourceObject = _findSubformSourceObject(blobStrings, controlName);
      if (sourceObject == null) {
        continue;
      }
      final sourceForm = sourceObject.startsWith('Form.')
          ? sourceObject.substring('Form.'.length)
          : sourceObject;
      final sourceTable = _findSourceTableNear(blobStrings, index, tableNames);
      final link = _inferRelationshipLink(
        parentRecordSource: parentRecordSource,
        childRecordSource: sourceTable,
        relationships: relationships,
      );
      subforms.add(<String, dynamic>{
        'name': controlName,
        'type': 'Subform',
        'sourceObject': sourceObject,
        'sourceForm': sourceForm,
        if (sourceTable != null) 'recordSource': sourceTable,
        if (link != null) 'linkMasterFields': link.masterField,
        if (link != null) 'linkChildFields': link.childField,
      });
    }
    return subforms;
  }

  String? _findSubformSourceObject(
      List<String> blobStrings, String controlName) {
    final index = blobStrings.indexOf(controlName);
    if (index == -1) {
      return null;
    }
    for (var cursor = index + 1;
        cursor < blobStrings.length && cursor <= index + 4;
        cursor++) {
      final value = blobStrings[cursor];
      if (value.startsWith('Form.')) {
        return value;
      }
    }
    return null;
  }

  String? _findSourceTableNear(
    List<String> blobStrings,
    int startIndex,
    Set<String> tableNames,
  ) {
    for (var cursor = startIndex + 1;
        cursor < blobStrings.length && cursor <= startIndex + 6;
        cursor++) {
      final value = blobStrings[cursor];
      if (tableNames.contains(value)) {
        return value;
      }
    }
    return null;
  }

  _RelationshipLink? _inferRelationshipLink({
    required String? parentRecordSource,
    required String? childRecordSource,
    required List<AccessRelationshipSchema> relationships,
  }) {
    if (parentRecordSource == null || childRecordSource == null) {
      return null;
    }

    for (final relationship in relationships) {
      if (relationship.fromTable == parentRecordSource &&
          relationship.toTable == childRecordSource &&
          relationship.fromColumns.isNotEmpty &&
          relationship.toColumns.isNotEmpty) {
        return _RelationshipLink(
          masterField: relationship.fromColumns.first,
          childField: relationship.toColumns.first,
        );
      }
      if (relationship.toTable == parentRecordSource &&
          relationship.fromTable == childRecordSource &&
          relationship.fromColumns.isNotEmpty &&
          relationship.toColumns.isNotEmpty) {
        return _RelationshipLink(
          masterField: relationship.toColumns.first,
          childField: relationship.fromColumns.first,
        );
      }
    }
    return null;
  }

  String? _inferControlTypeByPrefix(String value) {
    if (value.startsWith('subfrm')) {
      return 'Subform';
    }
    if (value.startsWith('txt')) {
      return 'TextBox';
    }
    if (value.startsWith('lbl')) {
      return 'Label';
    }
    if (value.startsWith('chk')) {
      return 'CheckBox';
    }
    if (value.startsWith('cbo') || value.startsWith('cmb')) {
      return 'ComboBox';
    }
    if (value.startsWith('lst')) {
      return 'ListBox';
    }
    if (value.startsWith('cmd')) {
      return 'CommandButton';
    }
    if (value.startsWith('img')) {
      return 'Image';
    }
    if (value.startsWith('lin')) {
      return 'Line';
    }
    if (value.startsWith('rec') || value.startsWith('ret')) {
      return 'Rectangle';
    }
    return null;
  }

  String _inferControlRole(String type) {
    switch (type) {
      case 'Label':
        return 'caption';
      case 'CommandButton':
        return 'action';
      case 'Subform':
        return 'embeddedView';
      case 'Line':
      case 'Rectangle':
        return 'decorative';
      default:
        return 'input';
    }
  }

  _StringMatch? _matchCatalogNameAt(
    List<String> values,
    int index,
    Map<String, String> catalogByKey,
  ) {
    for (var parts = 3; parts >= 1; parts--) {
      if (index + parts > values.length) {
        continue;
      }
      final combined = values.sublist(index, index + parts).join();
      final resolved = _resolveCatalogName(combined, catalogByKey);
      if (resolved != null) {
        return _StringMatch(resolved, parts);
      }
    }
    return null;
  }

  String? _resolveCatalogName(String value, Map<String, String> catalogByKey) {
    final normalizedValue = _normalizeLookupKey(value);
    final direct = catalogByKey[normalizedValue];
    if (direct != null) {
      return direct;
    }

    String? bestMatch;
    var bestScore = 0;
    for (final entry in catalogByKey.entries) {
      final key = entry.key;
      if (key.length < 4) {
        continue;
      }
      if (!normalizedValue.startsWith(key) &&
          !key.startsWith(normalizedValue)) {
        continue;
      }
      final score = key.length;
      if (score > bestScore) {
        bestScore = score;
        bestMatch = entry.value;
      }
    }
    return bestMatch;
  }

  _SectionMatch? _matchSectionAt(
    List<String> values,
    int index,
    String objectKind,
  ) {
    for (var parts = 1; parts <= 3; parts++) {
      if (index + parts > values.length) {
        continue;
      }
      final combined = values.sublist(index, index + parts).join();
      final kind = _inferSectionKind(combined, objectKind);
      if (kind != null) {
        return _SectionMatch(
          kind: kind,
          name: _canonicalSectionName(kind, objectKind, combined),
          consumedParts: parts,
        );
      }
    }
    return null;
  }

  String _canonicalSectionName(String kind, String objectKind, String fallback) {
    switch (kind) {
      case 'detail':
        return objectKind == 'report' ? 'Detail' : 'Detalhe';
      case 'formHeader':
        return 'CabecalhoDoFormulario';
      case 'formFooter':
        return 'RodapeDoFormulario';
      case 'reportHeader':
        return 'CabecalhoDoRelatorio';
      case 'reportFooter':
        return 'RodapeDoRelatorio';
      case 'pageHeader':
        return 'CabecalhoDaPagina';
      case 'pageFooter':
        return 'RodapeDaPagina';
      case 'groupHeader':
        return 'CabecalhoDeGrupo';
      case 'groupFooter':
        return 'RodapeDeGrupo';
      default:
        return fallback;
    }
  }

  Map<String, dynamic> _buildStorageSignals(
    _UiStorageMetadata metadata, {
    required String objectName,
  }) {
    final lengths = metadata.siblingStreamLengths;
    if (lengths.isEmpty) {
      return const <String, dynamic>{};
    }

    final vbaSignals = <String, dynamic>{};
    final projectStreamNames = <String>[];
    for (final name in const <String>[
      '_VBA_PROJECT',
      'dir',
      'PROJECT',
      'PROJECTwm',
    ]) {
      if (lengths.containsKey(name)) {
        projectStreamNames.add(name);
      }
    }
    if (projectStreamNames.isNotEmpty) {
      vbaSignals['projectStreamNames'] = projectStreamNames;
    }
    final accessVbaDataLength = lengths['AcessVBAData'];
    if (accessVbaDataLength != null) {
      vbaSignals['accessVbaDataLength'] = accessVbaDataLength;
    }

    final moduleCandidates = <Map<String, dynamic>>[];
    for (final entry in metadata.siblingStreamStrings.entries) {
      if (!_isPotentialVbaModuleStream(
        entry.key,
        entry.value,
        objectName: objectName,
        length: lengths[entry.key] ?? 0,
      )) {
        continue;
      }
      moduleCandidates.add(<String, dynamic>{
        'name': entry.key,
        'length': lengths[entry.key],
      });
    }
    if (moduleCandidates.isNotEmpty) {
      vbaSignals['moduleCandidates'] = moduleCandidates;
    }

    return vbaSignals.isEmpty
        ? const <String, dynamic>{}
        : <String, dynamic>{'vba': vbaSignals};
  }

  bool _isPotentialVbaModuleStream(
    String streamName,
    List<String> printableStrings, {
    required String objectName,
    required int length,
  }) {
    const knownNames = <String>{
      'Blob',
      'BlobDelta',
      'TypeInfo',
      'PropData',
      'DirData',
      'AcessVBAData',
      '_VBA_PROJECT',
      'dir',
      'PROJECT',
      'PROJECTwm',
      'MSysAccessStorage_ROOT',
      'MSysAccessStorage_SCRATCH',
    };
    if (knownNames.contains(streamName)) {
      return false;
    }
    final joined = printableStrings.join('\n');
    if (joined.contains('Attribute VB_Name') ||
        joined.contains('Private Sub') ||
        joined.contains('Public Sub') ||
        joined.contains('MsgBox') ||
        joined.contains('Form_$objectName')) {
      return true;
    }
    return length >= 128 && _looksLikeExplicitVbaStreamName(streamName);
  }

  bool _looksLikeExplicitVbaStreamName(String value) {
    if (value.length < 12) {
      return false;
    }
    for (final codeUnit in value.codeUnits) {
      final isUpper = codeUnit >= 65 && codeUnit <= 90;
      final isDigit = codeUnit >= 48 && codeUnit <= 57;
      final isUnderscore = codeUnit == 95;
      if (!isUpper && !isDigit && !isUnderscore) {
        return false;
      }
    }
    return true;
  }

  String? _inferSectionKind(String value, String objectKind) {
    final normalized = _normalizeLookupKey(value);
    if (normalized.contains('detalhe') || normalized.contains('detail')) {
      return 'detail';
    }
    if (normalized.contains('cabecalhodoformulario') ||
        normalized.contains('formheader') ||
        normalized.contains('cabecalhoformulario')) {
      return 'formHeader';
    }
    if (normalized.contains('rodapedoformulario') ||
        normalized.contains('formfooter') ||
        normalized.contains('rodapeformulario')) {
      return 'formFooter';
    }
    if (normalized.contains('cabecalhodorelatorio') ||
        normalized.contains('reportheader') ||
        normalized.contains('cabecalhorelatorio')) {
      return 'reportHeader';
    }
    if (normalized.contains('rodapedorelatorio') ||
        normalized.contains('reportfooter') ||
        normalized.contains('rodaperelatorio')) {
      return 'reportFooter';
    }
    if (normalized.contains('cabecalhodapagina') ||
        normalized.contains('cabecalhopagina') ||
        normalized.contains('pageheader')) {
      return 'pageHeader';
    }
    if (normalized.contains('rodapedapagina') ||
        normalized.contains('rodapepagina') ||
        normalized.contains('pagefooter')) {
      return 'pageFooter';
    }
    if (objectKind == 'report' &&
        (normalized.contains('cabecalhodegrupo') ||
            normalized.contains('groupheader'))) {
      return 'groupHeader';
    }
    if (objectKind == 'report' &&
        (normalized.contains('rodapedogrupo') ||
            normalized.contains('groupfooter'))) {
      return 'groupFooter';
    }
    return null;
  }

  List<int>? _asBytes(Object? value) {
    if (value is List<int>) {
      return value;
    }
    return null;
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

    for (final startOffset in const <int>[0, 1]) {
      final wide = StringBuffer();
      for (var index = startOffset; index + 1 < bytes.length; index += 2) {
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
  }

  String _normalizeLookupKey(String value) {
    final buffer = StringBuffer();
    for (final codeUnit in foldToAscii(value).toLowerCase().codeUnits) {
      final isLetter = codeUnit >= 97 && codeUnit <= 122;
      final isDigit = codeUnit >= 48 && codeUnit <= 57;
      if (isLetter || isDigit) {
        buffer.writeCharCode(codeUnit);
      }
    }
    return buffer.toString();
  }

  bool _isTemporaryAccessObjectName(String value) {
    final normalized = value.trim().toLowerCase();
    if (normalized.isEmpty) {
      return false;
    }
    return normalized.startsWith('~sq_') ||
        normalized.startsWith('~tmp') ||
        normalized.startsWith('~tmpclp');
  }

  Map<String, dynamic> toJson() {
    return {
      'tables': tables.map((k, v) => MapEntry(k, v.toJson())),
      'queries': queries.map((q) => q.toJson()).toList(),
      'forms': forms.map((f) => f.toJson()).toList(),
      'reports': reports.map((report) => report.toJson()).toList(),
      'modules': modules.map((m) => m.toJson()).toList(),
    };
  }
}

class _UiStorageMetadata {
  final Uint8List blobBytes;
  final List<String> blobStrings;
  final List<String> typeInfoStrings;
  final AccessPropertyMapGroup? propertyMap;
  final Map<String, int> siblingStreamLengths;
  final Map<String, List<String>> siblingStreamStrings;

  const _UiStorageMetadata({
    required this.blobBytes,
    required this.blobStrings,
    required this.typeInfoStrings,
    required this.propertyMap,
    required this.siblingStreamLengths,
    required this.siblingStreamStrings,
  });
}

class _BlobControlHints {
  final String? inferredType;
  final Map<String, dynamic> metadata;

  const _BlobControlHints({
    this.inferredType,
    this.metadata = const <String, dynamic>{},
  });
}

class _StringMatch {
  final String value;
  final int consumedParts;

  const _StringMatch(this.value, this.consumedParts);
}

class _SectionMatch {
  final String kind;
  final String name;
  final int consumedParts;

  const _SectionMatch({
    required this.kind,
    required this.name,
    required this.consumedParts,
  });
}

class _SectionAccumulator {
  final String kind;
  final String name;
  final List<Map<String, dynamic>> controls = <Map<String, dynamic>>[];

  _SectionAccumulator({required this.kind, required this.name});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'kind': kind,
      'name': name,
      'controls': controls,
      'visualGroups': _buildVisualGroups(),
    };
  }

  List<Map<String, dynamic>> _buildVisualGroups() {
    final grouped = <String, List<Map<String, dynamic>>>{};
    for (final control in controls) {
      final controlName = control['name'] as String?;
      if (controlName == null) {
        continue;
      }
      final stem = _controlStem(controlName);
      if (stem.length < 3) {
        continue;
      }
      grouped.putIfAbsent(stem, () => <Map<String, dynamic>>[]).add(control);
    }

    return grouped.entries
        .where((entry) => entry.value.length > 1)
        .map(
          (entry) => <String, dynamic>{
            'kind': 'sharedStem',
            'name': entry.key,
            'controls': entry.value,
          },
        )
        .toList(growable: false);
  }

  String _controlStem(String value) {
    final normalized = foldToAscii(value).toLowerCase();
    const prefixes = <String>[
      'subfrm',
      'txt',
      'lbl',
      'chk',
      'cmd',
      'cbo',
      'cmb',
      'lst',
      'img',
      'lin',
      'rec',
      'ret',
    ];
    for (final prefix in prefixes) {
      if (normalized.startsWith(prefix) && normalized.length > prefix.length) {
        return normalized.substring(prefix.length);
      }
    }
    return normalized;
  }
}

class _RelationshipLink {
  final String masterField;
  final String childField;

  const _RelationshipLink({
    required this.masterField,
    required this.childField,
  });
}

class CanonicalTable {
  final String name;
  final List<CanonicalColumn> columns;

  CanonicalTable(this.name, this.columns);

  Map<String, dynamic> toJson() => {
        'name': name,
        'columns': columns.map((c) => c.toJson()).toList(),
      };
}

class CanonicalColumn {
  final String name;
  final String type;
  final bool isRequired;
  final String? defaultValue;
  final String? calculatedExpression; // AST nativo

  CanonicalColumn({
    required this.name,
    required this.type,
    this.isRequired = false,
    this.defaultValue,
    this.calculatedExpression,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
        'isRequired': isRequired,
        if (defaultValue != null) 'defaultValue': defaultValue,
        if (calculatedExpression != null)
          'calculatedExpression': calculatedExpression,
      };
}

class CanonicalQuery {
  final String name;
  final String semanticSql;
  CanonicalQuery(this.name, this.semanticSql);

  Map<String, dynamic> toJson() => {
        'name': name,
        'semanticSql': semanticSql,
      };
}

class CanonicalForm {
  final String name;
  // Representação de UI traduzida do Blob binário.
  final Map<String, dynamic> components;
  final String? rawVbaCode; // VBA Form logic, if present
  CanonicalForm(this.name, this.components, {this.rawVbaCode});

  Map<String, dynamic> toJson() => {
        'name': name,
        'components': components,
        if (rawVbaCode != null) 'rawVbaCode': rawVbaCode,
      };
}

class CanonicalReport {
  final String name;
  final Map<String, dynamic> components;

  CanonicalReport(this.name, this.components);

  Map<String, dynamic> toJson() => {
        'name': name,
        'components': components,
      };
}

class CanonicalModule {
  final String name;
  final String rawVbaCode; // Código descompactado via MS-OVBA
  CanonicalModule(this.name, this.rawVbaCode);

  Map<String, dynamic> toJson() => {
        'name': name,
        'rawVbaCode': rawVbaCode,
      };
}
