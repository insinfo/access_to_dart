import 'access_expression.dart';
import 'access_types.dart';
import 'data_page_reader.dart';
import 'jet_format.dart';
import 'page_channel.dart';
import 'row_reader.dart';
import 'table_def_reader.dart';
import 'table_reader.dart';
import 'usage_map.dart';

/// Reads the system catalog (MSysObjects at page 2) and all supplementary
/// system tables (MSysQueries) to build a full [AccessDatabaseModel].
class AccessCatalog {
  final JetFormat format;
  final PageChannel pageChannel;

  // MSysObjects TDEF is always page 2 (Jackcess: PAGE_SYSTEM_CATALOG = 2)
  static const int _sysCatalogPage = 2;

  // Type values from DatabaseImpl
  static const int _typeTable = 1;
  static const int _typeQuery = 5;
  static const int _typeForm = -32768;
  static const int _typeReport = -32764;
  static const int _typeMacro = -32766;
  static const int _typeModule = -32757;
  static const int _typeContainer = 3;

  AccessCatalog({required this.format, required this.pageChannel});

  static int inferQueryTypeFromRows(List<Map<String, dynamic>> rows) =>
      _AccessQuerySqlBuilder().inferQueryType(rows);

  static String? reconstructSqlFromRows(
    List<Map<String, dynamic>> rows,
    int queryType,
  ) =>
      _AccessQuerySqlBuilder().reconstructSql(rows, queryType);

  /// Reads the complete database model from binary pages.
  Future<AccessDatabaseModel> read(String dbPath) async {
    // 1. Scan MSysObjects to collect all catalog entries
    final allEntries = await _readAllCatalogEntries();

    // 2. Find the "Tables" container's id (Jackcess: _tableParentId).
    //    User tables have type==1 and their parentId == the "Tables" container id.
    //    The "Tables" container is a type==3 entry named "Tables" whose itself
    //    parentId is the top-level DB parent (0xF000000).
    final tablesContainer = allEntries.firstWhere(
      (e) => e.name == 'Tables' && e.rawType == _typeContainer,
      orElse: () => AccessCatalogEntry(
          id: 0,
          parentId: 0,
          name: '',
          objectType: AccessObjectType.unknown,
          flags: 0,
          rawType: 0),
    );
    final tableParentId = tablesContainer.id;

    // 3. User tables: type==1, parentId==tableParentId, and NOT system bit 0x80000000
    final tableEntries = allEntries
        .where((e) =>
            e.rawType == _typeTable &&
            (tableParentId == 0 || e.parentId == tableParentId) &&
            !e.isSystem)
        .toList();
    final linkedTableEntries = allEntries
        .where((e) =>
            e.rawType == 6 &&
            (tableParentId == 0 || e.parentId == tableParentId) &&
            !e.isSystem)
        .toList();

    final queryEntries =
        allEntries.where((e) => e.rawType == _typeQuery).toList();
    final formEntries =
        allEntries.where((e) => e.rawType == _typeForm).toList();
    final reportEntries =
        allEntries.where((e) => e.rawType == _typeReport).toList();
    final macroEntries =
        allEntries.where((e) => e.rawType == _typeMacro).toList();
    final moduleEntries =
        allEntries.where((e) => e.rawType == _typeModule).toList();

    // 4. Build table schemas by reading their TDEF pages.
    //    The entry.id IS the TDEF page number for tables.
    final tblReader = TableReader(format: format, pageChannel: pageChannel);
    final tables = <AccessTableSchema>[];
    for (final entry in tableEntries) {
      try {
        final schema = await tblReader.readSchema(entry.name, entry.id);
        List<Map<String, dynamic>> rows;
        try {
          rows = await tblReader.readAllRows(entry.id);
        } catch (e) {
          print('[WARN] Failed to read sample rows for table "${entry.name}" '
              '(page ${entry.id}): $e');
          rows = const <Map<String, dynamic>>[];
        }
        tables.add(AccessTableSchema(
          name: schema.name,
          tdefPageNumber: schema.tdefPageNumber,
          rowCount: schema.rowCount,
          columns: schema.columns,
          indexes: schema.indexes,
          sampleRows: rows.take(10).toList(),
        ));
      } catch (e) {
        // Log error and continue
        print(
            '[WARN] Failed to read table "${entry.name}" (page ${entry.id}): $e');
      }
    }

    // 5. Read queries from MSysQueries
    final queries = await _readQueries(queryEntries);
    final relationships = await _readRelationships(allEntries);

    return AccessDatabaseModel(
      path: dbPath,
      formatName: format.name,
      tables: tables,
      linkedTables: linkedTableEntries,
      relationships: relationships,
      queries: queries,
      forms: formEntries,
      reports: reportEntries,
      macros: macroEntries,
      modules: moduleEntries,
    );
  }

