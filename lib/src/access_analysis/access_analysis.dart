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
    // Para ler tabelas nativamente do catálogo:
    final catalog = AccessCatalog(format: db.format, pageChannel: db.pageChannel);
    final model = await catalog.read(db.info.path);

    // 1. Extração de Tabelas Ricas (Nullability, defaults, calculadas)
    for (var rawTable in model.tables) {
       final canonicalColumns = rawTable.columns.map((c) => CanonicalColumn(
         name: c.name,
         type: c.typeCode.toString(),  // fixed
         isRequired: c.columnNumber == 0,
       )).toList();

       tables[rawTable.name] = CanonicalTable(rawTable.name, canonicalColumns);
    }

    // 2. Extração de Queries
    for (var q in model.queries) {
       queries.add(CanonicalQuery(q.name, q.sqlText ?? '')); // fixed
    }

    // 3. Extração não-tabular via MS-OVBA
    final tableReader = TableReader(format: db.format, pageChannel: db.pageChannel);
    final vbaReader = VbaProjectReader(tableReader);
    final vbaSources = await vbaReader.extractModules();

    for (var m in model.modules) {
       final snippet = vbaSources[m.name] ?? 'unparsed_vba_blob_placeholder';
       modules.add(CanonicalModule(m.name, snippet));
    }

    // Adiciona lógicas de Forms como módulos VBA complementares
    for (var f in model.forms) {
       final source = vbaSources['Form_${f.name}'] ?? vbaSources[f.name];
       
       forms.add(CanonicalForm(
         f.name, 
         {}, // components will be populated later
         rawVbaCode: source,
       ));
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'tables': tables.map((k, v) => MapEntry(k, v.toJson())),
      'queries': queries.map((q) => q.toJson()).toList(),
      'forms': forms.map((f) => f.toJson()).toList(),
      'modules': modules.map((m) => m.toJson()).toList(),
    };
  }
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
