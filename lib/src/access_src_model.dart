class AccessSrcProject {
  final String sourcePath;
  final List<AccessSrcTable> tables;
  final List<AccessSrcQuery> queries;
  final List<AccessSrcForm> forms;

  const AccessSrcProject({
    required this.sourcePath,
    required this.tables,
    required this.queries,
    required this.forms,
  });

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'sourcePath': sourcePath,
      'tables': tables.map((table) => table.toJson()).toList(),
      'queries': queries.map((query) => query.toJson()).toList(),
      'forms': forms.map((form) => form.toJson()).toList(),
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