  Future<List<AccessRelationshipSchema>> _readRelationships(
    List<AccessCatalogEntry> allEntries,
  ) async {
    final msysRelationshipsEntry = allEntries.firstWhere(
      (e) => e.name == 'MSysRelationships',
      orElse: () => const AccessCatalogEntry(
        id: 0,
        parentId: 0,
        name: '',
        objectType: AccessObjectType.unknown,
        flags: 0,
        rawType: 0,
      ),
    );

    if (msysRelationshipsEntry.id == 0) {
      return const <AccessRelationshipSchema>[];
    }

    try {
      final tableReader = TableReader(format: format, pageChannel: pageChannel);
      final rows = await tableReader.readAllRows(msysRelationshipsEntry.id);
      final grouped = <String, List<Map<String, dynamic>>>{};

      for (final row in rows) {
        final relationshipName = row['szRelationship']?.toString();
        if (relationshipName == null || relationshipName.isEmpty) {
          continue;
        }
        grouped
            .putIfAbsent(relationshipName, () => <Map<String, dynamic>>[])
            .add(row);
      }

      final relationships = grouped.entries.map((entry) {
        final rows = entry.value.toList()
          ..sort((a, b) {
            final left = (a['icolumn'] as num?)?.toInt() ?? 0;
            final right = (b['icolumn'] as num?)?.toInt() ?? 0;
            return left.compareTo(right);
          });

        final first = rows.first;
        return AccessRelationshipSchema(
          name: entry.key,
          fromTable: first['szObject']?.toString() ?? '',
          fromColumns: rows
              .map((row) => row['szColumn']?.toString() ?? '')
              .where((value) => value.isNotEmpty)
              .toList(),
          toTable: first['szReferencedObject']?.toString() ?? '',
          toColumns: rows
              .map((row) => row['szReferencedColumn']?.toString() ?? '')
              .where((value) => value.isNotEmpty)
              .toList(),
          flags: (first['grbit'] as num?)?.toInt() ?? 0,
          columnCount: (first['ccolumn'] as num?)?.toInt() ?? rows.length,
        );
      }).toList()
        ..sort((a, b) => a.name.compareTo(b.name));

      return relationships;
    } catch (_) {
      return const <AccessRelationshipSchema>[];
    }
  }

  // ─── Debug helper ─────────────────────────────────────────────────────────
  Future<List<AccessCatalogEntry>> debugGetAllEntries() =>
      _readAllCatalogEntries();

  // ─── Private helpers ──────────────────────────────────────────────────────

  /// Scan every data page of MSysObjects and return all catalog entries.
  Future<List<AccessCatalogEntry>> _readAllCatalogEntries() async {
    final tdefReader = TableDefReader(
        format: format, pageChannel: pageChannel, pageNumber: _sysCatalogPage);
    final cols = await tdefReader.readColumns();
    final rowReader =
        RowReader(format: format, columns: cols, pageChannel: pageChannel);

    // Find the data pages for MSysObjects using UsageMap
    final tdefBuf = await pageChannel.readPage(_sysCatalogPage);
    final tdefUint8 = tdefBuf.asUint8List();
    const usageMapOffset = 55; // OFFSET_OWNED_PAGES for Jet4
    final usageMap = await UsageMap.readFromTdef(
      pageChannel: pageChannel,
      format: format,
      tdefData: tdefUint8,
      tdefOffset: usageMapOffset,
    );

    final dataReader = DataPageReader(format: format, pageChannel: pageChannel);
    final entries = <AccessCatalogEntry>[];

    for (final pageNum in usageMap.pageNumbers) {
      try {
        final rows = await dataReader.readPageRows(pageNum);
        for (final row in rows) {
          if (row.isDeleted || row.isOverflow) continue;
          final map = await rowReader.readRow(row);
          final entry = _mapToEntry(map);
          if (entry != null) entries.add(entry);
        }
      } catch (_) {}
    }

    return entries;
  }

