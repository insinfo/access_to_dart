part of 'project_generator.dart';

extension FrontendGenerator on ProjectGenerator {
  Future<void> _writeFrontend(AnalysisProject project, Directory root) async {
    final frontendDir = Directory(p.join(root.path, 'frontend'));
    if (!frontendDir.existsSync()) {
      frontendDir.createSync(recursive: true);
    }

    await _generateFrontendPubspec(project, frontendDir);
    await _generateFrontendShared(project, Directory(p.join(frontendDir.path, 'lib', 'src', 'shared')));

    final modulesDir = Directory(p.join(frontendDir.path, 'lib', 'src', 'modules'));
    if (!modulesDir.existsSync()) {
      modulesDir.createSync(recursive: true);
    }

    for (var table in project.tables) {
      final moduleNameSnake = table.normalizedName;
      final moduleDir = Directory(p.join(modulesDir.path, moduleNameSnake));
      if (!moduleDir.existsSync()) {
        moduleDir.createSync(recursive: true);
      }

      await _generateService(project, table, moduleDir);
      await _generateConsultarPage(project, table, moduleDir);
      await _generateIncluirPage(project, table, moduleDir);
    }
  }

  Future<void> _generateFrontendPubspec(AnalysisProject project, Directory frontendDir) async {
    final pubspec = '''
name: ${project.dartPackageName}_frontend
description: Generated frontend for ${project.source}
publish_to: none

environment:
  sdk: ^3.6.2

dependencies:
  ${project.dartPackageName}_core:
    path: ../core
  ngdart: 8.0.0-dev.4
  ngforms: 5.0.0-dev.3
  ngrouter: 4.0.0-dev.3

dev_dependencies:
  build_runner: ^2.4.0
  sass_builder: ^2.4.0+1
''';
    await File(p.join(frontendDir.path, 'pubspec.yaml')).writeAsString(pubspec);
  }

