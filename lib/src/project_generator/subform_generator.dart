part of 'project_generator.dart';

extension _SubformGenerator on ProjectGenerator {
  T? _uniqueSubformName<T>(
      Iterable<T> candidates, String requested, String Function(T) name) {
    final exact = candidates
        .where((candidate) =>
            name(candidate).toLowerCase() == requested.toLowerCase())
        .toList();
    if (exact.isNotEmpty) return exact.length == 1 ? exact.single : null;
    final folded = candidates
        .where((candidate) =>
            AnalysisProject.lookupKey(name(candidate)) ==
            AnalysisProject.lookupKey(requested))
        .toList();
    return folded.length == 1 ? folded.single : null;
  }

  List<Map<String, Object?>> _subformDescriptors(
      AnalysisProject project, AnalysisTable parent) {
    final form = _resolveFrontendForm(project, parent);
    if (form == null) return const [];
    final result = <Map<String, Object?>>[];
    for (final control in form.controls) {
      if (control.type.toLowerCase() != 'subform') continue;
      final descriptor = <String, Object?>{
        'key': 'subform_${result.length}',
        'title': control.caption ?? control.name,
        'sourceObject': control.sourceObject,
      };
      String? reason;
      AnalysisForm? childForm;
      AnalysisTable? childTable;
      final sourceObject = control.sourceObject ?? '';
      if (sourceObject.toLowerCase().startsWith('form.')) {
        childForm = _uniqueSubformName(
            project.forms, sourceObject.substring(5), (form) => form.name);
      }
      if (childForm == null) {
        reason = 'Formulario de origem indisponivel ou ambiguo.';
      } else {
        final recordSource = childForm.recordSource ?? '';
        // Recover the requested table spelling, then validate the entire SQL
        // against that table. Never fall back to another folded name when an
        // exact table exists but its projected columns are incompatible.
        final isSelect = RegExp(r'^\s*SELECT\b', caseSensitive: false)
            .hasMatch(recordSource);
        final from = isSelect
            ? RegExp(r'\bFROM\s+(\[(?:[^\]]|\]\])+\]|[^\s;]+)\s*;?\s*$',
                    caseSensitive: false)
                .firstMatch(recordSource)
            : null;
        var tableName = from?.group(1) ?? recordSource;
        if (tableName.startsWith('[') && tableName.endsWith(']')) {
          tableName = tableName
              .substring(1, tableName.length - 1)
              .replaceAll(']]', ']');
        }
        childTable = _uniqueSubformName(
            scaffoldTables(project), tableName, (table) => table.name);
        if (childTable != null &&
            isSelect &&
            !_isDirectTableProjection(recordSource, childTable)) {
          childTable = null;
        }
        if (childTable == null) {
          reason = 'Consulta do subformulario nao suportada ou origem ambigua.';
        }
        final rawForms = <Object?>[
          ...((project.raw['forms'] as List?) ?? const []),
          ...(((project.raw['source_overlay'] as Map?)?['forms'] as List?) ??
              const []),
        ];
        var hasSourceProperties = false;
        for (final raw in rawForms.whereType<Map>()) {
          if ((raw['name'] as String? ?? '').toLowerCase() !=
              childForm.name.toLowerCase()) {
            continue;
          }
          hasSourceProperties = hasSourceProperties || raw['properties'] is Map;
          final properties = raw['properties'] as Map? ?? const {};
          if ((properties['Filter']?.toString().trim().isNotEmpty ?? false) ||
              (properties['OrderBy']?.toString().trim().isNotEmpty ?? false)) {
            reason =
                'Filtro ou ordenacao adicional do subformulario nao suportado.';
          }
        }
        if (!hasSourceProperties) {
          reason = 'Propriedades do formulario de origem indisponiveis.';
        }
      }
      final primaryKey = parent.primaryKey;
      if (primaryKey == null || primaryKey.columns.length != 1) {
        reason = 'Tabela pai precisa de chave primaria simples.';
      }
      List<String> fields(String? value) => (value ?? '')
          .split(';')
          .map((name) => name.trim().replaceAll(RegExp(r'^\[|\]$'), ''))
          .where((name) => name.isNotEmpty)
          .toList();
      final master = fields(control.linkMasterFields);
      final child = fields(control.linkChildFields);
      final links = <Map<String, String>>[];
      if (master.isEmpty || master.length != child.length) {
        reason = 'Vinculo mestre/detalhe ausente ou incompleto.';
      } else if (childTable != null) {
        AnalysisColumn? column(AnalysisTable table, String name) {
          for (final value in table.columns) {
            if (AnalysisProject.lookupKey(value.name) ==
                AnalysisProject.lookupKey(name)) {
              return value;
            }
          }
          return null;
        }

        for (var i = 0; i < master.length; i++) {
          var masterColumn = column(parent, master[i]);
          if (masterColumn == null) {
            for (final candidate in form.controls) {
              if (AnalysisProject.lookupKey(candidate.name) ==
                  AnalysisProject.lookupKey(master[i])) {
                masterColumn = column(parent, candidate.controlSource ?? '');
                break;
              }
            }
          }
          final childColumn = column(childTable, child[i]);
          if (masterColumn == null || childColumn == null) {
            reason = 'Campo de vinculo nao resolvido no esquema.';
            break;
          }
          links.add({
            'master': columnRuntimeName(masterColumn),
            'child': columnRuntimeName(childColumn),
          });
        }
      }
      descriptor['unsupportedReason'] = reason;
      if (reason == null && childTable != null) {
        descriptor.addAll({
          'parentTable': tableRuntimeName(parent),
          'parentPrimaryKey': columnRuntimeName(_getPrimaryKey(parent)),
          'parentKeyType': _routeParameterType(_getPrimaryKey(parent)),
          'childTable': tableRuntimeName(childTable),
          'links': links,
          'columns': _orderFrontendColumns(childTable, childForm)
              .where((column) =>
                  _resolveBoundControl(childForm, column) != null &&
                  !_isBinaryAttachmentColumn(column) &&
                  column.complexTypeClassification == null)
              .map((column) => {
                    'key': columnRuntimeName(column),
                    'label': _frontendFieldLabel(
                        column, _resolveBoundControl(childForm, column)),
                  })
              .toList(),
          'orderBy': childTable.primaryKey?.columns.length == 1
              ? columnRuntimeName(_getPrimaryKey(childTable))
              : null,
        });
      }
      if (reason == null && (descriptor['columns'] as List).isEmpty) {
        descriptor['unsupportedReason'] =
            'Nenhum campo vinculado disponivel para consulta.';
      }
      result.add(descriptor);
    }
    return result;
  }

