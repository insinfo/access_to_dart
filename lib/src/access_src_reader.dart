import 'dart:io';

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
    if (!await sqlDir.exists()) {
      return const <AccessSrcTable>[];
    }

    final sqlFiles = await sqlDir
        .list()
        .where((entity) => entity is File && entity.path.endsWith('.sql'))
        .cast<File>()
        .toList();
    sqlFiles.sort((a, b) => a.path.compareTo(b.path));

    final tables = <AccessSrcTable>[];
    for (final sqlFile in sqlFiles) {
      final baseName = _basenameWithoutExtension(sqlFile.path);
      final xmlFile = File('${sqlDir.path}\\$baseName.xml');
      final sql = (await sqlFile.readAsString()).trim();
      final xml = await xmlFile.exists() ? await xmlFile.readAsString() : null;

      tables.add(_parseTable(baseName, sql, xml));
    }

    return tables;
  }

  Future<List<AccessSrcQuery>> _readQueries(Directory directory) async {
    final queriesDir = Directory('${directory.path}\\queries');
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
    final formsDir = Directory('${directory.path}\\forms');
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

  List<AccessSrcColumn> _parseSqlColumns(String sql) {
    final match = RegExp(
      r'CREATE TABLE \[[^\]]+\] \(([\s\S]+)\)$',
      caseSensitive: false,
    ).firstMatch(sql.trim());
    if (match == null) {
      return const <AccessSrcColumn>[];
    }

    final body = match.group(1)!;
    final lines = body
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .map((line) =>
            line.endsWith(',') ? line.substring(0, line.length - 1) : line)
        .toList();

    final columns = <AccessSrcColumn>[];
    for (final line in lines) {
      final columnMatch = RegExp(r'^\[([^\]]+)\]\s+(.+)$').firstMatch(line);
      if (columnMatch == null) {
        continue;
      }

      final name = columnMatch.group(1)!;
      final definition = columnMatch.group(2)!;
      final typeMatch =
          RegExp(r'^([A-Z]+(?:\s*\([^)]+\))?)', caseSensitive: false)
              .firstMatch(definition);
      final type = typeMatch?.group(1)?.trim();

      columns.add(
        AccessSrcColumn(
          name: name,
          accessType: type,
          sqlType: null,
          caption: null,
          required: definition.toUpperCase().contains('NOT NULL'),
          maxLength: _extractLength(type),
          isAttachment: name == 'Anexos',
          isCalculated: false,
          expression: null,
          children: const <AccessSrcColumn>[],
        ),
      );
    }
    return columns;
  }

  String? _extractTableNameFromXml(String xml) {
    final matches =
        RegExp(r'<xsd:element name="([^"]+)"').allMatches(xml).toList();
    if (matches.length < 2) {
      return null;
    }
    return _decodeXml(matches[1].group(1)!);
  }

  List<AccessSrcIndex> _parseIndexes(String xml) {
    final indexes = <AccessSrcIndex>[];
    final regex = RegExp(
      r'<od:index index-name="([^"]+)" index-key="([^"]+)" primary="([^"]+)" unique="([^"]+)"[\s\S]*?/>',
    );
    for (final match in regex.allMatches(xml)) {
      indexes.add(
        AccessSrcIndex(
          name: _decodeXml(match.group(1)!),
          key: _decodeXml(match.group(2)!).trim(),
          primary: match.group(3) == 'yes',
          unique: match.group(4) == 'yes',
        ),
      );
    }
    return indexes;
  }

  List<AccessSrcColumn> _parseXmlColumns(String xml, String tableName) {
    final tableToken = '<xsd:element name="$tableName"';
    final tableStart = xml.indexOf(tableToken);
    if (tableStart < 0) {
      return const <AccessSrcColumn>[];
    }

    final tableBlock = _extractBalancedElement(xml, tableStart);
    if (tableBlock == null) {
      return const <AccessSrcColumn>[];
    }

    final sequenceBlock =
        _extractBalancedTag(tableBlock, '<xsd:sequence', '</xsd:sequence>');
    if (sequenceBlock == null) {
      return const <AccessSrcColumn>[];
    }

    final contentStart = sequenceBlock.indexOf('>') + 1;
    final contentEnd = sequenceBlock.lastIndexOf('</xsd:sequence>');
    final content = sequenceBlock.substring(contentStart, contentEnd);

    return _extractTopLevelElements(content).map(_parseXmlColumn).toList();
  }

  AccessSrcColumn _parseXmlColumn(String elementXml) {
    final openTagEnd = elementXml.indexOf('>');
    final openTag = elementXml.substring(0, openTagEnd + 1);
    final attrs = _parseAttributes(openTag);
    final properties = _parseFieldProperties(elementXml);
    final nestedSequence =
        _extractBalancedTag(elementXml, '<xsd:sequence', '</xsd:sequence>');

    return AccessSrcColumn(
      name: _decodeXml(attrs['name'] ?? ''),
      accessType: attrs['od:jetType'],
      sqlType: attrs['od:sqlSType'],
      caption: properties['Caption'],
      required:
          attrs['od:nonNullable'] == 'yes' || properties['Required'] == '1',
      maxLength: _parseMaxLength(elementXml),
      isAttachment: attrs['od:jetComplexType'] == 'MSysComplexType_Attachment',
      isCalculated: attrs.containsKey('od:expression') ||
          properties.containsKey('Expression'),
      expression:
          _decodeXml(attrs['od:expression'] ?? properties['Expression'] ?? ''),
      children: nestedSequence == null
          ? const <AccessSrcColumn>[]
          : _parseNestedColumnsFromSequence(nestedSequence),
    );
  }

  List<AccessSrcColumn> _parseNestedColumnsFromSequence(String sequenceBlock) {
    final contentStart = sequenceBlock.indexOf('>') + 1;
    final contentEnd = sequenceBlock.lastIndexOf('</xsd:sequence>');
    final content = sequenceBlock.substring(contentStart, contentEnd);
    return _extractTopLevelElements(content).map(_parseXmlColumn).toList();
  }

  Map<String, String> _parseFieldProperties(String xml) {
    final properties = <String, String>{};
    final regex = RegExp(
      r'<od:fieldProperty name="([^"]+)" type="[^"]+" value="([^"]*)"[\s\S]*?/>',
    );
    for (final match in regex.allMatches(xml)) {
      properties[_decodeXml(match.group(1)!)] = _decodeXml(match.group(2)!);
    }
    return properties;
  }

  int? _parseMaxLength(String xml) {
    final match = RegExp(r'<xsd:maxLength value="(\d+)"').firstMatch(xml);
    return match == null ? null : int.tryParse(match.group(1)!);
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
    final fileName = path.split('\\').last;
    final dotIndex = fileName.lastIndexOf('.');
    return dotIndex < 0 ? fileName : fileName.substring(0, dotIndex);
  }

  int? _extractLength(String? type) {
    if (type == null) {
      return null;
    }
    final match = RegExp(r'\((\d+)\)').firstMatch(type);
    return match == null ? null : int.tryParse(match.group(1)!);
  }

  Map<String, String> _parseAttributes(String openTag) {
    final attributes = <String, String>{};
    final regex = RegExp(r'([A-Za-z0-9:_-]+)="([^"]*)"');
    for (final match in regex.allMatches(openTag)) {
      attributes[match.group(1)!] = _decodeXml(match.group(2)!);
    }
    return attributes;
  }

  String _decodeXml(String value) {
    return value
        .replaceAll('&quot;', '"')
        .replaceAll('&apos;', "'")
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&amp;', '&');
  }

  String _unquoteBasValue(String rawValue) {
    if (rawValue.startsWith('"') &&
        rawValue.endsWith('"') &&
        rawValue.length >= 2) {
      return rawValue.substring(1, rawValue.length - 1).replaceAll('""', '"');
    }
    return rawValue;
  }

  String? _extractBalancedElement(String text, int startIndex) {
    final openStart = text.indexOf('<xsd:element', startIndex);
    if (openStart < 0) {
      return null;
    }

    final openEnd = text.indexOf('>', openStart);
    if (openEnd < 0) {
      return null;
    }

    if (text[openEnd - 1] == '/') {
      return text.substring(openStart, openEnd + 1);
    }

    var depth = 1;
    var cursor = openEnd + 1;
    while (depth > 0) {
      final nextOpen = text.indexOf('<xsd:element', cursor);
      final nextClose = text.indexOf('</xsd:element>', cursor);
      if (nextClose < 0) {
        return null;
      }

      if (nextOpen >= 0 && nextOpen < nextClose) {
        final nestedOpenEnd = text.indexOf('>', nextOpen);
        if (nestedOpenEnd < 0) {
          return null;
        }
        if (text[nestedOpenEnd - 1] != '/') {
          depth++;
        }
        cursor = nestedOpenEnd + 1;
      } else {
        depth--;
        cursor = nextClose + '</xsd:element>'.length;
      }
    }

    return text.substring(openStart, cursor);
  }

  String? _extractBalancedTag(
      String text, String openTagPrefix, String closeTag) {
    final openStart = text.indexOf(openTagPrefix);
    if (openStart < 0) {
      return null;
    }
    final openEnd = text.indexOf('>', openStart);
    if (openEnd < 0) {
      return null;
    }

    var depth = 1;
    var cursor = openEnd + 1;
    while (depth > 0) {
      final nextOpen = text.indexOf(openTagPrefix, cursor);
      final nextClose = text.indexOf(closeTag, cursor);
      if (nextClose < 0) {
        return null;
      }

      if (nextOpen >= 0 && nextOpen < nextClose) {
        depth++;
        cursor = text.indexOf('>', nextOpen) + 1;
      } else {
        depth--;
        cursor = nextClose + closeTag.length;
      }
    }

    return text.substring(openStart, cursor);
  }

  List<String> _extractTopLevelElements(String content) {
    final elements = <String>[];
    var cursor = 0;
    while (true) {
      final start = content.indexOf('<xsd:element', cursor);
      if (start < 0) {
        break;
      }

      final element = _extractBalancedElement(content, start);
      if (element == null) {
        break;
      }
      elements.add(element);
      cursor = start + element.length;
    }
    return elements;
  }

  _BasNode _parseBasTree(String text) {
    final root = _BasNode('Root');
    final stack = <_BasNode>[root];

    for (final rawLine in text.split('\n')) {
      final trimmed = rawLine.trim();
      if (trimmed.isEmpty) {
        continue;
      }

      final macroStart =
          RegExp(r'^([A-Za-z0-9_]+EmMacro)\s*=\s*Begin$').firstMatch(trimmed);
      if (macroStart != null) {
        final node = _BasNode('macro:${macroStart.group(1)!}');
        stack.last.children.add(node);
        stack.add(node);
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

      if (trimmed == 'End') {
        if (stack.length > 1) {
          stack.removeLast();
        }
        continue;
      }

      final propertyMatch =
          RegExp(r'^([^=]+?)\s*=\s*(.+)$').firstMatch(trimmed);
      if (propertyMatch == null) {
        continue;
      }

      stack.last.properties[propertyMatch.group(1)!.trim()] =
          _unquoteBasValue(propertyMatch.group(2)!.trim());
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
