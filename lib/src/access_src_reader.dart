import 'dart:convert';
import 'dart:io';

import 'package:xml/xml.dart';
import 'access_src_model.dart';

class AccessSrcReader {
  Future<AccessSrcProject> readDirectory(String path) async {
    final directory = Directory(path);
    if (!await directory.exists()) {
      throw FileSystemException('ACCDB source directory not found', path);
    }

    final tables = await _readTables(directory);
    final queries = await _readQueries(directory);
    final forms = await _readForms(directory);

    return AccessSrcProject(
      sourcePath: directory.path,
      tables: tables,
      queries: queries,
      forms: forms,
    );
  }

  Future<List<AccessSrcTable>> _readTables(Directory directory) async {
    final sqlDir = Directory('${directory.path}\\tbldefs');
    // For non-Windows environments fallback gracefully to /
    final altSqlDir = Directory('${directory.path}/tbldefs');

    final dirToRead = await sqlDir.exists()
        ? sqlDir
        : (await altSqlDir.exists() ? altSqlDir : null);
    if (dirToRead == null) return const <AccessSrcTable>[];

    final sqlFiles = await dirToRead
        .list()
        .where((entity) => entity is File && entity.path.endsWith('.sql'))
        .cast<File>()
        .toList();
    sqlFiles.sort((a, b) => a.path.compareTo(b.path));

    final jsonFiles = await dirToRead
        .list()
        .where((entity) => entity is File && entity.path.endsWith('.json'))
        .cast<File>()
        .toList();
    jsonFiles.sort((a, b) => a.path.compareTo(b.path));

    final tables = <AccessSrcTable>[];
    for (final sqlFile in sqlFiles) {
      final baseName = _basenameWithoutExtension(sqlFile.path);
      final xmlFile =
          File('${dirToRead.path}${Platform.pathSeparator}$baseName.xml');
      final sql = (await sqlFile.readAsString()).trim();
      final xml = await xmlFile.exists() ? await xmlFile.readAsString() : null;

      tables.add(_parseTable(baseName, sql, xml));
    }

    final seenNames = tables.map((table) => table.name.toLowerCase()).toSet();
    for (final jsonFile in jsonFiles) {
      final baseName = _basenameWithoutExtension(jsonFile.path);
      if (seenNames.contains(baseName.toLowerCase())) {
        continue;
      }
      final json = await jsonFile.readAsString();
      final parsed = _parseJsonTable(baseName, json);
      if (parsed != null) {
        tables.add(parsed);
      }
    }

    tables.sort((a, b) => a.name.compareTo(b.name));

    return tables;
  }

  Future<List<AccessSrcQuery>> _readQueries(Directory directory) async {
    final queriesDir =
        Directory('${directory.path}${Platform.pathSeparator}queries');
    if (!await queriesDir.exists()) {
      return const <AccessSrcQuery>[];
    }

    final sqlFiles = await queriesDir
        .list()
        .where((entity) => entity is File && entity.path.endsWith('.sql'))
        .cast<File>()
        .toList();
    sqlFiles.sort((a, b) => a.path.compareTo(b.path));

    return Future.wait(
      sqlFiles.map((file) async {
        return AccessSrcQuery(
          name: _basenameWithoutExtension(file.path),
          sql: (await file.readAsString()).trim(),
        );
      }),
    );
  }

  Future<List<AccessSrcForm>> _readForms(Directory directory) async {
    final formsDir =
        Directory('${directory.path}${Platform.pathSeparator}forms');
    if (!await formsDir.exists()) {
      return const <AccessSrcForm>[];
    }

    final basFiles = await formsDir
        .list()
        .where((entity) => entity is File && entity.path.endsWith('.bas'))
        .cast<File>()
        .toList();
    basFiles.sort((a, b) => a.path.compareTo(b.path));

    return Future.wait(
      basFiles.map((file) async {
        final text = await file.readAsString();
        return _parseForm(_basenameWithoutExtension(file.path), text);
      }),
    );
  }

