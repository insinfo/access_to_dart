class AccessSrcProject {
  final String sourcePath;
  final List<AccessSrcTable> tables;
  final List<AccessSrcQuery> queries;
  final List<AccessSrcForm> forms;
  final List<AccessSrcReport> reports;

  const AccessSrcProject({
    required this.sourcePath,
    required this.tables,
    required this.queries,
    required this.forms,
    this.reports = const [],
  });

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'sourcePath': sourcePath,
      'tables': tables.map((table) => table.toJson()).toList(),
      'queries': queries.map((query) => query.toJson()).toList(),
      'forms': forms.map((form) => form.toJson()).toList(),
      'reports': reports.map((report) => report.toJson()).toList(),
    };
  }
}

class AccessSrcTable {
  final String name;
  final String sql;
  final List<AccessSrcColumn> columns;
  final List<AccessSrcIndex> indexes;
  final bool isLinked;
  final String? sourceTableName;
  final String? connect;
  final String? primaryKey;

  const AccessSrcTable({
    required this.name,
    required this.sql,
    required this.columns,
    required this.indexes,
    this.isLinked = false,
    this.sourceTableName,
    this.connect,
    this.primaryKey,
  });

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'name': name,
      'sql': sql,
      'columns': columns.map((column) => column.toJson()).toList(),
      'indexes': indexes.map((index) => index.toJson()).toList(),
      'isLinked': isLinked,
      'sourceTableName': sourceTableName,
      'connect': connect,
      'primaryKey': primaryKey,
    };
  }
}

class AccessSrcColumn {
  final String name;
  final String? accessType;
  final String? sqlType;
  final String? caption;
  final String? defaultValue;
  final String? validationRule;
  final String? validationText;
  final String? format;
  final String? inputMask;
  final bool? allowZeroLength;
  final bool required;
  final int? maxLength;
  final bool isAttachment;
  final bool isCalculated;
  final String? expression;
  final List<AccessSrcColumn> children;

  const AccessSrcColumn({
    required this.name,
    required this.accessType,
    required this.sqlType,
    required this.caption,
    required this.defaultValue,
    this.validationRule,
    this.validationText,
    this.format,
    this.inputMask,
    this.allowZeroLength,
    required this.required,
    required this.maxLength,
    required this.isAttachment,
    required this.isCalculated,
    required this.expression,
    required this.children,
  });

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'name': name,
      'accessType': accessType,
      'sqlType': sqlType,
      'caption': caption,
      'defaultValue': defaultValue,
      'validationRule': validationRule,
      'validationText': validationText,
      'format': format,
      'inputMask': inputMask,
      'allowZeroLength': allowZeroLength,
      'required': required,
      'maxLength': maxLength,
      'isAttachment': isAttachment,
      'isCalculated': isCalculated,
      'expression': expression,
      'children': children.map((child) => child.toJson()).toList(),
    };
  }
}

class AccessSrcIndex {
  final String name;
  final String key;
  final bool primary;
  final bool unique;

  const AccessSrcIndex({
    required this.name,
    required this.key,
    required this.primary,
    required this.unique,
  });

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'name': name,
      'key': key,
      'primary': primary,
      'unique': unique,
    };
  }
}

class AccessSrcQuery {
  final String name;
  final String sql;
  final String? basText;
  final String? semanticSql;

  const AccessSrcQuery({
    required this.name,
    required this.sql,
    required this.basText,
    required this.semanticSql,
  });

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'name': name,
      'sql': sql,
      'basText': basText,
      'semanticSql': semanticSql,
    };
  }
}

class AccessSrcForm {
  final String name;
  final String? caption;
  final String? recordSource;
  final int? defaultView;
  final List<AccessSrcControl> controls;
  final Map<String, List<String>> macros;

  const AccessSrcForm({
    required this.name,
    required this.caption,
    required this.recordSource,
    required this.defaultView,
    required this.controls,
    required this.macros,
  });

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'name': name,
      'caption': caption,
      'recordSource': recordSource,
      'defaultView': defaultView,
      'controls': controls.map((control) => control.toJson()).toList(),
      'macros': macros,
    };
  }
}

class AccessSrcControl {
  final String type;
  final String name;
  final String? controlSource;
  final String? caption;
  final Map<String, List<String>> macros;

  const AccessSrcControl({
    required this.type,
    required this.name,
    required this.controlSource,
    required this.caption,
    required this.macros,
  });

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'type': type,
      'name': name,
      'controlSource': controlSource,
      'caption': caption,
      'macros': macros,
    };
  }
}

/// Inventário do export de relatório; não implica suporte à sua renderização.
class AccessSrcReport {
  final String name;
  final String? caption;
  final String? recordSource;
  final String? orderBy;
  final String? orderByOn;
  final String? orderByOnLoad;
  final List<AccessSrcReportGroupLevel> groupLevels;
  final List<AccessSrcControl> controls;
  final List<AccessSrcReportSection> sections;
  final Map<String, List<String>> macros;

  const AccessSrcReport({
    required this.name,
    required this.caption,
    required this.recordSource,
    this.orderBy,
    this.orderByOn,
    this.orderByOnLoad,
    this.groupLevels = const [],
    required this.controls,
    required this.sections,
    required this.macros,
  });

  Map<String, Object?> toJson() => {
        'name': name,
        'caption': caption,
        'recordSource': recordSource,
        'orderBy': orderBy,
        'orderByOn': orderByOn,
        'orderByOnLoad': orderByOnLoad,
        'groupLevels': groupLevels.map((level) => level.toJson()).toList(),
        'controls': controls.map((control) => control.toJson()).toList(),
        'sections': sections.map((section) => section.toJson()).toList(),
        'macros': macros,
      };
}

class AccessSrcReportSection {
  final String type;
  final String? name;
  final int? height;
  final List<AccessSrcControl> controls;

  const AccessSrcReportSection({
    required this.type,
    required this.name,
    required this.height,
    required this.controls,
  });

  Map<String, Object?> toJson() => {
        'type': type,
        'name': name,
        'height': height,
        'controls': controls.map((control) => control.toJson()).toList(),
      };
}

/// Um BreakLevel do SaveAsText, na ordem do export. Valores ausentes não
/// recebem defaults: NotDefault e enums numéricos permanecem como exportados.
class AccessSrcReportGroupLevel {
  final Map<String, String> properties;

  AccessSrcReportGroupLevel(Map<String, String> properties)
      : properties = Map.unmodifiable(properties);

  Map<String, Object?> toJson() => {
        'controlSource': properties['ControlSource'],
        'sortOrder': properties['SortOrder'],
        'groupHeader': properties['GroupHeader'],
        'groupFooter': properties['GroupFooter'],
        'groupOn': properties['GroupOn'],
        'groupInterval': properties['GroupInterval'],
        'keepTogether': properties['KeepTogether'],
        'properties': properties,
      };
}
