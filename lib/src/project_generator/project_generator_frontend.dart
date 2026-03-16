part of 'project_generator.dart';

extension FrontendGenerator on ProjectGenerator {
  Future<void> _writeFrontend(AnalysisProject project, Directory root) async {
    final frontendDir = Directory(p.join(root.path, 'frontend'));
    if (!frontendDir.existsSync()) {
      frontendDir.createSync(recursive: true);
    }

    await _generateFrontendPubspec(project, frontendDir);
    await _generateFrontendBuildYaml(frontendDir);
    await _generateFrontendShared(
      project,
      Directory(p.join(frontendDir.path, 'lib', 'src', 'shared')),
    );

    final modulesDir = Directory(
      p.join(frontendDir.path, 'lib', 'src', 'modules'),
    );
    if (!modulesDir.existsSync()) {
      modulesDir.createSync(recursive: true);
    }

    for (final table in project.tables) {
      final moduleNameSnake = table.normalizedName;
      final moduleDir = Directory(p.join(modulesDir.path, moduleNameSnake));
      if (!moduleDir.existsSync()) {
        moduleDir.createSync(recursive: true);
      }

      await _generateFormLogic(project, table, moduleDir);
      await _generateService(project, table, moduleDir);
      await _generateConsultarPage(project, table, moduleDir);
      await _generateIncluirPage(project, table, moduleDir);
      await _generateModulePageComponent(project, table, moduleDir);
    }

    await _generateFrontendShell(project, frontendDir);
  }

  Future<void> _generateFrontendPubspec(
    AnalysisProject project,
    Directory frontendDir,
  ) async {
    final pubspec = '''
name: ${project.dartPackageName}_frontend
description: Generated frontend for ${project.source}
publish_to: none

environment:
  sdk: ^3.6.2

dependencies:
  ${project.dartPackageName}_core:
    path: ../core
  http: ^1.2.1
  ngdart: 8.0.0-dev.4
  ngforms: 5.0.0-dev.3
  ngrouter: 4.0.0-dev.3

dev_dependencies:
  build_runner: ^2.4.0
  build_web_compilers: ^4.0.9
  sass_builder: ^2.2.1
  webdev: ^3.7.1
''';
    await File(p.join(frontendDir.path, 'pubspec.yaml')).writeAsString(pubspec);
  }

  Future<void> _generateFrontendBuildYaml(Directory frontendDir) async {
    const buildYaml = r'''targets:
  $default:
    builders:
      sass_builder:
        generate_for:
          - lib/**.scss
          - lib/**/*.scss
''';
    await File(p.join(frontendDir.path, 'build.yaml')).writeAsString(buildYaml);
  }

