import 'package:jackcess_dart/jackcess_dart.dart';

/// Modelo Canônico (Access Analysis).
/// Responsável por traduzir a leitura bruta (via JackcessDart) em abstrações ricas e universais
/// prontas para serem transformadas em JSON (`analysis.json`) ou utilizadas pelos geradores e migrador.
/// Totalmente independente de código de geração, focado exclusivamente no "Esquema" (AST lógico).
class AccessAnalysis {
  final Map<String, CanonicalTable> tables = {};
  final List<CanonicalQuery> queries = [];
  final List<CanonicalForm> forms = [];
  final List<CanonicalModule> modules = [];

  Future<void> extractFromDatabase(AccessDatabase db) async {
    final catalog = AccessCatalog(format: db.format, pageChannel: db.pageChannel);
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
    final formComponentCandidates =
        await _extractFormComponentCandidates(formTableReader, model);
    final formComponents = <String, Map<String, dynamic>>{
      for (final candidate in formComponentCandidates)
        if ((candidate['formName'] as String?) != null)
          candidate['formName'] as String: candidate,
    };
    final normalizedFormComponents = <String, Map<String, dynamic>>{
      for (final entry in formComponents.entries)
        _normalizeLookupKey(entry.key): entry.value,
    };

    for (var m in model.modules) {
      final snippet = vbaSources[m.name] ?? 'unparsed_vba_blob_placeholder';
      modules.add(CanonicalModule(m.name, snippet));
    }

    for (var f in model.forms) {
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
      forms.add(CanonicalForm(
        f.name,
        components,
        rawVbaCode: source,
      ));
    }
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
    final formNames = _extractFormNamesFromDirData(storageRows);
    if (formNames.isEmpty) {
      return const <Map<String, dynamic>>[];
    }

    final metadataByForm = <String, _FormStorageMetadata>{};
    for (var index = 0; index < storageRows.length; index++) {
      final ordinal = int.tryParse(storageRows[index]['Name']?.toString() ?? '');
      if (ordinal == null || ordinal < 0 || ordinal >= formNames.length) {
        continue;
      }

      final blobBytes = _findSiblingStreamBytes(storageRows, index, 'Blob');
      if (blobBytes == null || blobBytes.isEmpty) {
        continue;
      }
      final typeInfoBytes = _findSiblingStreamBytes(storageRows, index, 'TypeInfo');
      metadataByForm[formNames[ordinal]] = _FormStorageMetadata(
        blobStrings: _extractPrintableStrings(blobBytes).toList(),
        typeInfoStrings: typeInfoBytes == null
            ? const <String>[]
            : _extractPrintableStrings(typeInfoBytes).toList(),
      );
    }

    final tableNames = model.tables.map((table) => table.name).toSet();
    final queryNames = model.queries.map((query) => query.name).toSet();
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
        .toList();
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

      final controls = (candidate['controls'] as List<dynamic>? ?? const <dynamic>[])
          .cast<Map<String, dynamic>>();
      for (final control in controls) {
        final controlName = control['name'] as String?;
        if (controlName != null && rawVbaCode != null && rawVbaCode.contains(controlName)) {
          score += 8;
        }
      }

      final subforms = (candidate['subforms'] as List<dynamic>? ?? const <dynamic>[])
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

  List<String> _extractFormNamesFromDirData(List<Map<String, dynamic>> storageRows) {
    for (final row in storageRows) {
      if (row['Name']?.toString() != 'DirData') {
        continue;
      }
      final bytes = _asBytes(row['Lv']);
      if (bytes == null || bytes.isEmpty) {
        continue;
      }
      final values = _extractPrintableStrings(bytes)
          .where((value) => value.startsWith('frm'))
          .toList();
      if (values.isNotEmpty) {
        return values;
      }
    }
    return const <String>[];
  }

  List<int>? _findSiblingStreamBytes(
    List<Map<String, dynamic>> storageRows,
    int markerIndex,
    String streamName,
  ) {
    for (var index = markerIndex + 1; index < storageRows.length; index++) {
      final name = storageRows[index]['Name']?.toString();
      if (int.tryParse(name ?? '') != null) {
        break;
      }
      if (name == streamName) {
        return _asBytes(storageRows[index]['Lv']);
      }
    }
    return null;
  }

  Map<String, dynamic> _buildFormComponents({
    required String formName,
    required _FormStorageMetadata metadata,
    required Set<String> tableNames,
    required Set<String> queryNames,
    required List<AccessRelationshipSchema> relationships,
  }) {
    final recordSource = _findRecordSource(metadata.blobStrings, tableNames, queryNames);
    final controls = _buildControls(metadata.typeInfoStrings, metadata.blobStrings);
    final subforms = _buildSubforms(
      metadata.blobStrings,
      recordSource,
      tableNames,
      relationships,
    );

    return <String, dynamic>{
      'formName': formName,
      if (recordSource != null) 'recordSource': recordSource,
      if (controls.isNotEmpty) 'controls': controls,
      if (subforms.isNotEmpty) 'subforms': subforms,
    };
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
    List<String> typeInfoStrings,
    List<String> blobStrings,
  ) {
    final controls = <Map<String, dynamic>>[];
    for (final value in typeInfoStrings) {
      final type = _inferControlType(value);
      if (type == null) {
        continue;
      }
      controls.add(<String, dynamic>{
        'name': value,
        'type': type,
        if (type == 'Subform')
          'sourceObject': _findSubformSourceObject(blobStrings, value),
      });
    }
    return controls;
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

  String? _findSubformSourceObject(List<String> blobStrings, String controlName) {
    final index = blobStrings.indexOf(controlName);
    if (index == -1) {
      return null;
    }
    for (var cursor = index + 1; cursor < blobStrings.length && cursor <= index + 4; cursor++) {
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
    for (var cursor = startIndex + 1; cursor < blobStrings.length && cursor <= startIndex + 6; cursor++) {
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

  String? _inferControlType(String value) {
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
    if (value.startsWith('cmd')) {
      return 'CommandButton';
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

  String _normalizeLookupKey(String value) {
    final buffer = StringBuffer();
    for (final codeUnit in value.toLowerCase().codeUnits) {
      final isLetter = codeUnit >= 97 && codeUnit <= 122;
      final isDigit = codeUnit >= 48 && codeUnit <= 57;
      if (isLetter || isDigit) {
        buffer.writeCharCode(codeUnit);
      }
    }
    return buffer.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'tables': tables.map((k, v) => MapEntry(k, v.toJson())),
      'queries': queries.map((q) => q.toJson()).toList(),
      'forms': forms.map((f) => f.toJson()).toList(),
      'modules': modules.map((m) => m.toJson()).toList(),
    };
  }
}

class _FormStorageMetadata {
  final List<String> blobStrings;
  final List<String> typeInfoStrings;

  const _FormStorageMetadata({
    required this.blobStrings,
    required this.typeInfoStrings,
  });
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
    if (calculatedExpression != null) 'calculatedExpression': calculatedExpression,
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

class CanonicalModule {
  final String name;
  final String rawVbaCode; // Código descompactado via MS-OVBA
  CanonicalModule(this.name, this.rawVbaCode);

  Map<String, dynamic> toJson() => {
    'name': name,
    'rawVbaCode': rawVbaCode,
  };
}
