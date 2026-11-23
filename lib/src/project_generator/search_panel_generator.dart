part of 'project_generator.dart';

extension _AccessSearchPanelGenerator on ProjectGenerator {
  ({
    List<Map<String, Object?>> panels,
    Map<String, Map<String, Object?>> compiledSearchQueries,
  }) _compileSearchForms(AnalysisProject project) {
    final cached = _compiledSearchFormsCache[project];
    if (cached != null) return cached;

    final rawForms =
        ((project.raw['forms'] as List?) ?? const []).whereType<Map>().toList();
    final unboundForms = rawForms
        .where((f) => (f['recordSource']?.toString() ?? '').trim().isEmpty)
        .toList();
    if (unboundForms.isEmpty) {
      final empty = (
        panels: const <Map<String, Object?>>[],
        compiledSearchQueries: const <String, Map<String, Object?>>{},
      );
      _compiledSearchFormsCache[project] = empty;
      return empty;
    }

    final rawQueries =
        (project.raw['queries'] as List? ?? const []).whereType<Map>();
    final namedSubqueries = <String, String>{
      for (final q in rawQueries)
        if (q['name'] is String &&
            !(q['name'] as String).startsWith('~') &&
            q['sqlText'] is String &&
            (q['sqlText'] as String).trim().isNotEmpty)
          q['name'] as String: q['sqlText'] as String,
    };
    final tableByLowerName = <String, AnalysisTable>{
      for (final t in scaffoldTables(project)) t.name.toLowerCase(): t,
    };

    final panels = <Map<String, Object?>>[];
    final compiledSearchQueries = <String, Map<String, Object?>>{};
    final usedKeys = <String>{};

    for (final form in unboundForms) {
      final formName = (form['name']?.toString() ?? '').trim();
      if (formName.isEmpty) continue;
      final vba = (form['rawVbaCode']?.toString() ?? '');
      if (vba.trim().isEmpty) continue;
      final controls =
          ((form['controls'] as List?) ?? const []).whereType<Map>().toList();
      final listBoxes =
          controls.where((c) => c['type'] == 'ListBox').toList();
      if (listBoxes.isEmpty) continue;

      final vbaSubs = _extractVbaSubBodies(vba);
      Map<String, Object?>? matchedPanel;

      for (final lb in listBoxes) {
        final lbName = (lb['name']?.toString() ?? '').trim();
        if (lbName.isEmpty) continue;
        final props = (lb['properties'] as Map?) ?? const {};
        final rowSource = (props['RowSource']?.toString() ?? '').trim();
        if (rowSource.isEmpty) continue;

        final normLb = lbName
            .toLowerCase()
            .replaceAll(RegExp(r'[^a-z0-9_]'), '_');
        final clickBody = vbaSubs['${lbName.toLowerCase()}_click'] ??
            vbaSubs['${normLb}_click'] ??
            vbaSubs['${lbName.toLowerCase()}_dblclick'] ??
            vbaSubs['${normLb}_dblclick'];
        if (clickBody == null) continue;

        final openMatch = RegExp(
          r'DoCmd\.OpenForm\s+(.+)',
          caseSensitive: false,
        ).firstMatch(clickBody);
        if (openMatch == null) continue;
        final args = _splitCsvOutsideQuotes(openMatch.group(1)!.split('\n').first);
        if (args.length < 4 || !args[0].startsWith('"')) continue;
        final targetFormName = _unquoteVbaString(args[0]).trim();
        final whereCond = _unquoteVbaString(args[3]).trim();
        if (targetFormName.isEmpty || whereCond.isEmpty) continue;

        // Parse simple PK equality WhereCondition: [PkField]=[Forms]![SrcForm]![ListBox]
        final whereMatch = RegExp(
          r'^\[?([^\]]+?)\]?\s*=\s*(?:(?:\[?(?:Forms|Formulários)\]?!\[?[^\]!]+?\]?[!.])?\[?([^\]]+?)\]?)$',
          caseSensitive: false,
        ).firstMatch(whereCond);
        if (whereMatch == null) continue;
        final targetField = whereMatch.group(1)!.trim();
        final sourceCtrl = whereMatch.group(2)!.trim();
        if (sourceCtrl.toLowerCase() != lbName.toLowerCase()) continue;

        // Resolve target form -> single generated CRUD module
        final matchingTables = scaffoldTables(project)
            .where((candidate) =>
                _resolveFrontendForm(project, candidate)?.name.toLowerCase() ==
                targetFormName.toLowerCase())
            .toList();
        if (matchingTables.length != 1) continue;
        final targetTable = matchingTables.single;
        final pkCol = targetTable.primaryKey?.columns.length == 1
            ? targetTable.primaryKey!.columns.first.name
            : (targetTable.columns.isNotEmpty ? targetTable.columns.first.name : '');
        if (pkCol.isEmpty || pkCol.toLowerCase() != targetField.toLowerCase()) {
          continue;
        }

        // Compile ListBox RowSource (SQL or catalog query or table name)
        String sqlText = rowSource;
        final upper = sqlText.toUpperCase();
        if (!upper.startsWith('SELECT') &&
            !upper.startsWith('PARAMETERS') &&
            !upper.startsWith('(')) {
          final namedSql = namedSubqueries[sqlText] ??
              namedSubqueries.entries
                  .where((e) => e.key.toLowerCase() == sqlText.toLowerCase())
                  .map((e) => e.value)
                  .firstOrNull;
          if (namedSql != null) {
            sqlText = namedSql;
          } else if (tableByLowerName.containsKey(sqlText.toLowerCase())) {
            final t = tableByLowerName[sqlText.toLowerCase()]!;
            final cols = t.columns.take(8).map((c) => '[${c.name}]').join(', ');
            sqlText = 'SELECT $cols FROM [${t.name}]';
          } else {
            continue;
          }
        }

        final baseKey = toSnakeCaseIdentifier(formName);
        var key = baseKey.isEmpty ? 'search' : baseKey;
        var suffix = 2;
        while (usedKeys.contains(key)) {
          key = '${baseKey}_$suffix';
          suffix++;
        }
        final queryKey = '_srch_$key';

        MapEntry<String, Map<String, Object?>>? compiledEntry;
        try {
          compiledEntry = _compileExtendedQuerySpecification(
            project,
            key: queryKey,
            name: formName,
            sqlText: sqlText,
            namedSubqueries: namedSubqueries,
          );
        } on FormatException {
          continue;
        }
        if (compiledEntry == null) continue;

        final boundCol1Based =
            int.tryParse(props['BoundColumn']?.toString() ?? '') ?? 1;
        final boundOrdinal = boundCol1Based > 0 ? boundCol1Based - 1 : 0;
        final cols = (compiledEntry.value['columns'] as List? ?? const []);
        if (boundOrdinal >= cols.length) continue;

        usedKeys.add(key);
        compiledSearchQueries[queryKey] = compiledEntry.value;
        final caption = (form['caption']?.toString() ?? '').trim();
        final rawParams = (compiledEntry.value['parameters'] as List? ?? const [])
            .whereType<Map>()
            .map((p) {
              final srcName = p['sourceName']?.toString() ?? '';
              final bangIdx = srcName.lastIndexOf('!');
              final shortLabel = bangIdx >= 0
                  ? srcName.substring(bangIdx + 1).replaceAll('[', '').replaceAll(']', '')
                  : srcName;
              return <String, Object?>{
                'key': p['key'],
                'sourceName': srcName,
                'label': shortLabel.isEmpty ? srcName : shortLabel,
                'daoType': p['daoType'] ?? 10,
              };
            })
            .toList(growable: false);

        matchedPanel = <String, Object?>{
          'key': key,
          'name': formName,
          'title': caption.isEmpty ? formName : caption,
          'queryKey': queryKey,
          'boundOrdinal': boundOrdinal,
          'targetRouteSegment': tableRouteSegment(targetTable),
          'targetFormName': targetFormName,
          'parameters': rawParams,
        };
        break;
      }

      if (matchedPanel != null) {
        panels.add(matchedPanel);
      }
    }

    panels.sort((a, b) => (a['title'] as String)
        .toLowerCase()
        .compareTo((b['title'] as String).toLowerCase()));
    final result = (
      panels: panels,
      compiledSearchQueries: compiledSearchQueries,
    );
    _compiledSearchFormsCache[project] = result;
    return result;
  }
}