  Future<void> _generateFrontendShared(
    AnalysisProject project,
    Directory sharedDir,
  ) async {
    if (!sharedDir.existsSync()) {
      sharedDir.createSync(recursive: true);
    }

    Directory(p.join(sharedDir.path, 'components')).createSync(recursive: true);
    Directory(p.join(sharedDir.path, 'services')).createSync(recursive: true);
    Directory(p.join(sharedDir.path, 'utils')).createSync(recursive: true);

    const sharedDart = '''
export 'components/datatable.dart';
export 'components/modal.dart';
export 'services/api_http_service.dart';
export 'services/rest_service.dart';
export 'utils/filters.dart';
export 'utils/dataframe.dart';
export 'utils/loading.dart';
export 'utils/toast.dart';
export 'utils/dialogs.dart';
''';

    await File(p.join(sharedDir.path, 'services', 'api_http_service.dart'))
        .writeAsString('''
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHttpService {
  final String baseUrl;

  ApiHttpService(this.baseUrl);

  Uri _resolve(String path) => Uri.parse('\$baseUrl\$path');

  Future<Map<String, dynamic>> getJson(String path) async {
    final response = await http.get(_resolve(path));
    if (response.body.isEmpty) {
      return <String, dynamic>{};
    }
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
''');

    await File(p.join(sharedDir.path, 'shared.dart')).writeAsString(sharedDart);

    await File(p.join(sharedDir.path, 'components', 'datatable.dart'))
        .writeAsString('''
import 'package:ngdart/angular.dart';

@Component(
  selector: 'datatable-component',
  template: '',
)
class DatatableComponent {}

class DatatableCol {
  final String key;
  final String title;
  final bool enableSorting;
  final String? sortingBy;

  const DatatableCol({
    required this.key,
    required this.title,
    this.enableSorting = false,
    this.sortingBy,
  });
}

class DatatableSearchField {
  final String field;
  final String operator;
  final String label;

  const DatatableSearchField({
    required this.field,
    required this.operator,
    required this.label,
  });
}

class DatatableSettings {
  final List<DatatableCol> colsDefinitions;

  const DatatableSettings({required this.colsDefinitions});
}
''');

    await File(p.join(sharedDir.path, 'components', 'modal.dart'))
        .writeAsString('''
import 'package:ngdart/angular.dart';

@Component(
  selector: 'custom-modal',
  template: '<ng-content></ng-content>',
)
class CustomModalComponent {
  @Input('start-open')
  bool startOpen = false;

  @Input('title-text')
  String titleText = '';

  @Input()
  String size = '';

  @Input()
  String headerColor = '';
}
''');

    await File(p.join(sharedDir.path, 'services', 'rest_service.dart'))
        .writeAsString('''
import '../utils/dataframe.dart';
import '../utils/filters.dart';

class RestConfig {
  final String baseUrl;

  const RestConfig(this.baseUrl);
}

class RestServiceBase {
  final RestConfig conf;

  RestServiceBase(this.conf);

  Future<DataFrame<T>> getDataFrame<T>(
    String endpoint, {
    required T Function(Map<String, dynamic>) builder,
    Filters? filtros,
  }) async {
    return DataFrame<T>.newClear();
  }

  Future<T> getEntity<T>(
    String endpoint, {
    required T Function(Map<String, dynamic>) builder,
  }) async {
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> insertEntity(
    Map<String, dynamic> entity,
    String endpoint,
  ) async {
    return entity;
  }

  Future<Map<String, dynamic>> updateEntity(
    Map<String, dynamic> entity,
    String endpoint,
  ) async {
    return entity;
  }

  Future<void> deleteEntity(String endpoint) async {}
}
''');

    await File(p.join(sharedDir.path, 'utils', 'filters.dart')).writeAsString('''
class Filters {
  int limit;
  int offset;

  Filters({this.limit = 12, this.offset = 0});
}
''');

    await File(p.join(sharedDir.path, 'utils', 'dataframe.dart')).writeAsString('''
class DataFrame<T> {
  List<T> items = <T>[];

  DataFrame();

  factory DataFrame.newClear() => DataFrame<T>();
}
''');

    await File(p.join(sharedDir.path, 'utils', 'loading.dart')).writeAsString('''
class SimpleLoading {
  void show({Object? target}) {}

  void hide() {}
}
''');

    await File(p.join(sharedDir.path, 'utils', 'toast.dart')).writeAsString('''
class NotificationToastService {
  void showSuccess(String message) {}
}
''');

    await File(p.join(sharedDir.path, 'utils', 'dialogs.dart')).writeAsString('''
class StatusMessage {
  static const String errorLoadingData = 'Erro ao carregar dados';
  static const String errorGeneric = 'Erro';
}

class SimpleDialogComponent {
  static void showAlert(String message, {String? subMessage}) {}
}
''');
  }

  Future<void> _generateService(
    AnalysisProject project,
    AnalysisTable table,
    Directory moduleDir,
  ) async {
    final namePascal = table.className;
    final nameSnake = table.normalizedName;
    final endpoint = tableRouteSegment(table);
    final primaryKeyField = _getPrimaryKey(table).fieldName;

    final content = '''
import 'package:${project.dartPackageName}_core/core.dart';

import '../../../shared/shared.dart';

class ${namePascal}Service extends RestServiceBase {
  ${namePascal}Service(super.conf);

  Future<DataFrame<$namePascal>> all(Filters filtros) async {
    return getDataFrame<$namePascal>(
      '/$endpoint',
      builder: (map) => $namePascal.fromMap(map),
      filtros: filtros,
    );
  }

  Future<$namePascal> getById(int id) async {
    return getEntity<$namePascal>(
      '/$endpoint/\$id',
      builder: (map) => $namePascal.fromMap(map),
    );
  }

  Future<$namePascal> insert($namePascal entity) async {
    final map = await insertEntity(entity.toMap(), '/$endpoint');
    return $namePascal.fromMap(map);
  }

  Future<$namePascal> update($namePascal entity) async {
    final map = await updateEntity(entity.toMap(), '$endpoint/\${entity.$primaryKeyField}');
    return $namePascal.fromMap(map);
  }

  Future<void> deleteRow(int id) async {
    await deleteEntity('$endpoint/\$id');
  }
}
''';

    final file = File(
      p.join(moduleDir.path, 'services', '${nameSnake}_service.dart'),
    );
    if (!file.parent.existsSync()) {
      file.parent.createSync(recursive: true);
    }
    await file.writeAsString(content);
  }