  AccessSrcTable _parseTable(String fallbackName, String sql, String? xml) {
    final sqlColumns = _parseSqlColumns(sql);
    if (xml == null) {
      return AccessSrcTable(
        name: fallbackName,
        sql: sql,
        columns: sqlColumns,
        indexes: const <AccessSrcIndex>[],
      );
    }

    final tableName = _extractTableNameFromXml(xml) ?? fallbackName;
    final indexes = _parseIndexes(xml);
    final xmlColumns = _parseXmlColumns(xml, tableName);

    return AccessSrcTable(
      name: tableName,
      sql: sql,
      columns: xmlColumns.isNotEmpty ? xmlColumns : sqlColumns,
      indexes: indexes,
    );
  }

  AccessSrcTable? _parseJsonTable(String fallbackName, String json) {
    try {
      final decoded = json.isEmpty ? null : jsonDecode(json);
      if (decoded is! Map<String, dynamic>) {
        return null;
      }
      final info = decoded['Info'];
      final items = decoded['Items'];
      if (info is! Map || items is! Map) {
        return null;
      }
      if (info['Class']?.toString() != 'clsDbTableDef') {
        return null;
      }

      final name = items['Name']?.toString() ?? fallbackName;
      final connect = items['Connect']?.toString();
      final sourceTableName = items['SourceTableName']?.toString();
      final primaryKey = items['PrimaryKey']?.toString();
      final isLinked = connect != null && connect.isNotEmpty;

      return AccessSrcTable(
        name: name,
        sql: '',
        columns: const <AccessSrcColumn>[],
        indexes: primaryKey == null || primaryKey.isEmpty
            ? const <AccessSrcIndex>[]
            : <AccessSrcIndex>[
                AccessSrcIndex(
                  name: 'PrimaryKey',
                  key: primaryKey,
                  primary: true,
                  unique: true,
                ),
              ],
        isLinked: isLinked,
        sourceTableName: sourceTableName,
        connect: connect,
        primaryKey: primaryKey,
      );
    } catch (_) {
      return null;
    }
  }

  List<AccessSrcColumn> _parseSqlColumns(String sql) {
    final createTableStr = "CREATE TABLE ";
    int tableStrIndex = sql.toUpperCase().indexOf(createTableStr);
    if (tableStrIndex < 0) return const <AccessSrcColumn>[];

    int openParen = sql.indexOf('(', tableStrIndex);
    int closeParen = sql.lastIndexOf(')');
    if (openParen < 0 || closeParen < openParen) {
      return const <AccessSrcColumn>[];
    }

    String body = sql.substring(openParen + 1, closeParen);
    List<String> rawColumns = [];
    int depth = 0;
    int start = 0;
    for (int i = 0; i < body.length; i++) {
      if (body[i] == '(') {
        depth++;
      } else if (body[i] == ')') {
        depth--;
      } else if (body[i] == ',' && depth == 0) {
        rawColumns.add(body.substring(start, i).trim());
        start = i + 1;
      }
    }
    if (start < body.length) {
      rawColumns.add(body.substring(start).trim());
    }

    final columns = <AccessSrcColumn>[];
    for (String line in rawColumns) {
      if (line.isEmpty) continue;

      int nameStart = line.indexOf('[');
      int nameEnd = line.indexOf(']');
      if (nameStart < 0 || nameEnd < nameStart) continue; // fallback to skip

      String name = line.substring(nameStart + 1, nameEnd);
      String definition = line.substring(nameEnd + 1).trim();

      String? type;
      int? maxLength;

      int firstSpace = _indexOfFirstBoundary(definition);
      if (firstSpace > 0) {
        type = definition.substring(0, firstSpace);
        String restOfDef = definition.substring(firstSpace).trim();
        if (restOfDef.startsWith('(')) {
          int pqEnd = restOfDef.indexOf(')');
          if (pqEnd > 0) {
            maxLength = int.tryParse(restOfDef.substring(1, pqEnd).trim());
          }
        }
      } else {
        type = definition.isEmpty ? null : definition;
      }

      columns.add(AccessSrcColumn(
        name: name,
        accessType: type,
        sqlType: null,
        caption: null,
        required: definition.toUpperCase().contains('NOT NULL'),
        maxLength: maxLength,
        isAttachment: name == 'Anexos',
        isCalculated: false,
        expression: null,
        children: const [],
      ));
    }
    return columns;
  }

  int _indexOfFirstBoundary(String s) {
    for (int i = 0; i < s.length; i++) {
      if (s[i] == ' ' || s[i] == '(' || s[i] == ',') return i;
    }
    return -1;
  }

