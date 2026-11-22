part of 'project_generator.dart';

class CompiledReportAsset {
  final String controlName;
  final String picture;
  final String assetName;
  final String sourcePath;
  final String sha256;
  final String contentType;
  final String base64Data;

  const CompiledReportAsset({
    required this.controlName,
    required this.picture,
    required this.assetName,
    required this.sourcePath,
    required this.sha256,
    required this.contentType,
    required this.base64Data,
  });

  Map<String, Object?> toMetadataJson(String reportKey) => {
        'controlName': controlName,
        'picture': picture,
        'assetName': assetName,
        'sourcePath': sourcePath,
        'sha256': sha256,
        'contentType': contentType,
        'route': '/api/v1/access-reports/$reportKey/assets/$assetName',
      };
}

class CompiledReportControl {
  final int index;
  final String name;
  final String type;
  final int controlType;
  final int section;
  final int left;
  final int top;
  final int sheetTop;
  final int width;
  final int height;
  final int backStyle;
  final int backColor;
  final String backColorHex;
  final int borderStyle;
  final int borderColor;
  final String borderColorHex;
  final int foreColor;
  final String foreColorHex;
  final String? fontName;
  final int? fontSize;
  final int? fontWeight;
  final int? textAlign;
  final String? caption;
  final String? controlSource;
  final int? columnOrdinal;
  final int? daoType;
  final String? format;
  final String? picture;
  final int? pictureType;
  final int? sizeMode;
  final int? pictureAlignment;
  final String? assetName;
  final Map<String, Object?>? expression;
  final Map<String, Object?>? lookupSpec;
  final Map<String, Object?>? subReportSpec;

  const CompiledReportControl({
    required this.index,
    required this.name,
    required this.type,
    required this.controlType,
    required this.section,
    required this.left,
    required this.top,
    required this.sheetTop,
    required this.width,
    required this.height,
    required this.backStyle,
    required this.backColor,
    required this.backColorHex,
    required this.borderStyle,
    required this.borderColor,
    required this.borderColorHex,
    required this.foreColor,
    required this.foreColorHex,
    this.fontName,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.caption,
    this.controlSource,
    this.columnOrdinal,
    this.daoType,
    this.format,
    this.picture,
    this.pictureType,
    this.sizeMode,
    this.pictureAlignment,
    this.assetName,
    this.expression,
    this.lookupSpec,
    this.subReportSpec,
  });

  Map<String, Object?> toJson() => {
        'index': index,
        'name': name,
        'type': type,
        'controlType': controlType,
        'section': section,
        'left': left,
        'top': top,
        'sheetTop': sheetTop,
        'width': width,
        'height': height,
        'backStyle': backStyle,
        'backColor': backColor,
        'backColorHex': backColorHex,
        'borderStyle': borderStyle,
        'borderColor': borderColor,
        'borderColorHex': borderColorHex,
        'foreColor': foreColor,
        'foreColorHex': foreColorHex,
        if (fontName != null) 'fontName': fontName,
        if (fontSize != null) 'fontSize': fontSize,
        if (fontWeight != null) 'fontWeight': fontWeight,
        if (textAlign != null) 'textAlign': textAlign,
        if (caption != null) 'caption': caption,
        if (controlSource != null) 'controlSource': controlSource,
        if (columnOrdinal != null) 'columnOrdinal': columnOrdinal,
        if (daoType != null) 'daoType': daoType,
        if (format != null) 'format': format,
        if (picture != null) 'picture': picture,
        if (pictureType != null) 'pictureType': pictureType,
        if (sizeMode != null) 'sizeMode': sizeMode,
        if (pictureAlignment != null) 'pictureAlignment': pictureAlignment,
        if (assetName != null) 'assetName': assetName,
        if (expression != null) 'expression': expression,
        if (lookupSpec != null) 'lookupSpec': lookupSpec,
        if (subReportSpec != null) 'subReportSpec': subReportSpec,
      };
}

class CompiledReportSection {
  final String type;
  final String key;
  final int code;
  final String name;
  final int height;
  final bool keepTogether;

  const CompiledReportSection({
    required this.type,
    required this.key,
    required this.code,
    required this.name,
    required this.height,
    required this.keepTogether,
  });

  Map<String, Object?> toJson() => {
        'type': type,
        'key': key,
        'code': code,
        'name': name,
        'height': height,
        'keepTogether': keepTogether,
      };
}

class CompiledReportSpec {
  final String key;
  final String name;
  final String? caption;
  final String recordSource;
  final String queryKey;
  final String sourceSha256;
  final String? printSettingsSha256;
  final Map<String, Object?> pageSetup;
  final List<Map<String, Object?>> parameters;
  final List<CompiledReportSection> sections;
  final List<CompiledReportControl> controls;
  final List<CompiledReportAsset> assets;
  final List<Map<String, Object?>> groupLevels;

  const CompiledReportSpec({
    required this.key,
    required this.name,
    required this.caption,
    required this.recordSource,
    required this.queryKey,
    required this.sourceSha256,
    required this.printSettingsSha256,
    required this.pageSetup,
    required this.parameters,
    required this.sections,
    required this.controls,
    required this.assets,
    this.groupLevels = const <Map<String, Object?>>[],
  });

  bool get isGrouped => groupLevels.isNotEmpty;

  List<Map<String, Object?>> get boundControls => [
        for (final control in controls)
          if ((control.type == 'TextBox' ||
                  control.type == 'ComboBox' ||
                  control.type == 'CheckBox' ||
                  control.type == 'Attachment' ||
                  control.type == 'BoundObjectFrame') &&
              control.columnOrdinal != null)
            {
              'controlName': control.name,
              'controlType': control.controlType,
              'section': control.section,
              'controlSource': control.controlSource,
              'columnOrdinal': control.columnOrdinal,
              'daoType': control.daoType,
              'format': control.format,
              if (control.lookupSpec != null) 'lookupSpec': control.lookupSpec,
            },
      ];

  List<Map<String, Object?>> get expressionControls => [
        for (final control in controls)
          if (control.expression != null)
            {
              'controlName': control.name,
              'controlType': control.controlType,
              'section': control.section,
              'format': control.format,
              'expression': control.expression,
            },
      ];

  List<Map<String, Object?>> get subReportControls => [
        for (final control in controls)
          if (control.subReportSpec != null)
            {
              'controlName': control.name,
              'section': control.section,
              ...control.subReportSpec!,
            },
      ];

  Map<String, Object?> toInventoryJson() => {
        'key': key,
        'name': name,
        'caption': caption,
        'recordSource': recordSource,
        'queryKey': queryKey,
        'sourceSha256': sourceSha256,
        'printSettingsSha256': printSettingsSha256,
        'pageSetup': pageSetup,
        'parameters': parameters,
        if (groupLevels.isNotEmpty) 'groupLevels': groupLevels,
        'sections': sections.map((s) => s.toJson()).toList(growable: false),
        'controls': controls.map((c) => c.toJson()).toList(growable: false),
        'boundControls': boundControls,
        if (expressionControls.isNotEmpty)
          'expressionControls': expressionControls,
        if (subReportControls.isNotEmpty) 'subReports': subReportControls,
        'assets':
            assets.map((a) => a.toMetadataJson(key)).toList(growable: false),
        'readOnly': true,
      };
}

class CompiledReportCompilationResult {
  final List<CompiledReportSpec> reports;
  final List<Map<String, Object?>> diagnostics;
  final Map<String, Map<String, Object?>> compiledReportQueries;

  const CompiledReportCompilationResult({
    required this.reports,
    required this.diagnostics,
    this.compiledReportQueries = const <String, Map<String, Object?>>{},
  });
}

class _OfficeThemePalette {
  static const Map<int, List<int>> _defaultClrScheme = {
    0: [0x00, 0x00, 0x00], // dk1
    1: [0xFF, 0xFF, 0xFF], // lt1
    2: [0x44, 0x54, 0x6A], // dk2
    3: [0xE7, 0xE6, 0xE6], // lt2
    4: [0x44, 0x72, 0xC4], // accent1
    5: [0xED, 0x7D, 0x31], // accent2
    6: [0xA5, 0xA5, 0xA5], // accent3
    7: [0xFF, 0xC0, 0x00], // accent4
    8: [0x5B, 0x9B, 0xD5], // accent5
    9: [0x70, 0xAD, 0x47], // accent6
    10: [0x05, 0x63, 0xC1], // hlink
    11: [0x95, 0x4F, 0x72], // folHlink
  };

  static const Map<String, int> _slotByTag = {
    'dk1': 0,
    'lt1': 1,
    'dk2': 2,
    'lt2': 3,
    'accent1': 4,
    'accent2': 5,
    'accent3': 6,
    'accent4': 7,
    'accent5': 8,
    'accent6': 9,
    'hlink': 10,
    'folHlink': 11,
  };

  final Map<int, List<int>> _slots;

  const _OfficeThemePalette._(this._slots);

  factory _OfficeThemePalette.loadFromSource(
    String? sourceRoot, {
    Map<String, dynamic>? analysisRaw,
  }) {
    final slots = <int, List<int>>{
      for (final entry in _defaultClrScheme.entries)
        entry.key: List<int>.unmodifiable(entry.value),
    };
    Uint8List? bytes;
    if (sourceRoot != null && sourceRoot.isNotEmpty) {
      final thmxFile = _findActiveThmxFile(sourceRoot);
      if (thmxFile != null && thmxFile.existsSync()) {
        bytes = thmxFile.readAsBytesSync();
      }
    }
    bytes ??= _findActiveThmxBytesFromAnalysis(analysisRaw);
    if (bytes == null) {
      return _OfficeThemePalette._(slots);
    }
    try {
      final themeXmlBytes = _extractZipEntry(
        bytes,
        (name) =>
            name.toLowerCase() == 'theme/theme/theme1.xml' ||
            name.toLowerCase().endsWith('/theme1.xml'),
      );
      if (themeXmlBytes == null) {
        return _OfficeThemePalette._(slots);
      }
      final doc = XmlDocument.parse(utf8.decode(themeXmlBytes));
      final schemes = doc.descendants
          .whereType<XmlElement>()
          .where((e) => e.localName == 'clrScheme');
      if (schemes.isEmpty) {
        return _OfficeThemePalette._(slots);
      }
      for (final child in schemes.first.childElements) {
        final slotIdx = _slotByTag[child.localName];
        if (slotIdx == null) continue;
        final rgbHex = _readSchemeRgbHex(child);
        if (rgbHex != null) {
          slots[slotIdx] = rgbHex;
        }
      }
    } catch (_) {
      // Keep default Office palette if the .thmx archive cannot be decoded.
    }
    return _OfficeThemePalette._(slots);
  }

  static File? _findActiveThmxFile(String sourceRoot) {
    final themesDir = Directory(p.join(sourceRoot, 'themes'));
    if (!themesDir.existsSync()) return null;
    final dbPropsFile = File(p.join(sourceRoot, 'dbs-properties.json'));
    if (dbPropsFile.existsSync()) {
      try {
        final decoded = jsonDecode(dbPropsFile.readAsStringSync());
        final items = (decoded as Map?)?['Items'] as Map?;
        final themeProp = items?['Theme Resource Name'] as Map?;
        final activeName = themeProp?['Value']?.toString().trim();
        if (activeName != null && activeName.isNotEmpty) {
          final exact = File(p.join(themesDir.path, '$activeName.thmx'));
          if (exact.existsSync()) return exact;
        }
      } catch (_) {}
    }
    final candidates = themesDir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.toLowerCase().endsWith('.thmx'))
        .toList()
      ..sort((a, b) => a.path.compareTo(b.path));
    return candidates.isEmpty ? null : candidates.first;
  }

  static Uint8List? _findActiveThmxBytesFromAnalysis(
    Map<String, dynamic>? analysisRaw,
  ) {
    if (analysisRaw == null) return null;
    final dbProps = (analysisRaw['database_properties'] as Map?) ??
        ((analysisRaw['source_overlay'] as Map?)?['databaseProperties']
            as Map?);
    final activeName =
        dbProps?['Theme Resource Name']?.toString().trim().toLowerCase();
    final resources = ((analysisRaw['resources'] as List?) ?? const [])
        .whereType<Map>()
        .where((r) {
          final type = (r['type']?.toString() ?? '').trim().toLowerCase();
          final ext = (r['extension']?.toString() ?? '').trim().toLowerCase();
          final fileType =
              (r['fileType']?.toString() ?? '').trim().toLowerCase();
          return (type == 'thmx' || ext == 'thmx' || fileType == 'thmx') &&
              r['dataBase64'] is String;
        })
        .toList(growable: false);
    if (resources.isEmpty) return null;

    Map? selected;
    if (activeName != null && activeName.isNotEmpty) {
      for (final resource in resources) {
        final name = (resource['name']?.toString() ?? '').trim().toLowerCase();
        final fileName =
            (resource['fileName']?.toString() ?? '').trim().toLowerCase();
        if (name == activeName ||
            fileName == '$activeName.thmx' ||
            p.basenameWithoutExtension(fileName) == activeName) {
          selected = resource;
          break;
        }
      }
    }
    selected ??= resources.first;
    try {
      return base64Decode(selected['dataBase64'] as String);
    } catch (_) {
      return null;
    }
  }

  static List<int>? _readSchemeRgbHex(XmlElement slotElement) {
    for (final child in slotElement.childElements) {
      final hex = switch (child.localName) {
        'srgbClr' => child.getAttribute('val'),
        'sysClr' => child.getAttribute('lastClr'),
        _ => null,
      };
      if (hex != null && RegExp(r'^[0-9a-fA-F]{6}$').hasMatch(hex)) {
        return List<int>.unmodifiable([
          int.parse(hex.substring(0, 2), radix: 16),
          int.parse(hex.substring(2, 4), radix: 16),
          int.parse(hex.substring(4, 6), radix: 16),
        ]);
      }
    }
    return null;
  }

  static List<int>? _extractZipEntry(
    Uint8List bytes,
    bool Function(String entryName) matches,
  ) {
    if (bytes.length < 22) return null;
    final view = ByteData.sublistView(bytes);
    var eocdOffset = -1;
    final minOffset = math.max(0, bytes.length - 65557);
    for (var offset = bytes.length - 22; offset >= minOffset; offset--) {
      if (view.getUint32(offset, Endian.little) == 0x06054b50) {
        eocdOffset = offset;
        break;
      }
    }
    if (eocdOffset < 0) return null;
    final totalEntries = view.getUint16(eocdOffset + 10, Endian.little);
    final centralDirSize = view.getUint32(eocdOffset + 12, Endian.little);
    final centralDirOffset = view.getUint32(eocdOffset + 16, Endian.little);
    if (centralDirOffset + centralDirSize > bytes.length) return null;

    var cursor = centralDirOffset;
    for (var i = 0; i < totalEntries && cursor + 46 <= bytes.length; i++) {
      if (view.getUint32(cursor, Endian.little) != 0x02014b50) break;
      final method = view.getUint16(cursor + 10, Endian.little);
      final compressedSize = view.getUint32(cursor + 20, Endian.little);
      final nameLen = view.getUint16(cursor + 28, Endian.little);
      final extraLen = view.getUint16(cursor + 30, Endian.little);
      final commentLen = view.getUint16(cursor + 32, Endian.little);
      final localHeaderOffset = view.getUint32(cursor + 42, Endian.little);
      final nameStart = cursor + 46;
      if (nameStart + nameLen > bytes.length) break;
      final entryName =
          utf8.decode(bytes.sublist(nameStart, nameStart + nameLen), allowMalformed: true);
      cursor = nameStart + nameLen + extraLen + commentLen;
      if (!matches(entryName)) continue;

      if (localHeaderOffset + 30 > bytes.length ||
          view.getUint32(localHeaderOffset, Endian.little) != 0x04034b50) {
        return null;
      }
      final lfhNameLen = view.getUint16(localHeaderOffset + 26, Endian.little);
      final lfhExtraLen = view.getUint16(localHeaderOffset + 28, Endian.little);
      final dataStart = localHeaderOffset + 30 + lfhNameLen + lfhExtraLen;
      final dataEnd = dataStart + compressedSize;
      if (dataEnd > bytes.length) return null;
      final payload = bytes.sublist(dataStart, dataEnd);
      if (method == 0) return payload;
      if (method == 8) return ZLibCodec(raw: true).decode(payload);
      return null;
    }
    return null;
  }

  int? resolveColor({
    required int themeIndex,
    double? tint,
    double? shade,
  }) {
    final rgb = _slots[themeIndex];
    if (rgb == null) return null;
    final r0 = rgb[0] / 255.0;
    final g0 = rgb[1] / 255.0;
    final b0 = rgb[2] / 255.0;
    final maxC = math.max(r0, math.max(g0, b0));
    final minC = math.min(r0, math.min(g0, b0));
    var l = (maxC + minC) / 2.0;
    var s = 0.0;
    var h = 0.0;
    if (maxC != minC) {
      final d = maxC - minC;
      s = l > 0.5 ? d / (2.0 - maxC - minC) : d / (maxC + minC);
      if (maxC == r0) {
        h = (g0 - b0) / d + (g0 < b0 ? 6.0 : 0.0);
      } else if (maxC == g0) {
        h = (b0 - r0) / d + 2.0;
      } else {
        h = (r0 - g0) / d + 4.0;
      }
      h /= 6.0;
    }

    if (shade != null && shade < 100.0) {
      l = (l * (shade / 100.0)).clamp(0.0, 1.0);
    } else if (tint != null && tint < 100.0) {
      l = (l + (1.0 - l) * (1.0 - tint / 100.0)).clamp(0.0, 1.0);
    }

    int channelToByte(double v) => v.round().clamp(0, 255);

    if (s == 0.0) {
      // Office/GDI truncates exact half-lum gray on dark theme tinting (e.g. dk1 50% -> 127).
      final v = (tint != null && tint < 100.0 && (l - 0.5).abs() < 1e-9)
          ? (l * 255.0).floor()
          : channelToByte(l * 255.0);
      return v | (v << 8) | (v << 16);
    }

    final q = l < 0.5 ? l * (1.0 + s) : l + s - l * s;
    final pVal = 2.0 * l - q;
    double hueToRgb(double t) {
      var u = t;
      if (u < 0.0) u += 1.0;
      if (u > 1.0) u -= 1.0;
      if (u < 1.0 / 6.0) return pVal + (q - pVal) * 6.0 * u;
      if (u < 1.0 / 2.0) return q;
      if (u < 2.0 / 3.0) return pVal + (q - pVal) * (2.0 / 3.0 - u) * 6.0;
      return pVal;
    }

    final r = channelToByte(hueToRgb(h + 1.0 / 3.0) * 255.0);
    final g = channelToByte(hueToRgb(h) * 255.0);
    final b = channelToByte(hueToRgb(h - 1.0 / 3.0) * 255.0);
    return r | (g << 8) | (b << 16);
  }
}