  AnalysisColumn _getPrimaryKey(AnalysisTable table) {
    if (table.columns.isEmpty) {
      throw Exception('No columns in table ${table.name}');
    }

    final pk = table.primaryKey;
    if (pk != null && pk.columns.isNotEmpty) {
      final pkColName = pk.columns.first.name;
      for (final col in table.columns) {
        if (col.name == pkColName) {
          return col;
        }
      }
    }

    return table.columns.first;
  }

  Future<void> _generateConsultarPage(
    AnalysisProject project,
    AnalysisTable table,
    Directory moduleDir,
  ) async {
    final namePascal = table.className;
    final nameSnake = table.normalizedName;
    final moduleNameKebab = tableRouteSegment(table);

    final dartContent = '''
import 'package:ngdart/angular.dart';
import 'package:${project.dartPackageName}_core/core.dart';

import '../../../../shared/shared.dart';
import '../../services/${nameSnake}_service.dart';
import '../incluir_$nameSnake/incluir_${nameSnake}_page.dart';

@Component(
  selector: 'consultar-$moduleNameKebab-page',
  templateUrl: 'consultar_${nameSnake}_page.html',
  directives: [coreDirectives, Incluir${namePascal}Page],
)
class Consultar${namePascal}Page implements OnInit {
  final ${namePascal}Service _service =
  ${namePascal}Service(const RestConfig('/api/v1'));

  List<$namePascal> items = <$namePascal>[];
  bool loading = false;
  bool showForm = false;
  $namePascal? selectedItem;
  String? errorMessage;

  @override
  void ngOnInit() {
    load();
  }

  Future<void> load() async {
    loading = true;
    errorMessage = null;
    try {
      final frame = await _service.all(Filters(limit: 50, offset: 0));
      items = frame.items;
    } catch (e, s) {
      errorMessage = '\$e\\n\$s';
    } finally {
      loading = false;
    }
  }

  void openCreateForm() {
    selectedItem = null;
    showForm = true;
  }

  void openEditForm($namePascal row) {
    selectedItem = row;
    showForm = true;
  }

  Future<void> onUpdateEntity($namePascal row) async {
    selectedItem = row;
    showForm = false;
    await load();
  }
}
''';

    final htmlContent = '''
<div class="page-header page-header-light shadow">
  <div class="page-header-content d-lg-flex">
    <div class="d-flex">
      <h4 class="page-title mb-0">
        Módulo - <span class="fw-normal">Consultar $namePascal</span>
      </h4>
    </div>
  </div>
</div>

<div class="content">
  <div class="card">
    <div class="card-body">
      <div class="d-flex justify-content-between align-items-center mb-3">
        <p class="mb-0">Itens carregados: {{ items.length }}</p>
        <button type="button" class="btn btn-primary" (click)="openCreateForm()">Novo</button>
      </div>

      <div *ngIf="loading">Carregando...</div>
      <div *ngIf="errorMessage != null" class="alert alert-danger">{{ errorMessage }}</div>

      <table class="table table-striped" *ngIf="loading == false && items.isNotEmpty">
        <thead>
          <tr>
            <th>#</th>
            <th>Registro</th>
            <th>Ações</th>
          </tr>
        </thead>
        <tbody>
          <tr *ngFor="let item of items; let idx = index">
            <td>{{ idx + 1 }}</td>
            <td>{{ item.toMap() }}</td>
            <td>
              <button type="button" class="btn btn-sm btn-outline-primary" (click)="openEditForm(item)">Editar</button>
            </td>
          </tr>
        </tbody>
      </table>

      <p *ngIf="loading == false && items.isEmpty && errorMessage == null" class="mb-0">Nenhum registro carregado.</p>
    </div>
  </div>
</div>

<div class="content" *ngIf="showForm">
  <div class="card">
    <div class="card-body">
      <incluir-$moduleNameKebab-page
        [insideModal]="false"
        [entity]="selectedItem"
        [modoAlterar]="selectedItem != null"
        (onUpdateEntity)="onUpdateEntity(\$event)">
      </incluir-$moduleNameKebab-page>
    </div>
  </div>
</div>
''';

    final pagesDir = Directory(
      p.join(moduleDir.path, 'pages', 'consultar_$nameSnake'),
    );
    if (!pagesDir.existsSync()) {
      pagesDir.createSync(recursive: true);
    }
    await File(p.join(pagesDir.path, 'consultar_${nameSnake}_page.dart'))
        .writeAsString(dartContent);
    await File(p.join(pagesDir.path, 'consultar_${nameSnake}_page.html'))
        .writeAsString(htmlContent);
  }