  AccessCatalogEntry? _mapToEntry(Map<String, dynamic> row) {
    final name = row['Name'];
    final id = row['Id'];
    final parentId = row['ParentId'];
    final type = row['Type'];
    final flags = row['Flags'];
    if (name == null || id == null || type == null) return null;

    final rawType = type is int ? type : (type as num).toInt();
    return AccessCatalogEntry(
      id: id is int ? id : (id as num).toInt(),
      parentId: parentId is int ? parentId : (parentId as num?)?.toInt() ?? 0,
      name: name.toString(),
      objectType: AccessObjectType.fromTypeValue(rawType),
      flags: flags is int ? flags : (flags as num?)?.toInt() ?? 0,
      rawType: rawType,
    );
  }

  /// Read MSysQueries to build query definitions.
  Future<List<AccessQueryDef>> _readQueries(
      List<AccessCatalogEntry> queryEntries) async {
    // Find MSysQueries table entry
    final allEntries = await _readAllCatalogEntries();
    final msysQueriesEntry = allEntries.firstWhere(
      (e) => e.name == 'MSysQueries',
      orElse: () => AccessCatalogEntry(
          id: 0,
          parentId: 0,
          name: '',
          objectType: AccessObjectType.unknown,
          flags: 0,
          rawType: 0),
    );

    if (msysQueriesEntry.id == 0) return [];

    try {
      final qTdefReader = TableDefReader(
          format: format,
          pageChannel: pageChannel,
          pageNumber: msysQueriesEntry.id);
      final cols = await qTdefReader.readColumns();
      final rowReader =
          RowReader(format: format, columns: cols, pageChannel: pageChannel);

      final tdefBuf = await pageChannel.readPage(msysQueriesEntry.id);
      final tdefUint8 = tdefBuf.asUint8List();
      const usageMapOffset = 55; // OFFSET_OWNED_PAGES for Jet4
      final usageMap = await UsageMap.readFromTdef(
        pageChannel: pageChannel,
        format: format,
        tdefData: tdefUint8,
        tdefOffset: usageMapOffset,
      );

      final dataReader =
          DataPageReader(format: format, pageChannel: pageChannel);
      // Group rows by ObjectId – each query has multiple rows in MSysQueries
      final Map<int, List<Map<String, dynamic>>> grouped = {};

      for (final pageNum in usageMap.pageNumbers) {
        try {
          final rows = await dataReader.readPageRows(pageNum);
          for (final row in rows) {
            if (row.isDeleted || row.isOverflow) continue;
            final map = await rowReader.readRow(row);
            final objId = map['ObjectId'];
            if (objId == null) continue;
            final id = objId is int ? objId : (objId as num).toInt();
            grouped.putIfAbsent(id, () => []).add(map);
          }
        } catch (_) {}
      }

      // Build one AccessQueryDef per objectId
      final defs = <AccessQueryDef>[];
      for (final entry in queryEntries) {
        final rows = grouped[entry.id] ?? [];
        // Reconstruct SQL from Expression columns in attribute=1 rows (TYPE row)
        // and attribute=5 rows (TABLE rows), attribute=6 (COLUMN), etc.
        final queryType = inferQueryTypeFromRows(rows);
        final sqlText = reconstructSqlFromRows(rows, queryType);
        defs.add(AccessQueryDef(
          name: entry.name,
          objectId: entry.id,
          sqlText: sqlText,
          queryType: queryType,
          rows: _mapQueryRows(rows),
        ));
      }
      return defs;
    } catch (e) {
      return [];
    }
  }

  List<AccessQueryRow> _mapQueryRows(List<Map<String, dynamic>> rows) {
    int? asInt(dynamic value) {
      if (value is int) {
        return value;
      }
      if (value is num) {
        return value.toInt();
      }
      return null;
    }

    final mapped = rows.map((row) {
      final attribute = asInt(row['Attribute']);
      return AccessQueryRow(
        attribute: attribute,
        attributeName: AccessQueryRow.attributeNameFor(attribute),
        flag: asInt(row['Flag']),
        expression: row['Expression']?.toString(),
        expressionAst:
            AccessExpressionParser.tryParse(row['Expression']?.toString()),
        name1: row['Name1']?.toString(),
        name2: row['Name2']?.toString(),
        extra: asInt(row['Extra']),
        order: asInt(row['Order']),
      );
    }).toList();

    mapped.sort((a, b) {
      final orderA = a.order ?? 1 << 30;
      final orderB = b.order ?? 1 << 30;
      if (orderA != orderB) {
        return orderA.compareTo(orderB);
      }
      return (a.attribute ?? 1 << 30).compareTo(b.attribute ?? 1 << 30);
    });
    return mapped;
  }
}

