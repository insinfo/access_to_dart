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
      Map<String, dynamic> effectiveChildRaw = const <String, dynamic>{};
      var hasChildSourceProps = false;
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
        Map<String, dynamic>? rawChildForm;
        Map<String, dynamic>? overlayChildForm;
        for (final raw in ((project.raw['forms'] as List?) ?? const []).whereType<Map>()) {
          if ((raw['name'] as String? ?? '').toLowerCase() ==
              childForm.name.toLowerCase()) {
            rawChildForm = raw.cast<String, dynamic>();
            break;
          }
        }
        for (final raw in (((project.raw['source_overlay'] as Map?)?['forms'] as List?) ?? const []).whereType<Map>()) {
          if ((raw['name'] as String? ?? '').toLowerCase() ==
              childForm.name.toLowerCase()) {
            overlayChildForm = raw.cast<String, dynamic>();
            break;
          }
        }
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
        effectiveChildRaw = <String, dynamic>{
          if (rawChildForm != null) ...rawChildForm,
          if (overlayChildForm != null && overlayChildForm['properties'] is Map)
            'properties': overlayChildForm['properties'],
          if (rawChildForm == null && overlayChildForm != null) ...overlayChildForm,
        };
        hasChildSourceProps = hasSourceProperties;
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
      if (reason == null && childTable != null && childForm != null) {
        final linkChildKeys = links.map((link) => link['child']!).toSet();
        final childColumns = _orderFrontendColumns(childTable, childForm)
            .where((column) =>
                _resolveBoundControl(childForm, column) != null &&
                !_isBinaryAttachmentColumn(column) &&
                column.complexTypeClassification == null)
            .map((column) {
              final runtimeName = columnRuntimeName(column);
              final baseType = column.dartType.endsWith('?')
                  ? column.dartType.substring(0, column.dartType.length - 1)
                  : column.dartType;
              final editable = !column.isAutoNumber &&
                  !column.isCalculated &&
                  !linkChildKeys.contains(runtimeName) &&
                  const {'String', 'int', 'double', 'bool', 'DateTime'}
                      .contains(baseType);
              return <String, Object?>{
                'key': runtimeName,
                'label': _frontendFieldLabel(
                    column, _resolveBoundControl(childForm, column)),
                'dartType': baseType,
                'inputType': _subformInputType(baseType),
                'isRequired': column.isRequired &&
                    column.allowZeroLength != true &&
                    (column.defaultValue == null ||
                        column.defaultValue!.trim().isEmpty),
                'editable': editable,
              };
            })
            .toList(growable: false);
        final childPk = childTable.primaryKey?.columns.length == 1
            ? _getPrimaryKey(childTable)
            : null;
        final childPkKey = childPk == null ? null : columnRuntimeName(childPk);
        final childPkType = childPk == null ? null : _routeParameterType(childPk);
        final childPkIsAuto = childPk?.isAutoNumber ?? false;
        final editableKeys = childColumns
            .where((c) => c['editable'] == true)
            .map((c) => c['key'] as String)
            .toSet();
        final missingRequiredColumns = childTable.columns.where((column) {
          if (column.isAutoNumber || column.isCalculated) return false;
          final runtimeName = columnRuntimeName(column);
          if (linkChildKeys.contains(runtimeName)) return false;
          if (column.defaultValue != null &&
              column.defaultValue!.trim().isNotEmpty) {
            return false;
          }
          if (!column.isRequired) return false;
          return !editableKeys.contains(runtimeName);
        }).toList(growable: false);
        final effectiveCaps = describeAccessFormCapabilities(
          <String, dynamic>{
            'name': childForm.name,
            'properties': const <String, dynamic>{},
            'controls': const <Object?>[],
            ...effectiveChildRaw,
          },
          hasSourceExport: hasChildSourceProps,
        );
        final childPerms =
            (effectiveCaps['source_form_permissions'] as Map?) ?? const {};
        final childEvents =
            (effectiveCaps['write_lifecycle_events'] as List?) ?? const [];
        final canCreate = editableKeys.isNotEmpty &&
            childPerms['create'] == true &&
            childEvents.isEmpty &&
            childPk != null &&
            (childPkIsAuto ||
                linkChildKeys.contains(childPkKey) ||
                editableKeys.contains(childPkKey)) &&
            missingRequiredColumns.isEmpty;
        final canDelete = childPerms['delete'] == true &&
            childEvents.isEmpty &&
            childPk != null;
        descriptor.addAll({
          'parentTable': tableRuntimeName(parent),
          'parentPrimaryKey': columnRuntimeName(_getPrimaryKey(parent)),
          'parentKeyType': _routeParameterType(_getPrimaryKey(parent)),
          'childTable': tableRuntimeName(childTable),
          'childPrimaryKey': childPkKey,
          'childPrimaryKeyType': childPkType,
          'childPrimaryKeyIsAutoNumber': childPkIsAuto,
          'canCreate': canCreate,
          'canDelete': canDelete,
          'links': links,
          'columns': childColumns,
          'orderBy': childPkKey,
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

  String _subformInputType(String baseType) {
    switch (baseType) {
      case 'int':
      case 'double':
        return 'number';
      case 'bool':
        return 'checkbox';
      case 'DateTime':
        return 'date';
      default:
        return 'text';
    }
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

class _SubformForbiddenError implements Exception {
  final String message;
  const _SubformForbiddenError(this.message);
}

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

  static Future<Response> create(Request request, String module,
      String idRaw, String key) async {
    try {
      final body = await request.bodyAsMap();
      return responseJson(
        await createRow(request.make<Connection>(), module, idRaw, key, body),
      );
    } on _SubformForbiddenError catch (error) {
      return responseError(error.message, statusCode: 403);
    } on ArgumentError catch (error) {
      return responseError(error.message.toString(), statusCode: 400);
    } on FormatException {
      return responseError('Dados ou identificador invalidos.', statusCode: 400);
    } on TypeError {
      return responseError('Corpo JSON invalido.', statusCode: 400);
    } on StateError catch (error) {
      return responseError(error.message, statusCode: 404);
    } catch (_) {
      return responseError('Nao foi possivel incluir o registro relacionado.', statusCode: 500);
    }
  }

  static Future<Response> delete(Request request, String module,
      String idRaw, String key, String childIdRaw) async {
    try {
      return responseJson(
        await deleteRow(request.make<Connection>(), module, idRaw, key, childIdRaw),
      );
    } on _SubformForbiddenError catch (error) {
      return responseError(error.message, statusCode: 403);
    } on ArgumentError catch (error) {
      return responseError(error.message.toString(), statusCode: 400);
    } on FormatException {
      return responseError('Identificador invalido.', statusCode: 400);
    } on StateError catch (error) {
      return responseError(error.message, statusCode: 404);
    } catch (_) {
      return responseError('Nao foi possivel excluir o registro relacionado.', statusCode: 500);
    }
  }

  static Object _parseKeyValue(String raw, String? keyType) {
    switch (keyType) {
      case 'int':
        return int.parse(raw);
      case 'double':
        final parsed = double.parse(raw);
        if (!parsed.isFinite) throw const FormatException('Non-finite ID');
        return parsed;
      default:
        return raw;
    }
  }

  static Future<({Map descriptor, Map<String, dynamic> parent})> _loadContext(
      Connection db, String module, String idRaw, String key) async {
    final moduleSpec = specifications[module] as Map?;
    final descriptor = moduleSpec?[key] as Map?;
    if (descriptor == null) throw ArgumentError('Subformulario nao suportado.');
    final id = _parseKeyValue(idRaw, descriptor['parentKeyType'] as String?);
    final parent = await db
        .table(descriptor['parentTable'] as String)
        .where(descriptor['parentPrimaryKey'] as String, '=', id)
        .first();
    if (parent == null) throw StateError('Registro pai nao encontrado.');
    return (
      descriptor: descriptor,
      parent: Map<String, dynamic>.from(parent),
    );
  }

  static Map<String, Object?> _formatRow(
      Map row, List<Map> columns, String? childPk) {
    final formatted = <String, Object?>{
      for (final column in columns)
        column['key'] as String: _jsonValue(row[column['key']]),
    };
    if (childPk != null && row.containsKey(childPk)) {
      formatted['__pk'] = _jsonValue(row[childPk]);
    }
    return formatted;
  }

  static Future<Map<String, Object?>> loadRows(
      Connection db, String module, String idRaw, String key) async {
    final ctx = await _loadContext(db, module, idRaw, key);
    final descriptor = ctx.descriptor;
    final parent = ctx.parent;
    final columns = (descriptor['columns'] as List).cast<Map>();
    final childPk = descriptor['childPrimaryKey'] as String?;
    final result = <String, Object?>{
      'columns': columns,
      'rows': <Object?>[],
      'truncated': false,
      'canCreate': descriptor['canCreate'] == true,
      'canDelete': descriptor['canDelete'] == true,
      'childPrimaryKey': childPk,
    };
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
    result['rows'] = rows
        .take(100)
        .map((row) => _formatRow(row, columns, childPk))
        .toList();
    return result;
  }

  static Object? _coerceEditableValue(Object? rawValue, Map column) {
    final dartType = column['dartType'] as String? ?? 'String';
    final label = column['label']?.toString() ?? column['key'].toString();
    final isRequired = column['isRequired'] == true;
    if (rawValue == null) {
      if (isRequired) throw ArgumentError('Campo obrigatorio: $label.');
      return null;
    }
    if (rawValue is String && rawValue.trim().isEmpty) {
      if (dartType != 'String') {
        if (isRequired) throw ArgumentError('Campo obrigatorio: $label.');
        return null;
      }
      if (isRequired) throw ArgumentError('Campo obrigatorio: $label.');
      return '';
    }
    switch (dartType) {
      case 'int':
        if (rawValue is int) return rawValue;
        if (rawValue is num) return rawValue.toInt();
        final parsedInt = int.tryParse(rawValue.toString().trim());
        if (parsedInt == null) {
          throw ArgumentError('Valor inteiro invalido para $label.');
        }
        return parsedInt;
      case 'double':
        if (rawValue is num) return rawValue.toDouble();
        final parsedDouble = double.tryParse(
          rawValue.toString().trim().replaceAll(',', '.'),
        );
        if (parsedDouble == null || !parsedDouble.isFinite) {
          throw ArgumentError('Valor numerico invalido para $label.');
        }
        return parsedDouble;
      case 'bool':
        if (rawValue is bool) return rawValue;
        if (rawValue is num) return rawValue != 0;
        final text = rawValue.toString().trim().toLowerCase();
        if (text == 'true' || text == '1' || text == 'sim') return true;
        if (text == 'false' || text == '0' || text == 'nao') return false;
        throw ArgumentError('Valor booleano invalido para $label.');
      case 'DateTime':
        final dt = rawValue is DateTime
            ? rawValue
            : DateTime.tryParse(rawValue.toString().trim());
        if (dt == null) {
          throw ArgumentError('Data invalida para $label.');
        }
        return dt.toIso8601String();
      default:
        return rawValue.toString();
    }
  }

  static Future<Map<String, Object?>> createRow(Connection db, String module,
      String idRaw, String key, Map<String, dynamic> body) async {
    final ctx = await _loadContext(db, module, idRaw, key);
    final descriptor = ctx.descriptor;
    final parent = ctx.parent;
    if (descriptor['canCreate'] != true) {
      throw const _SubformForbiddenError(
        'Inclusao neste subformulario desabilitada pelas permissoes do formulario Access.',
      );
    }
    final links = (descriptor['links'] as List).cast<Map>();
    if (links.isEmpty) throw StateError('Vinculo nao definido.');
    final payload = <String, dynamic>{};
    for (final link in links) {
      final value = parent[link['master']];
      if (value == null) {
        throw ArgumentError('Chave de vinculo do registro pai ausente.');
      }
      payload[link['child'] as String] = value;
    }
    final columns = (descriptor['columns'] as List).cast<Map>();
    for (final column in columns) {
      if (column['editable'] != true) continue;
      final colKey = column['key'] as String;
      final hasKey = body.containsKey(colKey);
      if (!hasKey && column['isRequired'] != true) continue;
      final coerced = _coerceEditableValue(body[colKey], column);
      if (coerced != null || hasKey) {
        payload[colKey] = coerced;
      }
    }
    final childTable = descriptor['childTable'] as String;
    final childPk = descriptor['childPrimaryKey'] as String?;
    final childPkIsAuto = descriptor['childPrimaryKeyIsAutoNumber'] == true;
    Map<String, dynamic>? saved;
    if (childPk != null && childPkIsAuto) {
      payload.remove(childPk);
      final insertedId = await db.table(childTable).insertGetId(payload, childPk);
      if (insertedId != null) {
        final reloaded =
            await db.table(childTable).where(childPk, '=', insertedId).first();
        if (reloaded != null) saved = Map<String, dynamic>.from(reloaded);
      }
    } else {
      await db.table(childTable).insert(payload);
      if (childPk != null && payload[childPk] != null) {
        final reloaded = await db
            .table(childTable)
            .where(childPk, '=', payload[childPk])
            .first();
        if (reloaded != null) saved = Map<String, dynamic>.from(reloaded);
      }
    }
    return _formatRow(saved ?? payload, columns, childPk);
  }

  static Future<Map<String, Object?>> deleteRow(Connection db, String module,
      String idRaw, String key, String childIdRaw) async {
    final ctx = await _loadContext(db, module, idRaw, key);
    final descriptor = ctx.descriptor;
    final parent = ctx.parent;
    final childPk = descriptor['childPrimaryKey'] as String?;
    if (descriptor['canDelete'] != true || childPk == null) {
      throw const _SubformForbiddenError(
        'Exclusao neste subformulario desabilitada pelas permissoes do formulario Access.',
      );
    }
    final childId = _parseKeyValue(
      childIdRaw,
      descriptor['childPrimaryKeyType'] as String?,
    );
    final links = (descriptor['links'] as List).cast<Map>();
    if (links.isEmpty) throw StateError('Vinculo nao definido.');
    final query = db
        .table(descriptor['childTable'] as String)
        .where(childPk, '=', childId);
    for (final link in links) {
      final value = parent[link['master']];
      if (value == null) {
        throw ArgumentError('Chave de vinculo do registro pai ausente.');
      }
      query.where(link['child'] as String, '=', value);
    }
    final affected = await query.delete();
    if (affected == 0) {
      throw StateError('Registro relacionado nao encontrado.');
    }
    return const <String, Object?>{'success': true};
  }

  static Object? _jsonValue(Object? value) {
    if (value is DateTime) return value.toIso8601String();
    if (value is BigInt) return value.toString();
    return value;
  }
}
''';

const _subformPanelSource = r"""
import 'dart:html' as html;
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
      <button type="button" class="btn btn-sm btn-outline-secondary mb-2" (click)="load()" [disabled]="loading || saving">Atualizar relacionados</button>
      <p *ngIf="!loading && error == null && rows.isEmpty">Nenhum registro relacionado.</p>
      <p *ngIf="truncated">Exibindo os primeiros 100 registros relacionados.</p>
      <div class="table-responsive" *ngIf="rows.isNotEmpty">
        <table class="table table-sm">
          <thead>
            <tr>
              <th *ngFor="let column of columns">{{column['label']}}</th>
              <th *ngIf="canDelete">Ações</th>
            </tr>
          </thead>
          <tbody>
            <tr *ngFor="let row of rows">
              <td *ngFor="let column of columns">{{cell(row, column)}}</td>
              <td *ngIf="canDelete">
                <button type="button" class="btn btn-sm btn-outline-danger" [disabled]="saving || loading || !canDeleteRow(row)" (click)="deleteRow(row['__pk'])">Excluir</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div *ngIf="canCreate" class="border rounded p-2 mt-2">
        <div class="fw-semibold mb-2">Adicionar relacionado</div>
        <div class="row g-2">
          <div class="col-md-4" *ngFor="let column of editableColumns">
            <label class="form-label small mb-1">{{column['label']}}</label>
            <div *ngIf="isBoolColumn(column)" class="form-check pt-1">
              <input type="checkbox" class="form-check-input" [checked]="draftChecked(column['key'])" (change)="onDraftCheckbox(column['key'], \$event)">
            </div>
            <input *ngIf="!isBoolColumn(column)" [attr.type]="inputTypeFor(column)" class="form-control form-control-sm" [value]="draftValue(column['key'])" (input)="onDraftInput(column['key'], \$event)">
          </div>
        </div>
        <div class="mt-2 text-end">
          <button type="button" class="btn btn-sm btn-primary" [disabled]="saving || loading" (click)="submitCreate()">Adicionar</button>
        </div>
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
  final Map<String, Object?> draft = <String, Object?>{};
  String? childPrimaryKey;
  bool canCreate = false;
  bool canDelete = false;
  String? error;
  bool loading = false;
  bool saving = false;
  bool truncated = false;
  int _request = 0;

  List<Map> get editableColumns =>
      columns.where((column) => column['editable'] == true).toList(growable: false);

  @override
  void ngAfterChanges() { load(); }

  @override
  void ngOnDestroy() { _request++; }

  Future<void> load() async {
    final request = ++_request;
    columns = <Map>[]; rows = <Map>[]; error = null; truncated = false;
    canCreate = false; canDelete = false; childPrimaryKey = null;
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
      canCreate = data['canCreate'] == true;
      canDelete = data['canDelete'] == true;
      childPrimaryKey = data['childPrimaryKey']?.toString();
    } catch (_) {
      if (request == _request) error = 'Nao foi possivel carregar os registros relacionados.';
    } finally {
      if (request == _request) loading = false;
    }
  }

  bool isBoolColumn(Map column) => column['dartType'] == 'bool';

  String inputTypeFor(Map column) => column['inputType']?.toString() ?? 'text';

  String draftValue(Object? rawKey) {
    final key = rawKey?.toString() ?? '';
    return draft[key]?.toString() ?? '';
  }

  bool draftChecked(Object? rawKey) {
    final key = rawKey?.toString() ?? '';
    return draft[key] == true;
  }

  void onDraftInput(Object? rawKey, Object? event) {
    final key = rawKey?.toString() ?? '';
    if (key.isEmpty || event is! html.Event) return;
    final target = event.target;
    if (target is html.InputElement) {
      draft[key] = target.value ?? '';
    }
  }

  void onDraftCheckbox(Object? rawKey, Object? event) {
    final key = rawKey?.toString() ?? '';
    if (key.isEmpty || event is! html.Event) return;
    final target = event.target;
    if (target is html.InputElement) {
      draft[key] = target.checked == true;
    }
  }

  bool canDeleteRow(Map row) =>
      canDelete && childPrimaryKey != null && row['__pk'] != null;

  Future<void> submitCreate() async {
    if (saving || parentId == null || unsupportedReason.isNotEmpty || !canCreate) {
      return;
    }
    saving = true;
    error = null;
    try {
      final payload = <String, Object?>{};
      for (final column in editableColumns) {
        final key = column['key']?.toString() ?? '';
        if (key.isEmpty) continue;
        if (column['dartType'] == 'bool') {
          payload[key] = draft[key] == true;
        } else {
          final text = draft[key]?.toString().trim() ?? '';
          if (text.isNotEmpty) payload[key] = text;
        }
      }
      await _api.postJson(
        '/${Uri.encodeComponent(module)}/${Uri.encodeComponent(parentId.toString())}/subforms/${Uri.encodeComponent(subformKey)}',
        payload,
      );
      draft.clear();
      saving = false;
      await load();
    } catch (e) {
      error = e.toString();
      saving = false;
    }
  }

  Future<void> deleteRow(Object? rawPk) async {
    if (saving || parentId == null || unsupportedReason.isNotEmpty || !canDelete || rawPk == null) {
      return;
    }
    saving = true;
    error = null;
    try {
      await _api.deleteJson(
        '/${Uri.encodeComponent(module)}/${Uri.encodeComponent(parentId.toString())}/subforms/${Uri.encodeComponent(subformKey)}/${Uri.encodeComponent(rawPk.toString())}',
      );
      saving = false;
      await load();
    } catch (e) {
      error = e.toString();
      saving = false;
    }
  }

  String cell(Map row, Map column) => row[column['key']]?.toString() ?? '';
}
""";