  Future<void> _generateFrontendShared(AnalysisProject project, Directory sharedDir) async {
    if (!sharedDir.existsSync()) sharedDir.createSync(recursive: true);
    
    final sharedDart = '''
export 'components/datatable.dart';
export 'components/modal.dart';
export 'services/rest_service.dart';
export 'utils/filters.dart';
export 'utils/dataframe.dart';
export 'utils/loading.dart';
export 'utils/toast.dart';
export 'utils/dialogs.dart';
''';
    
    await File(p.join(sharedDir.path, 'shared.dart')).writeAsString(sharedDart);
    
    Directory(p.join(sharedDir.path, 'components')).createSync(recursive: true);
    Directory(p.join(sharedDir.path, 'services')).createSync(recursive: true);
    Directory(p.join(sharedDir.path, 'utils')).createSync(recursive: true);

    await File(p.join(sharedDir.path, 'components', 'datatable.dart')).writeAsString('''
import 'package:ngdart/angular.dart';
import '../utils/filters.dart';

class DatatableCol {
  final String key;
  final String title;
  final bool enableSorting;
  final String? sortingBy;
  DatatableCol({required this.key, required this.title, this.enableSorting = false, this.sortingBy});
}

class DatatableSearchField {
  final String field;
  final String operator;
  final String label;
  DatatableSearchField({required this.field, required this.operator, required this.label});
}

class DatatableSettings {
  final List<DatatableCol> colsDefinitions;
  DatatableSettings({required this.colsDefinitions});
}

@Directive(selector: 'datatable-component')
class DatatableComponent {
  @Input() bool showCheckboxToSelectRow = false;
  @Input() Filters? dataTableFilter;
  @Input() dynamic data;
  @Input() DatatableSettings? settings;
  @Input() List<DatatableSearchField>? searchInFields;
  @Output() Object? dataRequest;
  @Output() Object? onRowClick;
}
''');

    await File(p.join(sharedDir.path, 'components', 'modal.dart')).writeAsString('''
import 'package:ngdart/angular.dart';

@Directive(selector: 'custom-modal')
class CustomModalComponent {
  @Input('start-open') bool startOpen = false;
  @Input('title-text') String titleText = '';
  @Input() String size = '';
  @Input() String headerColor = '';
  
  bool isOpen = false;
  
  void open() { isOpen = true; }
  void close() { isOpen = false; }
}
''');

    await File(p.join(sharedDir.path, 'services', 'rest_service.dart')).writeAsString('''
import '../utils/filters.dart';
import '../utils/dataframe.dart';

class RestConfig {
  final String baseUrl;
  RestConfig(this.baseUrl);
}

class RestServiceBase {
  final RestConfig conf;
  RestServiceBase(this.conf);

  Future<DataFrame<T>> getDataFrame<T>(String endpoint, {required T Function(Map<String, dynamic>) builder, Filters? filtros}) async {
    return DataFrame<T>.newClear();
  }

  Future<T> getEntity<T>(String endpoint, {required T Function(Map<String, dynamic>) builder}) async {
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> insertEntity(Map<String, dynamic> entity, String endpoint) async {
    return entity;
  }

  Future<Map<String, dynamic>> updateEntity(Map<String, dynamic> entity, String endpoint) async {
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
  List<T> items = [];
  DataFrame();
  factory DataFrame.newClear() => DataFrame<T>();
}
''');

    await File(p.join(sharedDir.path, 'utils', 'loading.dart')).writeAsString('''
class SimpleLoading {
  void show({dynamic target}) {}
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

  Future<void> _generateService(AnalysisProject project, AnalysisTable table, Directory moduleDir) async {
    final namePascal = table.className;
    final nameSnake = table.normalizedName;
    final endpoint = nameSnake.replaceAll('_', '-');

    final content = '''
import 'package:${project.dartPackageName}_core/core.dart';
import '../../shared/shared.dart';

class ${namePascal}Service extends RestServiceBase {
  \${namePascal}Service(super.conf);

  Future<DataFrame<$namePascal>> all(Filters filtros) async {
    return getDataFrame<$namePascal>(
      '/$endpoint',
      builder: (map) => $namePascal.fromMap(map),
      filtros: filtros,
    );
  }

  Future<$namePascal> getById(int id) async {
    return getEntity<$namePascal>(
      '/\$endpoint/\$id',
      builder: (map) => $namePascal.fromMap(map),
    );
  }

  Future<$namePascal> insert($namePascal entity) async {
    final map = await insertEntity(entity.toMap(), '/$endpoint');
    return $namePascal.fromMap(map);
  }

  Future<$namePascal> update($namePascal entity) async {
    final map = await updateEntity(entity.toMap(), '$endpoint/\${entity.id}');
    return $namePascal.fromMap(map);
  }

  Future<void> deleteRow(int id) async {
    await deleteEntity('$endpoint/\$id');
  }
}
''';

    final file = File(p.join(moduleDir.path, 'services', '${nameSnake}_service.dart'));
    if (!file.parent.existsSync()) file.parent.createSync(recursive: true);
    await file.writeAsString(content);
  }

  AnalysisColumn _getPrimaryKey(AnalysisTable table) {
    if (table.columns.isEmpty) throw Exception('No columns in table ${table.name}');
    final pk = table.primaryKey;
    if (pk != null && pk.columns.isNotEmpty) {
      final pkColName = pk.columns.first.name;
      for (final col in table.columns) {
        if (col.name == pkColName) return col;
      }
    }
    return table.columns.first;
  }

  Future<void> _generateConsultarPage(AnalysisProject project, AnalysisTable table, Directory moduleDir) async {
    final namePascal = table.className;
    final nameSnake = table.normalizedName;
    final moduleNameKebab = nameSnake.replaceAll('_', '-');
    final idField = _getPrimaryKey(table);
    
    final dartContent = '''
import 'dart:async';
import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';
import 'package:${project.dartPackageName}_core/core.dart';
import 'dart:html' as html;
import '../../shared/shared.dart';
import '../incluir_$nameSnake/incluir_${nameSnake}_page.dart';
import '../services/${nameSnake}_service.dart';

@Component(
  selector: 'consultar-$moduleNameKebab-page',
  templateUrl: 'consultar_${nameSnake}_page.html',
  directives: [
    coreDirectives,
    DatatableComponent,
    CustomModalComponent,
    Incluir${namePascal}Page,
  ],
)
class Consultar${namePascal}Page implements OnInit, OnActivate, CanReuse {
  final ${namePascal}Service _service;

  @ViewChild('container')
  html.DivElement? containerElement;

  @ViewChild('datatable')
  DatatableComponent? datatable;

  @ViewChild('modalAltera')
  CustomModalComponent? modalAltera;

  $namePascal entitySel = $namePascal();
  DataFrame<$namePascal> items = DataFrame<$namePascal>.newClear();
  Filters filtros = Filters(limit: 12, offset: 0);
  late DatatableSettings datatableSettings;

  Consultar${namePascal}Page(this._service) {
    datatableSettings = DatatableSettings(colsDefinitions: [
      DatatableCol(key: '${idField.normalizedName}', title: 'ID', enableSorting: true, sortingBy: '${idField.normalizedName}'),
    ]);
  }

  List<DatatableSearchField> searchInFields = <DatatableSearchField>[
    DatatableSearchField(field: '${idField.normalizedName}', operator: '=', label: 'ID'),
  ];

  Future<void> load({bool showLoading = true}) async {
    final loading = SimpleLoading();
    try {
      if (showLoading) loading.show(target: containerElement);
      items = await _service.all(filtros);
    } catch (e, s) {
      SimpleDialogComponent.showAlert(StatusMessage.errorLoadingData, subMessage: '\$e \$s');
    } finally {
      if (showLoading) loading.hide();
    }
  }

  void onRequestData(Filters f) {
    filtros = f;
    load();
  }

  void rowClickHandler($namePascal row) {
    entitySel = row;
    modalAltera?.open();
  }

  void onUpdateEntity($namePascal row) {
    load();
    modalAltera?.close();
  }

  Map<String, String> currentQueryParameters = {};

  @override
  void onActivate(RouterState? previous, RouterState current) {
    currentQueryParameters = current.queryParameters;
  }

  @override
  void ngOnInit() {}

  @override
  Future<bool> canReuse(RouterState current, RouterState next) async {
    return false;
  }
}
''';

    final htmlContent = '''
<div class="page-header page-header-light shadow">
	<div class="page-header-content d-lg-flex">
		<div class="d-flex">
			<h4 class="page-title mb-0">
				Módulo - <span class="fw-normal">Consultar \$namePascal</span>
			</h4>
		</div>
	</div>
</div>

<div #container class="content" style="position: relative;">
	<div class="card">
		<datatable-component 
            #datatable 
            [showCheckboxToSelectRow]="false" 
            [dataTableFilter]="filtros"
			[data]="items" 
            [settings]="datatableSettings" 
            [searchInFields]="searchInFields"
			(dataRequest)="onRequestData(\\\$event)" 
            (onRowClick)="rowClickHandler(\\\$event)">
        </datatable-component>
	</div>
</div>

<custom-modal #modalAltera [start-open]="false" title-text="Alterar \$namePascal" size="modal-full" headerColor="primary">
	<incluir-\$moduleNameKebab-page 
        *ngIf="modalAltera.isOpen == true" 
        [insideModal]="true" 
        [entity]="entitySel"
		[modoAlterar]="true" 
        (onUpdateEntity)="onUpdateEntity(\\\$event)">
    </incluir-$moduleNameKebab-page>
</custom-modal>
''';

    final pagesDir = Directory(p.join(moduleDir.path, 'pages', 'consultar_$nameSnake'));
    if (!pagesDir.existsSync()) pagesDir.createSync(recursive: true);
    await File(p.join(pagesDir.path, 'consultar_${nameSnake}_page.dart')).writeAsString(dartContent);
    await File(p.join(pagesDir.path, 'consultar_${nameSnake}_page.html')).writeAsString(htmlContent);
  }

  Future<void> _generateIncluirPage(AnalysisProject project, AnalysisTable table, Directory moduleDir) async {
    final namePascal = table.className;
    final nameSnake = table.normalizedName;
    final moduleNameKebab = nameSnake.replaceAll('_', '-');
    
    String formInputsHtml = '';
    for (var col in table.columns) {
      if (col.isAutoNumber) continue;
      
      formInputsHtml += '''
        <div class="col-md-4 form-group mb-3">
            <label class="form-label">${col.name}:</label>
            <input [(ngModel)]="entity.${col.fieldName}" 
                   ngControl="${col.normalizedName}" 
                   ${col.dartType == 'DateTime?' ? 'type="date"' : 'type="text"'} 
                   class="form-control" ${col.dartType == 'String?' ? 'required' : ''}>
        </div>
      ''';
    }

    final htmlContent = '''
<div *ngIf="insideModal == false" class="page-header page-header-light shadow">
    <div class="page-header-content d-lg-flex">
        <h4 class="page-title mb-0">Módulo - <span class="fw-normal">Incluir $namePascal</span></h4>
    </div>
</div>

<div #container class="content">
    <div class="card" [class.card]="insideModal == false">
        <div class="card-body">
            <form (ngSubmit)="salvar()" #formEntity="ngForm" novalidate (keydown.enter)="\\\$event.preventDefault()">
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
import '../../shared/shared.dart';
import '../services/${nameSnake}_service.dart';

@Component(
  selector: 'incluir-$moduleNameKebab-page',
  templateUrl: 'incluir_${nameSnake}_page.html',
  directives: [coreDirectives, formDirectives],
)
class Incluir${namePascal}Page implements OnInit {
  final ${namePascal}Service _service;
  final NotificationToastService _toastService;

  @ViewChild('formEntity')
  NgForm? formEntity;

  @Input('insideModal')
  bool insideModal = false;

  @Input('modoAlterar')
  bool modoAlterar = false;

  $namePascal entity = $namePascal();

  @Input('entity')
  set setEntity($namePascal val) {
    entity = $namePascal.fromMap(val.toMap());
  }

  Incluir${namePascal}Page(this._service, this._toastService);

  final _updateEntityController = StreamController<$namePascal>();
  @Output('onUpdateEntity')
  Stream<$namePascal> get onUpdateEntity => _updateEntityController.stream;

  @override
  void ngOnInit() {}

  Future<void> salvar() async {
    final loading = SimpleLoading();
    try {
      loading.show();
      if (modoAlterar) {
        // TODO: await _service.update(entity.id!, entity);
      } else {
        await _service.insert(entity);
      }
      _toastService.showSuccess('Salvo com sucesso!');
      _updateEntityController.add(entity);
    } catch (e, s) {
      SimpleDialogComponent.showAlert(StatusMessage.errorGeneric, subMessage: '\$e \$s');
    } finally {
      loading.hide();
    }
  }
}
''';

    final pagesDir = Directory(p.join(moduleDir.path, 'pages', 'incluir_$nameSnake'));
    if (!pagesDir.existsSync()) pagesDir.createSync(recursive: true);
    await File(p.join(pagesDir.path, 'incluir_${nameSnake}_page.dart')).writeAsString(dartContent);
    await File(p.join(pagesDir.path, 'incluir_${nameSnake}_page.html')).writeAsString(htmlContent);
  }
}