  Future<void> _generateIncluirPage(
    AnalysisProject project,
    AnalysisTable table,
    Directory moduleDir,
  ) async {
    final namePascal = table.className;
    final nameSnake = table.normalizedName;
    final moduleNameKebab = tableRouteSegment(table);
    final formLogicClassName = '${namePascal}FormLogic';

    var formInputsHtml = '';
    for (final col in table.columns) {
      if (col.isAutoNumber) {
        continue;
      }

      formInputsHtml += '''
        <div class="col-md-4 form-group mb-3">
          <label class="form-label">${col.name}:</label>
          <input
            [ngModel]="readField('${col.normalizedName}')"
            (ngModelChange)="updateField('${columnRuntimeName(col)}', \$event)"
            ngControl="${col.fieldName}"
            ${col.dartType == 'DateTime?' ? 'type="date"' : 'type="text"'}
            [class.is-invalid]="readFieldError('${columnRuntimeName(col)}') != null"
            class="form-control">
          <div class="invalid-feedback d-block" *ngIf="readFieldError('${columnRuntimeName(col)}') != null">
            {{ readFieldError('${columnRuntimeName(col)}') }}
          </div>
        </div>
      ''';
    }

    formInputsHtml = formInputsHtml.replaceAll("readField('", "readField('");
    for (final col in table.columns) {
      formInputsHtml = formInputsHtml.replaceAll(
        "readField('${col.normalizedName}')",
        "readField('${columnRuntimeName(col)}')",
      );
    }

    final htmlContent = '''
<div *ngIf="insideModal == false" class="page-header page-header-light shadow">
  <div class="page-header-content d-lg-flex">
    <h4 class="page-title mb-0">Módulo - <span class="fw-normal">Incluir $namePascal</span></h4>
  </div>
</div>

<div class="content">
  <div class="alert alert-info border-start border-info border-4 mb-3" *ngIf="validationHints.isNotEmpty">
    <strong>Regras migradas do formulario Access:</strong>
    <ul class="mb-0 mt-2">
      <li *ngFor="let hint of validationHints">{{ hint }}</li>
    </ul>
  </div>
  <div class="card">
    <div class="card-body">
      <form (ngSubmit)="salvar()" #formEntity="ngForm" novalidate>
        <div class="row">
$formInputsHtml
        </div>
        <div class="text-end mt-3">
          <button class="btn btn-primary btn-labeled btn-labeled-start" type="submit">
            <span class="btn-labeled-icon bg-black bg-opacity-20"><i class="ph ph-floppy-disk"></i></span>
            Salvar
          </button>
        </div>
      </form>
    </div>
  </div>
</div>
''';

    final dartContent = '''
import 'dart:async';

import 'package:ngdart/angular.dart';
import 'package:ngforms/ngforms.dart';
import 'package:${project.dartPackageName}_core/core.dart';

import '../../../../shared/shared.dart';
import '../../logic/${nameSnake}_form_logic.dart';
import '../../services/${nameSnake}_service.dart';

@Component(
  selector: 'incluir-$moduleNameKebab-page',
  templateUrl: 'incluir_${nameSnake}_page.html',
  directives: [coreDirectives, formDirectives],
)
class Incluir${namePascal}Page implements OnInit {
  final ${namePascal}Service _service =
  ${namePascal}Service(const RestConfig('/api/v1'));

  @ViewChild('formEntity')
  NgForm? formEntity;

  @Input('insideModal')
  bool insideModal = false;

  @Input('modoAlterar')
  bool modoAlterar = false;

  final Map<String, dynamic> _draft = <String, dynamic>{};
  final Map<String, String> validationErrors = <String, String>{};

  @Input('entity')
  set entityInput($namePascal? val) {
    _draft
      ..clear()
      ..addAll(val?.toMap() ?? <String, dynamic>{});
  }

  final _updateEntityController = StreamController<$namePascal>.broadcast();

  @Output('onUpdateEntity')
  Stream<$namePascal> get onUpdateEntity => _updateEntityController.stream;

  @override
  void ngOnInit() {}

  List<String> get validationHints => $formLogicClassName.validationHints;

  String readField(String key) {
    final value = _draft[key];
    return value?.toString() ?? '';
  }

  String? readFieldError(String key) => validationErrors[key];

  void updateField(String key, Object? value) {
    _draft[key] = value;
    validationErrors.remove(key);
  }

  Future<void> salvar() async {
    final loading = SimpleLoading();
    try {
      validationErrors
        ..clear()
        ..addAll($formLogicClassName.validateDraft(_draft));
      if (validationErrors.isNotEmpty) {
        SimpleDialogComponent.showAlert(validationErrors.values.first);
        return;
      }

      loading.show();
      final entity = $namePascal.fromMap(_draft);
      final saved = modoAlterar
          ? await _service.update(entity)
          : await _service.insert(entity);
      _updateEntityController.add(saved);
    } catch (e, s) {
      SimpleDialogComponent.showAlert(
        StatusMessage.errorGeneric,
        subMessage: '\$e \$s',
      );
    } finally {
      loading.hide();
    }
  }
}
''';

    final pagesDir = Directory(
      p.join(moduleDir.path, 'pages', 'incluir_$nameSnake'),
    );
    if (!pagesDir.existsSync()) {
      pagesDir.createSync(recursive: true);
    }
    await File(p.join(pagesDir.path, 'incluir_${nameSnake}_page.dart'))
        .writeAsString(dartContent);
    await File(p.join(pagesDir.path, 'incluir_${nameSnake}_page.html'))
        .writeAsString(htmlContent);
  }