String _buildAccessSearchPanelDartSource(List<Map<String, Object?>> panels) {
  final encoded = _dartStringLiteral(jsonEncode(panels));
  return _accessSearchPanelDartTemplate.replaceFirst('/*COMPILED_SEARCHES*/', encoded);
}

const _accessSearchPanelDartTemplate = r'''import 'dart:convert';
import 'dart:html' as html;

import 'package:ngdart/angular.dart';

import '../services/api_http_service.dart';

@Component(
  selector: 'access-search-panel',
  templateUrl: 'access_search_panel.html',
  styleUrls: ['access_search_panel.css'],
  directives: [coreDirectives],
)
class AccessSearchPanel implements OnInit {
  static final List<Map<String, dynamic>> compiledSearches =
      (jsonDecode(/*COMPILED_SEARCHES*/) as List).cast<Map<String, dynamic>>();

  final ApiHttpService _api = ApiHttpService('/api/v1');
  final Map<String, String> _parameterValues = <String, String>{};

  String activeSearchKey = compiledSearches.isEmpty
      ? ''
      : compiledSearches.first['key'] as String;
  bool loading = false;
  bool hasSearched = false;
  bool truncated = false;
  String? errorMessage;
  List<Map<String, dynamic>> resultColumns = <Map<String, dynamic>>[];
  List<List<Object?>> resultRows = <List<Object?>>[];

  @Input()
  set selectedKey(String? value) {
    if (value == null || value.isEmpty) return;
    if (compiledSearches.any((s) => s['key'] == value)) {
      activeSearchKey = value;
      resultColumns = <Map<String, dynamic>>[];
      resultRows = <List<Object?>>[];
      errorMessage = null;
      hasSearched = false;
      truncated = false;
    }
  }

  @override
  void ngOnInit() {
    if (activeSearchKey.isEmpty && compiledSearches.isNotEmpty) {
      activeSearchKey = compiledSearches.first['key'] as String;
    }
  }

  Map<String, dynamic>? get activeSearch {
    for (final s in compiledSearches) {
      if (s['key'] == activeSearchKey) return s;
    }
    return null;
  }

  List<Map<String, dynamic>> get activeParameters {
    final s = activeSearch;
    if (s == null) return const <Map<String, dynamic>>[];
    return ((s['parameters'] as List?) ?? const [])
        .whereType<Map>()
        .map((m) => m.cast<String, dynamic>())
        .toList(growable: false);
  }

  String parameterValue(Object? key) =>
      _parameterValues[key?.toString() ?? ''] ?? '';

  void onSearchSelected(html.Event event) {
    final target = event.target;
    if (target is html.SelectElement && target.value != null) {
      activeSearchKey = target.value!;
      resultColumns = <Map<String, dynamic>>[];
      resultRows = <List<Object?>>[];
      errorMessage = null;
      hasSearched = false;
      truncated = false;
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
    runSearch();
  }

  String formatCell(Object? value) => value == null ? '' : value.toString();

  String rowHref(List<Object?> row) {
    final s = activeSearch;
    if (s == null) return '#/';
    final route = s['targetRouteSegment'] as String? ?? '';
    final boundOrd = s['boundOrdinal'] as int? ?? 0;
    final rawId =
        (boundOrd >= 0 && boundOrd < row.length) ? (row[boundOrd]?.toString() ?? '') : '';
    if (rawId.isEmpty) {
      return '#/access-form/${Uri.encodeComponent(route)}';
    }
    return '#/access-form/${Uri.encodeComponent(route)}?id=${Uri.encodeComponent(rawId)}';
  }

  Future<void> runSearch() async {
    final s = activeSearch;
    if (s == null || loading) return;
    final queryKey = s['queryKey'] as String? ?? '';
    if (queryKey.isEmpty) return;
    loading = true;
    errorMessage = null;
    hasSearched = true;
    truncated = false;
    resultColumns = <Map<String, dynamic>>[];
    resultRows = <List<Object?>>[];
    try {
      final paramsPayload = <String, Object?>{};
      for (final param in activeParameters) {
        final key = param['key'] as String;
        final rawVal = _parameterValues[key] ?? '';
        final daoType = param['daoType'] as int? ?? 10;
        final isNonText = daoType == 3 ||
            daoType == 4 ||
            daoType == 5 ||
            daoType == 6 ||
            daoType == 7 ||
            daoType == 8 ||
            daoType == 18;
        paramsPayload[key] =
            (isNonText && rawVal.trim().isEmpty) ? null : rawVal;
      }
      final response = await _api.getJson(
        '/access-queries/${Uri.encodeComponent(queryKey)}',
        queryParameters: <String, String>{
          'parameters': jsonEncode(paramsPayload),
          'limit': '100',
        },
      );
      if (response is! Map) {
        throw const FormatException('Resposta invalida da pesquisa.');
      }
      resultColumns = ((response['columns'] as List?) ?? const [])
          .whereType<Map>()
          .map((c) => c.cast<String, dynamic>())
          .toList(growable: false);
      resultRows = ((response['rows'] as List?) ?? const [])
          .whereType<List>()
          .map((row) => row.cast<Object?>())
          .toList(growable: false);
      truncated = response['truncated'] == true;
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      loading = false;
    }
  }
}
''';