  String _subformPanelHtml(AnalysisProject project, AnalysisTable parent) {
    final descriptors = _subformDescriptors(project, parent);
    return descriptors.map((descriptor) => '''
<access-subform-panel
  [parentId]="subformParentId"
  module="${_htmlTextLiteral(tableRouteName(parent))}"
  subformKey="${_htmlTextLiteral(descriptor['key'] as String)}"
  title="${_htmlTextLiteral(descriptor['title'] as String)}"
  unsupportedReason="${_htmlTextLiteral(descriptor['unsupportedReason'] as String? ?? '')}">
</access-subform-panel>
''').join();
  }

  Future<void> _generateSubformBackend(
      AnalysisProject project, Directory backendDir) async {
    final specifications = <String, Object?>{};
    for (final table in scaffoldTables(project)) {
      final descriptors = _subformDescriptors(project, table);
      specifications[tableRouteName(table)] = {
        for (final descriptor in descriptors)
          if (descriptor['unsupportedReason'] == null)
            descriptor['key'] as String: descriptor,
      };
    }
    final source = _subformBackendSource.replaceFirst(
        '/*SPECIFICATIONS*/', _dartStringLiteral(jsonEncode(specifications)));
    await File(p.join(backendDir.path, 'lib/src/shared/access_subforms.dart'))
        .writeAsString(source);
  }
}