  Future<void> _generateFormLogic(
    AnalysisProject project,
    AnalysisTable table,
    Directory moduleDir,
  ) async {
    final nameSnake = table.normalizedName;
    final validations = _buildValidationsForTable(project, table);
    final hints = <String>[];
    final seenHints = <String>{};
    for (final validation in validations) {
      for (final message in validation.messages) {
        if (seenHints.add(message)) {
          hints.add(message);
        }
      }
    }
    final hintsLiteral = hints.isEmpty
        ? 'const <String>[]'
        : 'const <String>[\n${hints.map((hint) => '    ${jsonEncode(hint)},').join('\n')}\n  ]';
    final logicDir = Directory(p.join(moduleDir.path, 'logic'));
    if (!logicDir.existsSync()) {
      logicDir.createSync(recursive: true);
    }

    final content = '''
import 'package:${project.dartPackageName}_core/core.dart';

class ${table.className}FormLogic {
  static const List<String> validationHints = $hintsLiteral;

  static Map<String, String> validateDraft(Map<String, dynamic> draft) {
    return ${table.className}ValidationContract.validateDraft(draft)
        .asFieldMap();
  }
}
''';

    await File(p.join(logicDir.path, '${nameSnake}_form_logic.dart'))
        .writeAsString(content);
  }

  Future<void> _generateModulePageComponent(
    AnalysisProject project,
    AnalysisTable table,
    Directory moduleDir,
  ) async {
    final namePascal = table.className;
    final nameSnake = table.normalizedName;
    final moduleNameKebab = tableRouteSegment(table);
    final pagesDir = Directory(p.join(moduleDir.path, 'pages'));
    if (!pagesDir.existsSync()) {
      pagesDir.createSync(recursive: true);
    }

    await File(p.join(pagesDir.path, '${nameSnake}_page_component.dart'))
        .writeAsString('''
import 'package:ngdart/angular.dart';

import 'consultar_$nameSnake/consultar_${nameSnake}_page.dart';

@Component(
  selector: '$moduleNameKebab-page',
  templateUrl: '${nameSnake}_page_component.html',
  styleUrls: ['${nameSnake}_page_component.css'],
  directives: [coreDirectives, Consultar${namePascal}Page],
)
class ${namePascal}PageComponent {}
''');

    await File(p.join(pagesDir.path, '${nameSnake}_page_component.html'))
        .writeAsString('<consultar-$moduleNameKebab-page></consultar-$moduleNameKebab-page>\n');
    await File(p.join(pagesDir.path, '${nameSnake}_page_component.scss'))
      .writeAsString('');
  }