class _AccessQuerySqlBuilder {
  static const int _queryFlagMask = 0xF0;

  int inferQueryType(List<Map<String, dynamic>> rows) {
    final typeRow = rows.where((r) => r['Attribute'] == 1).firstOrNull;
    final explicit = _asInt(typeRow?['Flag']) ?? 0;
    final mappedExplicit = _mapObjectFlagToQueryType(explicit);
    if (mappedExplicit != 0) {
      return mappedExplicit;
    }

    if (rows.any((r) => r['Attribute'] == 5 || r['Attribute'] == 6)) {
      return 1;
    }
    return 0;
  }

  String? reconstructSql(List<Map<String, dynamic>> rows, int queryType) {
    final passthroughRows = rows.where((r) => r['Attribute'] == 4).toList();
    if (queryType == 8 && passthroughRows.isNotEmpty) {
      return passthroughRows
          .map((r) => r['Expression']?.toString() ?? '')
          .where((part) => part.isNotEmpty)
          .join(' ');
    }

    switch (queryType) {
      case 1:
        return _buildSelectSql(rows);
      default:
        final parts = rows
            .where((r) => r['Expression'] != null)
            .map((r) => '-- attr=${r['Attribute']}: ${r['Expression']}')
            .join('\n');
        return parts.isEmpty ? null : parts;
    }
  }

  int? _asInt(dynamic value) {
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    return null;
  }

  int _mapObjectFlagToQueryType(int rawFlag) {
    switch (rawFlag & _queryFlagMask) {
      case 0:
        return 1;
      case 80:
        return 2;
      case 64:
        return 3;
      case 48:
        return 4;
      case 32:
        return 5;
      case 16:
        return 6;
      case 96:
        return 7;
      case 112:
        return 8;
      case 128:
        return 9;
      default:
        return 0;
    }
  }

  String? _buildSelectSql(List<Map<String, dynamic>> rows) {
    final flagRow = rows.where((r) => r['Attribute'] == 3).firstOrNull;
    final selectFlags = _asInt(flagRow?['Flag']) ?? 0;
    final tableRows = rows.where((r) => r['Attribute'] == 5).toList();
    final joinRows = rows.where((r) => r['Attribute'] == 7).toList();
    final columnRows = rows.where((r) => r['Attribute'] == 6).toList();
    final whereRow = rows.where((r) => r['Attribute'] == 8).firstOrNull;
    final groupRows = rows.where((r) => r['Attribute'] == 9).toList();
    final havingRow = rows.where((r) => r['Attribute'] == 10).firstOrNull;
    final orderRows = rows.where((r) => r['Attribute'] == 11).toList();

    final selectPrefix = _buildSelectPrefix(selectFlags);
    final columns = _buildSelectColumns(columnRows, tableRows, selectFlags);
    final fromTables = _buildFromTables(tableRows, joinRows);
    final whereExpr =
        _normalizeNullableExpression(whereRow?['Expression']?.toString());
    final groupExprs = groupRows
        .map((row) =>
            _normalizeNullableExpression(row['Expression']?.toString()))
        .whereType<String>()
        .toList();
    final havingExpr =
        _normalizeNullableExpression(havingRow?['Expression']?.toString());
    final orderExprs = orderRows
        .map((row) => _buildOrdering(row))
        .whereType<String>()
        .toList();

    if (columns.isEmpty && fromTables.isEmpty) {
      return null;
    }

    final builder = StringBuffer();
    builder.write('SELECT');
    if (selectPrefix.isNotEmpty) {
      builder.write(' $selectPrefix');
    }
    builder.write('\n  ');
    builder.write(columns.join(',\n  '));

    if (fromTables.isNotEmpty) {
      builder.write('\nFROM\n  ');
      builder.write(fromTables.join(',\n  '));
    }
    if (whereExpr != null && whereExpr.isNotEmpty) {
      builder.write('\nWHERE\n  $whereExpr');
    }
    if (groupExprs.isNotEmpty) {
      builder.write('\nGROUP BY\n  ');
      builder.write(groupExprs.join(',\n  '));
    }
    if (havingExpr != null && havingExpr.isNotEmpty) {
      builder.write('\nHAVING\n  $havingExpr');
    }
    if (orderExprs.isNotEmpty) {
      builder.write('\nORDER BY\n  ');
      builder.write(orderExprs.join(',\n  '));
    }
    return builder.toString();
  }