const _subformBackendSource = r'''
import 'dart:convert';
import 'package:eloquent/eloquent.dart';
import 'package:shelf/shelf.dart';
import 'extensions/request_extension.dart';
import 'utils/api_utils.dart';

class AccessSubformController {
  static final Map<String, dynamic> specifications =
      (jsonDecode(/*SPECIFICATIONS*/) as Map).cast<String, dynamic>();

  static Future<Response> list(Request request, String module,
      String idRaw, String key) async {
    try {
      return responseJson(await loadRows(request.make<Connection>(), module, idRaw, key));
    } on ArgumentError catch (error) {
      return responseError(error.message.toString(), statusCode: 400);
    } on FormatException {
      return responseError('Identificador pai invalido.', statusCode: 400);
    } on StateError catch (error) {
      return responseError(error.message, statusCode: 404);
    } catch (_) {
      return responseError('Nao foi possivel carregar o subformulario.', statusCode: 500);
    }
  }

  static Future<Map<String, Object?>> loadRows(
      Connection db, String module, String idRaw, String key) async {
    final moduleSpec = specifications[module] as Map?;
    final descriptor = moduleSpec?[key] as Map?;
    if (descriptor == null) throw ArgumentError('Subformulario nao suportado.');
    final Object id;
    switch (descriptor['parentKeyType']) {
      case 'int': id = int.parse(idRaw); break;
      case 'double': id = double.parse(idRaw); break;
      default: id = idRaw;
    }
    final parent = await db.table(descriptor['parentTable'] as String)
        .where(descriptor['parentPrimaryKey'] as String, '=', id).first();
    if (parent == null) throw StateError('Registro pai nao encontrado.');
    final columns = (descriptor['columns'] as List).cast<Map>();
    final result = <String, Object?>{'columns': columns, 'rows': <Object?>[], 'truncated': false};
    final links = (descriptor['links'] as List).cast<Map>();
    if (links.isEmpty) throw StateError('Vinculo nao definido.');
    final query = db.table(descriptor['childTable'] as String);
    for (final link in links) {
      final value = parent[link['master']];
      // Null is not an instruction to remove the predicate or match all rows.
      if (value == null) return result;
      query.where(link['child'] as String, '=', value);
    }
    final orderBy = descriptor['orderBy'] as String?;
    if (orderBy != null) query.orderBy(orderBy);
    final rows = await query.limit(101).get();
    result['truncated'] = rows.length > 100;
    result['rows'] = rows.take(100).map((row) => {
      for (final column in columns) column['key'] as String: _jsonValue(row[column['key']]),
    }).toList();
    return result;
  }

  static Object? _jsonValue(Object? value) {
    if (value is DateTime) return value.toIso8601String();
    if (value is BigInt) return value.toString();
    return value;
  }
}
''';

const _subformPanelSource = r"""
import 'package:ngdart/angular.dart';
import '../services/api_http_service.dart';

@Component(
  selector: 'access-subform-panel',
  directives: [coreDirectives],
  template: '''
<section class="card mt-3">
  <div class="card-header"><strong>{{title}}</strong> — consulta de registros relacionados</div>
  <div class="card-body">
    <p class="text-muted">Consulta vinculada aos dados salvos do registro principal. Alterações não salvas ainda não são consideradas.</p>
    <p *ngIf="unsupportedReason.isNotEmpty" class="text-warning">{{unsupportedReason}}</p>
    <p *ngIf="unsupportedReason.isEmpty && parentId == null">Salve o registro principal para consultar os relacionados.</p>
    <p *ngIf="loading">Carregando...</p>
    <p *ngIf="error != null" class="text-danger">{{error}}</p>
    <div *ngIf="parentId != null && unsupportedReason.isEmpty">
      <button type="button" class="btn btn-sm btn-outline-secondary mb-2" (click)="load()" [disabled]="loading">Atualizar relacionados</button>
      <p *ngIf="!loading && error == null && rows.isEmpty">Nenhum registro relacionado.</p>
      <p *ngIf="truncated">Exibindo os primeiros 100 registros relacionados.</p>
      <div class="table-responsive" *ngIf="rows.isNotEmpty">
        <table class="table table-sm"><thead><tr><th *ngFor="let column of columns">{{column['label']}}</th></tr></thead>
          <tbody><tr *ngFor="let row of rows"><td *ngFor="let column of columns">{{cell(row, column)}}</td></tr></tbody>
        </table>
      </div>
    </div>
  </div>
</section>
''',
)
class AccessSubformPanel implements AfterChanges, OnDestroy {
  @Input() Object? parentId;
  @Input() String module = '';
  @Input() String subformKey = '';
  @Input() String title = '';
  @Input() String unsupportedReason = '';
  final ApiHttpService _api = ApiHttpService('/api/v1');
  List<Map> columns = <Map>[];
  List<Map> rows = <Map>[];
  String? error;
  bool loading = false;
  bool truncated = false;
  int _request = 0;

  @override
  void ngAfterChanges() { load(); }

  @override
  void ngOnDestroy() { _request++; }

  Future<void> load() async {
    final request = ++_request;
    columns = <Map>[]; rows = <Map>[]; error = null; truncated = false;
    loading = false;
    if (parentId == null || unsupportedReason.isNotEmpty) return;
    loading = true;
    try {
      final response = await _api.getJson('/${Uri.encodeComponent(module)}/'
          '${Uri.encodeComponent(parentId.toString())}/subforms/${Uri.encodeComponent(subformKey)}');
      if (request != _request) return;
      final data = response as Map;
      columns = (data['columns'] as List).cast<Map>();
      rows = (data['rows'] as List).cast<Map>();
      truncated = data['truncated'] == true;
    } catch (_) {
      if (request == _request) error = 'Nao foi possivel carregar os registros relacionados.';
    } finally {
      if (request == _request) loading = false;
    }
  }

  String cell(Map row, Map column) => row[column['key']]?.toString() ?? '';
}
""";