  Future<void> _generateFrontendShell(
    AnalysisProject project,
    Directory frontendDir,
  ) async {
    final libDir = Directory(p.join(frontendDir.path, 'lib'));
    final webDir = Directory(p.join(frontendDir.path, 'web'));
    if (!libDir.existsSync()) {
      libDir.createSync(recursive: true);
    }
    if (!webDir.existsSync()) {
      webDir.createSync(recursive: true);
    }

    final pageImports = <String>[];
    final pageDirectives = <String>[];
    final navLinks = <String>[];
    final pageBlocks = <String>[];

    for (final table in project.tables) {
      final nameSnake = table.normalizedName;
      final routeSegment = tableRouteSegment(table);
      pageImports.add(
        "import 'src/modules/$nameSnake/pages/${nameSnake}_page_component.dart';",
      );
      pageDirectives.add('${table.className}PageComponent');
      navLinks.add(
        "        <button type=\"button\" class=\"nav-link\" [class.is-active]=\"activeModule == '$routeSegment'\" (click)=\"setActiveModule('$routeSegment')\">${table.className}</button>",
      );
      pageBlocks.add(
          "    <$routeSegment-page *ngIf=\"activeModule == '$routeSegment'\"></$routeSegment-page>",
      );
    }

    final initialModule = project.tables.isEmpty
        ? ''
        : tableRouteSegment(project.tables.first);

    await File(p.join(libDir.path, 'app_component.dart')).writeAsString('''
import 'package:ngdart/angular.dart';

${pageImports.join('\n')}

@Component(
  selector: 'app-root',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, ${pageDirectives.join(', ')}],
)
class AppComponent {
  String activeModule = '${initialModule.replaceAll("'", "\\'")}';

  void setActiveModule(String value) {
    activeModule = value;
  }
}
''');

    await File(p.join(libDir.path, 'app_component.html')).writeAsString('''
<div class="app-shell">
  <aside class="sidebar">
    <h1>${project.projectName}</h1>
    <nav class="nav-links">
${navLinks.join('\n')}
    </nav>
  </aside>
  <main class="content-area">
${pageBlocks.join('\n')}
  </main>
</div>
''');

    await File(p.join(libDir.path, 'app_component.scss')).writeAsString('''
\$paper: #f7f3ea;
\$ink: #2f2a24;
\$line: #d8d0c0;

.app-shell {
  display: grid;
  grid-template-columns: 260px 1fr;
  min-height: 100vh;
}

.sidebar {
  padding: 24px;
  background: #f3f0e8;
  border-right: 1px solid #d8d0c0;
}

.nav-links {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.nav-link {
  appearance: none;
  background: transparent;
  border: 0;
  cursor: pointer;
  font: inherit;
  padding: 0;
  text-align: left;
  color: #3a342b;
  text-decoration: none;
}

.nav-link.is-active {
  font-weight: 700;
}

.content-area {
  padding: 24px;
}

body {
  margin: 0;
  font-family: Georgia, 'Times New Roman', serif;
  color: \$ink;
  background: linear-gradient(180deg, #fbfaf6 0%, \$paper 100%);
}

.sidebar h1 {
  margin-top: 0;
}

.nav-link:hover {
  text-decoration: underline;
}
''');

    await File(p.join(webDir.path, 'main.dart')).writeAsString('''
import 'package:ngdart/angular.dart';

import 'package:${project.dartPackageName}_frontend/app_component.template.dart' as ng;

void main() {
  runApp(ng.AppComponentNgFactory);
}
''');

    await File(p.join(webDir.path, 'index.html')).writeAsString('''
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${project.projectName}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/limitless@4.0/dist/css/all.min.css">
    <base href="/">
  </head>
  <body>
    <app-root>Carregando...</app-root>
    <script defer src="main.dart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/limitless@4.0/dist/js/bootstrap/bootstrap.bundle.min.js"></script>
  </body>
</html>
''');
  }

