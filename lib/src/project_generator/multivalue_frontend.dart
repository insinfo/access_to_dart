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
      final childKey = child?.primaryKey?.columns.length == 1
          ? child?.columns
              .where((c) => c.name == child.primaryKey?.columns.single.name)
              .toList()
          : null;
      final formProperties = forms.single['properties'] as Map?;
      bool defaultTrue(Object? value) => value == null || value == '-1';
      bool defaultFalse(Object? value) => value == null || value == '0';
      final writeAllowed = supported &&
          properties != null &&
          formProperties != null &&
          defaultTrue(formProperties['AllowEdits']) &&
          defaultTrue(properties['Enabled']) &&
          defaultFalse(properties['Locked']) &&
          (properties['ColumnCount'] == null ||
              properties['ColumnCount'] == '1') &&
          (properties['BoundColumn'] == null ||
              properties['BoundColumn'] == '1') &&
          options.isNotEmpty &&
          options.every((v) => v.isNotEmpty) &&
          options.map((v) => v.toLowerCase()).toSet().length ==
              options.length &&
          properties['LimitToList'] == 'NotDefault' &&
          ((control['events'] as Map?)?.isEmpty ?? true) &&
          ((control['macroDefinitions'] as Map?)?.isEmpty ?? true) &&
          childKey?.length == 1 &&
          childKey!.single.isAutoNumber &&
          _routeParameterType(childKey.single) == 'int' &&
          child.columns
                  .singleWhere((c) => c.name == child.complexValueColumn)
                  .typeName ==
              'Text';
      result.add({
        'key': columnRuntimeName(column),
        'control': control['name'],
        'title': control['caption'] ?? column.name,
        'controlType': control['type'],
        'options': options,
        'readOnly': !writeAllowed,
        'writeAllowed': writeAllowed,
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
 [resetVersion]="collectionResetVersion"
 (pendingChange)="collectionPendingChanged(\$event)"
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
import 'dart:async';
import 'package:ngdart/angular.dart';
import '../utils/dialogs.dart';
import '../services/api_http_service.dart';

@Component(
 selector: 'access-multivalue-panel',
 directives: [coreDirectives],
 template: '''
<section class="card mt-3">
 <div class="card-header"><strong>{{title}}</strong><span *ngIf="!canEdit"> — somente leitura</span></div>
 <div class="card-body">
  <p>Valores salvos da coleção. As mudanças de seleção só são gravadas em Salvar coleção, separadamente dos demais campos.</p>
  <p *ngIf="writeAllowed">Esta operação grava somente a coleção; outros eventos VBA do formulário não são executados.</p>
  <p *ngIf="unsupportedReason.isNotEmpty" class="text-warning">{{unsupportedReason}}</p>
  <p *ngIf="unsupportedReason.isEmpty && parentId == null">Registro novo: a coleção poderá ser consultada após salvar o registro principal.</p>
  <p *ngIf="loading">Carregando coleção...</p>
  <p *ngIf="error != null" class="text-danger">{{error}}</p>
  <div *ngIf="parentId != null && unsupportedReason.isEmpty">
   <button type="button" class="btn btn-sm btn-outline-secondary mb-2" (click)="load()" [disabled]="loading || saving">Atualizar coleção</button>
   <p *ngIf="!loading && error == null && values.isEmpty">Nenhum valor selecionado.</p>
   <p *ngIf="truncated" class="text-warning">Exibindo somente os primeiros 100 valores. A coleção possui outros valores.</p>
   <ul *ngIf="values.isNotEmpty"><li *ngFor="let value of values">{{display(value)}}</li></ul>
  </div>
  <div *ngIf="options.isNotEmpty">
   <p>Opções do controle de origem:</p>
   <label class="form-check" *ngFor="let option of options">
    <input type="checkbox" class="form-check-input" [disabled]="!canEdit" [checked]="isSelected(option)" (change)="toggle(option)">
    <span class="form-check-label">{{option}}</span>
   </label>
  </div>
  <p *ngIf="writeAllowed && parentId != null && !loading && error == null && !serverEditable" class="text-warning">{{readOnlyReason}}</p>
  <p *ngIf="dirty" class="text-warning">Alterações da coleção ainda não salvas.</p>
  <p *ngIf="savedMessage != null" class="text-success">{{savedMessage}}</p>
  <div *ngIf="canEdit || saving">
   <button type="button" class="btn btn-primary" (click)="save()" [disabled]="!dirty || saving">Salvar coleção</button>
   <button type="button" class="btn btn-outline-secondary" (click)="discard()" [disabled]="!dirty || saving">Descartar seleção</button>
  </div>
 </div>
</section>
''',
)
class AccessMultivaluePanel implements AfterChanges, OnDestroy {
 @Input() Object? parentId;
 @Input() String descriptorBase64 = '';
 @Input() int resetVersion = 0;
 final _pending = StreamController<Map<String, Object>>.broadcast(sync: true);
 @Output() Stream<Map<String, Object>> get pendingChange => _pending.stream;
 bool writeAllowed = false;
 bool serverEditable = false;
 bool saving = false;
 String revision = '';
 String? savedMessage;
 String readOnlyReason = '';
 Set<String> draft = <String>{};
 bool get dirty => serverEditable && (draft.length != values.length || !values.every(draft.contains));
 bool get canEdit => parentId != null && writeAllowed && serverEditable && !loading && !saving;
 void _notify() => _pending.add({'fieldKey': fieldKey, 'pending': dirty || saving, 'saving': saving});
 String get endpoint => '/${Uri.encodeComponent(module)}/${Uri.encodeComponent(parentId.toString())}/collections/${Uri.encodeComponent(fieldKey)}';
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
  writeAllowed = descriptor['writeAllowed'] == true;
  load(force: true);
 }
 @override
 void ngOnDestroy() { _request++; _pending.close(); }
 bool isSelected(String option) => serverEditable ? draft.contains(option) : values.contains(option);
 void toggle(String option) {
  if (!canEdit) return;
  if (!draft.remove(option)) draft.add(option);
  savedMessage = null; _notify();
 }
 void discard() {
  if (saving || !SimpleDialogComponent.showConfirm('Descartar a seleção ainda não salva?')) return;
  draft = values.whereType<String>().toSet(); error = null; savedMessage = null; _notify();
 }
 void _accept(dynamic response) {
  if (response is! Map || response['values'] is! List || response['truncated'] is! bool) throw const FormatException('Invalid collection response');
  final rows = response['values'] as List;
  if (rows.any((row) => row is! Map || !row.containsKey('value'))) throw const FormatException('Invalid collection row');
  values = rows.map<Object?>((row) => row['value']).toList();
  truncated = response['truncated'] as bool;
  revision = response['revision'] as String? ?? '';
  readOnlyReason = response['readOnlyReason'] as String? ?? 'Seleção indisponível para edição: valores legados, repetidos, nulos ou coleção incompleta. Nenhum valor será descartado automaticamente.';
  serverEditable = writeAllowed && response['editable'] == true && revision.isNotEmpty;
  draft = values.whereType<String>().toSet();
 }
 Future<void> save() async {
  if (!canEdit || !dirty) return;
  final request = _request;
  saving = true; error = null; savedMessage = null; _notify();
  try {
   final response = await _api.putJson(endpoint, {'values': options.where(draft.contains).toList(), 'revision': revision});
   if (request != _request) return;
   _accept(response); savedMessage = 'Coleção salva.';
  } catch (_) {
   if (request == _request) error = 'Não foi possível salvar. A seleção foi mantida nesta tela; atualize a coleção para conferir conflitos antes de tentar novamente.';
  } finally {
   if (request == _request) { saving = false; _notify(); }
  }
 }
 String display(Object? value) => value == null ? '(valor nulo)' : value == '' ? '(texto vazio)' : value.toString();
 Future<void> load({bool force = false}) async {
  if (!force && (saving || (dirty && !SimpleDialogComponent.showConfirm('Descartar a seleção ainda não salva e recarregar?')))) return;
  final request = ++_request;
  values = <Object?>[]; draft = <String>{}; error = null; savedMessage = null;
  truncated = false; loading = false; serverEditable = false; saving = false;
  _notify();
  if (parentId == null || unsupportedReason.isNotEmpty) return;
  loading = true;
  try {
   final response = await _api.getJson(endpoint);
   if (request != _request) return;
   _accept(response); _notify();
  } catch (_) {
   if (request == _request) error = 'Não foi possível carregar a coleção. Tente atualizar novamente.';
  } finally {
   if (request == _request) loading = false;
  }
 }
}
""";