  String? _extractTableNameFromXml(String xmlStr) {
    try {
      final document = XmlDocument.parse(xmlStr);
      final schemas = document.findAllElements('xsd:schema');
      if (schemas.isNotEmpty) {
        final elements = schemas.first.findElements('xsd:element').toList();
        if (elements.length > 1) {
          return elements[1].getAttribute('name');
        } else if (elements.isNotEmpty &&
            elements.first.getAttribute('name') != 'dataroot') {
          return elements.first.getAttribute('name');
        }
      }
    } catch (_) {}
    return null;
  }

  List<AccessSrcIndex> _parseIndexes(String xmlStr) {
    final indexes = <AccessSrcIndex>[];
    try {
      final document = XmlDocument.parse(xmlStr);
      final indexTags = document.findAllElements('od:index');
      for (final el in indexTags) {
        indexes.add(AccessSrcIndex(
          name: el.getAttribute('name') ?? el.getAttribute('index-name') ?? '',
          key: el.getAttribute('index-key')?.trim() ?? '',
          primary: el.getAttribute('primary') == 'yes',
          unique: el.getAttribute('unique') == 'yes',
        ));
      }
    } catch (_) {}
    return indexes;
  }

  List<AccessSrcColumn> _parseXmlColumns(String xmlStr, String tableName) {
    try {
      final document = XmlDocument.parse(xmlStr);
      final elements = document.findAllElements('xsd:element');
      for (final el in elements) {
        if (el.getAttribute('name') == tableName &&
            el.parent != null &&
            el.parent is XmlElement &&
            (el.parent as XmlElement).name.local == 'schema') {
          return _parseXmlNodeColumns(el);
        }
      }
    } catch (_) {}
    return const [];
  }

  List<AccessSrcColumn> _parseXmlNodeColumns(XmlElement element) {
    final complexType = element.findElements('xsd:complexType').firstOrNull;
    final sequence = complexType?.findElements('xsd:sequence').firstOrNull;
    if (sequence == null) return const [];
    return _parseXmlSequence(sequence);
  }

  List<AccessSrcColumn> _parseXmlSequence(XmlElement sequence) {
    final result = <AccessSrcColumn>[];
    for (final el in sequence.findElements('xsd:element')) {
      result.add(_parseXmlColumnNode(el));
    }
    return result;
  }

  AccessSrcColumn _parseXmlColumnNode(XmlElement el) {
    final name = el.getAttribute('name') ?? '';
    final accessType = el.getAttribute('od:jetType');
    final sqlType = el.getAttribute('od:sqlSType');
    final nonNullable = el.getAttribute('od:nonNullable') == 'yes';
    final isComplex =
        el.getAttribute('od:jetComplexType') == 'MSysComplexType_Attachment';

    int? maxLength;
    final simpleType = el.findElements('xsd:simpleType').firstOrNull;
    if (simpleType != null) {
      final restriction =
          simpleType.findElements('xsd:restriction').firstOrNull;
      if (restriction != null) {
        final maxEl = restriction.findElements('xsd:maxLength').firstOrNull;
        if (maxEl != null) {
          maxLength = int.tryParse(maxEl.getAttribute('value') ?? '');
        }
      }
    }

    String? caption;
    String? expression;
    bool required = nonNullable;

    final annotation = el.findElements('xsd:annotation').firstOrNull;
    if (annotation != null) {
      final appinfo = annotation.findElements('xsd:appinfo').firstOrNull;
      if (appinfo != null) {
        final fieldProps = appinfo.findElements('od:fieldProperty');
        for (final prop in fieldProps) {
          final propName = prop.getAttribute('name');
          final propValue = prop.getAttribute('value');
          if (propName == 'Caption') caption = propValue;
          if (propName == 'Required' && propValue == '1') required = true;
          if (propName == 'Expression') expression = propValue;
        }
      }
    }

    final attrExpr = el.getAttribute('od:expression');
    if (attrExpr != null) {
      expression = attrExpr;
    }

    final children = _parseXmlNodeColumns(el);

    return AccessSrcColumn(
      name: name,
      accessType: accessType,
      sqlType: sqlType,
      caption: caption,
      required: required,
      maxLength: maxLength,
      isAttachment: isComplex,
      isCalculated: expression != null && expression.isNotEmpty,
      expression: expression,
      children: children,
    );
  }