  List<_GeneratedFieldValidation> _matchFormRulesToColumns(
    AnalysisTable table,
    AccessFormRuleSet ruleSet,
  ) {
    final byKey = <String, _GeneratedFieldValidation>{};
    for (final rule in ruleSet.fieldRules) {
      final column = _matchRuleToColumn(table, rule);
      if (column == null) {
        continue;
      }
      final runtimeKey = columnRuntimeName(column);
      final existing = byKey[runtimeKey];
      if (existing == null) {
        byKey[runtimeKey] = _GeneratedFieldValidation(
          column: column,
          runtimeKey: runtimeKey,
          methodSuffix: _pascalizeKey(runtimeKey),
          kinds: {...rule.kinds},
          messages: [...rule.messages],
        );
        continue;
      }

      existing.kinds.addAll(rule.kinds);
      for (final message in rule.messages) {
        if (!existing.messages.contains(message)) {
          existing.messages.add(message);
        }
      }
    }
    return byKey.values.toList();
  }

  AnalysisColumn? _matchRuleToColumn(
    AnalysisTable table,
    AccessFormFieldRule rule,
  ) {
    final columnsByKey = <String, AnalysisColumn>{};
    for (final column in table.columns) {
      final key = _lookupFormKey(column.name);
      columnsByKey[key] = column;
      columnsByKey[_singularFormKey(key)] = column;
    }

    final candidates = <String>{
      rule.controlName,
      ...rule.referencedControls,
    };
    for (final candidate in candidates) {
      final stripped = _stripControlPrefix(candidate);
      final key = _lookupFormKey(stripped);
      final column = columnsByKey[key] ?? columnsByKey[_singularFormKey(key)];
      if (column != null) {
        return column;
      }
    }
    return null;
  }

}

String _stripControlPrefix(String value) {
  const prefixes = <String>['txt', 'cbo', 'chk', 'cmd', 'btn', 'subfrm', 'frm'];
  final lower = value.toLowerCase();
  for (final prefix in prefixes) {
    if (lower.startsWith(prefix) && value.length > prefix.length) {
      return value.substring(prefix.length);
    }
  }
  return value;
}

String _lookupFormKey(String value) {
  final buffer = StringBuffer();
  for (final codeUnit in value.toLowerCase().codeUnits) {
    final isLetter = codeUnit >= 97 && codeUnit <= 122;
    final isDigit = codeUnit >= 48 && codeUnit <= 57;
    if (isLetter || isDigit) {
      buffer.writeCharCode(codeUnit);
    }
  }
  return buffer.toString();
}

String _singularFormKey(String value) {
  if (value.endsWith('s') && value.length > 3) {
    return value.substring(0, value.length - 1);
  }
  return value;
}

String _pascalizeKey(String value) {
  final buffer = StringBuffer();
  var upperNext = true;
  for (final codeUnit in value.codeUnits) {
    final isLetter = (codeUnit >= 65 && codeUnit <= 90) ||
        (codeUnit >= 97 && codeUnit <= 122);
    final isDigit = codeUnit >= 48 && codeUnit <= 57;
    if (!isLetter && !isDigit) {
      upperNext = true;
      continue;
    }
    if (upperNext) {
      buffer.write(String.fromCharCode(codeUnit).toUpperCase());
      upperNext = false;
      continue;
    }
    buffer.write(String.fromCharCode(codeUnit));
  }
  return buffer.toString();
}

class _GeneratedFieldValidation {
  final AnalysisColumn column;
  final String runtimeKey;
  final String methodSuffix;
  final Set<AccessFormFieldRuleKind> kinds;
  final List<String> messages;

  _GeneratedFieldValidation({
    required this.column,
    required this.runtimeKey,
    required this.methodSuffix,
    required this.kinds,
    required this.messages,
  });

  String messageForKind(
    AccessFormFieldRuleKind kind, {
    required String fallback,
  }) {
    if (messages.isEmpty) {
      return fallback;
    }
    switch (kind) {
      case AccessFormFieldRuleKind.required:
        return messages.firstWhere(
          (message) => message.toLowerCase().contains('informe'),
          orElse: () => messages.first,
        );
      case AccessFormFieldRuleKind.cpf:
        return messages.firstWhere(
          (message) => message.toLowerCase().contains('cpf'),
          orElse: () => messages.first,
        );
      case AccessFormFieldRuleKind.email:
        return messages.firstWhere(
          (message) => message.toLowerCase().contains('email'),
          orElse: () => messages.first,
        );
      case AccessFormFieldRuleKind.phone:
        return messages.firstWhere(
          (message) =>
              message.toLowerCase().contains('telefone') ||
              message.toLowerCase().contains('fone'),
          orElse: () => messages.first,
        );
      case AccessFormFieldRuleKind.custom:
        return messages.first;
    }
  }
}