extension _CompiledReportRenderer on ProjectGenerator {
  CompiledReportCompilationResult compileEligibleReports(
      AnalysisProject project) {
    final cachedResult = _compiledReportsCache[project];
    if (cachedResult != null) return cachedResult;
    final compiledQueries = _compileQuerySpecifications(project).specifications;
    final queryByLowerName = <String, MapEntry<String, Map<String, Object?>>>{
      for (final entry in compiledQueries.entries)
        (entry.value['name'] as String).toLowerCase(): entry,
    };
    final compiledReportQueries = <String, Map<String, Object?>>{};
    final usedQueryKeys = <String>{...compiledQueries.keys};
    final failedRecordSources = <String>{};
    final tableByLowerName = <String, AnalysisTable>{
      for (final table in project.tables)
        if (!table.isSyntheticComplexTable) table.name.toLowerCase(): table,
    };
    final catalogQueryByLowerName = <String, Map<String, dynamic>>{};
    final namedSubqueries = <String, String>{};
    for (final rawQ in (project.raw['queries'] as List? ?? const []).whereType<Map>()) {
      final qName = (rawQ['name']?.toString() ?? '').trim();
      if (qName.isNotEmpty) {
        final qMap = rawQ.cast<String, dynamic>();
        catalogQueryByLowerName[qName.toLowerCase()] = qMap;
        if (qMap['sqlText'] is String &&
            (qMap['sqlText'] as String).trim().isNotEmpty) {
          namedSubqueries[qName] = qMap['sqlText'] as String;
        }
      }
    }
    final sourceRoot = _resolveReportSourceRoot(project);
    final themePalette = _OfficeThemePalette.loadFromSource(
      sourceRoot,
      analysisRaw: project.raw,
    );
    final binaryResources = ((project.raw['resources'] as List?) ?? const [])
        .whereType<Map>()
        .map((resource) => resource.cast<String, dynamic>())
        .toList(growable: false);
    final reports = <CompiledReportSpec>[];
    final diagnostics = <Map<String, Object?>>[];
    final usedKeys = <String>{};
    final compiledByLowerName = <String, CompiledReportSpec>{};

    final rawReports = (project.raw['reports'] as List? ?? const [])
        .whereType<Map>()
        .map((r) => r.cast<String, dynamic>())
        .toList(growable: false);
    final rawReportsByLowerName = <String, Map<String, dynamic>>{
      for (final r in rawReports)
        if ((r['name']?.toString() ?? '').isNotEmpty)
          (r['name'] as String).toLowerCase(): r,
    };
    for (final rawReport in rawReports) {
      final name = rawReport['name']?.toString() ?? '';
      if (name.isEmpty) {
        diagnostics.add({
          'report': name,
          'status': 'inventory-only',
          'reason': 'missing-report-name',
        });
        continue;
      }
      final precompiled = compiledByLowerName[name.toLowerCase()];
      if (precompiled != null) {
        diagnostics.add({
          'report': name,
          'status': 'compiled-read-only',
          'routeKey': precompiled.key,
          'queryKey': precompiled.queryKey,
          'controls': precompiled.controls.length,
        });
        continue;
      }
      final key = toSnakeCaseIdentifier(name);
      if (usedKeys.contains(key)) {
        diagnostics.add({
          'report': name,
          'status': 'inventory-only',
          'reason': 'report-route-collision',
        });
        continue;
      }
      final compiled = _tryCompileReport(
        rawReport,
        project: project,
        key: key,
        queryByLowerName: queryByLowerName,
        compiledReportQueries: compiledReportQueries,
        usedQueryKeys: usedQueryKeys,
        failedRecordSources: failedRecordSources,
        tableByLowerName: tableByLowerName,
        catalogQueryByLowerName: catalogQueryByLowerName,
        namedSubqueries: namedSubqueries,
        rawReportsByLowerName: rawReportsByLowerName,
        compiledByLowerName: compiledByLowerName,
        activeReportStack: {name.toLowerCase()},
        extraReportsOut: reports,
        usedReportKeys: usedKeys,
        sourceRoot: sourceRoot,
        themePalette: themePalette,
        binaryResources: binaryResources,
      );
      if (compiled.spec != null) {
        usedKeys.add(key);
        compiledByLowerName[name.toLowerCase()] = compiled.spec!;
        reports.add(compiled.spec!);
        diagnostics.add({
          'report': name,
          'status': 'compiled-read-only',
          'routeKey': key,
          'queryKey': compiled.spec!.queryKey,
          'controls': compiled.spec!.controls.length,
        });
      } else {
        diagnostics.add({
          'report': name,
          'status': 'inventory-only',
          'reason': compiled.reason,
        });
      }
    }

    final result = CompiledReportCompilationResult(
      reports: reports,
      diagnostics: diagnostics,
      compiledReportQueries: compiledReportQueries,
    );
    _compiledReportsCache[project] = result;
    return result;
  }

  MapEntry<String, Map<String, Object?>>? _compileReportQueryForRecordSource(
    AnalysisProject project,
    String recordSource, {
    required Set<String> usedQueryKeys,
    required Set<String> failedRecordSources,
    required Map<String, AnalysisTable> tableByLowerName,
    required Map<String, Map<String, dynamic>> catalogQueryByLowerName,
    required Map<String, String> namedSubqueries,
  }) {
    final lower = recordSource.toLowerCase();
    if (failedRecordSources.contains(lower)) return null;

    String? sqlText;
    String? candidateKey;
    final directTable = tableByLowerName[lower];
    if (directTable != null) {
      sqlText = 'SELECT * FROM [${directTable.name}]';
      candidateKey = 'report_table_${toSnakeCaseIdentifier(directTable.name)}';
    } else if ((recordSource.trimLeft().toUpperCase().startsWith('SELECT ') || recordSource.trimLeft().toUpperCase().startsWith('PARAMETERS ') || recordSource.trimLeft().startsWith('('))) {
      sqlText = recordSource;
      final hash = sha256
          .convert(utf8.encode(recordSource))
          .toString()
          .substring(0, 12);
      candidateKey = 'report_sql_$hash';
    } else {
      final catalogQuery = catalogQueryByLowerName[lower];
      if (catalogQuery != null &&
          catalogQuery['executionContract'] == null &&
          catalogQuery['sqlText'] is String) {
        sqlText = catalogQuery['sqlText'] as String;
        final baseKey = toSnakeCaseIdentifier(catalogQuery['name'] as String);
        candidateKey =
            usedQueryKeys.contains(baseKey) ? 'report_q_$baseKey' : baseKey;
      }
    }
    if (sqlText == null || candidateKey == null || usedQueryKeys.contains(candidateKey)) {
      failedRecordSources.add(lower);
      return null;
    }
    try {
      return _compileExtendedQuerySpecification(
        project,
        key: candidateKey,
        name: recordSource,
        sqlText: sqlText,
        namedSubqueries: namedSubqueries,
      );
    } on FormatException {
      failedRecordSources.add(lower);
      return null;
    }
  }

  String? _resolveReportSourceRoot(AnalysisProject project) {
    final overlayPath =
        (project.raw['source_overlay'] as Map?)?['sourcePath'] as String?;
    if (overlayPath != null &&
        overlayPath.isNotEmpty &&
        Directory(overlayPath).existsSync()) {
      return overlayPath;
    }
    final fallbackPath = project.raw['source_overlay_path'] as String?;
    if (fallbackPath != null &&
        fallbackPath.isNotEmpty &&
        Directory(fallbackPath).existsSync()) {
      return fallbackPath;
    }
    if (project.source.isNotEmpty) {
      final candidate = '${project.source}.src';
      if (Directory(candidate).existsSync()) {
        return candidate;
      }
    }
    return null;
  }