  String _buildSelectPrefix(int flags) {
    if ((flags & 0x02) != 0) {
      return 'DISTINCT';
    }
    if ((flags & 0x08) != 0) {
      return 'DISTINCTROW';
    }
    return '';
  }

  List<String> _buildSelectColumns(
    List<Map<String, dynamic>> columnRows,
    List<Map<String, dynamic>> tableRows,
    int selectFlags,
  ) {
    final columns = <String>[];
    for (final row in columnRows) {
      var expression = row['Expression']?.toString();
      final alias = row['Name1']?.toString();

      if (expression == null || expression.isEmpty) {
        if (tableRows.length == 1) {
          expression =
              '${_quoteIdentifierPath(tableRows.first['Name1']?.toString() ?? '')}.*';
        } else {
          expression = '*';
        }
      } else {
        expression = _normalizeExpressionForSql(expression);
      }

      if (alias != null && alias.isNotEmpty) {
        columns.add('$expression AS ${_quoteIdentifierPath(alias)}');
      } else {
        columns.add(expression);
      }
    }

    if (columns.isEmpty ||
        ((selectFlags & 0x01) != 0 && !columns.contains('*'))) {
      if (tableRows.length == 1) {
        columns.insert(
          0,
          '${_quoteIdentifierPath(tableRows.first['Name1']?.toString() ?? '')}.*',
        );
      } else {
        columns.insert(0, '*');
      }
    }
    return columns;
  }

  List<String> _buildFromTables(
    List<Map<String, dynamic>> tableRows,
    List<Map<String, dynamic>> joinRows,
  ) {
    final sourcesByName = <String, _SqlTableSource>{};
    final orderedNames = <String>[];

    for (final row in tableRows) {
      final source = _SqlTableSource.fromRow(row, _quoteIdentifierPath);
      for (final key in source.tableNames) {
        sourcesByName[key] = source;
      }
      final primaryName = row['Name1']?.toString();
      if (primaryName != null && primaryName.isNotEmpty) {
        orderedNames.add(primaryName.toLowerCase());
      }
    }

    final usedNames = <String>{};
    final joinSources = <_SqlTableSource>[];

    for (final row in joinRows) {
      final leftName = row['Name1']?.toString();
      final rightName = row['Name2']?.toString();
      final onExpr =
          _normalizeNullableExpression(row['Expression']?.toString());
      final joinType = _joinTypeForFlag(_asInt(row['Flag']) ?? 0);
      if (leftName == null ||
          rightName == null ||
          onExpr == null ||
          joinType == null) {
        continue;
      }

      final leftKey = leftName.toLowerCase();
      final rightKey = rightName.toLowerCase();
      var left = sourcesByName[leftKey];
      var right = sourcesByName[rightKey];

      if (left == null && right == null) {
        left = _SqlTableSource.raw(_quoteIdentifierPath(leftName), leftKey);
        right = _SqlTableSource.raw(_quoteIdentifierPath(rightName), rightKey);
      }
      left ??= _SqlTableSource.raw(_quoteIdentifierPath(leftName), leftKey);
      right ??= _SqlTableSource.raw(_quoteIdentifierPath(rightName), rightKey);

      final joined = _SqlTableSource.join(left, right, joinType, onExpr);
      for (final key in {...left.tableNames, ...right.tableNames}) {
        sourcesByName[key] = joined;
        usedNames.add(key);
      }
      joinSources.removeWhere((source) => source.overlaps(joined));
      joinSources.add(joined);
    }

    final fromParts = <String>[];
    final emitted = <_SqlTableSource>{};

    for (final name in orderedNames) {
      final source = sourcesByName[name];
      if (source == null || emitted.contains(source)) {
        continue;
      }
      if (usedNames.contains(name)) {
        fromParts.add(source.sql);
        emitted.add(source);
      } else {
        fromParts.add(source.sql);
        emitted.add(source);
      }
    }

    for (final source in joinSources) {
      if (!emitted.contains(source)) {
        fromParts.add(source.sql);
        emitted.add(source);
      }
    }

    return fromParts;
  }

