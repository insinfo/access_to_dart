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

  const CompiledReportControl({
    required this.index,
    required this.name,
    required this.type,
    required this.controlType,
    required this.section,
    required this.left,
    required this.top,
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
  });

  Map<String, Object?> toJson() => {
        'index': index,
        'name': name,
        'type': type,
        'controlType': controlType,
        'section': section,
        'left': left,
        'top': top,
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
      };
}

class CompiledReportSection {
  final String type;
  final String name;
  final int height;
  final bool keepTogether;

  const CompiledReportSection({
    required this.type,
    required this.name,
    required this.height,
    required this.keepTogether,
  });

  Map<String, Object?> toJson() => {
        'type': type,
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
  });

  List<Map<String, Object?>> get boundControls => [
        for (final control in controls)
          if ((control.type == 'TextBox' ||
                  control.type == 'ComboBox' ||
                  control.type == 'CheckBox') &&
              control.columnOrdinal != null)
            {
              'controlName': control.name,
              'controlType': control.controlType,
              'controlSource': control.controlSource,
              'columnOrdinal': control.columnOrdinal,
              'daoType': control.daoType,
              'format': control.format,
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
        'sections': sections.map((s) => s.toJson()).toList(growable: false),
        'controls': controls.map((c) => c.toJson()).toList(growable: false),
        'boundControls': boundControls,
        'assets':
            assets.map((a) => a.toMetadataJson(key)).toList(growable: false),
        'readOnly': true,
      };
}

class CompiledReportCompilationResult {
  final List<CompiledReportSpec> reports;
  final List<Map<String, Object?>> diagnostics;

  const CompiledReportCompilationResult({
    required this.reports,
    required this.diagnostics,
  });
}

