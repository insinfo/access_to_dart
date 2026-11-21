part of 'project_generator.dart';

extension _MultivalueFrontend on ProjectGenerator {
  Set<String> _multivalueFieldKeys(
      AnalysisProject project, AnalysisTable table) {
    final names = project.tables
        .where((t) =>
            t.isSyntheticMultiValueTable &&
            t.collectionParentTable == table.name)
        .map((t) => t.collectionParentColumn)
        .toSet();
    return table.columns
        .where((c) => c.allowMultipleValues == true || names.contains(c.name))
        .map(columnRuntimeName)
        .toSet();
  }

  List<Map<String, Object?>> _multivalueUiDescriptors(
      AnalysisProject project, AnalysisTable table) {
    final selected = _resolveFrontendForm(project, table);
    if (selected == null) return const [];
    final forms = ((project.raw['forms'] as List?) ?? const [])
        .whereType<Map>()
        .where((f) => f['name'] == selected.name)
        .toList();
    if (forms.length != 1) return const [];
    final controls = ((forms.single['controls'] as List?) ?? const [])
        .whereType<Map>()
        .toList();
    final result = <Map<String, Object?>>[];
    for (final column in table.columns.where((c) =>
        _multivalueFieldKeys(project, table).contains(columnRuntimeName(c)))) {
      final matches = controls
          .where((c) =>
              c['controlSource'] == column.name && c['type'] == 'ComboBox')
          .toList();
      if (matches.length != 1) continue;
      final control = matches.single;
      final children = project.tables
          .where((t) =>
              t.isSyntheticMultiValueTable &&
              t.collectionParentTable == table.name &&
              t.collectionParentColumn == column.name)
          .toList();
      final child = children.length == 1 ? children.single : null;
      final supported = child != null &&
          table.primaryKey?.columns.length == 1 &&
          child.primaryKey?.columns.length == 1 &&
          child.collectionLinkColumn != null &&
          child.complexValueColumn != null &&
          child.columns.map((c) => c.name).toSet().containsAll([
            child.collectionLinkColumn,
            child.complexValueColumn,
            child.primaryKey!.columns.single.name
          ]);
      final properties = control['properties'] as Map?;
      final options = properties?['RowSourceType'] == 'Value List' &&
              properties?['RowSource'] is String
          ? _parseAccessValueList(properties!['RowSource'] as String)
          : const <String>[];
      result.add({
        'key': columnRuntimeName(column),
        'control': control['name'],
        'title': control['caption'] ?? column.name,
        'controlType': control['type'],
        'options': options,
        'readOnly': true,
        'unsupportedReason': supported
            ? ''
            : 'Leitura desta coleção ainda indisponível: vínculo de origem incompleto.'
      });
    }
    return result;
  }

  String _multivaluePanelHtml(AnalysisProject project, AnalysisTable table) =>
      _multivalueUiDescriptors(project, table)
          .map((d) => '''
<access-multivalue-panel
 [parentId]="subformParentId"
 [descriptorBase64]="'${base64Encode(utf8.encode(jsonEncode({
                    ...d,
                    'module': tableRouteName(table)
                  })))}'">
</access-multivalue-panel>
''')
          .join();
}

const _multivaluePanelSource = r"""
import 'dart:convert';
import 'package:ngdart/angular.dart';
import '../services/api_http_service.dart';

@Component(
 selector: 'access-multivalue-panel',
 directives: [coreDirectives],
 template: '''
<section class="card mt-3">
 <div class="card-header"><strong>{{title}}</strong> — somente leitura</div>
 <div class="card-body">
  <p>Valores salvos da coleção. A edição desta coleção ainda não está disponível.</p>
  <p *ngIf="unsupportedReason.isNotEmpty" class="text-warning">{{unsupportedReason}}</p>
  <p *ngIf="unsupportedReason.isEmpty && parentId == null">Registro novo: a coleção poderá ser consultada após salvar o registro principal.</p>
  <p *ngIf="loading">Carregando coleção...</p>
  <p *ngIf="error != null" class="text-danger">{{error}}</p>
  <div *ngIf="parentId != null && unsupportedReason.isEmpty">
   <button type="button" class="btn btn-sm btn-outline-secondary mb-2" (click)="load()" [disabled]="loading">Atualizar coleção</button>
   <p *ngIf="!loading && error == null && values.isEmpty">Nenhum valor selecionado.</p>
   <p *ngIf="truncated" class="text-warning">Exibindo somente os primeiros 100 valores. A coleção possui outros valores.</p>
   <ul *ngIf="values.isNotEmpty"><li *ngFor="let value of values">{{display(value)}}</li></ul>
  </div>
  <div *ngIf="options.isNotEmpty">
   <p>Opções do controle de origem (somente leitura):</p>
   <label class="form-check" *ngFor="let option of options">
    <input type="checkbox" class="form-check-input" disabled [checked]="isSelected(option)">
    <span class="form-check-label">{{option}}</span>
   </label>
  </div>
 </div>
</section>
''',
)
class AccessMultivaluePanel implements AfterChanges, OnDestroy {
 @Input() Object? parentId;
 @Input() String descriptorBase64 = '';
 String module = '';
 String fieldKey = '';
 String title = '';
 String unsupportedReason = '';
 final ApiHttpService _api = ApiHttpService('/api/v1');
 List<Object?> values = <Object?>[];
 List<String> options = <String>[];
 String? error;
 bool loading = false;
 bool truncated = false;
 int _request = 0;
 @override
 void ngAfterChanges() {
  final descriptor = jsonDecode(utf8.decode(base64Decode(descriptorBase64))) as Map;
  module = descriptor['module'] as String;
  fieldKey = descriptor['key'] as String;
  title = descriptor['title'] as String;
  unsupportedReason = descriptor['unsupportedReason'] as String;
  options = (descriptor['options'] as List).cast<String>();
  load();
 }
 @override
 void ngOnDestroy() { _request++; }
 bool isSelected(String option) => values.contains(option);
 String display(Object? value) => value == null ? '(valor nulo)' : value == '' ? '(texto vazio)' : value.toString();
 Future<void> load() async {
  final request = ++_request;
  values = <Object?>[]; error = null; truncated = false; loading = false;
  if (parentId == null || unsupportedReason.isNotEmpty) return;
  loading = true;
  try {
   final response = await _api.getJson('/${Uri.encodeComponent(module)}/${Uri.encodeComponent(parentId.toString())}/collections/${Uri.encodeComponent(fieldKey)}');
   if (request != _request) return;
   if (response is! Map || response['values'] is! List || response['truncated'] is! bool) throw const FormatException('Invalid collection response');
   final rows = response['values'] as List;
   if (rows.any((row) => row is! Map || !row.containsKey('value'))) throw const FormatException('Invalid collection row');
   values = rows.map<Object?>((row) => row['value']).toList();
   truncated = response['truncated'] as bool;
  } catch (_) {
   if (request == _request) error = 'Não foi possível carregar a coleção. Tente atualizar novamente.';
  } finally {
   if (request == _request) loading = false;
  }
 }
}
""";