  String? _joinTypeForFlag(int flag) {
    switch (flag) {
      case 1:
        return 'INNER JOIN';
      case 2:
        return 'LEFT JOIN';
      case 3:
        return 'RIGHT JOIN';
      default:
        return null;
    }
  }

  String? _buildOrdering(Map<String, dynamic> row) {
    final expression = row['Expression']?.toString();
    if (expression == null || expression.isEmpty) {
      return null;
    }
    final normalized = _normalizeExpressionForSql(expression);
    final direction = row['Name1']?.toString();
    if (direction != null && direction.toUpperCase() == 'D') {
      return '$normalized DESC';
    }
    return normalized;
  }

  String? _normalizeNullableExpression(String? expression) {
    if (expression == null) {
      return null;
    }
    final trimmed = expression.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    return _normalizeExpressionForSql(trimmed);
  }

  String _normalizeExpressionForSql(String expression) {
    final trimmed = expression.trim();
    if (trimmed.isEmpty) {
      return trimmed;
    }
    if (trimmed == '*') {
      return trimmed;
    }
    if (_looksLikeSimpleIdentifierPath(trimmed)) {
      if (trimmed.endsWith('.*')) {
        final prefix = trimmed.substring(0, trimmed.length - 2);
        return '${_quoteIdentifierPath(prefix)}.*';
      }
      return _quoteIdentifierPath(trimmed);
    }
    return expression;
  }

  bool _looksLikeSimpleIdentifierPath(String value) {
    for (var i = 0; i < value.length; i++) {
      final char = value.codeUnitAt(i);
      final isAsciiLetter =
          (char >= 65 && char <= 90) || (char >= 97 && char <= 122);
      final isDigit = char >= 48 && char <= 57;
      final isTrailingStar = char == 42 &&
          i == value.length - 1 &&
          i > 0 &&
          value.codeUnitAt(i - 1) == 46;
      const allowedPunctuation = '._[]';
      final isAllowedPunctuation = allowedPunctuation.codeUnits.contains(char);
      if (!(isAsciiLetter ||
          isDigit ||
          isAllowedPunctuation ||
          isTrailingStar)) {
        return false;
      }
    }
    return true;
  }

  String _quoteIdentifierPath(String value) {
    if (value.isEmpty) {
      return value;
    }
    return value
        .split('.')
        .map((part) =>
            part.startsWith('[') && part.endsWith(']') ? part : '[$part]')
        .join('.');
  }
}

class _SqlTableSource {
  final String sql;
  final Set<String> tableNames;

  const _SqlTableSource(this.sql, this.tableNames);

  String get lookupKey => tableNames.first;

  bool overlaps(_SqlTableSource other) =>
      tableNames.any(other.tableNames.contains);

  static _SqlTableSource fromRow(
    Map<String, dynamic> row,
    String Function(String value) quoteIdentifierPath,
  ) {
    final tableName = row['Name1']?.toString() ?? '';
    final alias = row['Name2']?.toString();
    final expression = row['Expression']?.toString();
    final sourceSql = <String>[];
    if (expression != null && expression.isNotEmpty) {
      sourceSql.add('[$expression]');
    } else {
      sourceSql.add(quoteIdentifierPath(tableName));
    }
    if (alias != null && alias.isNotEmpty) {
      sourceSql.add('AS ${quoteIdentifierPath(alias)}');
    }
    final keys = <String>{
      if (tableName.isNotEmpty) tableName.toLowerCase(),
      if (alias != null && alias.isNotEmpty) alias.toLowerCase(),
    };
    return _SqlTableSource(sourceSql.join(' '), keys);
  }

  static _SqlTableSource raw(String sql, String lookupKey) =>
      _SqlTableSource(sql, {lookupKey});

  static _SqlTableSource join(
    _SqlTableSource left,
    _SqlTableSource right,
    String joinType,
    String onExpression,
  ) {
    final sql = '(${left.sql} $joinType ${right.sql} ON $onExpression)';
    return _SqlTableSource(sql, {...left.tableNames, ...right.tableNames});
  }
}