  ({CompiledReportSpec? spec, String? reason}) _tryCompileReport(
    Map<String, dynamic> report, {
    required AnalysisProject project,
    required String key,
    required Map<String, MapEntry<String, Map<String, Object?>>>
        queryByLowerName,
    required Map<String, Map<String, Object?>> compiledReportQueries,
    required Set<String> usedQueryKeys,
    required Set<String> failedRecordSources,
    required Map<String, AnalysisTable> tableByLowerName,
    required Map<String, Map<String, dynamic>> catalogQueryByLowerName,
    required Map<String, String> namedSubqueries,
    required Map<String, Map<String, dynamic>> rawReportsByLowerName,
    required Map<String, CompiledReportSpec> compiledByLowerName,
    required Set<String> activeReportStack,
    required List<CompiledReportSpec> extraReportsOut,
    required Set<String> usedReportKeys,
    required String? sourceRoot,
    required _OfficeThemePalette themePalette,
    required List<Map<String, dynamic>> binaryResources,
  }) {
    final hasSourceExport = sourceRoot != null &&
        sourceRoot.isNotEmpty &&
        report['sourceSha256'] != null;
    final sourceSha256 = hasSourceExport
        ? report['sourceSha256']?.toString()
        : (report['sourceSha256'] ?? report['binaryStorageSha256'])?.toString();
    if (sourceSha256 == null ||
        !RegExp(r'^[a-f0-9]{64}$').hasMatch(sourceSha256)) {
      return (spec: null, reason: 'missing-source-export-sha256');
    }

    final props = ((report['properties'] as Map?) ?? const {})
        .cast<String, dynamic>();
    if (_reportHasBehaviorOrModule(report, props)) {
      return (spec: null, reason: 'has-vba-macros-or-events');
    }
    final onOpenWindowAction = _cosmeticOpenWindowAction(report);

    final rawGroupLevels = (report['groupLevels'] as List?) ?? const [];
    final recordSource =
        (report['recordSource'] ?? props['RecordSource'])?.toString().trim();
    final isBound = recordSource != null && recordSource.isNotEmpty;
    if (rawGroupLevels.isNotEmpty && !isBound) {
      return (spec: null, reason: 'unsupported-group-levels');
    }
    final parsedGroupLevels = <({
      int index,
      String controlSource,
      bool descending,
      bool hasHeader,
      bool hasFooter,
      int groupOn,
      int groupInterval,
    })>[];
    final headerGroupIndices = <int>[];
    final footerGroupIndices = <int>[];
    for (var gi = 0; gi < rawGroupLevels.length; gi++) {
      final rawGl = rawGroupLevels[gi];
      if (rawGl is! Map) {
        return (spec: null, reason: 'unsupported-group-levels');
      }
      final gl = rawGl.cast<String, dynamic>();
      final glProps =
          ((gl['properties'] as Map?) ?? const {}).cast<String, dynamic>();
      final groupOn =
          _parseReportInt(gl['groupOn'] ?? glProps['GroupOn']) ?? 0;
      if (groupOn < 0 || groupOn > 7) {
        return (spec: null, reason: 'unsupported-group-levels');
      }
      final groupInterval =
          _parseReportInt(gl['groupInterval'] ?? glProps['GroupInterval']) ?? 1;
      if (groupInterval < 1) {
        return (spec: null, reason: 'unsupported-group-levels');
      }
      final glSource =
          (gl['controlSource'] ?? glProps['ControlSource'])?.toString().trim();
      if (glSource == null || glSource.isEmpty || glSource.startsWith('=')) {
        return (spec: null, reason: 'unsupported-group-levels');
      }
      final sortRaw = (gl['sortOrder'] ?? glProps['SortOrder'])
          ?.toString()
          .trim()
          .toLowerCase();
      final descending =
          sortRaw == 'notdefault' || sortRaw == 'true' || sortRaw == '1';
      final hasHeader =
          _isAccessFlagSet(gl['groupHeader'] ?? glProps['GroupHeader']);
      final hasFooter =
          _isAccessFlagSet(gl['groupFooter'] ?? glProps['GroupFooter']);
      if (hasHeader) headerGroupIndices.add(gi);
      if (hasFooter) footerGroupIndices.add(gi);
      parsedGroupLevels.add((
        index: gi,
        controlSource: glSource,
        descending: descending,
        hasHeader: hasHeader,
        hasFooter: hasFooter,
        groupOn: groupOn,
        groupInterval: groupInterval,
      ));
    }
    MapEntry<String, Map<String, Object?>>? pendingReportQuery;
    var queryEntry =
        isBound ? queryByLowerName[recordSource.toLowerCase()] : null;
    if (isBound && queryEntry == null) {
      pendingReportQuery = _compileReportQueryForRecordSource(
        project,
        recordSource,
        usedQueryKeys: usedQueryKeys,
        failedRecordSources: failedRecordSources,
        tableByLowerName: tableByLowerName,
        catalogQueryByLowerName: catalogQueryByLowerName,
        namedSubqueries: namedSubqueries,
      );
      queryEntry = pendingReportQuery;
    }
    if (isBound && queryEntry == null) {
      return (spec: null, reason: 'record-source-not-compiled-query');
    }

    final queryColumns = queryEntry == null
        ? const <Map>[]
        : (queryEntry.value['columns'] as List).cast<Map>();
    final columnsByLower = <String, List<Map>>{};
    for (final col in queryColumns) {
      final colName = (col['name'] as String).toLowerCase();
      (columnsByLower[colName] ??= []).add(col);
    }

    final compiledGroupLevels = <Map<String, Object?>>[];
    for (final gl in parsedGroupLevels) {
      final glMatches = _resolveReportQueryColumns(
        gl.controlSource,
        columnsByLower,
        queryColumns,
      );
      if (glMatches.length != 1) {
        return (spec: null, reason: 'unsupported-group-levels');
      }
      final daoType = glMatches.single['daoType'] as int;
      final validGroupOn = gl.groupOn == 0 ||
          (daoType == 8 && gl.groupOn >= 1 && gl.groupOn <= 7) ||
          (gl.groupOn == 1 &&
              (daoType == 10 ||
                  daoType == 12 ||
                  const {3, 4, 5, 7}.contains(daoType)));
      if (!validGroupOn) {
        return (spec: null, reason: 'unsupported-group-levels');
      }
      compiledGroupLevels.add({
        'index': gl.index,
        'controlSource': gl.controlSource,
        'columnOrdinal': glMatches.single['ordinal'] as int,
        'daoType': daoType,
        'descending': gl.descending,
        'hasHeader': gl.hasHeader,
        'hasFooter': gl.hasFooter,
        'groupOn': gl.groupOn,
        'groupInterval': gl.groupInterval,
      });
    }

    final widthTwips = _parseReportInt(props['Width']);
    if (widthTwips == null || widthTwips <= 0) {
      return (spec: null, reason: 'missing-report-width');
    }

    var pageSetup = _parseReportPageSetup(
      report['printSettings'],
      widthTwips: widthTwips,
    );
    if (pageSetup == null && !hasSourceExport && report['printSettings'] == null) {
      final isLandscape = widthTwips > 11906;
      pageSetup = <String, Object?>{
        'widthTwips': widthTwips,
        'detailHeightTwips': 0,
        'sheetHeightTwips': 0,
        'orientation': isLandscape ? 2 : 1,
        'orientationName': isLandscape ? 'Landscape' : 'Portrait',
        'paperSize': 9,
        'paperSizeName': 'A4',
        'leftMarginTwips': 720,
        'rightMarginTwips': 720,
        'topMarginTwips': 720,
        'bottomMarginTwips': 720,
      };
    }
    if (pageSetup == null) {
      return (spec: null, reason: 'missing-or-invalid-print-settings');
    }

    final rawSections = (report['sections'] as List?) ?? const [];
    if (rawSections.isEmpty) {
      return (spec: null, reason: 'missing-sections');
    }

    bool isEmptyOrphanBreak(Map item) {
      final h = _parseReportInt(item['height'] ??
              (item['properties'] as Map?)?['Height']) ??
          0;
      final ctrls = (item['controls'] as List?) ?? const [];
      return h == 0 && ctrls.isEmpty;
    }

    var breakHeaderCount = 0;
    var breakFooterCount = 0;
    for (final item in rawSections) {
      if (item is! Map) continue;
      final sType = item['type']?.toString() ?? '';
      if (sType == 'BreakHeader' &&
          !(isEmptyOrphanBreak(item) && breakHeaderCount >= compiledGroupLevels.length)) {
        breakHeaderCount++;
      }
      if (sType == 'BreakFooter' &&
          !(isEmptyOrphanBreak(item) && breakFooterCount >= compiledGroupLevels.length)) {
        breakFooterCount++;
      }
    }
    if (breakHeaderCount > 4 ||
        breakFooterCount > 4 ||
        breakHeaderCount > compiledGroupLevels.length ||
        breakFooterCount > compiledGroupLevels.length) {
      return (spec: null, reason: 'unsupported-group-levels');
    }

    final assignedHeaderLevels = headerGroupIndices.length == breakHeaderCount
        ? headerGroupIndices
        : [for (var idx = 0; idx < breakHeaderCount; idx++) idx];
    final assignedFooterLevels = footerGroupIndices.length == breakFooterCount
        ? footerGroupIndices
        : [for (var idx = 0; idx < breakFooterCount; idx++) idx];
    if (assignedHeaderLevels.any((lvl) => lvl > 3) ||
        assignedFooterLevels.any((lvl) => lvl > 3)) {
      return (spec: null, reason: 'unsupported-group-levels');
    }

    final queryParams = queryEntry == null
        ? const <Map<String, Object?>>[]
        : ((queryEntry.value['parameters'] as List?) ?? const [])
            .cast<Map<String, Object?>>();
    final queryParamByLower = <String, String>{};
    for (final qp in queryParams) {
      final srcName = (qp['sourceName']?.toString() ?? '').trim();
      if (srcName.isEmpty) continue;
      queryParamByLower[srcName.toLowerCase()] = srcName;
      if (srcName.startsWith('[') && srcName.endsWith(']') && !srcName.contains('!')) {
        queryParamByLower[srcName.substring(1, srcName.length - 1).trim().toLowerCase()] =
            srcName;
      }
    }
    final promptParamByLower = <String, String>{};
    final reportPromptParams = <Map<String, Object?>>[];

    final knownControlNamesLower = <String>{};
    for (final item in rawSections) {
      if (item is! Map) continue;
      for (final ctrl in ((item['controls'] as List?) ?? const []).whereType<Map>()) {
        final cn = ctrl['name']?.toString().trim() ?? '';
        if (cn.isNotEmpty) knownControlNamesLower.add(cn.toLowerCase());
      }
    }

    var seenHeaderIdx = 0;
    var seenFooterIdx = 0;
    final validatedSections = <({
      Map<String, dynamic> raw,
      String type,
      String sectionKey,
      String name,
      int height,
      int bucket,
      int code,
      bool keepTogether,
      List<Map<String, dynamic>> controls,
    })>[];
    for (final item in rawSections) {
      if (item is! Map) {
        return (spec: null, reason: 'invalid-section-entry');
      }
      final section = item.cast<String, dynamic>();
      final sType = section['type']?.toString() ?? '';
      final sProps = ((section['properties'] as Map?) ?? const {})
          .cast<String, dynamic>();
      if (_mapHasBehaviorOrEvents(section, sProps)) {
        return (spec: null, reason: 'section-has-events-or-macros');
      }
      int bucket;
      int code;
      String sectionKey;
      switch (sType) {
        case 'FormHeader':
        case 'ReportHeader':
          bucket = 0;
          code = 1;
          sectionKey = 'report_header';
          break;
        case 'PageHeader':
          bucket = 1;
          code = 3;
          sectionKey = 'page_header';
          break;
        case 'BreakHeader':
          if (seenHeaderIdx >= assignedHeaderLevels.length &&
              isEmptyOrphanBreak(section)) {
            continue;
          }
          final lvl = assignedHeaderLevels[seenHeaderIdx++];
          bucket = 2 + lvl;
          code = 5 + (2 * lvl);
          sectionKey = 'group_header_$lvl';
          break;
        case 'Section':
          bucket = 6;
          code = 0;
          sectionKey = 'detail';
          break;
        case 'BreakFooter':
          if (seenFooterIdx >= assignedFooterLevels.length &&
              isEmptyOrphanBreak(section)) {
            continue;
          }
          final lvl = assignedFooterLevels[seenFooterIdx++];
          bucket = 10 - lvl;
          code = 6 + (2 * lvl);
          sectionKey = 'group_footer_$lvl';
          break;
        case 'FormFooter':
        case 'ReportFooter':
          bucket = 11;
          code = 2;
          sectionKey = 'report_footer';
          break;
        case 'PageFooter':
          bucket = 12;
          code = 4;
          sectionKey = 'page_footer';
          break;
        default:
          return (spec: null, reason: 'unsupported-section-type:$sType');
      }
      final sHeight = _parseReportInt(section['height'] ?? sProps['Height']);
      if (sHeight == null || sHeight < 0) {
        return (spec: null, reason: 'invalid-section-height:$sType');
      }
      final controls = (section['controls'] as List?) ?? const [];
      final typedControls = <Map<String, dynamic>>[];
      for (final ctrl in controls) {
        if (ctrl is! Map) {
          return (spec: null, reason: 'invalid-control-entry');
        }
        final ctrlMap = ctrl.cast<String, dynamic>();
        if (!isBound) {
          final cProps = ((ctrlMap['properties'] as Map?) ?? const {});
          final cs = (ctrlMap['controlSource'] ?? cProps['ControlSource'])
              ?.toString()
              .trim();
          if (cs != null &&
              cs.isNotEmpty &&
              _compileReportControlExpression(
                    cs,
                    columnsByLower,
                    queryColumns,
                    isBound: false,
                    queryParamByLower: queryParamByLower,
                    promptParamByLower: promptParamByLower,
                    reportPromptParams: reportPromptParams,
                    knownControlNamesLower: knownControlNamesLower,
                  ) ==
                  null) {
            return (spec: null, reason: 'missing-record-source');
          }
        }
        typedControls.add(ctrlMap);
      }
      validatedSections.add((
        raw: section,
        type: sType,
        sectionKey: sectionKey,
        name: section['name']?.toString() ?? sType,
        height: sHeight,
        bucket: bucket,
        code: code,
        keepTogether: sProps['KeepTogether']?.toString() == 'NotDefault',
        controls: typedControls,
      ));
    }

    validatedSections.sort((a, b) => a.bucket.compareTo(b.bucket));
    final compiledSections = <CompiledReportSection>[];
    final sectionControls =
        <({Map<String, dynamic> control, int sectionCode, int offsetTwips})>[];
    var detailHeight = 0;
    var sheetOffsetTwips = 0;
    for (final s in validatedSections) {
      if (s.type == 'Section') {
        detailHeight = s.height;
      }
      for (final ctrl in s.controls) {
        sectionControls.add((
          control: ctrl,
          sectionCode: s.code,
          offsetTwips: sheetOffsetTwips,
        ));
      }
      compiledSections.add(CompiledReportSection(
        type: s.type,
        key: s.sectionKey,
        code: s.code,
        name: s.name,
        height: s.height,
        keepTogether: s.keepTogether,
      ));
      sheetOffsetTwips += s.height;
    }

    if (sheetOffsetTwips <= 0 || sectionControls.isEmpty) {
      return (spec: null, reason: 'missing-detail-controls');
    }
    pageSetup['detailHeightTwips'] = detailHeight;
    pageSetup['sheetHeightTwips'] = sheetOffsetTwips;
    if (onOpenWindowAction != null) {
      pageSetup['onOpenWindowAction'] = onOpenWindowAction;
    }

    final defaultsRaw =
        ((report['controlDefaults'] as Map?) ?? const {}).cast<String, dynamic>();

    final rawImages = (report['images'] as List?) ?? const [];
    final imageByControl = <String, Map<String, dynamic>>{};
    for (final img in rawImages) {
      if (img is Map && img['controlName'] is String) {
        imageByControl[(img['controlName'] as String).toLowerCase()] =
            img.cast<String, dynamic>();
      }
    }

    final subReportQueryKeyByCtrlLower = <String, String>{};
    final subReportColsByCtrlLower = <String, List<Map>>{};
    final compiledSubReportsByIdx = <int, ({CompiledReportSpec childSpec, Map<String, Object?> subSpec})>{};
    for (var i = 0; i < sectionControls.length; i++) {
      final ctrl = sectionControls[i].control;
      final cType = ctrl['type']?.toString() ?? '';
      if (cType != 'Subform') continue;
      final cName = ctrl['name']?.toString() ?? '';
      final cProps = ((ctrl['properties'] as Map?) ?? const {}).cast<String, dynamic>();
      if (_mapHasBehaviorOrEvents(ctrl, cProps)) {
        return (spec: null, reason: 'control-has-events-or-macros:$cName');
      }
      var sourceObj =
          (ctrl['sourceObject'] ?? cProps['SourceObject'])?.toString().trim() ?? '';
      if (sourceObj.toLowerCase().startsWith('report.')) {
        sourceObj = sourceObj.substring(7).trim();
      }
      final childLower = sourceObj.toLowerCase();
      if (sourceObj.isEmpty ||
          activeReportStack.length >= 3 ||
          activeReportStack.contains(childLower)) {
        return (spec: null, reason: 'unsupported-subreport:$cName');
      }
      var childSpec = compiledByLowerName[childLower];
      if (childSpec == null) {
        final childRaw = rawReportsByLowerName[childLower];
        if (childRaw == null) {
          return (spec: null, reason: 'unsupported-subreport:$cName');
        }
        final childKey = toSnakeCaseIdentifier(sourceObj);
        if (usedReportKeys.contains(childKey)) {
          return (spec: null, reason: 'unsupported-subreport:$cName');
        }
        final childRes = _tryCompileReport(
          childRaw,
          project: project,
          key: childKey,
          queryByLowerName: queryByLowerName,
          compiledReportQueries: compiledReportQueries,
          usedQueryKeys: usedQueryKeys,
          failedRecordSources: failedRecordSources,
          tableByLowerName: tableByLowerName,
          catalogQueryByLowerName: catalogQueryByLowerName,
          namedSubqueries: namedSubqueries,
          rawReportsByLowerName: rawReportsByLowerName,
          compiledByLowerName: compiledByLowerName,
          activeReportStack: {...activeReportStack, childLower},
          extraReportsOut: extraReportsOut,
          usedReportKeys: usedReportKeys,
          sourceRoot: sourceRoot,
          themePalette: themePalette,
          binaryResources: binaryResources,
        );
        if (childRes.spec == null) {
          return (spec: null, reason: 'unsupported-subreport:$cName');
        }
        childSpec = childRes.spec!;
        usedReportKeys.add(childKey);
        compiledByLowerName[childLower] = childSpec;
        extraReportsOut.add(childSpec);
      }
      final childQueryEntry = childSpec.queryKey.isEmpty
          ? null
          : (compiledReportQueries[childSpec.queryKey] ??
              queryByLowerName[childSpec.recordSource.toLowerCase()]?.value);
      final childQueryCols = childQueryEntry == null
          ? const <Map>[]
          : ((childQueryEntry['columns'] as List?) ?? const []).cast<Map>();
      final childColsByLower = <String, List<Map>>{};
      for (final col in childQueryCols) {
        (childColsByLower[(col['name'] as String).toLowerCase()] ??= []).add(col);
      }

      final lmRaw =
          (ctrl['linkMasterFields'] ?? cProps['LinkMasterFields'])?.toString().trim() ?? '';
      final lcRaw =
          (ctrl['linkChildFields'] ?? cProps['LinkChildFields'])?.toString().trim() ?? '';
      final masterFields = lmRaw.isEmpty
          ? const <String>[]
          : lmRaw.split(';').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
      final childFields = lcRaw.isEmpty
          ? const <String>[]
          : lcRaw.split(';').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
      if (masterFields.length != childFields.length) {
        return (spec: null, reason: 'unsupported-subreport:$cName');
      }
      final linkMasterOrdinals = <int>[];
      final linkChildOrdinals = <int>[];
      for (var li = 0; li < masterFields.length; li++) {
        final mCols =
            _resolveReportQueryColumns(masterFields[li], columnsByLower, queryColumns);
        final cCols =
            _resolveReportQueryColumns(childFields[li], childColsByLower, childQueryCols);
        if (mCols.length != 1 || cCols.length != 1) {
          return (spec: null, reason: 'unsupported-subreport:$cName');
        }
        linkMasterOrdinals.add(mCols.single['ordinal'] as int);
        linkChildOrdinals.add(cCols.single['ordinal'] as int);
      }
      subReportQueryKeyByCtrlLower[cName.toLowerCase()] = childSpec.queryKey;
      subReportColsByCtrlLower[cName.toLowerCase()] = childQueryCols;
      compiledSubReportsByIdx[i] = (
        childSpec: childSpec,
        subSpec: {
          'childReportKey': childSpec.key,
          'childQueryKey': childSpec.queryKey,
          'linkMasterOrdinals': linkMasterOrdinals,
          'linkChildOrdinals': linkChildOrdinals,
        },
      );
    }

    final pendingLookupQueries = <MapEntry<String, Map<String, Object?>>>[];
    final compiledControls = <CompiledReportControl>[];
    final compiledAssets = <CompiledReportAsset>[];
    final assetHashByName = <String, String>{};

    for (var i = 0; i < sectionControls.length; i++) {
      final entry = sectionControls[i];
      final ctrl = entry.control;
      final sectionCode = entry.sectionCode;
      final sectionOffsetTwips = entry.offsetTwips;
      final cName = ctrl['name']?.toString() ?? '';
      final cType = ctrl['type']?.toString() ?? '';
      final cProps = ((ctrl['properties'] as Map?) ?? const {})
          .cast<String, dynamic>();
      if (_mapHasBehaviorOrEvents(ctrl, cProps)) {
        return (spec: null, reason: 'control-has-events-or-macros:$cName');
      }
      final controlTypeCode = switch (cType) {
        'Label' => 100,
        'Rectangle' => 101,
        'Line' => 102,
        'Image' => 103,
        'CheckBox' => 106,
        'BoundObjectFrame' => 108,
        'TextBox' => 109,
        'ComboBox' => 111,
        'Subform' => 112,
        'OptionButton' => 105,
        'OptionGroup' => 107,
        'PageBreak' => 118,
        'Attachment' => 126,
        'EmptyCell' => 127,
        _ => null,
      };
      if (controlTypeCode == null || cName.isEmpty) {
        return (spec: null, reason: 'unsupported-control-type:$cType');
      }

      final defProps =
          ((defaultsRaw[cType] as Map?) ?? const {}).cast<String, dynamic>();
      var width =
          _parseReportInt(ctrl['width'] ?? cProps['Width'] ?? defProps['Width']);
      var height = _parseReportInt(
          ctrl['height'] ?? cProps['Height'] ?? defProps['Height']);
      final cachedLeft = _parseReportInt(cProps['LayoutCachedLeft']);
      final cachedTop = _parseReportInt(cProps['LayoutCachedTop']);
      final cachedRight = _parseReportInt(cProps['LayoutCachedWidth']);
      final cachedBottom = _parseReportInt(cProps['LayoutCachedHeight']);
      var left =
          _parseReportInt(ctrl['left'] ?? cProps['Left']) ?? cachedLeft ?? 0;
      if (left >= -30 && left < 0) left = 0;
      var top =
          _parseReportInt(ctrl['top'] ?? cProps['Top']) ?? cachedTop ?? 0;
      if (top >= -30 && top < 0) top = 0;
      if ((width == null || width <= 0) &&
          cachedRight != null &&
          cachedRight >= left) {
        width = cachedRight - left;
      }
      if ((height == null || height <= 0) &&
          cachedBottom != null &&
          cachedBottom >= top) {
        height = cachedBottom - top;
      }
      if (cType == 'CheckBox' || cType == 'OptionButton') {
        width ??= 260;
        height ??= 240;
      } else if (cType == 'TextBox' ||
          cType == 'ComboBox' ||
          cType == 'Label' ||
          cType == 'Attachment' ||
          cType == 'BoundObjectFrame') {
        width ??= 1701;
        height ??= 240;
      }
      if (cType == 'Line' || cType == 'EmptyCell' || cType == 'Label' || cType == 'PageBreak') {
        width ??= 0;
        height ??= 0;
        if (left < 0 ||
            top < 0 ||
            width < 0 ||
            height < 0 ||
            (cType == 'Line' && width == 0 && height == 0)) {
          return (spec: null, reason: 'invalid-control-geometry:$cName');
        }
      } else if (width == null ||
          height == null ||
          left < 0 ||
          top < 0 ||
          width <= 0 ||
          height <= 0) {
        return (spec: null, reason: 'invalid-control-geometry:$cName');
      }

      final backStyle = cType == 'Line' ||
              cType == 'CheckBox' ||
              cType == 'EmptyCell'
          ? 0
          : (_parseReportInt(cProps['BackStyle'] ?? defProps['BackStyle']) ??
              (cType == 'TextBox' ||
                      cType == 'ComboBox' ||
                      cType == 'Image' ||
                      cType == 'Rectangle'
                  ? 1
                  : 0));
      final backColor = _resolveControlThemeColor(
        'Back',
        cProps,
        defProps,
        themePalette,
        fallback: 16777215,
      );
      final borderStyle = cType == 'EmptyCell'
          ? 0
          : (_parseReportInt(cProps['BorderStyle'] ??
                  cProps['OldBorderStyle'] ??
                  defProps['BorderStyle'] ??
                  defProps['OldBorderStyle']) ??
              (cType == 'Label' || cType == 'Image' ? 0 : 1));
      final borderColor = _resolveControlThemeColor(
        'Border',
        cProps,
        defProps,
        themePalette,
        fallback: 0,
      );
      final foreColor = _resolveControlThemeColor(
        'Fore',
        cProps,
        defProps,
        themePalette,
        fallback: 0,
      );

      String? fontName;
      int? fontSize;
      int? fontWeight;
      int? textAlign;
      String? caption;
      String? controlSource;
      int? columnOrdinal;
      int? daoType;
      String? format;
      String? picture;
      int? pictureType;
      int? sizeMode;
      int? pictureAlignment;
      String? assetName;
      Map<String, Object?>? expression;
      Map<String, Object?>? lookupSpec;
      Map<String, Object?>? subReportSpec;

      if (cType == 'Label' || cType == 'TextBox' || cType == 'ComboBox') {
        fontName =
            (cProps['FontName'] ?? defProps['FontName'])?.toString() ??
                'Calibri';
        fontSize =
            _parseReportInt(cProps['FontSize'] ?? defProps['FontSize']) ?? 11;
        fontWeight =
            _parseReportInt(cProps['FontWeight'] ?? defProps['FontWeight']) ??
                400;
        textAlign =
            _parseReportInt(cProps['TextAlign'] ?? defProps['TextAlign']) ?? 0;
        if (cType == 'Label') {
          caption = (ctrl['caption'] ?? cProps['Caption'])?.toString() ?? '';
        } else {
          final isCombo = cType == 'ComboBox';
          if (isCombo && !_isIdentityDisplayComboBox(cProps, defProps)) {
            final rawRowSrc = (cProps['RowSource'] ?? defProps['RowSource'])
                ?.toString()
                .trim();
            final rowSrcType =
                (cProps['RowSourceType'] ?? defProps['RowSourceType'])
                        ?.toString()
                        .trim()
                        .toLowerCase() ??
                    '';
            String? rowSrc = rawRowSrc;
            if ((rowSrc == null || rowSrc.isEmpty) &&
                rowSrcType == 'table/query') {
              // Check table-level lookup definition on underlying source column if available
              final rawCs =
                  (ctrl['controlSource'] ?? cProps['ControlSource'])
                      ?.toString()
                      .trim();
              if (rawCs != null && rawCs.isNotEmpty && !rawCs.startsWith('=')) {
                final csCols = _resolveReportQueryColumns(
                    rawCs, columnsByLower, queryColumns);
                if (csCols.length == 1) {
                  final st = csCols.single['sourceTable']?.toString().toLowerCase() ?? '';
                  final sc = csCols.single['sourceColumn']?.toString().toLowerCase() ?? '';
                  final tbl = tableByLowerName[st];
                  final tblCol = tbl?.columns
                      .where((col) => col.name.toLowerCase() == sc)
                      .firstOrNull;
                  if (tblCol?.rowSource != null && tblCol!.rowSource!.trim().isNotEmpty) {
                    rowSrc = tblCol.rowSource!.trim();
                  }
                }
              }
            }
            if ((rowSrc == null || rowSrc.isEmpty) &&
                rowSrcType != 'table/query') {
              return (spec: null, reason: 'unsupported-combobox-lookup:$cName');
            }
            if (rowSrc != null && rowSrc.isNotEmpty) {
            final boundCol = _parseReportInt(
                    cProps['BoundColumn'] ?? defProps['BoundColumn']) ??
                1;
            final colCount = _parseReportInt(
                cProps['ColumnCount'] ?? defProps['ColumnCount']);
            final colWidthsRaw =
                (cProps['ColumnWidths'] ?? defProps['ColumnWidths'])
                        ?.toString()
                        .trim() ??
                    '';
            final boundIdx = (boundCol - 1) < 0 ? 0 : (boundCol - 1);
            var displayIdx = -1;
            if (colWidthsRaw.isNotEmpty) {
              final parts = colWidthsRaw.split(RegExp(r'[;,]'));
              for (var wi = 0; wi < parts.length; wi++) {
                final wMatch =
                    RegExp(r'^[+-]?[0-9]+(?:\.[0-9]+)?').firstMatch(parts[wi].trim());
                final w = wMatch == null ? 0 : (double.tryParse(wMatch.group(0)!) ?? 0);
                if (w > 0) {
                  displayIdx = wi;
                  break;
                }
              }
            }
            if (displayIdx < 0) {
              displayIdx = (boundIdx == 0 && (colCount == null || colCount >= 2))
                  ? 1
                  : 0;
            }
            if (rowSrcType == 'value list') {
              final items = _parseValueListItems(rowSrc);
              final step = (colCount != null && colCount > 1)
                  ? colCount
                  : (displayIdx + 1 > 1 ? displayIdx + 1 : 1);
              final staticMap = <String, String>{};
              for (var vi = 0; vi + boundIdx < items.length; vi += step) {
                final kVal = items[vi + boundIdx];
                final dVal = (vi + displayIdx < items.length)
                    ? items[vi + displayIdx]
                    : kVal;
                staticMap[kVal] = dVal;
              }
              lookupSpec = {'staticMap': staticMap};
            } else {
              final lkpEntry = _compileReportLookupQuery(
                project,
                rowSrc,
                usedQueryKeys: usedQueryKeys,
                compiledReportQueries: compiledReportQueries,
                pendingLookupQueries: pendingLookupQueries,
                tableByLowerName: tableByLowerName,
                catalogQueryByLowerName: catalogQueryByLowerName,
                namedSubqueries: namedSubqueries,
              );
              if (lkpEntry == null) {
                return (spec: null, reason: 'unsupported-combobox-lookup:$cName');
              }
              final lkpCols =
                  ((lkpEntry.value['columns'] as List?) ?? const []).cast<Map>();
              if (boundIdx >= lkpCols.length) {
                return (spec: null, reason: 'unsupported-combobox-lookup:$cName');
              }
              final effDisplay = displayIdx < lkpCols.length
                  ? displayIdx
                  : (lkpCols.length > 1 && boundIdx == 0 ? 1 : 0);
              lookupSpec = {
                'queryKey': lkpEntry.key,
                'boundOrdinal': boundIdx,
                'displayOrdinal': effDisplay,
              };
            }
            }
          }
          controlSource =
              (ctrl['controlSource'] ?? cProps['ControlSource'])?.toString().trim();
          final typeSlug = isCombo ? 'combobox' : 'textbox';
          if (controlSource != null && controlSource.isNotEmpty) {
            final intMatch = !isCombo
                ? RegExp(r'^=([+-]?[0-9]+)$').firstMatch(controlSource)
                : null;
            final literalMatch = !isCombo && intMatch == null
                ? RegExp(r'^="([^"]*)"$').firstMatch(controlSource)
                : null;
            if (intMatch != null) {
              caption = intMatch.group(1)!;
              controlSource = null;
            } else if (literalMatch != null) {
              caption = literalMatch.group(1)!;
              controlSource = null;
            } else if (controlSource.startsWith('=')) {
              expression = !isCombo
                  ? _compileReportControlExpression(
                      controlSource,
                      columnsByLower,
                      queryColumns,
                      isBound: isBound,
                      queryParamByLower: queryParamByLower,
                      promptParamByLower: promptParamByLower,
                      reportPromptParams: reportPromptParams,
                      knownControlNamesLower: knownControlNamesLower,
                      subReportQueryKeyByCtrlLower: subReportQueryKeyByCtrlLower,
                      subReportColsByCtrlLower: subReportColsByCtrlLower,
                    )
                  : null;
              if (expression == null) {
                return (spec: null, reason: 'unsupported-$typeSlug-source:$cName');
              }
            } else {
              final colMatches = _resolveReportQueryColumns(
                controlSource,
                columnsByLower,
                queryColumns,
              );
              if (colMatches.length == 1) {
                columnOrdinal = colMatches.single['ordinal'] as int;
                daoType = colMatches.single['daoType'] as int;
              } else if (!isCombo && colMatches.isEmpty && isBound) {
                final cleanPrompt = _stripSingleBrackets(controlSource);
                final qParam = queryParamByLower[cleanPrompt.toLowerCase()];
                if (qParam != null) {
                  expression = {'op': 'param', 'name': qParam};
                } else if (!controlSource.contains('.')) {
                  final lowerPrompt = controlSource.toLowerCase();
                  final canonical = promptParamByLower.putIfAbsent(lowerPrompt, () {
                    reportPromptParams.add({
                      'key': 'rp${reportPromptParams.length}',
                      'sourceName': controlSource,
                      'daoType': 10,
                      'optional': true,
                    });
                    return controlSource!;
                  });
                  expression = {'op': 'param', 'name': canonical};
                } else {
                  return (spec: null, reason: 'unresolved-$typeSlug-column:$cName');
                }
              } else {
                return (spec: null, reason: 'unresolved-$typeSlug-column:$cName');
              }
            }
          } else {
            if (isCombo) {
              return (spec: null, reason: 'unsupported-combobox-source:$cName');
            }
            controlSource = null;
          }
          format = cProps['Format']?.toString();
          if (format != null && !_isSupportedReportFormat(format)) {
            return (spec: null, reason: 'unsupported-$typeSlug-format:$cName');
          }
        }
      } else if (cType == 'Attachment') {
        controlSource =
            (ctrl['controlSource'] ?? cProps['ControlSource'])?.toString().trim();
        if (controlSource != null && controlSource.isNotEmpty) {
          if (controlSource.startsWith('=')) {
            return (spec: null, reason: 'unsupported-attachment-source:$cName');
          }
          final colMatches = _resolveReportQueryColumns(
            controlSource,
            columnsByLower,
            queryColumns,
          );
          if (colMatches.length != 1 || colMatches.single['daoType'] != 18) {
            return (spec: null, reason: 'unresolved-attachment-column:$cName');
          }
          columnOrdinal = colMatches.single['ordinal'] as int;
          daoType = 18;
        } else {
          controlSource = null;
        }
      } else if (cType == 'BoundObjectFrame') {
        controlSource =
            (ctrl['controlSource'] ?? cProps['ControlSource'])?.toString().trim();
        if (controlSource != null && controlSource.isNotEmpty) {
          if (controlSource.startsWith('=')) {
            return (spec: null, reason: 'unsupported-boundobjectframe-source:$cName');
          }
          final colMatches = _resolveReportQueryColumns(
            controlSource,
            columnsByLower,
            queryColumns,
          );
          if (colMatches.length != 1 ||
              !const {10, 11, 12, 18}.contains(colMatches.single['daoType'])) {
            return (spec: null, reason: 'unresolved-boundobjectframe-column:$cName');
          }
          columnOrdinal = colMatches.single['ordinal'] as int;
          daoType = colMatches.single['daoType'] as int;
        } else {
          controlSource = null;
        }
      } else if (cType == 'Subform') {
        subReportSpec = compiledSubReportsByIdx[i]?.subSpec;
      } else if (cType == 'CheckBox') {
        controlSource =
            (ctrl['controlSource'] ?? cProps['ControlSource'])?.toString().trim();
        if (controlSource != null && controlSource.isNotEmpty) {
          if (controlSource.startsWith('=')) {
            return (spec: null, reason: 'unsupported-checkbox-source:$cName');
          }
          final colMatches = _resolveReportQueryColumns(
            controlSource,
            columnsByLower,
            queryColumns,
          );
          if (colMatches.length != 1 || colMatches.single['daoType'] != 1) {
            return (spec: null, reason: 'unresolved-checkbox-column:$cName');
          }
          columnOrdinal = colMatches.single['ordinal'] as int;
          daoType = 1;
        } else {
          controlSource = null;
        }
      } else if (cType == 'Image') {
        picture = cProps['Picture']?.toString();
        pictureType =
            _parseReportInt(cProps['PictureType'] ?? defProps['PictureType']);
        sizeMode = _parseReportInt(cProps['SizeMode'] ?? defProps['SizeMode']) ?? 0;
        pictureAlignment = _parseReportInt(
                cProps['PictureAlignment'] ?? defProps['PictureAlignment']) ??
            2;
        if (pictureType != 2 || picture == null || picture.isEmpty) {
          return (spec: null, reason: 'unsupported-image-storage:$cName');
        }
        final imageEntry = imageByControl[cName.toLowerCase()];
        CompiledReportAsset? loadedAsset;
        if (hasSourceExport) {
          if (imageEntry == null ||
              imageEntry['status'] != 'resolved' ||
              imageEntry['sourcePath'] is! String ||
              imageEntry['sha256'] is! String) {
            return (spec: null, reason: 'unresolved-shared-image:$cName');
          }
          loadedAsset = _loadVerifiedReportAsset(
            controlName: cName,
            picture: picture,
            relativeSourcePath: imageEntry['sourcePath'] as String,
            expectedSha256: imageEntry['sha256'] as String,
            sourceRoot: sourceRoot,
          );
          if (loadedAsset == null) {
            return (spec: null, reason: 'missing-or-corrupt-image-file:$cName');
          }
        } else {
          if (imageEntry != null && imageEntry['status'] != 'resolved') {
            return (spec: null, reason: 'unresolved-shared-image:$cName');
          }
          loadedAsset = _loadBinaryResourceReportAsset(
            controlName: cName,
            picture: picture,
            expectedSha256: imageEntry?['sha256'] as String?,
            resources: binaryResources,
          );
          if (loadedAsset == null) {
            return (
              spec: null,
              reason: imageEntry == null
                  ? 'unresolved-shared-image:$cName'
                  : 'missing-or-corrupt-image-file:$cName',
            );
          }
        }
        final existingHash = assetHashByName[loadedAsset.assetName];
        if (existingHash != null && existingHash != loadedAsset.sha256) {
          return (spec: null, reason: 'report-asset-name-collision:$cName');
        }
        if (existingHash == null) {
          assetHashByName[loadedAsset.assetName] = loadedAsset.sha256;
          compiledAssets.add(loadedAsset);
        }
        assetName = loadedAsset.assetName;
      }

      compiledControls.add(CompiledReportControl(
        index: i,
        name: cName,
        type: cType,
        controlType: controlTypeCode,
        section: sectionCode,
        left: left,
        top: top,
        sheetTop: sectionOffsetTwips + top,
        width: width,
        height: height,
        backStyle: backStyle,
        backColor: backColor,
        backColorHex: _accessBgrToHex(backColor),
        borderStyle: borderStyle,
        borderColor: borderColor,
        borderColorHex: _accessBgrToHex(borderColor),
        foreColor: foreColor,
        foreColorHex: _accessBgrToHex(foreColor),
        fontName: fontName,
        fontSize: fontSize,
        fontWeight: fontWeight,
        textAlign: textAlign,
        caption: caption,
        controlSource: controlSource,
        columnOrdinal: columnOrdinal,
        daoType: daoType,
        format: format,
        picture: picture,
        pictureType: pictureType,
        sizeMode: sizeMode,
        pictureAlignment: pictureAlignment,
        assetName: assetName,
        expression: expression,
        lookupSpec: lookupSpec,
        subReportSpec: subReportSpec,
      ));
    }

    if (pendingReportQuery != null) {
      usedQueryKeys.add(pendingReportQuery.key);
      compiledReportQueries[pendingReportQuery.key] = pendingReportQuery.value;
      queryByLowerName[recordSource!.toLowerCase()] = pendingReportQuery;
    }
    for (final lkp in pendingLookupQueries) {
      usedQueryKeys.add(lkp.key);
      compiledReportQueries[lkp.key] = lkp.value;
    }

    final mergedParams = <Map<String, Object?>>[
      ...queryParams,
      ...reportPromptParams,
    ];

    return (
      spec: CompiledReportSpec(
        key: key,
        name: report['name'] as String,
        caption: (report['caption'] ?? props['Caption'])?.toString(),
        recordSource: recordSource ?? '',
        queryKey: queryEntry?.key ?? '',
        sourceSha256: sourceSha256,
        printSettingsSha256: report['printSettingsSha256']?.toString(),
        pageSetup: pageSetup,
        parameters: mergedParams,
        sections: compiledSections,
        controls: compiledControls,
        assets: compiledAssets,
        groupLevels: compiledGroupLevels,
      ),
      reason: null,
    );
  }