  AccessSrcForm _parseForm(String name, String text) {
    final root = _parseBasTree(text);
    final formNode = root.children.firstWhere(
      (child) => child.type == 'Form',
      orElse: () => _BasNode('Form'),
    );
    final controls = <AccessSrcControl>[];
    void collectControls(_BasNode node) {
      if (_isRelevantControlType(node.type)) {
        final blockName = node.properties['Name'];
        if (blockName != null && !_isNoiseControl(blockName)) {
          controls.add(
            AccessSrcControl(
              type: node.type,
              name: blockName,
              controlSource: node.properties['ControlSource'],
              caption: node.properties['Caption'],
              macros: _collectMacros(node),
            ),
          );
        }
      }
      for (final child in node.children) {
        collectControls(child);
      }
    }

    collectControls(formNode);

    return AccessSrcForm(
      name: name,
      caption: formNode.properties['Caption'],
      recordSource: formNode.properties['RecordSource'],
      defaultView: int.tryParse(formNode.properties['DefaultView'] ?? ''),
      controls: controls,
      macros: _collectMacros(formNode),
    );
  }

  bool _isNoiseControl(String name) {
    return name.startsWith('zecEmptyCell');
  }

  String _basenameWithoutExtension(String path) {
    final fileName = path.split(Platform.pathSeparator).last;
    final dotIndex = fileName.lastIndexOf('.');
    return dotIndex < 0 ? fileName : fileName.substring(0, dotIndex);
  }

  String _unquoteBasValue(String rawValue) {
    if (rawValue.startsWith('"') &&
        rawValue.endsWith('"') &&
        rawValue.length >= 2) {
      return rawValue.substring(1, rawValue.length - 1).replaceAll('""', '"');
    }
    return rawValue;
  }

  _BasNode _parseBasTree(String text) {
    final root = _BasNode('Root');
    final stack = <_BasNode>[root];

    for (final rawLine in text.split('\n')) {
      final trimmed = rawLine.trim();
      if (trimmed.isEmpty) {
        continue;
      }

      if (trimmed == 'End') {
        if (stack.length > 1) {
          stack.removeLast();
        }
        continue;
      }

      if (trimmed == 'Begin') {
        final node = _BasNode('_Anonymous');
        stack.last.children.add(node);
        stack.add(node);
        continue;
      }

      if (trimmed.startsWith('Begin ')) {
        final node = _BasNode(trimmed.substring('Begin '.length).trim());
        stack.last.children.add(node);
        stack.add(node);
        continue;
      }

      int equalIndex = trimmed.indexOf('=');
      if (equalIndex > 0) {
        String propName = trimmed.substring(0, equalIndex).trim();
        String propValue = trimmed.substring(equalIndex + 1).trim();

        if (propName.endsWith('EmMacro') && propValue == 'Begin') {
          final node = _BasNode('macro:$propName');
          stack.last.children.add(node);
          stack.add(node);
        } else if (propValue == 'Begin') {
          final node = _BasNode('property:$propName');
          stack.last.children.add(node);
          stack.add(node);
        } else {
          stack.last.properties[propName] = _unquoteBasValue(propValue);
        }
      }
    }

    return root;
  }

  Map<String, List<String>> _collectMacros(_BasNode node) {
    final macros = <String, List<String>>{};
    for (final child in node.children) {
      if (child.type.startsWith('macro:')) {
        final macroName = child.type.substring('macro:'.length);
        final actions = <String>[];

        void collectActions(_BasNode actionNode) {
          final action = actionNode.properties['Action'];
          if (action != null) {
            actions.add(action);
          }
          for (final nested in actionNode.children) {
            collectActions(nested);
          }
        }

        collectActions(child);
        macros[macroName] = actions;
      }
    }
    return macros;
  }

  bool _isRelevantControlType(String type) {
    return switch (type) {
      'TextBox' ||
      'Attachment' ||
      'CommandButton' ||
      'ComboBox' ||
      'CheckBox' ||
      'ListBox' ||
      'Subform' ||
      'Label' =>
        true,
      _ => false,
    };
  }
}

class _BasNode {
  final String type;
  final Map<String, String> properties = <String, String>{};
  final List<_BasNode> children = <_BasNode>[];

  _BasNode(this.type);
}
