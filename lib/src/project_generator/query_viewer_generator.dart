part of 'project_generator.dart';

extension _AccessQueryViewerGenerator on ProjectGenerator {
  List<Map<String, Object?>> _catalogQueryDescriptors(AnalysisProject project) {
    final catalog = _compileCatalogQueries(project);
    final items = <Map<String, Object?>>[];
    for (final entry in catalog.specifications.entries) {
      if (entry.key.startsWith('_rpt_')) continue;
      final spec = entry.value;
      final name = (spec['name']?.toString() ?? entry.key).trim();
      if (name.isEmpty || name.startsWith('~')) continue;
      items.add(<String, Object?>{
        'key': entry.key,
        'name': name,
        'parameters': spec['parameters'] ?? const [],
        'columns': spec['columns'] ?? const [],
        'ordering': spec['ordering'] ?? 'unspecified',
      });
    }
    items.sort((a, b) => (a['name'] as String)
        .toLowerCase()
        .compareTo((b['name'] as String).toLowerCase()));
    return items;
  }
}

String _buildAccessQueryViewerDartSource(List<Map<String, Object?>> queries) {
  final encoded = _dartStringLiteral(jsonEncode(queries));
  return _accessQueryViewerDartTemplate.replaceFirst('/*COMPILED_QUERIES*/', encoded);
}

const _accessQueryViewerDartTemplate = r'''import 'dart:convert';
import 'dart:html' as html;

import 'package:ngdart/angular.dart';

import '../services/api_http_service.dart';

@Component(
  selector: 'access-query-viewer',
  templateUrl: 'access_query_viewer.html',
  styleUrls: ['access_query_viewer.css'],
  directives: [coreDirectives],
)
class AccessQueryViewer implements OnInit {
  static final List<Map<String, dynamic>> compiledQueries =
      (jsonDecode(/*COMPILED_QUERIES*/) as List).cast<Map<String, dynamic>>();

  final ApiHttpService _api = ApiHttpService('/api/v1');
  final Map<String, String> _parameterValues = <String, String>{};

  String filterText = '';
  String activeQueryKey = compiledQueries.isEmpty
      ? ''
      : compiledQueries.first['key'] as String;
  bool loading = false;
  bool hasSearched = false;
  bool truncated = false;
  String? errorMessage;
  List<Map<String, dynamic>> resultColumns = <Map<String, dynamic>>[];
  List<List<Object?>> resultRows = <List<Object?>>[];

  @Input()
  set selectedKey(String? value) {
    if (value == null || value.isEmpty) return;
    if (compiledQueries.any((q) => q['key'] == value)) {
      activeQueryKey = value;
      resultColumns = <Map<String, dynamic>>[];
      resultRows = <List<Object?>>[];
      errorMessage = null;
      hasSearched = false;
      truncated = false;
    }
  }

  @override
  void ngOnInit() {
    if (activeQueryKey.isEmpty && compiledQueries.isNotEmpty) {
      activeQueryKey = compiledQueries.first['key'] as String;
    }
  }

  List<Map<String, dynamic>> get filteredQueries {
    final needle = filterText.trim().toLowerCase();
    if (needle.isEmpty) return compiledQueries;
    return compiledQueries.where((q) {
      final name = (q['name']?.toString() ?? '').toLowerCase();
      final key = (q['key']?.toString() ?? '').toLowerCase();
      return name.contains(needle) || key.contains(needle);
    }).toList(growable: false);
  }

  Map<String, dynamic>? get activeQuery {
    for (final q in compiledQueries) {
      if (q['key'] == activeQueryKey) return q;
    }
    return null;
  }

  List<Map<String, dynamic>> get activeParameters {
    final q = activeQuery;
    if (q == null) return const <Map<String, dynamic>>[];
    return ((q['parameters'] as List?) ?? const [])
        .whereType<Map>()
        .map((m) => m.cast<String, dynamic>())
        .toList(growable: false);
  }

  String parameterValue(Object? key) =>
      _parameterValues[key?.toString() ?? ''] ?? '';

  void onFilterInput(html.Event event) {
    final target = event.target;
    if (target is html.InputElement) {
      filterText = target.value ?? '';
    }
  }

  void onQuerySelected(html.Event event) {
    final target = event.target;
    if (target is html.SelectElement && target.value != null) {
      activeQueryKey = target.value!;
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
    loadQuery();
  }

  String formatCell(Object? value) => value == null ? '' : value.toString();

  Future<void> loadQuery() async {
    if (activeQueryKey.isEmpty || loading) return;
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
        '/access-queries/${Uri.encodeComponent(activeQueryKey)}',
        queryParameters: <String, String>{
          'parameters': jsonEncode(paramsPayload),
          'limit': '100',
        },
      );
      if (response is! Map) {
        throw const FormatException('Resposta invalida da consulta.');
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

String _buildAccessQueryViewerHtml() {
  return r'''<section class="access-query-viewer">
  <div class="card mb-3" *ngIf="compiledQueries.isEmpty">
    <div class="card-body">
      <p class="mb-0">Nenhuma consulta compilada disponivel neste projeto.</p>
    </div>
  </div>
  <div class="card mb-3" *ngIf="compiledQueries.isNotEmpty">
    <div class="card-body">
      <h4 class="mb-3">Consultas Compiladas (Somente Leitura)</h4>
      <div class="mb-3">
        <label class="form-label">Filtrar consulta</label>
        <input type="text" class="form-control" [value]="filterText" (input)="onFilterInput($event)" placeholder="Filtrar consultas por nome...">
      </div>
      <form (submit)="onSubmit($event)">
        <div class="mb-3">
          <label class="form-label">Consulta</label>
          <select class="form-select" (change)="onQuerySelected($event)">
            <option *ngFor="let query of filteredQueries" [value]="query['key']" [selected]="activeQueryKey == query['key']">{{ query['name'] }}</option>
          </select>
        </div>
        <div class="mb-3" *ngFor="let param of activeParameters">
          <label class="form-label">{{ param['sourceName'] }}</label>
          <input type="text" class="form-control" [attr.data-access-query-param]="param['key']" [value]="parameterValue(param['key'])" (input)="onParameterInput(param['key'], $event)">
        </div>
        <button type="submit" class="btn btn-primary" [disabled]="loading">Executar consulta</button>
      </form>
      <p class="mt-3 mb-0 text-muted" *ngIf="loading">Executando consulta...</p>
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
            <th *ngFor="let col of resultColumns">{{ col['name'] }}</th>
          </tr>
        </thead>
        <tbody>
          <tr *ngFor="let row of resultRows">
            <td *ngFor="let cell of row">{{ formatCell(cell) }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>
''';
}

String _buildAccessQueryViewerScss() {
  return '''.access-query-viewer {
  max-width: 1200px;
}
''';
}