  CompiledReportAsset? _loadVerifiedReportAsset({
    required String controlName,
    required String picture,
    required String relativeSourcePath,
    required String expectedSha256,
    required String? sourceRoot,
  }) {
    if (sourceRoot == null || sourceRoot.isEmpty) {
      return null;
    }
    final normalizedRel = relativeSourcePath.replaceAll(r'\', '/');
    if (normalizedRel.startsWith('/') ||
        normalizedRel.contains(':') ||
        normalizedRel.split('/').contains('..')) {
      return null;
    }
    final rootDir = Directory(sourceRoot);
    if (!rootDir.existsSync()) {
      return null;
    }
    final assetFile = File(p.joinAll([rootDir.path, ...normalizedRel.split('/')]));
    if (!assetFile.existsSync()) {
      return null;
    }
    final resolvedRoot = rootDir.resolveSymbolicLinksSync();
    final resolvedFile = assetFile.resolveSymbolicLinksSync();
    if (!p.isWithin(resolvedRoot, resolvedFile)) {
      return null;
    }
    final bytes = assetFile.readAsBytesSync();
    final actualSha = sha256.convert(bytes).toString();
    if (actualSha != expectedSha256) {
      return null;
    }
    final ext = p.extension(assetFile.path).toLowerCase();
    final contentType = switch (ext) {
      '.png' => 'image/png',
      '.jpg' || '.jpeg' => 'image/jpeg',
      '.gif' => 'image/gif',
      _ => null,
    };
    if (contentType == null) {
      return null;
    }
    return CompiledReportAsset(
      controlName: controlName,
      picture: picture,
      assetName: p.basename(assetFile.path),
      sourcePath: normalizedRel,
      sha256: actualSha,
      contentType: contentType,
      base64Data: base64Encode(bytes),
    );
  }

  CompiledReportAsset? _loadBinaryResourceReportAsset({
    required String controlName,
    required String picture,
    required String? expectedSha256,
    required List<Map<String, dynamic>> resources,
  }) {
    if (resources.isEmpty) return null;
    final pictureLower = picture.trim().toLowerCase();
    Map<String, dynamic>? matched;
    for (final resource in resources) {
      if (resource['dataBase64'] is! String) continue;
      final rType = (resource['type']?.toString() ?? '').trim().toLowerCase();
      final rExt =
          (resource['extension']?.toString() ?? '').trim().toLowerCase();
      final isImage = rType == 'img' ||
          rExt == 'png' ||
          rExt == 'jpg' ||
          rExt == 'jpeg' ||
          rExt == 'gif';
      if (!isImage) continue;
      final rName = (resource['name']?.toString() ?? '').trim().toLowerCase();
      final rFile =
          (resource['fileName']?.toString() ?? '').trim().toLowerCase();
      if (rName == pictureLower ||
          rFile == pictureLower ||
          (rFile.isNotEmpty &&
              p.basenameWithoutExtension(rFile) == pictureLower)) {
        matched = resource;
        break;
      }
    }
    if (matched == null) return null;

    final List<int> bytes;
    try {
      bytes = base64Decode(matched['dataBase64'] as String);
    } catch (_) {
      return null;
    }
    final actualSha = sha256.convert(bytes).toString();
    if (expectedSha256 != null &&
        expectedSha256.isNotEmpty &&
        actualSha != expectedSha256) {
      return null;
    }

    var rawExt = (matched['extension']?.toString() ?? '').trim().toLowerCase();
    if (rawExt.isEmpty && matched['fileType'] is String) {
      rawExt = (matched['fileType'] as String).trim().toLowerCase();
    }
    final fileNameCandidate = (matched['fileName']?.toString() ?? '').trim();
    if (rawExt.isEmpty && fileNameCandidate.isNotEmpty) {
      rawExt = p.extension(fileNameCandidate).replaceFirst('.', '').toLowerCase();
    }
    final contentType = switch (rawExt) {
      'png' => 'image/png',
      'jpg' || 'jpeg' => 'image/jpeg',
      'gif' => 'image/gif',
      _ => null,
    };
    if (contentType == null) return null;

    final fallbackBase = (matched['name']?.toString() ?? '').trim().isNotEmpty
        ? (matched['name'] as String).trim()
        : picture.trim();
    final safeBase = fileNameCandidate.isNotEmpty
        ? p.basename(fileNameCandidate)
        : p.basename('$fallbackBase.$rawExt');
    if (safeBase.isEmpty || safeBase == '.' || safeBase == '..') {
      return null;
    }

    return CompiledReportAsset(
      controlName: controlName,
      picture: picture,
      assetName: safeBase,
      sourcePath: 'MSysResources/$safeBase',
      sha256: actualSha,
      contentType: contentType,
      base64Data: base64Encode(bytes),
    );
  }

  bool _reportHasBehaviorOrModule(
    Map<String, dynamic> report,
    Map<String, dynamic> props,
  ) {
    if (report['hasModule'] == true) return true;
    if ((report['rawVbaCode']?.toString().trim() ?? '').isNotEmpty) return true;
    final hasModuleProp = props['HasModule']?.toString().trim();
    if (hasModuleProp != null &&
        hasModuleProp.isNotEmpty &&
        hasModuleProp != '0' &&
        hasModuleProp.toLowerCase() != 'false' &&
        hasModuleProp != 'Default') {
      return true;
    }
    return _mapHasBehaviorOrEvents(report, props, allowCosmeticOpenMacro: true);
  }

  String? _cosmeticOpenWindowAction(Map<String, dynamic> report) {
    final macros = report['macros'];
    final macroDefs = report['macroDefinitions'];
    if (macros is Map && macros.isNotEmpty) {
      if (macros.length != 1 || !macros.containsKey('OnOpenEmMacro')) {
        return null;
      }
      final actions = macros['OnOpenEmMacro'];
      if (actions is! List ||
          actions.length != 1 ||
          actions.single?.toString().trim() != 'Maximize') {
        return null;
      }
    } else if (macroDefs is! Map || !macroDefs.containsKey('OnOpenEmMacro')) {
      return null;
    }

    if (macroDefs is Map && macroDefs.isNotEmpty) {
      if (macroDefs.length != 1 || !macroDefs.containsKey('OnOpenEmMacro')) {
        return null;
      }
      final steps = macroDefs['OnOpenEmMacro'];
      if (steps is! List || steps.isEmpty) return null;
      var foundMaximize = false;
      for (final rawStep in steps) {
        if (rawStep is! Map) return null;
        final action = rawStep['action']?.toString().trim();
        final condition = rawStep['condition']?.toString().trim();
        final arguments = (rawStep['arguments'] as List?) ?? const [];
        final children = (rawStep['children'] as List?) ?? const [];
        if ((condition != null && condition.isNotEmpty) ||
            arguments.isNotEmpty ||
            children.isNotEmpty) {
          return null;
        }
        if (action == null || action.isEmpty) {
          continue;
        }
        if (action == 'Maximize') {
          foundMaximize = true;
          continue;
        }
        return null;
      }
      if (!foundMaximize) return null;
    }
    return 'Maximize';
  }

  bool _mapHasBehaviorOrEvents(
    Map<String, dynamic> node,
    Map<String, dynamic> props, {
    bool allowCosmeticOpenMacro = false,
  }) {
    final events = node['events'];
    if (events is Map && events.isNotEmpty) return true;
    final hasCosmeticOpen =
        allowCosmeticOpenMacro && _cosmeticOpenWindowAction(node) != null;
    for (final key in const ['macros', 'macroDefinitions']) {
      final entry = node[key];
      if (entry is Map && entry.isNotEmpty && !hasCosmeticOpen) {
        return true;
      }
    }
    for (final entry in props.entries) {
      if (RegExp(r'^On[A-Z]').hasMatch(entry.key) &&
          (entry.value?.toString().trim() ?? '').isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  Map<String, Object?>? _parseReportPageSetup(
    Object? rawSettings, {
    required int widthTwips,
  }) {
    if (rawSettings is! Map) return null;
    final items = rawSettings['Items'];
    if (items is! Map) return null;
    final margins = items['Margins'];
    final printer = items['Printer'];
    if (margins is! Map || printer is! Map) return null;
    final leftIn = _parseReportDouble(margins['LeftMargin']);
    final rightIn = _parseReportDouble(margins['RightMargin']);
    final topIn = _parseReportDouble(margins['TopMargin']);
    final botIn = _parseReportDouble(margins['BotMargin']);
    if (leftIn == null || rightIn == null || topIn == null || botIn == null) {
      return null;
    }
    final orientationName = printer['Orientation']?.toString() ?? 'Portrait';
    final paperName = printer['PaperSize']?.toString() ?? 'A4';
    final orientation = switch (orientationName) {
      'Portrait' => 1,
      'Landscape' => 2,
      _ => null,
    };
    final paperSize = switch (paperName) {
      'A4' => 9,
      'Letter' => 1,
      _ => null,
    };
    if (orientation == null || paperSize == null) return null;
    return <String, Object?>{
      'widthTwips': widthTwips,
      'detailHeightTwips': 0,
      'sheetHeightTwips': 0,
      'orientation': orientation,
      'orientationName': orientationName,
      'paperSize': paperSize,
      'paperSizeName': paperName,
      'leftMarginTwips': (leftIn * 1440).round(),
      'rightMarginTwips': (rightIn * 1440).round(),
      'topMarginTwips': (topIn * 1440).round(),
      'bottomMarginTwips': (botIn * 1440).round(),
    };
  }

  int? _parseReportInt(Object? value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value.trim());
    return null;
  }

  double? _parseReportDouble(Object? value) {
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value.trim());
    return null;
  }

  int _resolveControlThemeColor(
    String prefix,
    Map<String, dynamic> ctrlProp,
    Map<String, dynamic> defProp,
    _OfficeThemePalette palette, {
    required int fallback,
  }) {
    final explicitCtrl = _parseReportInt(ctrlProp['${prefix}Color']);
    if (explicitCtrl != null) return explicitCtrl;

    final ctrlThemeRaw = ctrlProp['${prefix}ThemeColorIndex'];
    final defThemeRaw = defProp['${prefix}ThemeColorIndex'];
    final themeIndex = _parseReportInt(ctrlThemeRaw ?? defThemeRaw);
    if (themeIndex != null && themeIndex >= 0) {
      final ctrlChangedTheme = ctrlThemeRaw != null &&
          ctrlThemeRaw.toString() != defThemeRaw?.toString();
      final rawCtrlTint = ctrlProp['${prefix}Tint'];
      final rawCtrlShade = ctrlProp['${prefix}Shade'];
      final effectiveTint = rawCtrlTint ??
          (ctrlChangedTheme || rawCtrlShade != null
              ? null
              : defProp['${prefix}Tint']);
      final effectiveShade = rawCtrlShade ??
          (ctrlChangedTheme || rawCtrlTint != null
              ? null
              : defProp['${prefix}Shade']);
      final resolved = palette.resolveColor(
        themeIndex: themeIndex,
        tint: _parseReportDouble(effectiveTint),
        shade: _parseReportDouble(effectiveShade),
      );
      if (resolved != null) return resolved;
    }

    final explicitDef = _parseReportInt(defProp['${prefix}Color']);
    if (explicitDef != null) return explicitDef;
    return fallback;
  }

  bool _isAccessFlagSet(Object? raw) {
    final s = raw?.toString().trim().toLowerCase() ?? '';
    return s == 'notdefault' || s == 'true' || s == '1';
  }

  String _stripSingleBrackets(String value) {
    final t = value.trim();
    if (t.startsWith('[') && t.endsWith(']') && !t.contains('!') && t.length >= 2) {
      return t.substring(1, t.length - 1).trim();
    }
    return t;
  }

  List<String> _parseValueListItems(String raw) {
    final items = <String>[];
    final buf = StringBuffer();
    String? quote;
    for (var i = 0; i < raw.length; i++) {
      final ch = raw[i];
      if (quote != null) {
        if (ch == quote) {
          if (i + 1 < raw.length && raw[i + 1] == quote) {
            buf.write(raw[++i]);
          } else {
            quote = null;
          }
        } else {
          buf.write(ch);
        }
      } else if (ch == '"' || ch == "'") {
        quote = ch;
      } else if (ch == ';') {
        items.add(buf.toString().trim());
        buf.clear();
      } else {
        buf.write(ch);
      }
    }
    items.add(buf.toString().trim());
    return items;
  }

  MapEntry<String, Map<String, Object?>>? _compileReportLookupQuery(
    AnalysisProject project,
    String rowSource, {
    required Set<String> usedQueryKeys,
    required Map<String, Map<String, Object?>> compiledReportQueries,
    required List<MapEntry<String, Map<String, Object?>>> pendingLookupQueries,
    required Map<String, AnalysisTable> tableByLowerName,
    required Map<String, Map<String, dynamic>> catalogQueryByLowerName,
    required Map<String, String> namedSubqueries,
  }) {
    final trimmed = rowSource.trim();
    final lower = trimmed.toLowerCase();
    String? sqlText;
    final tbl = tableByLowerName[lower];
    if (tbl != null) {
      sqlText = 'SELECT * FROM [${tbl.name}]';
    } else if (trimmed.toUpperCase().startsWith('SELECT ') ||
        trimmed.toUpperCase().startsWith('PARAMETERS ') ||
        trimmed.startsWith('(')) {
      sqlText = trimmed;
    } else {
      final cat = catalogQueryByLowerName[lower];
      if (cat != null && cat['sqlText'] is String) {
        sqlText = cat['sqlText'] as String;
      }
    }
    if (sqlText == null || sqlText.trim().isEmpty) return null;
    final hash = sha256.convert(utf8.encode(trimmed)).toString().substring(0, 12);
    final candidateKey = 'report_lookup_$hash';
    for (final existing in pendingLookupQueries) {
      if (existing.key == candidateKey) return existing;
    }
    final alreadyCompiled = compiledReportQueries[candidateKey];
    if (alreadyCompiled != null) {
      return MapEntry(candidateKey, alreadyCompiled);
    }
    if (usedQueryKeys.contains(candidateKey)) {
      return null;
    }
    try {
      final entry = _compileExtendedQuerySpecification(
        project,
        key: candidateKey,
        name: trimmed,
        sqlText: sqlText,
        namedSubqueries: namedSubqueries,
      );
      if (entry != null) pendingLookupQueries.add(entry);
      return entry;
    } on FormatException {
      return null;
    }
  }

  Map<String, Object?>? _compileReportControlExpression(
    String rawSource,
    Map<String, List<Map>> columnsByLower,
    List<Map> queryColumns, {
    required bool isBound,
    Map<String, String> queryParamByLower = const {},
    Map<String, String> promptParamByLower = const {},
    List<Map<String, Object?>>? reportPromptParams,
    Set<String> knownControlNamesLower = const {},
    Map<String, String> subReportQueryKeyByCtrlLower = const {},
    Map<String, List<Map>> subReportColsByCtrlLower = const {},
  }) {
    final trimmed = rawSource.trim();
    if (!trimmed.startsWith('=')) return null;
    final body = trimmed.substring(1).trim();
    if (body.isEmpty) return null;
    final lower = body.toLowerCase();
    if (RegExp(r'^date\s*\(\s*\)$').hasMatch(lower)) {
      return const {'op': 'date'};
    }
    if (RegExp(r'^now\s*\(\s*\)$').hasMatch(lower)) {
      return const {'op': 'now'};
    }
    final countMatch = RegExp(
      r'^count\s*\(\s*(.+?)\s*\)$',
      caseSensitive: false,
    ).firstMatch(body);
    if (countMatch != null) {
      if (!isBound) return null;
      final arg = countMatch.group(1)!.trim();
      if (arg == '*') {
        return const {'op': 'count', 'columnOrdinal': null};
      }
      final cols = _resolveExpressionColumn(arg, columnsByLower, queryColumns);
      if (cols.length == 1) {
        return {
          'op': 'count',
          'columnOrdinal': cols.single['ordinal'] as int,
        };
      }
    }
    final sumMatch = RegExp(
      r'^([+-])?\s*sum\s*\(\s*(.+?)\s*\)$',
      caseSensitive: false,
    ).firstMatch(body);
    if (sumMatch != null && isBound) {
      final sign = sumMatch.group(1) == '-' ? -1 : 1;
      final arg = sumMatch.group(2)!.trim();
      final cols = _resolveExpressionColumn(arg, columnsByLower, queryColumns);
      if (cols.length == 1 &&
          const {1, 3, 4, 5, 7}.contains(cols.single['daoType'])) {
        return {
          'op': 'sum',
          'columnOrdinal': cols.single['ordinal'] as int,
          'daoType': cols.single['daoType'] as int,
          'sign': sign,
        };
      }
    }

    final parts = _parsePageConcatExpression(body);
    if (parts != null) {
      return {'op': 'concat', 'parts': parts};
    }

    final general = _GeneralReportExprCompiler(
      columnsByLower: columnsByLower,
      queryColumns: queryColumns,
      isBound: isBound,
      queryParamByLower: queryParamByLower,
      promptParamByLower: promptParamByLower,
      reportPromptParams: reportPromptParams ?? <Map<String, Object?>>[],
      knownControlNamesLower: knownControlNamesLower,
      subReportQueryKeyByCtrlLower: subReportQueryKeyByCtrlLower,
      subReportColsByCtrlLower: subReportColsByCtrlLower,
      resolveColumnFn: _resolveExpressionColumn,
    );
    return general.compile(body);
  }

  List<Map> _resolveExpressionColumn(
    String rawArg,
    Map<String, List<Map>> columnsByLower,
    List<Map> queryColumns,
  ) {
    final direct =
        _resolveReportQueryColumns(rawArg, columnsByLower, queryColumns);
    if (direct.isNotEmpty) return direct;

    final segments = rawArg
        .split('.')
        .map((part) {
          final t = part.trim();
          if (t.startsWith('[') && t.endsWith(']') && t.length >= 2) {
            return t.substring(1, t.length - 1);
          }
          return t;
        })
        .where((s) => s.isNotEmpty)
        .toList();
    if (segments.length >= 2) {
      final tail2 = '${segments[segments.length - 2]}.${segments.last}';
      final byTail2 =
          _resolveReportQueryColumns(tail2, columnsByLower, queryColumns);
      if (byTail2.isNotEmpty) return byTail2;
    }
    if (segments.isNotEmpty) {
      return _resolveReportQueryColumns(
          segments.last, columnsByLower, queryColumns);
    }
    return const [];
  }

  List<Map<String, String>>? _parsePageConcatExpression(String body) {
    final rawParts = <String>[];
    final current = StringBuffer();
    String? quoteChar;
    for (var i = 0; i < body.length; i++) {
      final ch = body[i];
      if (quoteChar != null) {
        current.write(ch);
        if (ch == quoteChar) {
          if (i + 1 < body.length && body[i + 1] == quoteChar) {
            current.write(body[++i]);
          } else {
            quoteChar = null;
          }
        }
      } else {
        if (ch == '"' || ch == "'") {
          quoteChar = ch;
          current.write(ch);
        } else if (ch == '&') {
          rawParts.add(current.toString().trim());
          current.clear();
        } else {
          current.write(ch);
        }
      }
    }
    if (quoteChar != null) return null;
    rawParts.add(current.toString().trim());
    if (rawParts.any((p) => p.isEmpty)) return null;

    final result = <Map<String, String>>[];
    var sawPageVar = false;
    for (final part in rawParts) {
      if ((part.startsWith('"') && part.endsWith('"') && part.length >= 2) ||
          (part.startsWith("'") && part.endsWith("'") && part.length >= 2)) {
        final q = part[0];
        final inner = part.substring(1, part.length - 1).replaceAll('$q$q', q);
        result.add({'literal': inner});
      } else {
        final clean = (part.startsWith('[') && part.endsWith(']') && part.length >= 2)
            ? part.substring(1, part.length - 1).trim().toLowerCase()
            : part.toLowerCase();
        if (clean == 'page' || clean == 'pages') {
          sawPageVar = true;
          result.add({'var': clean});
        } else {
          return null;
        }
      }
    }
    return sawPageVar ? result : null;
  }

  bool _isSupportedReportFormat(String rawFormat) {
    final trimmed = rawFormat.trim();
    if (trimmed.isEmpty) return true;
    final lower = trimmed.toLowerCase();
    if (_supportedReportFormats.contains(lower)) return true;
    final withoutQuoted = lower
        .replaceAll(RegExp(r'\"[^\"]*\"'), '')
        .replaceAll(RegExp(r'"[^"]*"'), '')
        .trim();
    if (withoutQuoted.isEmpty) return true;
    return RegExp(r'^[#0.,;()+\-*/%$ rsdmyhns/:\\@<>]+$')
        .hasMatch(withoutQuoted);
  }

  static const Set<String> _supportedReportFormats = {
    '',
    '>',
    '<',
    '@',
    '#',
    r'\',
    'short date',
    'long date',
    'medium date',
    'short time',
    'medium time',
    'long time',
    'standard',
    'currency',
    'percent',
    'fixed',
    'scientific',
    'general number',
    'yes/no',
    'true/false',
    'dd/mm/yyyy',
    'dd/mm/yy',
    'dd/mm/yyyy hh:nn',
    'mm/yyyy',
    'mmm/yyyy',
    'mmmm/yyyy',
    'yyyy',
    'hh:nn',
  };

  List<Map> _resolveReportQueryColumns(
    String rawControlSource,
    Map<String, List<Map>> columnsByLower,
    List<Map> queryColumns,
  ) {
    final direct = columnsByLower[rawControlSource.toLowerCase()];
    if (direct != null && direct.isNotEmpty) return direct;

    final unbracketed = rawControlSource
        .split('.')
        .map((part) {
          final t = part.trim();
          if (t.startsWith('[') && t.endsWith(']') && t.length >= 2) {
            return t.substring(1, t.length - 1);
          }
          return t;
        })
        .join('.');
    final byNormalized = columnsByLower[unbracketed.toLowerCase()];
    if (byNormalized != null && byNormalized.isNotEmpty) return byNormalized;

    if (unbracketed.contains('.')) {
      final afterFirstDot =
          unbracketed.substring(unbracketed.indexOf('.') + 1).toLowerCase();
      final byAfterFirst = columnsByLower[afterFirstDot];
      if (byAfterFirst != null && byAfterFirst.isNotEmpty) return byAfterFirst;

      final dot = unbracketed.indexOf('.');
      final tbl = unbracketed.substring(0, dot).toLowerCase();
      final col = unbracketed.substring(dot + 1).toLowerCase();
      final exactPair = [
        for (final entry in queryColumns)
          if ((entry['sourceTable']?.toString().toLowerCase() ?? '') == tbl &&
              (entry['sourceColumn']?.toString().toLowerCase() ?? '') == col)
            entry,
      ];
      if (exactPair.isNotEmpty) return exactPair;

      final lastDot = unbracketed.lastIndexOf('.');
      final lastSeg = unbracketed.substring(lastDot + 1).toLowerCase();
      final byLastCol = columnsByLower[lastSeg];
      if (byLastCol != null && byLastCol.length == 1) return byLastCol;
      return const [];
    }

    final lowerCol = unbracketed.toLowerCase();
    final bySourceCol = [
      for (final entry in queryColumns)
        if ((entry['sourceColumn']?.toString().toLowerCase() ?? '') == lowerCol)
          entry,
    ];
    return bySourceCol.length == 1 ? bySourceCol : const [];
  }

  bool _isIdentityDisplayComboBox(
    Map<String, dynamic> ctrlProp,
    Map<String, dynamic> defProp,
  ) {
    final columnCount =
        _parseReportInt(ctrlProp['ColumnCount'] ?? defProp['ColumnCount']) ?? 1;
    final boundColumn =
        _parseReportInt(ctrlProp['BoundColumn'] ?? defProp['BoundColumn']) ?? 1;
    if (columnCount != 1 || boundColumn != 1) {
      return false;
    }
    final columnWidthsRaw =
        (ctrlProp['ColumnWidths'] ?? defProp['ColumnWidths'])?.toString().trim();
    if (columnWidthsRaw != null && columnWidthsRaw.isNotEmpty) {
      final firstWidth = _parseReportDouble(
        columnWidthsRaw.split(RegExp(r'[;,]')).first,
      );
      if (firstWidth == null || firstWidth <= 0) {
        return false;
      }
    }
    return true;
  }

  String _accessBgrToHex(int bgr) {
    final r = bgr & 0xFF;
    final g = (bgr >> 8) & 0xFF;
    final b = (bgr >> 16) & 0xFF;
    String hex2(int value) => value.toRadixString(16).padLeft(2, '0');
    return '#${hex2(r)}${hex2(g)}${hex2(b)}';
  }

  Future<void> _generateReportBackend(
      AnalysisProject project, Directory backendDir) async {
    final compiled = compileEligibleReports(project);
    final specsMap = <String, Map<String, Object?>>{
      for (final report in compiled.reports) report.key: report.toInventoryJson(),
    };
    final assetsMap = <String, Map<String, Object?>>{
      for (final report in compiled.reports)
        for (final asset in report.assets)
          '${report.key}/${asset.assetName}': {
            'contentType': asset.contentType,
            'sha256': asset.sha256,
            'base64': asset.base64Data,
          },
    };
    final source = _reportBackendSource
        .replaceFirst(
            '/*SPECIFICATIONS*/', _dartStringLiteral(jsonEncode(specsMap)))
        .replaceFirst('/*ASSETS*/', _dartStringLiteral(jsonEncode(assetsMap)));
    await File(p.join(backendDir.path, 'lib/src/shared/access_reports.dart'))
        .writeAsString(source);
    await File(p.join(backendDir.path, 'lib/src/shared/access_reports.json'))
        .writeAsString(const JsonEncoder.withIndent('  ').convert({
      'reports': specsMap,
      'diagnostics': compiled.diagnostics,
    }));
  }
}

const _reportBackendSource = r'''
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'access_queries.dart';
import 'utils/api_utils.dart';

class AccessReportController {
  static final Map<String, dynamic> specifications =
      (jsonDecode(/*SPECIFICATIONS*/) as Map).cast<String, dynamic>();
  static final Map<String, dynamic> embeddedAssets =
      (jsonDecode(/*ASSETS*/) as Map).cast<String, dynamic>();

  static Future<Response> list(Request request) async {
    return responseJson({
      'reports': [
        for (final entry in specifications.values.whereType<Map>()) entry,
      ],
      'readOnly': true,
    });
  }

  static Future<Response> run(Request request, String key) async {
    final descriptor = specifications[key] as Map?;
    if (descriptor == null) {
      return responseError('Relatorio nao compilado.', statusCode: 404);
    }
    final queryKey = descriptor['queryKey'] as String?;
    final exprControls =
        ((descriptor['expressionControls'] as List?) ?? const []).cast<Map>();
    final nowDt = DateTime.now();

    final rawParamsJson = request.url.queryParameters['parameters'];
    final allInput = <String, Object?>{};
    if (rawParamsJson != null && rawParamsJson.isNotEmpty) {
      try {
        final decoded = jsonDecode(rawParamsJson);
        if (decoded is Map) {
          for (final entry in decoded.entries) {
            allInput[entry.key.toString()] = entry.value;
          }
        }
      } catch (_) {}
    }

    final descriptorParams =
        ((descriptor['parameters'] as List?) ?? const []).cast<Map>();
    final paramValuesBySource = <String, Object?>{};
    for (final p in descriptorParams) {
      final pKey = p['key']?.toString() ?? '';
      final srcName = p['sourceName']?.toString() ?? '';
      if (srcName.isEmpty) continue;
      paramValuesBySource[srcName] = allInput[pKey];
    }

    if (queryKey == null || queryKey.isEmpty) {
      final values = _evalControlMap(
        exprControls,
        const <List>[],
        seedValues: const <String, String>{},
        pageNumber: 1,
        totalPages: 1,
        nowDt: nowDt,
        parameterValues: paramValuesBySource,
      );
      return responseJson({
        'report': descriptor['name'],
        'key': key,
        'caption': descriptor['caption'],
        'recordSource': descriptor['recordSource'],
        'queryKey': '',
        'parameters': descriptorParams,
        'pageSetup': descriptor['pageSetup'],
        'sections': descriptor['sections'],
        'controls': descriptor['controls'],
        'pages': [
          {'pageNumber': 1, 'values': values},
        ],
        'rowCount': 1,
        'truncated': false,
        'readOnly': true,
      });
    }

    final queryDescriptor =
        AccessQueryController.specifications[queryKey] as Map?;
    if (queryDescriptor == null) {
      return responseError('Consulta do relatorio indisponivel.', statusCode: 500);
    }
    try {
      final queryParamDefs =
          ((queryDescriptor['parameters'] as List?) ?? const []).cast<Map>();
      final queryInput = <String, Object?>{
        for (final qp in queryParamDefs)
          if (allInput.containsKey(qp['key']?.toString()))
            qp['key'].toString(): allInput[qp['key'].toString()],
      };
      final result = await AccessQueryController.executeDescriptor(
        request,
        queryDescriptor,
        parsedParametersOverride:
            queryParamDefs.isEmpty ? const <String, Object?>{} : queryInput,
      );
      final rows = (result['rows'] as List).cast<List>();
      final boundControls = (descriptor['boundControls'] as List).cast<Map>();
      final groupLevels =
          ((descriptor['groupLevels'] as List?) ?? const []).cast<Map>();

      final lookupMapsByCtrl = <String, Map<String, String>>{};
      final lookupCache = <String, Map<String, String>>{};
      for (final c in boundControls) {
        final lkp = c['lookupSpec'];
        if (lkp is! Map) continue;
        final ctrlName = c['controlName'] as String;
        final staticMap = lkp['staticMap'];
        if (staticMap is Map) {
          lookupMapsByCtrl[ctrlName] = {
            for (final e in staticMap.entries)
              e.key.toString(): e.value?.toString() ?? '',
          };
          continue;
        }
        final lkpQueryKey = lkp['queryKey']?.toString() ?? '';
        final bOrd = (lkp['boundOrdinal'] as num?)?.toInt() ?? 0;
        final dOrd = (lkp['displayOrdinal'] as num?)?.toInt() ?? 0;
        if (lkpQueryKey.isNotEmpty) {
          final cacheKey = '$lkpQueryKey:$bOrd:$dOrd';
          lookupMapsByCtrl[ctrlName] = lookupCache[cacheKey] ??=
              await AccessQueryController.executeLookupMap(
                  request, lkpQueryKey, bOrd, dOrd);
        }
      }

      final subReportDefs =
          ((descriptor['subReports'] as List?) ?? const []).cast<Map>();
      final subReportDataByCtrl = <String, _LoadedSubReport>{};
      for (final sr in subReportDefs) {
        final cName = sr['controlName'] as String;
        final childKey = sr['childReportKey']?.toString() ?? '';
        final childDesc = specifications[childKey] as Map?;
        if (childDesc == null) continue;
        final childQKey = sr['childQueryKey']?.toString() ?? '';
        final childRows = childQKey.isEmpty
            ? const <List<Object?>>[]
            : await AccessQueryController.executeRowsInternal(
                request,
                childQKey,
                const <String, Object?>{},
              );
        subReportDataByCtrl[cName] = _LoadedSubReport(
          spec: childDesc,
          rows: childRows,
          linkMasterOrdinals:
              ((sr['linkMasterOrdinals'] as List?) ?? const []).cast<int>(),
          linkChildOrdinals:
              ((sr['linkChildOrdinals'] as List?) ?? const []).cast<int>(),
        );
      }

      if (groupLevels.isNotEmpty) {
        final sections =
            ((descriptor['sections'] as List?) ?? const []).cast<Map>();
        final bands = buildGroupedBands(
          rows: rows,
          groupLevels: groupLevels,
          sections: sections,
          boundControls: boundControls,
          exprControls: exprControls,
          lookupMapsByCtrl: lookupMapsByCtrl,
          subReportDataByCtrl: subReportDataByCtrl,
          parameterValues: paramValuesBySource,
          nowDt: nowDt,
        );
        return responseJson({
          'report': descriptor['name'],
          'key': key,
          'caption': descriptor['caption'],
          'recordSource': descriptor['recordSource'],
          'queryKey': queryKey,
          'parameters': descriptorParams,
          'pageSetup': descriptor['pageSetup'],
          'sections': descriptor['sections'],
          'controls': descriptor['controls'],
          'grouped': true,
          'bands': bands,
          'pages': rows.isEmpty
              ? const <Map<String, Object?>>[]
              : [
                  {
                    'pageNumber': 1,
                    'values': const <String, String>{},
                    'bands': bands,
                  }
                ],
          'rowCount': rows.length,
          'truncated': result['truncated'],
          'readOnly': true,
        });
      }

      final pages = <Map<String, Object?>>[];
      final totalPages = rows.length;
      for (var i = 0; i < rows.length; i++) {
        final row = rows[i];
        final values = <String, String>{};
        for (final control in boundControls) {
          final ctrlName = control['controlName'] as String;
          final ordinal = control['columnOrdinal'] as int;
          final raw = ordinal < row.length ? row[ordinal] : null;
          values[ctrlName] = _formatCell(
            raw,
            control['daoType'] as int,
            control['format'] as String?,
            controlType: control['controlType'] as int?,
            lookupMap: lookupMapsByCtrl[ctrlName],
          );
        }
        final pageSubReports = _evalSubReportsForRow(
            row, subReportDataByCtrl, paramValuesBySource, nowDt);
        final pageExprs = _evalControlMap(
          exprControls,
          rows,
          detailRow: row,
          seedValues: values,
          pageNumber: i + 1,
          totalPages: totalPages,
          nowDt: nowDt,
          parameterValues: paramValuesBySource,
          subReportDataByCtrl: subReportDataByCtrl,
          pageSubReports: pageSubReports,
        );
        values.addAll(pageExprs);
        pages.add({
          'pageNumber': i + 1,
          'values': values,
          if (pageSubReports.isNotEmpty) 'subReports': pageSubReports,
        });
      }
      return responseJson({
        'report': descriptor['name'],
        'key': key,
        'caption': descriptor['caption'],
        'recordSource': descriptor['recordSource'],
        'queryKey': queryKey,
        'parameters': descriptorParams,
        'pageSetup': descriptor['pageSetup'],
        'sections': descriptor['sections'],
        'controls': descriptor['controls'],
        'pages': pages,
        'rowCount': pages.length,
        'truncated': result['truncated'],
        'readOnly': true,
      });
    } on AccessQueryInputError catch (error) {
      return responseError(error.message, statusCode: 400);
    } catch (_) {
      return responseError(
        'Nao foi possivel executar o relatorio compilado.',
        statusCode: 500,
      );
    }
  }

  static Future<Response> asset(
    Request request,
    String key,
    String asset,
  ) async {
    final entry = embeddedAssets['$key/$asset'] as Map?;
    if (entry == null) {
      return responseError('Recurso do relatorio nao encontrado.', statusCode: 404);
    }
    final bytes = base64Decode(entry['base64'] as String);
    return Response.ok(
      bytes,
      headers: {
        'Content-Type': entry['contentType'] as String,
        'Cache-Control': 'public, max-age=3600',
      },
    );
  }

  static Map<String, List<Map<String, Object?>>> _evalSubReportsForRow(
    List parentRow,
    Map<String, _LoadedSubReport> subReportDataByCtrl,
    Map<String, Object?> paramValues,
    DateTime nowDt,
  ) {
    if (subReportDataByCtrl.isEmpty) return const {};
    final out = <String, List<Map<String, Object?>>>{};
    for (final entry in subReportDataByCtrl.entries) {
      final sr = entry.value;
      final matched = <List>[];
      for (final childRow in sr.rows) {
        var ok = true;
        for (var k = 0; k < sr.linkMasterOrdinals.length; k++) {
          final mo = sr.linkMasterOrdinals[k];
          final co = sr.linkChildOrdinals[k];
          final mv = mo < parentRow.length ? parentRow[mo] : null;
          final cv = co < childRow.length ? childRow[co] : null;
          if (mv == null || cv == null || mv.toString() != cv.toString()) {
            ok = false;
            break;
          }
        }
        if (ok) matched.add(childRow);
      }
      final childBound =
          ((sr.spec['boundControls'] as List?) ?? const []).cast<Map>();
      final childExprs =
          ((sr.spec['expressionControls'] as List?) ?? const []).cast<Map>();
      final renderedRows = <Map<String, Object?>>[];
      for (final cr in matched.take(100)) {
        final vals = <String, String>{};
        for (final bc in childBound) {
          final ord = bc['columnOrdinal'] as int;
          final raw = ord < cr.length ? cr[ord] : null;
          vals[bc['controlName'] as String] = _formatCell(
            raw,
            bc['daoType'] as int,
            bc['format'] as String?,
            controlType: bc['controlType'] as int?,
          );
        }
        vals.addAll(_evalControlMap(
          childExprs,
          matched,
          detailRow: cr,
          seedValues: vals,
          pageNumber: 1,
          totalPages: 1,
          nowDt: nowDt,
          parameterValues: paramValues,
        ));
        renderedRows.add({'values': vals, '_rawRow': cr});
      }
      out[entry.key] = renderedRows;
    }
    return out;
  }

  static Map<String, String> _evalControlMap(
    List<Map> exprControls,
    List<List> allRows, {
    List? detailRow,
    required Map<String, String> seedValues,
    required int pageNumber,
    required int totalPages,
    required DateTime nowDt,
    int? sectionCodeFilter,
    Map<String, Object?> parameterValues = const {},
    Map<String, _LoadedSubReport> subReportDataByCtrl = const {},
    Map<String, List<Map<String, Object?>>> pageSubReports = const {},
  }) {
    final result = <String, String>{};
    final combined = <String, String>{...seedValues};
    for (var pass = 0; pass < 2; pass++) {
      for (final e in exprControls) {
        if (sectionCodeFilter != null &&
            (e['section'] as int? ?? 0) != sectionCodeFilter) {
          continue;
        }
        final secCode = e['section'] as int? ?? 0;
        final scopeRows = (sectionCodeFilter == null && secCode == 0 && detailRow != null)
            ? [detailRow]
            : allRows;
        final val = evalExpression(
          e['expression'] as Map,
          scopeRows,
          pageNumber: pageNumber,
          totalPages: totalPages,
          nowDt: nowDt,
          format: e['format'] as String?,
          parameterValues: parameterValues,
          controlValues: combined,
          subReportRows: pageSubReports,
        );
        final name = e['controlName'] as String;
        result[name] = val;
        combined[name] = val;
      }
    }
    return result;
  }

  static List<Map<String, Object?>> buildGroupedBands({
    required List<List> rows,
    required List<Map> groupLevels,
    required List<Map> sections,
    required List<Map> boundControls,
    required List<Map> exprControls,
    Map<String, Map<String, String>> lookupMapsByCtrl = const {},
    Map<String, _LoadedSubReport> subReportDataByCtrl = const {},
    Map<String, Object?> parameterValues = const {},
    required DateTime nowDt,
  }) {
    if (rows.isEmpty) return const <Map<String, Object?>>[];
    final sorted = [for (final r in rows) r];
    sorted.sort((a, b) {
      for (final gl in groupLevels) {
        final ord = gl['columnOrdinal'] as int;
        final daoType = (gl['daoType'] as int?) ?? 10;
        final groupOn = (gl['groupOn'] as int?) ?? 0;
        final groupInterval = (gl['groupInterval'] as int?) ?? 1;
        final desc = gl['descending'] == true;
        final av = _groupBucketValue(
            ord < a.length ? a[ord] : null, daoType, groupOn, groupInterval);
        final bv = _groupBucketValue(
            ord < b.length ? b[ord] : null, daoType, groupOn, groupInterval);
        final cmp = _compareGroupValues(av, bv);
        if (cmp != 0) return desc ? -cmp : cmp;
      }
      return 0;
    });

    final sectionByCode = {
      for (final s in sections) s['code'] as int: s,
    };
    Map<String, Object?> evalBand(
      int sectionCode,
      List row,
      List<List> scopeRows,
    ) {
      final values = <String, String>{};
      for (final c in boundControls) {
        if ((c['section'] as int? ?? 0) != sectionCode) continue;
        final ctrlName = c['controlName'] as String;
        final ord = c['columnOrdinal'] as int;
        final raw = ord < row.length ? row[ord] : null;
        values[ctrlName] = _formatCell(
          raw,
          c['daoType'] as int,
          c['format'] as String?,
          controlType: c['controlType'] as int?,
          lookupMap: lookupMapsByCtrl[ctrlName],
        );
      }
      final subReports = _evalSubReportsForRow(
          row, subReportDataByCtrl, parameterValues, nowDt);
      final exprVals = _evalControlMap(
        exprControls,
        scopeRows,
        sectionCodeFilter: sectionCode,
        seedValues: values,
        pageNumber: 1,
        totalPages: 1,
        nowDt: nowDt,
        parameterValues: parameterValues,
        subReportDataByCtrl: subReportDataByCtrl,
        pageSubReports: subReports,
      );
      values.addAll(exprVals);
      return {
        'values': values,
        if (subReports.isNotEmpty) 'subReports': subReports,
      };
    }

    final bands = <Map<String, Object?>>[];
    void emitSection(int code, List row, List<List> scopeRows) {
      final sec = sectionByCode[code];
      if (sec == null) return;
      final height = sec['height'] as int? ?? 0;
      if (height <= 0) return;
      final bandData = evalBand(code, row, scopeRows);
      bands.add({
        'bandKey': sec['key'] as String,
        'sectionCode': code,
        ...bandData,
      });
    }

    String groupKeyFor(List row, int levelIdx) {
      final gl = groupLevels[levelIdx];
      final ord = gl['columnOrdinal'] as int;
      final daoType = (gl['daoType'] as int?) ?? 10;
      final groupOn = (gl['groupOn'] as int?) ?? 0;
      final groupInterval = (gl['groupInterval'] as int?) ?? 1;
      final v = _groupBucketValue(
          ord < row.length ? row[ord] : null, daoType, groupOn, groupInterval);
      return v == null ? '\u0000NULL' : v.toString();
    }

    final activeLevels = <int>[
      for (final lvl in const [0, 1, 2, 3])
        if (lvl < groupLevels.length &&
            (sectionByCode.containsKey(5 + 2 * lvl) ||
                sectionByCode.containsKey(6 + 2 * lvl)))
          lvl,
    ];

    void emitLevel(int activePos, List<List> slice) {
      if (activePos >= activeLevels.length) {
        for (final row in slice) {
          emitSection(0, row, [row]);
        }
        return;
      }
      final lvl = activeLevels[activePos];
      final headerCode = 5 + 2 * lvl;
      final footerCode = 6 + 2 * lvl;
      var start = 0;
      while (start < slice.length) {
        final key = groupKeyFor(slice[start], lvl);
        var end = start + 1;
        while (end < slice.length && groupKeyFor(slice[end], lvl) == key) {
          end++;
        }
        final groupSlice = slice.sublist(start, end);
        emitSection(headerCode, groupSlice.first, groupSlice);
        emitLevel(activePos + 1, groupSlice);
        emitSection(footerCode, groupSlice.first, groupSlice);
        start = end;
      }
    }

    emitSection(1, sorted.first, sorted);
    emitSection(3, sorted.first, sorted);
    emitLevel(0, sorted);
    emitSection(2, sorted.first, sorted);
    emitSection(4, sorted.first, sorted);
    return bands;
  }

  static Object? _groupBucketValue(
      Object? raw, int daoType, int groupOn, int groupInterval) {
    if (raw == null || groupOn == 0) return raw;
    if (daoType == 8) {
      final dt = raw is DateTime ? raw : DateTime.tryParse(raw.toString());
      if (dt == null) return raw;
      String pad2(int n) => n.toString().padLeft(2, '0');
      switch (groupOn) {
        case 1:
          return '${(dt.year ~/ groupInterval) * groupInterval}';
        case 2:
          return '${dt.year}-Q${((dt.month - 1) ~/ 3) + 1}';
        case 3:
          return '${dt.year}-${pad2(dt.month)}';
        case 4:
          final wk = (dt.difference(DateTime(dt.year, 1, 1)).inDays ~/ 7) + 1;
          return '${dt.year}-W${pad2(wk)}';
        case 5:
          return '${dt.year}-${pad2(dt.month)}-${pad2(dt.day)}';
        case 6:
          return '${dt.year}-${pad2(dt.month)}-${pad2(dt.day)} ${pad2(dt.hour)}';
        case 7:
          return '${dt.year}-${pad2(dt.month)}-${pad2(dt.day)} ${pad2(dt.hour)}:${pad2(dt.minute)}';
      }
    }
    if (groupOn == 1 && (daoType == 10 || daoType == 12)) {
      final s = raw.toString().toLowerCase();
      return s.length <= groupInterval ? s : s.substring(0, groupInterval);
    }
    if (groupOn == 1 && const {3, 4, 5, 7}.contains(daoType)) {
      final n = raw is num ? raw : num.tryParse(raw.toString());
      if (n != null) return (n ~/ groupInterval) * groupInterval;
    }
    return raw;
  }

  static int _compareGroupValues(Object? a, Object? b) {
    if (a == null && b == null) return 0;
    if (a == null) return -1;
    if (b == null) return 1;
    if (a is num && b is num) return a.compareTo(b);
    if (a is bool && b is bool) return (a ? 1 : 0).compareTo(b ? 1 : 0);
    return a.toString().toLowerCase().compareTo(b.toString().toLowerCase());
  }

  static String evalExpression(
    Map expression,
    List<List> scopeRows, {
    required int pageNumber,
    required int totalPages,
    required DateTime nowDt,
    String? format,
    Map<String, Object?> parameterValues = const {},
    Map<String, String> controlValues = const {},
    Map<String, List<Map<String, Object?>>> subReportRows = const {},
  }) {
    final op = expression['op'] as String?;
    String pad2(int n) => n.toString().padLeft(2, '0');
    switch (op) {
      case 'date':
        return '${pad2(nowDt.day)}/${pad2(nowDt.month)}/${nowDt.year}';
      case 'now':
        final fmtLower = (format ?? '').trim().toLowerCase();
        if (fmtLower == 'short date' || fmtLower == 'long date' || fmtLower == 'dd/mm/yyyy') {
          return '${pad2(nowDt.day)}/${pad2(nowDt.month)}/${nowDt.year}';
        }
        return '${pad2(nowDt.day)}/${pad2(nowDt.month)}/${nowDt.year} ${pad2(nowDt.hour)}:${pad2(nowDt.minute)}';
      case 'count':
        final ord = expression['columnOrdinal'] as int?;
        if (ord == null) return '${scopeRows.length}';
        var count = 0;
        for (final row in scopeRows) {
          if (ord < row.length && row[ord] != null) count++;
        }
        return '$count';
      case 'sum':
        final ord = expression['columnOrdinal'] as int;
        final daoType = expression['daoType'] as int;
        final sign = (expression['sign'] as int?) ?? 1;
        num total = 0;
        for (final row in scopeRows) {
          if (ord >= row.length || row[ord] == null) continue;
          final cell = row[ord];
          if (daoType == 1 && cell is bool) {
            total += cell ? -1 : 0;
          } else if (cell is num) {
            total += cell;
          } else {
            final parsed = num.tryParse(cell.toString().trim().replaceAll(',', '.'));
            if (parsed != null) total += parsed;
          }
        }
        total = total * sign;
        if (total == total.roundToDouble() && daoType != 5) {
          return '${total.toInt()}';
        }
        if (daoType == 5) {
          return total.toStringAsFixed(2);
        }
        return '$total';
      case 'concat':
        final parts = (expression['parts'] as List).cast<Map>();
        final buf = StringBuffer();
        for (final p in parts) {
          if (p['literal'] != null) {
            buf.write(p['literal']);
          } else if (p['var'] == 'page') {
            buf.write(pageNumber);
          } else if (p['var'] == 'pages') {
            buf.write(totalPages);
          }
        }
        return buf.toString();
      case 'param':
        final name = expression['name']?.toString() ?? '';
        return _formatScalarResult(parameterValues[name], format, nowDt);
      case 'expr':
        final node = expression['node'] as Map;
        final currentRow = scopeRows.isEmpty ? const <Object?>[] : scopeRows.first;
        final val = _evalAst(
          node,
          currentRow: currentRow,
          scopeRows: scopeRows,
          pageNumber: pageNumber,
          totalPages: totalPages,
          nowDt: nowDt,
          parameterValues: parameterValues,
          controlValues: controlValues,
          subReportRows: subReportRows,
        );
        return _formatScalarResult(val, format, nowDt);
      default:
        return '';
    }
  }

  static String _formatScalarResult(Object? val, String? format, DateTime nowDt) {
    if (val == null) return '';
    String text;
    if (val is DateTime) {
      String pad2(int n) => n.toString().padLeft(2, '0');
      text = '${pad2(val.day)}/${pad2(val.month)}/${val.year}';
    } else if (val is num && val == val.roundToDouble()) {
      text = '${val.toInt()}';
    } else {
      text = val.toString();
    }
    final fmt = (format ?? '').trim();
    if (fmt == '>') return text.toUpperCase();
    if (fmt == '<') return text.toLowerCase();
    return text;
  }

  static Object? _evalAst(
    Map node, {
    required List currentRow,
    required List<List> scopeRows,
    required int pageNumber,
    required int totalPages,
    required DateTime nowDt,
    required Map<String, Object?> parameterValues,
    required Map<String, String> controlValues,
    required Map<String, List<Map<String, Object?>>> subReportRows,
  }) {
    final k = node['k'] as String?;
    switch (k) {
      case 'lit':
      case 'num':
      case 'bool':
        return node['v'];
      case 'null':
        return null;
      case 'date_lit':
        return _tryParseDate(node['v']?.toString());
      case 'var':
        return node['v'] == 'page' ? pageNumber : totalPages;
      case 'param':
        final rawP = parameterValues[node['name']?.toString() ?? ''];
        return rawP;
      case 'ctrl':
        final cname = (node['name']?.toString() ?? '').toLowerCase();
        for (final entry in controlValues.entries) {
          if (entry.key.toLowerCase() == cname) return entry.value;
        }
        return null;
      case 'col':
        final ord = node['ord'] as int;
        final val = ord < currentRow.length ? currentRow[ord] : null;
        if (node['daoType'] == 1 && val is bool) {
          return val ? -1 : 0;
        }
        return val;
      case 'sub':
        final subLower = node['sub']?.toString() ?? '';
        for (final e in subReportRows.entries) {
          if (e.key.toLowerCase() == subLower && e.value.isNotEmpty) {
            final rawRow = e.value.first['_rawRow'];
            if (rawRow is List) {
              final ord = node['ord'] as int;
              final val = ord < rawRow.length ? rawRow[ord] : null;
              if (node['daoType'] == 1 && val is bool) return val ? -1 : 0;
              return val;
            }
          }
        }
        return null;
      case 'un':
        final inner = _evalAst(
          node['x'] as Map,
          currentRow: currentRow,
          scopeRows: scopeRows,
          pageNumber: pageNumber,
          totalPages: totalPages,
          nowDt: nowDt,
          parameterValues: parameterValues,
          controlValues: controlValues,
          subReportRows: subReportRows,
        );
        if (node['op'] == 'NOT') return !_toBool(inner);
        final n = _toNum(inner);
        return n == null ? null : -n;
      case 'bin':
        final op = node['op'] as String;
        final l = _evalAst(node['l'] as Map,
            currentRow: currentRow,
            scopeRows: scopeRows,
            pageNumber: pageNumber,
            totalPages: totalPages,
            nowDt: nowDt,
            parameterValues: parameterValues,
            controlValues: controlValues,
            subReportRows: subReportRows);
        final r = _evalAst(node['r'] as Map,
            currentRow: currentRow,
            scopeRows: scopeRows,
            pageNumber: pageNumber,
            totalPages: totalPages,
            nowDt: nowDt,
            parameterValues: parameterValues,
            controlValues: controlValues,
            subReportRows: subReportRows);
        switch (op) {
          case 'AND':
            return _toBool(l) && _toBool(r);
          case 'OR':
            return _toBool(l) || _toBool(r);
          case '&':
            return '${l ?? ''}${r ?? ''}';
          case '+':
            if (l is String || r is String) {
              final ln = _toNum(l);
              final rn = _toNum(r);
              if (ln != null && rn != null) return ln + rn;
              return '${l ?? ''}${r ?? ''}';
            }
            return (_toNum(l) ?? 0) + (_toNum(r) ?? 0);
          case '-':
            return (_toNum(l) ?? 0) - (_toNum(r) ?? 0);
          case '*':
            return (_toNum(l) ?? 0) * (_toNum(r) ?? 0);
          case '/':
            final den = _toNum(r) ?? 0;
            if (den == 0) return null;
            return (_toNum(l) ?? 0) / den;
          case '=':
            return _compareDynamic(l, r) == 0;
          case '<>':
            return _compareDynamic(l, r) != 0;
          case '<':
            return _compareDynamic(l, r) < 0;
          case '<=':
            return _compareDynamic(l, r) <= 0;
          case '>':
            return _compareDynamic(l, r) > 0;
          case '>=':
            return _compareDynamic(l, r) >= 0;
        }
        return null;
      case 'fn':
        final fn = node['fn'] as String;
        final args = ((node['args'] as List?) ?? const []).cast<Map>();
        List<List> aggRowsFor(Map inner) {
          if (inner['k'] == 'sub') {
            final subLower = inner['sub']?.toString() ?? '';
            for (final e in subReportRows.entries) {
              if (e.key.toLowerCase() == subLower) {
                return [
                  for (final sr in e.value)
                    if (sr['_rawRow'] is List) sr['_rawRow'] as List,
                ];
              }
            }
            return const <List>[];
          }
          return scopeRows;
        }
        Object? evalSubArg(Map arg, List row) {
          if (arg['k'] == 'sub') {
            final ord = arg['ord'] as int;
            final val = ord < row.length ? row[ord] : null;
            if (arg['daoType'] == 1 && val is bool) return val ? -1 : 0;
            return val;
          }
          return _evalAst(arg,
              currentRow: row,
              scopeRows: [row],
              pageNumber: pageNumber,
              totalPages: totalPages,
              nowDt: nowDt,
              parameterValues: parameterValues,
              controlValues: controlValues,
              subReportRows: subReportRows);
        }
        switch (fn) {
          case 'COUNT':
            if (args.isEmpty) return 0;
            if (args.first['k'] == 'star') return scopeRows.length;
            final targetRows = aggRowsFor(args.first);
            var cnt = 0;
            for (final r in targetRows) {
              if (evalSubArg(args.first, r) != null) cnt++;
            }
            return cnt;
          case 'SUM':
          case 'AVG':
          case 'MIN':
          case 'MAX':
            if (args.isEmpty) return null;
            final targetRows = aggRowsFor(args.first);
            final vals = <Object>[];
            for (final r in targetRows) {
              final v = evalSubArg(args.first, r);
              if (v != null) vals.add(v);
            }
            if (vals.isEmpty) return fn == 'SUM' ? 0 : null;
            if (fn == 'SUM') {
              return vals.fold<num>(0, (s, v) => s + (_toNum(v) ?? 0));
            }
            if (fn == 'AVG') {
              final sum = vals.fold<num>(0, (s, v) => s + (_toNum(v) ?? 0));
              return sum / vals.length;
            }
            var best = vals.first;
            for (final v in vals.skip(1)) {
              final cmp = _compareDynamic(v, best);
              if ((fn == 'MIN' && cmp < 0) || (fn == 'MAX' && cmp > 0)) {
                best = v;
              }
            }
            return best;
        }
        Object? argAt(int idx) => idx < args.length
            ? _evalAst(args[idx],
                currentRow: currentRow,
                scopeRows: scopeRows,
                pageNumber: pageNumber,
                totalPages: totalPages,
                nowDt: nowDt,
                parameterValues: parameterValues,
                controlValues: controlValues,
                subReportRows: subReportRows)
            : null;
        switch (fn) {
          case 'DATE':
            return DateTime(nowDt.year, nowDt.month, nowDt.day);
          case 'NOW':
            return nowDt;
          case 'IIF':
            return _toBool(argAt(0)) ? argAt(1) : argAt(2);
          case 'NZ':
            final v = argAt(0);
            if (v != null && v.toString().isNotEmpty) return v;
            return args.length > 1 ? argAt(1) : '';
          case 'ISNULL':
            return argAt(0) == null;
          case 'YEAR':
            return _tryParseDate(argAt(0))?.year;
          case 'MONTH':
            return _tryParseDate(argAt(0))?.month;
          case 'DAY':
            return _tryParseDate(argAt(0))?.day;
          case 'MONTHNAME':
            final m = _toNum(argAt(0))?.toInt();
            if (m == null || m < 1 || m > 12) return '';
            const fullNames = [
              'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
              'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro',
            ];
            final abbrev = args.length > 1 && _toBool(argAt(1));
            final res = fullNames[m - 1];
            return abbrev ? res.substring(0, 3) : res;
          case 'DATEDIFF':
            final iv = (argAt(0)?.toString() ?? '').toLowerCase();
            final d1 = _tryParseDate(argAt(1));
            final d2 = _tryParseDate(argAt(2));
            if (d1 == null || d2 == null) return null;
            if (iv == 'd' || iv == 'y') return d2.difference(d1).inDays;
            if (iv == 'yyyy') return d2.year - d1.year;
            if (iv == 'm') return (d2.year - d1.year) * 12 + (d2.month - d1.month);
            return d2.difference(d1).inDays;
          case 'UCASE':
            return (argAt(0)?.toString() ?? '').toUpperCase();
          case 'LCASE':
            return (argAt(0)?.toString() ?? '').toLowerCase();
          case 'TRIM':
            return (argAt(0)?.toString() ?? '').trim();
          case 'LTRIM':
            return (argAt(0)?.toString() ?? '').trimLeft();
          case 'RTRIM':
            return (argAt(0)?.toString() ?? '').trimRight();
          case 'LEFT':
            final s = argAt(0)?.toString() ?? '';
            final n = _toNum(argAt(1))?.toInt() ?? 0;
            return n <= 0 ? '' : (n >= s.length ? s : s.substring(0, n));
          case 'RIGHT':
            final s = argAt(0)?.toString() ?? '';
            final n = _toNum(argAt(1))?.toInt() ?? 0;
            return n <= 0 ? '' : (n >= s.length ? s : s.substring(s.length - n));
          case 'MID':
            final s = argAt(0)?.toString() ?? '';
            final st = (_toNum(argAt(1))?.toInt() ?? 1) - 1;
            if (st < 0 || st >= s.length) return '';
            if (args.length < 3) return s.substring(st);
            final ln = _toNum(argAt(2))?.toInt() ?? 0;
            if (ln <= 0) return '';
            final end = st + ln > s.length ? s.length : st + ln;
            return s.substring(st, end);
          case 'LEN':
            return (argAt(0)?.toString() ?? '').length;
          case 'REPLACE':
            return (argAt(0)?.toString() ?? '').replaceAll(
                argAt(1)?.toString() ?? '', argAt(2)?.toString() ?? '');
          case 'INT':
            final n = _toNum(argAt(0));
            return n?.floor();
          case 'FIX':
            final n = _toNum(argAt(0));
            return n?.truncate();
          case 'ABS':
            final n = _toNum(argAt(0));
            return n?.abs();
          case 'ROUND':
            final n = _toNum(argAt(0));
            if (n == null) return null;
            final digits = _toNum(argAt(1))?.toInt() ?? 0;
            if (digits <= 0) return n.round();
            return double.parse(n.toStringAsFixed(digits));
          case 'VAL':
          case 'CDBL':
            return _toNum(argAt(0))?.toDouble();
          case 'CINT':
          case 'CLNG':
            return _toNum(argAt(0))?.round();
          case 'CSTR':
            return argAt(0)?.toString() ?? '';
          case 'FORMAT':
            return _formatScalarResult(argAt(0), argAt(1)?.toString(), nowDt);
        }
        return null;
      default:
        return null;
    }
  }

  static bool _toBool(Object? v) {
    if (v == null) return false;
    if (v is bool) return v;
    if (v is num) return v != 0;
    final s = v.toString().trim().toLowerCase();
    return s == 'true' || s == 'yes' || s == 'sim' || s == '-1' || s == '1';
  }

  static num? _toNum(Object? v) {
    if (v == null) return null;
    if (v is num) return v;
    if (v is bool) return v ? -1 : 0;
    return num.tryParse(v.toString().trim().replaceAll(',', '.'));
  }

  static DateTime? _tryParseDate(Object? v) {
    if (v == null) return null;
    if (v is DateTime) return v;
    final s = v.toString().trim();
    if (s.isEmpty) return null;
    final iso = DateTime.tryParse(s);
    if (iso != null) return iso;
    final br = RegExp(r'^(\d{1,2})/(\d{1,2})/(\d{4})').firstMatch(s);
    if (br != null) {
      return DateTime(
          int.parse(br.group(3)!), int.parse(br.group(2)!), int.parse(br.group(1)!));
    }
    return null;
  }

  static int _compareDynamic(Object? a, Object? b) {
    if (a == null && b == null) return 0;
    if (a == null) return -1;
    if (b == null) return 1;
    final na = _toNum(a);
    final nb = _toNum(b);
    if (na != null && nb != null) return na.compareTo(nb);
    return a.toString().toLowerCase().compareTo(b.toString().toLowerCase());
  }

  static String _formatCell(
    Object? value,
    int daoType,
    String? format, {
    int? controlType,
    Map<String, String>? lookupMap,
  }) {
    if (controlType == 106) {
      return value == true ? 'true' : 'false';
    }
    if (value == null) return '';
    String text;
    final fmtLower = (format ?? '').trim().toLowerCase();
    if (lookupMap != null) {
      final key = value.toString();
      text = lookupMap[key] ??
          lookupMap[key.trim()] ??
          _lookupInsensitive(lookupMap, key) ??
          key;
    } else if (daoType == 1 && value is bool) {
      text = fmtLower == 'true/false'
          ? (value ? 'True' : 'False')
          : (value ? 'Sim' : 'Não');
    } else if (daoType == 8) {
      final iso = value.toString();
      if ((fmtLower == 'short date' || fmtLower == 'dd/mm/yyyy') &&
          iso.length >= 10 &&
          RegExp(r'^\d{4}-\d{2}-\d{2}').hasMatch(iso)) {
        text = '${iso.substring(8, 10)}/${iso.substring(5, 7)}/${iso.substring(0, 4)}';
      } else if (fmtLower == 'dd/mm/yy' &&
          iso.length >= 10 &&
          RegExp(r'^\d{4}-\d{2}-\d{2}').hasMatch(iso)) {
        text = '${iso.substring(8, 10)}/${iso.substring(5, 7)}/${iso.substring(2, 4)}';
      } else {
        text = iso;
      }
    } else {
      text = value.toString();
    }
    if (format == '>') {
      text = text.toUpperCase();
    } else if (format == '<') {
      text = text.toLowerCase();
    }
    return text;
  }

  static String? _lookupInsensitive(Map<String, String> map, String target) {
    final lower = target.trim().toLowerCase();
    for (final e in map.entries) {
      if (e.key.trim().toLowerCase() == lower) return e.value;
    }
    return null;
  }
}

class _LoadedSubReport {
  final Map spec;
  final List<List<Object?>> rows;
  final List<int> linkMasterOrdinals;
  final List<int> linkChildOrdinals;

  const _LoadedSubReport({
    required this.spec,
    required this.rows,
    required this.linkMasterOrdinals,
    required this.linkChildOrdinals,
  });
}
''';

String _ngDartSingleQuotedExpr(String value) {
  final escaped = value
      .replaceAll(r'\', r'\\')
      .replaceAll("'", r"\'")
      .replaceAll(r'$', r'\$')
      .replaceAll('\r', r'\r')
      .replaceAll('\n', r'\n');
  return "'$escaped'";
}

String _ngDartHtmlText(String value) {
  final preserved = value.replaceAllMapped(
    RegExp(r' {2,}'),
    (m) => '\u00A0' * m.group(0)!.length,
  );
  return _htmlTextLiteral(preserved)
      .replaceAll('{', '&#123;')
      .replaceAll('}', '&#125;');
}

String _twipsToPx(int twips) => (twips / 15.0).toStringAsFixed(2);

String _buildAccessReportViewerDartSource(List<CompiledReportSpec> reports) {
  final catalog = [
    for (final report in reports)
      {
        'key': report.key,
        'name': report.name,
        'caption': report.caption ?? report.name,
        'recordSource': report.recordSource,
        'parameters': report.parameters,
        'controlsCount': report.controls.length,
        'grouped': report.isGrouped,
      },
  ];
  return _accessReportViewerDartTemplate.replaceFirst(
    '/*COMPILED_REPORTS*/',
    _dartStringLiteral(jsonEncode(catalog)),
  );
}

const _accessReportViewerDartTemplate = r'''
import 'dart:convert';
import 'dart:html' as html;

import 'package:ngdart/angular.dart';

import '../services/api_http_service.dart';

@Component(
  selector: 'access-report-viewer',
  templateUrl: 'access_report_viewer.html',
  styleUrls: ['access_report_viewer.css'],
  directives: [coreDirectives],
)
class AccessReportViewer implements OnInit {
  static final List<Map<String, dynamic>> compiledReports =
      (jsonDecode(/*COMPILED_REPORTS*/) as List).cast<Map<String, dynamic>>();

  final ApiHttpService _api = ApiHttpService('/api/v1');
  final Map<String, String> _parameterValues = <String, String>{};

  String activeReportKey = compiledReports.isEmpty
      ? ''
      : compiledReports.first['key'] as String;
  bool loading = false;
  bool hasSearched = false;
  bool truncated = false;
  String? errorMessage;
  List<Map<String, dynamic>> pages = <Map<String, dynamic>>[];

  @Input()
  set selectedKey(String? value) {
    if (value == null || value.isEmpty) return;
    if (compiledReports.any((r) => r['key'] == value)) {
      activeReportKey = value;
      pages = <Map<String, dynamic>>[];
      errorMessage = null;
      hasSearched = false;
    }
  }

  @override
  void ngOnInit() {
    if (activeReportKey.isEmpty && compiledReports.isNotEmpty) {
      activeReportKey = compiledReports.first['key'] as String;
    }
  }

  Map<String, dynamic>? get activeReport {
    for (final report in compiledReports) {
      if (report['key'] == activeReportKey) {
        return report;
      }
    }
    return null;
  }

  List<Map<String, dynamic>> get activeParameters {
    final report = activeReport;
    if (report == null) return const [];
    return (report['parameters'] as List).cast<Map<String, dynamic>>();
  }

  String parameterValue(Object? key) => _parameterValues[key?.toString() ?? ''] ?? '';

  void onReportSelected(html.Event event) {
    final target = event.target;
    if (target is html.SelectElement && target.value != null) {
      activeReportKey = target.value!;
      pages = <Map<String, dynamic>>[];
      errorMessage = null;
      hasSearched = false;
    }
  }

  void onParameterInput(Object? key, html.Event event) {
    final target = event.target;
    if (target is html.InputElement && key != null) {
      _parameterValues[key.toString()] = target.value ?? '';
    }
  }

  void onSubmit(html.Event event) {
    event.preventDefault();
    loadReport();
  }

  Future<void> loadReport() async {
    if (activeReportKey.isEmpty || loading) return;
    loading = true;
    errorMessage = null;
    hasSearched = true;
    pages = <Map<String, dynamic>>[];
    truncated = false;
    try {
      final paramsPayload = <String, String>{
        for (final param in activeParameters)
          param['key'] as String: _parameterValues[param['key'] as String] ?? '',
      };
      final response = await _api.getJson(
        '/access-reports/${Uri.encodeComponent(activeReportKey)}',
        queryParameters: {'parameters': jsonEncode(paramsPayload)},
      );
      if (response is! Map) {
        throw const FormatException('Resposta invalida do relatorio.');
      }
      final rawPages = (response['pages'] as List?) ?? const [];
      pages = rawPages
          .whereType<Map>()
          .map((page) => page.cast<String, dynamic>())
          .toList(growable: false);
      truncated = response['truncated'] == true;
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      loading = false;
    }
  }

  String pageValue(Map<String, dynamic> page, String controlName) {
    final values = page['values'];
    if (values is Map) {
      return values[controlName]?.toString() ?? '';
    }
    return '';
  }

  bool pageChecked(Map<String, dynamic> page, String controlName) =>
      pageValue(page, controlName) == 'true';

  List<Map<String, dynamic>> groupedBands(Map<String, dynamic> page) {
    final raw = page['bands'];
    if (raw is List) {
      return raw
          .whereType<Map>()
          .map((item) => item.cast<String, dynamic>())
          .toList(growable: false);
    }
    return const <Map<String, dynamic>>[];
  }

  String bandValue(Map<String, dynamic> band, String controlName) {
    final values = band['values'];
    if (values is Map) {
      return values[controlName]?.toString() ?? '';
    }
    return '';
  }

  bool bandChecked(Map<String, dynamic> band, String controlName) =>
      bandValue(band, controlName) == 'true';

  List<Map<String, dynamic>> subReportRows(
    Map<String, dynamic> container,
    String controlName,
  ) {
    final sr = container['subReports'];
    if (sr is Map) {
      final list = sr[controlName];
      if (list is List) {
        return list
            .whereType<Map>()
            .map((m) => m.cast<String, dynamic>())
            .toList(growable: false);
      }
    }
    return const <Map<String, dynamic>>[];
  }

  String subReportSummary(Map<String, dynamic> subRow) {
    final vals = subRow['values'];
    if (vals is Map && vals.isNotEmpty) {
      return vals.values
          .map((v) => v?.toString() ?? '')
          .where((v) => v.isNotEmpty)
          .join(' | ');
    }
    return '';
  }
}
''';

String _buildAccessReportViewerHtml(List<CompiledReportSpec> reports) {
  if (reports.isEmpty) {
    return '''
<section class="card">
  <div class="card-body">
    <p class="mb-0">Nenhum relatório compilado disponível neste projeto.</p>
  </div>
</section>
''';
  }
  final buffer = StringBuffer();
  buffer.writeln('<section class="access-report-viewer">');
  buffer.writeln('  <div class="card mb-3 access-report-toolbar">');
  buffer.writeln('    <div class="card-body">');
  buffer.writeln('      <h4 class="mb-3">Relatórios Compilados (Somente Leitura)</h4>');
  buffer.writeln('      <form (submit)="onSubmit(\$event)">');
  buffer.writeln('        <div class="mb-3">');
  buffer.writeln('          <label class="form-label">Relatório</label>');
  buffer.writeln('          <select class="form-select" (change)="onReportSelected(\$event)">');
  for (final report in reports) {
    final title = _ngDartHtmlText(report.caption ?? report.name);
    final keyHtml = _htmlTextLiteral(report.key);
    final keyExpr = _htmlTextLiteral(_ngDartSingleQuotedExpr(report.key));
    buffer.writeln(
        '            <option value="$keyHtml" [selected]="activeReportKey == $keyExpr">$title</option>');
  }
  buffer.writeln('          </select>');
  buffer.writeln('        </div>');
  buffer.writeln('        <div class="mb-3" *ngFor="let param of activeParameters">');
  buffer.writeln('          <label class="form-label">{{ param[\'sourceName\'] }}</label>');
  buffer.writeln('          <input type="text" class="form-control" [attr.data-access-report-param]="param[\'key\']" [value]="parameterValue(param[\'key\'])" (input)="onParameterInput(param[\'key\'], \$event)">');
  buffer.writeln('        </div>');
  buffer.writeln('        <button type="submit" class="btn btn-primary" [disabled]="loading">Visualizar Relatório</button>');
  buffer.writeln('      </form>');
  buffer.writeln('      <p class="mt-3 mb-0 text-muted" *ngIf="loading">Carregando relatório...</p>');
  buffer.writeln('      <div class="alert alert-danger mt-3 mb-0" *ngIf="errorMessage != null">{{ errorMessage }}</div>');
  buffer.writeln('      <p class="mt-3 mb-0 text-warning" *ngIf="truncated">Resultado limitado às primeiras 100 linhas.</p>');
  buffer.writeln('      <p class="mt-3 mb-0" *ngIf="hasSearched && !loading && errorMessage == null && pages.isEmpty">Nenhum registro encontrado para os parâmetros informados.</p>');
  buffer.writeln('    </div>');
  buffer.writeln('  </div>');

  void writeControlHtml(CompiledReportSpec report, CompiledReportControl ctrl,
      {required bool isBand}) {
    final ctrlNameExpr = _htmlTextLiteral(_ngDartSingleQuotedExpr(ctrl.name));
    final ctrlTypeExpr = _htmlTextLiteral(_ngDartSingleQuotedExpr(ctrl.type));
    final cssClass = 'access-report-ctrl-${report.key}-${ctrl.index}';
    final valueHelper = isBand ? 'bandValue(band,' : 'pageValue(page,';
    final checkedHelper = isBand ? 'bandChecked(band,' : 'pageChecked(page,';
    switch (ctrl.type) {
      case 'Label':
        final text = _ngDartHtmlText(ctrl.caption ?? '');
        buffer.writeln(
            '        <div class="$cssClass" [attr.data-access-control]="$ctrlNameExpr" [attr.data-access-control-type]="$ctrlTypeExpr">$text</div>');
        break;
      case 'TextBox':
      case 'ComboBox':
        if (ctrl.columnOrdinal == null &&
            ctrl.expression == null &&
            ctrl.caption != null) {
          final captionHtml = _ngDartHtmlText(ctrl.caption!);
          buffer.writeln(
              '        <div class="$cssClass" [attr.data-access-control]="$ctrlNameExpr" [attr.data-access-control-type]="$ctrlTypeExpr">$captionHtml</div>');
        } else {
          final nameArg = _ngDartSingleQuotedExpr(ctrl.name);
          buffer.writeln(
              '        <div class="$cssClass" [attr.data-access-control]="$ctrlNameExpr" [attr.data-access-control-type]="$ctrlTypeExpr">{{ $valueHelper $nameArg) }}</div>');
        }
        break;
      case 'Rectangle':
      case 'Line':
      case 'Attachment':
      case 'EmptyCell':
      case 'BoundObjectFrame':
      case 'OptionButton':
      case 'OptionGroup':
      case 'PageBreak':
        buffer.writeln(
            '        <div class="$cssClass" [attr.data-access-control]="$ctrlNameExpr" [attr.data-access-control-type]="$ctrlTypeExpr"></div>');
        break;
      case 'Subform':
        final nameArg = _ngDartSingleQuotedExpr(ctrl.name);
        final subSource = isBand ? 'band' : 'page';
        buffer.writeln(
            '        <div class="$cssClass" [attr.data-access-control]="$ctrlNameExpr" [attr.data-access-control-type]="$ctrlTypeExpr"><div class="access-subreport-row" *ngFor="let subRow of subReportRows($subSource, $nameArg)">{{ subReportSummary(subRow) }}</div></div>');
        break;
      case 'CheckBox':
        final nameArg = _ngDartSingleQuotedExpr(ctrl.name);
        buffer.writeln(
            '        <div class="$cssClass" [attr.data-access-control]="$ctrlNameExpr" [attr.data-access-control-type]="$ctrlTypeExpr" [attr.data-access-checked]="$valueHelper $nameArg)"><input type="checkbox" disabled [checked]="$checkedHelper $nameArg)"></div>');
        break;
      case 'Image':
        final src = _htmlTextLiteral(
            '/api/v1/access-reports/${report.key}/assets/${ctrl.assetName}');
        final alt = _htmlTextLiteral(ctrl.picture ?? ctrl.name);
        buffer.writeln(
            '        <div class="$cssClass" [attr.data-access-control]="$ctrlNameExpr" [attr.data-access-control-type]="$ctrlTypeExpr"><img src="$src" alt="$alt"></div>');
        break;
    }
  }

  for (final report in reports) {
    final keyExpr = _htmlTextLiteral(_ngDartSingleQuotedExpr(report.key));
    buffer.writeln('  <div *ngIf="activeReportKey == $keyExpr">');
    if (report.isGrouped) {
      buffer.writeln('    <div *ngIf="pages.isNotEmpty" class="access-report-paper-${report.key}">');
      buffer.writeln('      <div class="access-report-grouped-${report.key}" [attr.data-access-report]="$keyExpr">');
      buffer.writeln('        <ng-container *ngFor="let band of groupedBands(pages.first)">');
      for (final sec in report.sections) {
        if (sec.height <= 0) continue;
        final secKeyExpr = _htmlTextLiteral(_ngDartSingleQuotedExpr(sec.key));
        buffer.writeln('          <div *ngIf="band[\'bandKey\'] == $secKeyExpr" class="access-report-band-${report.key}-${sec.key}">');
        for (final ctrl in report.controls) {
          if (ctrl.section != sec.code) continue;
          writeControlHtml(report, ctrl, isBand: true);
        }
        buffer.writeln('          </div>');
      }
      buffer.writeln('        </ng-container>');
      buffer.writeln('      </div>');
      buffer.writeln('    </div>');
    } else {
      buffer.writeln('    <div *ngFor="let page of pages" class="access-report-paper-${report.key}">');
      buffer.writeln('      <div class="access-report-sheet-${report.key}" [attr.data-access-report]="$keyExpr">');
      for (final ctrl in report.controls) {
        writeControlHtml(report, ctrl, isBand: false);
      }
      buffer.writeln('      </div>');
      buffer.writeln('    </div>');
    }
    buffer.writeln('  </div>');
  }
  buffer.writeln('</section>');
  return buffer.toString();
}

String _buildAccessReportViewerScss(List<CompiledReportSpec> reports) {
  final buffer = StringBuffer();
  buffer.writeln('''
.access-report-viewer {
  max-width: 960px;
}

@media print {
  .access-report-toolbar {
    display: none;
  }
}
''');
  for (final report in reports) {
    final setup = report.pageSetup;
    final widthTwips = setup['widthTwips'] as int;
    final heightTwips =
        (setup['sheetHeightTwips'] as int?) ?? (setup['detailHeightTwips'] as int);
    final leftTwips = setup['leftMarginTwips'] as int;
    final rightTwips = setup['rightMarginTwips'] as int;
    final topTwips = setup['topMarginTwips'] as int;
    final bottomTwips = setup['bottomMarginTwips'] as int;
    final paperWidthTwips = widthTwips + leftTwips + rightTwips;
    buffer.writeln('''
.access-report-paper-${report.key} {
  width: ${_twipsToPx(paperWidthTwips)}px;
  padding: ${_twipsToPx(topTwips)}px ${_twipsToPx(rightTwips)}px ${_twipsToPx(bottomTwips)}px ${_twipsToPx(leftTwips)}px;
  background-color: #ffffff;
  border: 1px solid #d0c8b8;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  margin: 16px 0;
  box-sizing: border-box;
  page-break-after: always;
}

.access-report-sheet-${report.key} {
  position: relative;
  width: ${_twipsToPx(widthTwips)}px;
  height: ${_twipsToPx(heightTwips)}px;
  background-color: #ffffff;
  overflow: hidden;
}
''');
    if (report.isGrouped) {
      for (final sec in report.sections) {
        if (sec.height <= 0) continue;
        buffer.writeln('''
.access-report-band-${report.key}-${sec.key} {
  position: relative;
  width: ${_twipsToPx(widthTwips)}px;
  height: ${_twipsToPx(sec.height)}px;
  background-color: #ffffff;
  overflow: hidden;
}
''');
      }
    }
    for (final ctrl in report.controls) {
      final isLine = ctrl.type == 'Line';
      final isCheck = ctrl.type == 'CheckBox';
      final isSpacer = ctrl.type == 'EmptyCell';
      final bg = isLine || isCheck || isSpacer
          ? 'transparent'
          : (ctrl.backStyle == 1 ? ctrl.backColorHex : 'transparent');
      final border = isLine || isCheck || isSpacer
          ? 'none'
          : (ctrl.borderStyle == 1 ? '1px solid ${ctrl.borderColorHex}' : 'none');
      final cssWidth = _twipsToPx(isLine && ctrl.width == 0 ? 15 : ctrl.width);
      final cssHeight =
          _twipsToPx(isLine && ctrl.height == 0 ? 15 : ctrl.height);
      final cls = 'access-report-ctrl-${report.key}-${ctrl.index}';
      buffer.writeln('.$cls {');
      buffer.writeln('  position: absolute;');
      buffer.writeln('  left: ${_twipsToPx(ctrl.left)}px;');
      final topTwips = report.isGrouped ? ctrl.top : ctrl.sheetTop;
      buffer.writeln('  top: ${_twipsToPx(topTwips)}px;');
      buffer.writeln('  width: ${cssWidth}px;');
      buffer.writeln('  height: ${cssHeight}px;');
      buffer.writeln('  background-color: $bg;');
      buffer.writeln('  border: $border;');
      if (isLine) {
        if (ctrl.width > 0 && ctrl.height == 0) {
          buffer.writeln('  border-top: 1px solid ${ctrl.borderColorHex};');
        } else if (ctrl.height > 0 && ctrl.width == 0) {
          buffer.writeln('  border-left: 1px solid ${ctrl.borderColorHex};');
        } else {
          buffer.writeln('  border-top: 1px solid ${ctrl.borderColorHex};');
          buffer.writeln('  border-left: 1px solid ${ctrl.borderColorHex};');
        }
      }
      buffer.writeln('  box-sizing: border-box;');
      buffer.writeln('  overflow: hidden;');
      if (ctrl.type == 'Label' ||
          ctrl.type == 'TextBox' ||
          ctrl.type == 'ComboBox') {
        final align = switch (ctrl.textAlign) {
          2 => 'center',
          3 => 'right',
          4 => 'justify',
          _ => 'left',
        };
        final fontFamily = (ctrl.fontName ?? 'Calibri').replaceAll("'", '');
        buffer.writeln('  color: ${ctrl.foreColorHex};');
        buffer.writeln(
            "  font-family: '$fontFamily', 'Carlito', 'Liberation Sans', Arial, sans-serif;");
        buffer.writeln('  font-size: ${ctrl.fontSize ?? 11}pt;');
        buffer.writeln('  font-weight: ${ctrl.fontWeight ?? 400};');
        buffer.writeln('  text-align: $align;');
        buffer.writeln('  line-height: 1.08;');
        buffer.writeln('  white-space: pre-wrap;');
        buffer.writeln('  padding: 0;');
      }
      buffer.writeln('}');
      if (ctrl.type == 'CheckBox') {
        buffer.writeln('''
.$cls input[type="checkbox"] {
  display: block;
  width: 14px;
  height: 14px;
  margin: 1px;
  pointer-events: none;
  accent-color: #1f1f1f;
}
''');
      }
      if (ctrl.type == 'Image') {
        final fit = switch (ctrl.sizeMode) {
          1 => 'fill',
          3 => 'contain',
          _ => 'none',
        };
        buffer.writeln('''
.$cls img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: $fit;
}
''');
      }
    }
  }
  return buffer.toString();
}
