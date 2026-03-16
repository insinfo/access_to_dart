part of '../project_generator.dart';

extension _FrontendModuleGenerator on ProjectGenerator {
  Future<void> _generateService(
    AnalysisProject project,
    AnalysisTable table,
    Directory moduleDir,
  ) async {
    final module = _buildFrontendModuleIr(project, table);
    final content = _buildFrontendModuleServiceSource(
      module: module,
    );

    final file = File(
      p.join(moduleDir.path, 'services', '${module.nameSnake}_service.dart'),
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
    final module = _buildFrontendModuleIr(project, table);
    final namePascal = module.className;
    final nameSnake = module.nameSnake;
    final moduleNameKebab = module.moduleNameKebab;

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

    final htmlContent = _buildConsultarPageHtml(
      namePascal: namePascal,
      moduleNameKebab: moduleNameKebab,
    );

    final pagesDir = Directory(p.join(moduleDir.path, 'pages', 'consultar_$nameSnake'));
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
    final module = _buildFrontendModuleIr(project, table);
    final namePascal = module.className;
    final nameSnake = module.nameSnake;
    final moduleNameKebab = module.moduleNameKebab;
    final formLogicClassName = module.formLogicClassName;

    final formFields = module.fields
        .where((field) => field.isAutoNumber == false)
        .map(
          (field) => <String, Object?>{
            'label': field.label,
            'readKey': field.runtimeName,
            'updateKey': field.runtimeName,
            'ngControl': field.fieldName,
            'inputType': field.inputType,
          },
        )
        .toList(growable: false);

    final htmlContent = _buildIncluirPageHtml(
      namePascal: namePascal,
      fields: formFields,
    );

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

    final pagesDir = Directory(p.join(moduleDir.path, 'pages', 'incluir_$nameSnake'));
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
    final module = _buildFrontendModuleIr(project, table);
    final nameSnake = module.nameSnake;
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

class ${module.formLogicClassName} {
  static const List<String> validationHints = $hintsLiteral;

  static Map<String, String> validateDraft(Map<String, dynamic> draft) {
    return ${module.className}ValidationContract.validateDraft(draft)
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
    final module = _buildFrontendModuleIr(project, table);
    final namePascal = module.className;
    final nameSnake = module.nameSnake;
    final moduleNameKebab = module.moduleNameKebab;
    final pagesDir = Directory(p.join(moduleDir.path, 'pages'));
    if (!pagesDir.existsSync()) {
      pagesDir.createSync(recursive: true);
    }

    await File(p.join(pagesDir.path, '${nameSnake}_page_component.dart'))
        .writeAsString(
          _buildFrontendModulePageComponentDartSource(
            namePascal: namePascal,
            nameSnake: nameSnake,
            moduleNameKebab: moduleNameKebab,
          ),
        );

    await File(p.join(pagesDir.path, '${nameSnake}_page_component.html'))
        .writeAsString(
          _buildFrontendModulePageComponentHtml(
            moduleNameKebab: moduleNameKebab,
          ),
        );
    await File(p.join(pagesDir.path, '${nameSnake}_page_component.scss'))
        .writeAsString('');
  }
}