String _buildAccessSearchPanelHtml() {
  return r'''<section class="access-search-panel">
  <div class="card mb-3" *ngIf="compiledSearches.isEmpty">
    <div class="card-body">
      <p class="mb-0">Nenhum formulario de pesquisa disponivel neste projeto.</p>
    </div>
  </div>
  <div class="card mb-3" *ngIf="compiledSearches.isNotEmpty">
    <div class="card-body">
      <h4 class="mb-3">Pesquisas de Registros</h4>
      <form (submit)="onSubmit($event)">
        <div class="mb-3">
          <label class="form-label">Pesquisa</label>
          <select class="form-select" (change)="onSearchSelected($event)">
            <option *ngFor="let item of compiledSearches" [value]="item['key']" [selected]="activeSearchKey == item['key']">{{ item['title'] }}</option>
          </select>
        </div>
        <div class="mb-3" *ngFor="let param of activeParameters">
          <label class="form-label">{{ param['label'] }}</label>
          <input type="text" class="form-control" [attr.data-access-search-param]="param['key']" [value]="parameterValue(param['key'])" (input)="onParameterInput(param['key'], $event)">
        </div>
        <button type="submit" class="btn btn-primary" [disabled]="loading">Pesquisar</button>
      </form>
      <p class="mt-3 mb-0 text-muted" *ngIf="loading">Pesquisando registros...</p>
      <div class="alert alert-danger mt-3 mb-0" *ngIf="errorMessage != null">{{ errorMessage }}</div>
      <p class="mt-3 mb-0 text-warning" *ngIf="truncated">Resultado limitado as primeiras 100 linhas.</p>
      <p class="mt-3 mb-0" *ngIf="hasSearched && !loading && errorMessage == null && resultRows.isEmpty">Nenhum registro encontrado.</p>
    </div>
  </div>
  <div class="card" *ngIf="resultRows.isNotEmpty">
    <div class="card-body table-responsive">
      <table class="table table-sm table-striped table-bordered mb-0">
        <thead>
          <tr>
            <th>Acao</th>
            <th *ngFor="let col of resultColumns">{{ col['name'] }}</th>
          </tr>
        </thead>
        <tbody>
          <tr *ngFor="let row of resultRows">
            <td><a class="btn btn-sm btn-outline-primary" [href]="rowHref(row)">Abrir</a></td>
            <td *ngFor="let cell of row">{{ formatCell(cell) }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>
''';
}

String _buildAccessSearchPanelScss() {
  return '''.access-search-panel {
  max-width: 1200px;
}
''';
}