extension _CompiledReportRenderer on ProjectGenerator {
  CompiledReportCompilationResult compileEligibleReports(
      AnalysisProject project) {
    final compiledQueries = _compileQuerySpecifications(project).specifications;
    final queryByLowerName = <String, MapEntry<String, Map<String, Object?>>>{
      for (final entry in compiledQueries.entries)
        (entry.value['name'] as String).toLowerCase(): entry,
    };
    final sourceRoot = _resolveReportSourceRoot(project);
    final reports = <CompiledReportSpec>[];
    final diagnostics = <Map<String, Object?>>[];
    final usedKeys = <String>{};

    final rawReports =
        (project.raw['reports'] as List? ?? const []).whereType<Map>();
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
        rawReport.cast<String, dynamic>(),
        key: key,
        queryByLowerName: queryByLowerName,
        sourceRoot: sourceRoot,
      );
      if (compiled.spec != null) {
        usedKeys.add(key);
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

    return CompiledReportCompilationResult(
      reports: reports,
      diagnostics: diagnostics,
    );
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
    required String key,
    required Map<String, MapEntry<String, Map<String, Object?>>>
        queryByLowerName,
    required String? sourceRoot,
  }) {
    final sourceSha256 = report['sourceSha256']?.toString();
    if (sourceSha256 == null ||
        !RegExp(r'^[a-f0-9]{64}$').hasMatch(sourceSha256)) {
      return (spec: null, reason: 'missing-source-export-sha256');
    }

    final props = ((report['properties'] as Map?) ?? const {})
        .cast<String, dynamic>();
    if (_reportHasBehaviorOrModule(report, props)) {
      return (spec: null, reason: 'has-vba-macros-or-events');
    }

    final groupLevels = (report['groupLevels'] as List?) ?? const [];
    if (groupLevels.isNotEmpty) {
      return (spec: null, reason: 'unsupported-group-levels');
    }

    final recordSource =
        (report['recordSource'] ?? props['RecordSource'])?.toString().trim();
    if (recordSource == null || recordSource.isEmpty) {
      return (spec: null, reason: 'missing-record-source');
    }
    final queryEntry = queryByLowerName[recordSource.toLowerCase()];
    if (queryEntry == null) {
      return (spec: null, reason: 'record-source-not-compiled-query');
    }

    final widthTwips = _parseReportInt(props['Width']);
    if (widthTwips == null || widthTwips <= 0) {
      return (spec: null, reason: 'missing-report-width');
    }

    final pageSetup = _parseReportPageSetup(
      report['printSettings'],
      widthTwips: widthTwips,
    );
    if (pageSetup == null) {
      return (spec: null, reason: 'missing-or-invalid-print-settings');
    }

    final rawSections = (report['sections'] as List?) ?? const [];
    if (rawSections.isEmpty) {
      return (spec: null, reason: 'missing-sections');
    }

    final compiledSections = <CompiledReportSection>[];
    final sectionControls = <Map<String, dynamic>>[];
    var detailHeight = 0;
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
      if (sType != 'PageHeader' && sType != 'Section' && sType != 'PageFooter') {
        return (spec: null, reason: 'unsupported-section-type:$sType');
      }
      final sHeight = _parseReportInt(section['height'] ?? sProps['Height']);
      if (sHeight == null || sHeight < 0) {
        return (spec: null, reason: 'invalid-section-height:$sType');
      }
      final controls = (section['controls'] as List?) ?? const [];
      if ((sType == 'PageHeader' || sType == 'PageFooter') &&
          (sHeight > 0 || controls.isNotEmpty)) {
        return (spec: null, reason: 'non-empty-page-header-or-footer');
      }
      if (sType == 'Section') {
        if (sHeight <= 0) {
          return (spec: null, reason: 'empty-detail-section');
        }
        detailHeight = sHeight;
        for (final ctrl in controls) {
          if (ctrl is! Map) {
            return (spec: null, reason: 'invalid-control-entry');
          }
          sectionControls.add(ctrl.cast<String, dynamic>());
        }
      }
      compiledSections.add(CompiledReportSection(
        type: sType,
        name: section['name']?.toString() ?? sType,
        height: sHeight,
        keepTogether: sProps['KeepTogether']?.toString() == 'NotDefault',
      ));
    }

    if (detailHeight <= 0 || sectionControls.isEmpty) {
      return (spec: null, reason: 'missing-detail-controls');
    }
    pageSetup['detailHeightTwips'] = detailHeight;

    final defaultsRaw =
        ((report['controlDefaults'] as Map?) ?? const {}).cast<String, dynamic>();
    final queryColumns = (queryEntry.value['columns'] as List).cast<Map>();
    final columnsByLower = <String, List<Map>>{};
    for (final col in queryColumns) {
      final colName = (col['name'] as String).toLowerCase();
      (columnsByLower[colName] ??= []).add(col);
    }

    final rawImages = (report['images'] as List?) ?? const [];
    final imageByControl = <String, Map<String, dynamic>>{};
    for (final img in rawImages) {
      if (img is Map && img['controlName'] is String) {
        imageByControl[(img['controlName'] as String).toLowerCase()] =
            img.cast<String, dynamic>();
      }
    }

    final compiledControls = <CompiledReportControl>[];
    final compiledAssets = <CompiledReportAsset>[];
    final assetHashByName = <String, String>{};

    for (var i = 0; i < sectionControls.length; i++) {
      final ctrl = sectionControls[i];
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
        'Image' => 103,
        'CheckBox' => 106,
        'TextBox' => 109,
        'ComboBox' => 111,
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
      var left = _parseReportInt(ctrl['left'] ?? cProps['Left']) ?? cachedLeft;
      if (left == null && width != null && cachedRight == width) {
        left = 0;
      }
      var top = _parseReportInt(ctrl['top'] ?? cProps['Top']) ?? cachedTop;
      if (top == null && height != null && cachedBottom == height) {
        top = 0;
      }
      if (width == null && left != null && cachedRight != null && cachedRight > left) {
        width = cachedRight - left;
      }
      if (height == null && top != null && cachedBottom != null && cachedBottom > top) {
        height = cachedBottom - top;
      }
      if (left == null ||
          top == null ||
          width == null ||
          height == null ||
          left < 0 ||
          top < 0 ||
          width <= 0 ||
          height <= 0) {
        return (spec: null, reason: 'invalid-control-geometry:$cName');
      }

      final backStyle = _parseReportInt(cProps['BackStyle'] ??
              defProps['BackStyle']) ??
          (cType == 'TextBox' ||
                  cType == 'ComboBox' ||
                  cType == 'Image' ||
                  cType == 'Rectangle'
              ? 1
              : 0);
      final backColor =
          _parseReportInt(cProps['BackColor'] ?? defProps['BackColor']) ??
              16777215;
      final borderStyle = _parseReportInt(cProps['BorderStyle'] ??
              cProps['OldBorderStyle'] ??
              defProps['BorderStyle'] ??
              defProps['OldBorderStyle']) ??
          (cType == 'Label' || cType == 'Image' ? 0 : 1);
      final borderColor = _resolveReportBorderColor(cType, cProps, defProps);
      final foreColor = _resolveReportForeColor(cProps, defProps);

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
            return (spec: null, reason: 'unsupported-combobox-lookup:$cName');
          }
          controlSource =
              (ctrl['controlSource'] ?? cProps['ControlSource'])?.toString().trim();
          final typeSlug = isCombo ? 'combobox' : 'textbox';
          if (controlSource != null && controlSource.isNotEmpty) {
            if (controlSource.startsWith('=')) {
              return (spec: null, reason: 'unsupported-$typeSlug-source:$cName');
            }
            final colMatches =
                columnsByLower[controlSource.toLowerCase()] ?? const [];
            if (colMatches.length != 1) {
              return (spec: null, reason: 'unresolved-$typeSlug-column:$cName');
            }
            columnOrdinal = colMatches.single['ordinal'] as int;
            daoType = colMatches.single['daoType'] as int;
          } else {
            if (isCombo) {
              return (spec: null, reason: 'unsupported-combobox-source:$cName');
            }
            controlSource = null;
          }
          format = cProps['Format']?.toString();
          if (format != null && format.isNotEmpty && format != '>') {
            return (spec: null, reason: 'unsupported-$typeSlug-format:$cName');
          }
        }
      } else if (cType == 'CheckBox') {
        controlSource =
            (ctrl['controlSource'] ?? cProps['ControlSource'])?.toString().trim();
        if (controlSource == null ||
            controlSource.isEmpty ||
            controlSource.startsWith('=')) {
          return (spec: null, reason: 'unsupported-checkbox-source:$cName');
        }
        final colMatches =
            columnsByLower[controlSource.toLowerCase()] ?? const [];
        if (colMatches.length != 1 || colMatches.single['daoType'] != 1) {
          return (spec: null, reason: 'unresolved-checkbox-column:$cName');
        }
        columnOrdinal = colMatches.single['ordinal'] as int;
        daoType = 1;
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
        if (imageEntry == null ||
            imageEntry['status'] != 'resolved' ||
            imageEntry['sourcePath'] is! String ||
            imageEntry['sha256'] is! String) {
          return (spec: null, reason: 'unresolved-shared-image:$cName');
        }
        final loadedAsset = _loadVerifiedReportAsset(
          controlName: cName,
          picture: picture,
          relativeSourcePath: imageEntry['sourcePath'] as String,
          expectedSha256: imageEntry['sha256'] as String,
          sourceRoot: sourceRoot,
        );
        if (loadedAsset == null) {
          return (spec: null, reason: 'missing-or-corrupt-image-file:$cName');
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
        section: 0,
        left: left,
        top: top,
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
      ));
    }

    return (
      spec: CompiledReportSpec(
        key: key,
        name: report['name'] as String,
        caption: (report['caption'] ?? props['Caption'])?.toString(),
        recordSource: recordSource,
        queryKey: queryEntry.key,
        sourceSha256: sourceSha256,
        printSettingsSha256: report['printSettingsSha256']?.toString(),
        pageSetup: pageSetup,
        parameters:
            ((queryEntry.value['parameters'] as List?) ?? const [])
                .cast<Map<String, Object?>>(),
        sections: compiledSections,
        controls: compiledControls,
        assets: compiledAssets,
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
    return _mapHasBehaviorOrEvents(report, props);
  }

  bool _mapHasBehaviorOrEvents(
    Map<String, dynamic> node,
    Map<String, dynamic> props,
  ) {
    for (final key in const ['events', 'macros', 'macroDefinitions']) {
      final entry = node[key];
      if (entry is Map && entry.isNotEmpty) return true;
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

  int _resolveReportBorderColor(
    String type,
    Map<String, dynamic> ctrlProp,
    Map<String, dynamic> defProp,
  ) {
    final explicit = _parseReportInt(ctrlProp['BorderColor']);
    if (explicit != null) return explicit;
    if (ctrlProp['BorderThemeColorIndex']?.toString() == '0' ||
        (ctrlProp['BorderTint']?.toString() == '100.0' &&
            defProp['BorderThemeColorIndex']?.toString() == '0')) {
      return 0;
    }
    if (type == 'Label') return 8355711;
    return 10921638;
  }

  int _resolveReportForeColor(
    Map<String, dynamic> ctrlProp,
    Map<String, dynamic> defProp,
  ) {
    final explicit =
        _parseReportInt(ctrlProp['ForeColor'] ?? defProp['ForeColor']);
    if (explicit != null) return explicit;
    final themeIndex = (ctrlProp['ForeThemeColorIndex'] ??
            defProp['ForeThemeColorIndex'])
        ?.toString()
        .trim();
    final shade =
        (ctrlProp['ForeShade'] ?? defProp['ForeShade'])?.toString().trim();
    if (themeIndex == '4' && shade == '75.0') return 9917743;
    if (themeIndex == '9' && shade == '50.0') return 2316088;
    return 0;
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
    final queryDescriptor =
        queryKey == null ? null : AccessQueryController.specifications[queryKey] as Map?;
    if (queryDescriptor == null) {
      return responseError('Consulta do relatorio indisponivel.', statusCode: 500);
    }
    try {
      final result =
          await AccessQueryController.executeDescriptor(request, queryDescriptor);
      final rows = (result['rows'] as List).cast<List>();
      final boundControls = (descriptor['boundControls'] as List).cast<Map>();
      final pages = <Map<String, Object?>>[];
      for (var i = 0; i < rows.length; i++) {
        final row = rows[i];
        final values = <String, String>{};
        for (final control in boundControls) {
          final ordinal = control['columnOrdinal'] as int;
          final raw = ordinal < row.length ? row[ordinal] : null;
          values[control['controlName'] as String] = _formatCell(
            raw,
            control['daoType'] as int,
            control['format'] as String?,
            controlType: control['controlType'] as int?,
          );
        }
        pages.add({'pageNumber': i + 1, 'values': values});
      }
      return responseJson({
        'report': descriptor['name'],
        'key': key,
        'caption': descriptor['caption'],
        'recordSource': descriptor['recordSource'],
        'queryKey': queryKey,
        'parameters': result['parameters'],
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

  static String _formatCell(
    Object? value,
    int daoType,
    String? format, {
    int? controlType,
  }) {
    if (controlType == 106) {
      return value == true ? 'true' : 'false';
    }
    if (value == null) return '';
    String text;
    if (daoType == 1 && value is bool) {
      text = value ? 'Sim' : 'Não';
    } else {
      text = value.toString();
    }
    if (format == '>') {
      text = text.toUpperCase();
    }
    return text;
  }
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

  for (final report in reports) {
    final keyExpr = _htmlTextLiteral(_ngDartSingleQuotedExpr(report.key));
    buffer.writeln('  <div *ngIf="activeReportKey == $keyExpr">');
    buffer.writeln('    <div *ngFor="let page of pages" class="access-report-paper-${report.key}">');
    buffer.writeln('      <div class="access-report-sheet-${report.key}" [attr.data-access-report]="$keyExpr">');
    for (final ctrl in report.controls) {
      final ctrlNameExpr = _htmlTextLiteral(_ngDartSingleQuotedExpr(ctrl.name));
      final ctrlTypeExpr = _htmlTextLiteral(_ngDartSingleQuotedExpr(ctrl.type));
      final cssClass = 'access-report-ctrl-${report.key}-${ctrl.index}';
      switch (ctrl.type) {
        case 'Label':
          final text = _ngDartHtmlText(ctrl.caption ?? '');
          buffer.writeln(
              '        <div class="$cssClass" [attr.data-access-control]="$ctrlNameExpr" [attr.data-access-control-type]="$ctrlTypeExpr">$text</div>');
          break;
        case 'TextBox':
        case 'ComboBox':
          final nameArg = _ngDartSingleQuotedExpr(ctrl.name);
          buffer.writeln(
              '        <div class="$cssClass" [attr.data-access-control]="$ctrlNameExpr" [attr.data-access-control-type]="$ctrlTypeExpr">{{ pageValue(page, $nameArg) }}</div>');
          break;
        case 'Rectangle':
          buffer.writeln(
              '        <div class="$cssClass" [attr.data-access-control]="$ctrlNameExpr" [attr.data-access-control-type]="$ctrlTypeExpr"></div>');
          break;
        case 'CheckBox':
          final nameArg = _ngDartSingleQuotedExpr(ctrl.name);
          buffer.writeln(
              '        <div class="$cssClass" [attr.data-access-control]="$ctrlNameExpr" [attr.data-access-control-type]="$ctrlTypeExpr" [attr.data-access-checked]="pageValue(page, $nameArg)"><input type="checkbox" disabled [checked]="pageChecked(page, $nameArg)"></div>');
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
    buffer.writeln('      </div>');
    buffer.writeln('    </div>');
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
    final heightTwips = setup['detailHeightTwips'] as int;
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
    for (final ctrl in report.controls) {
      final bg = ctrl.type == 'CheckBox'
          ? 'transparent'
          : (ctrl.backStyle == 1 ? ctrl.backColorHex : 'transparent');
      final border = ctrl.type == 'CheckBox'
          ? 'none'
          : (ctrl.borderStyle == 1 ? '1px solid ${ctrl.borderColorHex}' : 'none');
      final cls = 'access-report-ctrl-${report.key}-${ctrl.index}';
      buffer.writeln('.$cls {');
      buffer.writeln('  position: absolute;');
      buffer.writeln('  left: ${_twipsToPx(ctrl.left)}px;');
      buffer.writeln('  top: ${_twipsToPx(ctrl.top)}px;');
      buffer.writeln('  width: ${_twipsToPx(ctrl.width)}px;');
      buffer.writeln('  height: ${_twipsToPx(ctrl.height)}px;');
      buffer.writeln('  background-color: $bg;');
      buffer.writeln('  border: $border;');
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
        buffer.writeln('  line-height: 1.12;');
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
