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
            'inputMode': field.inputMode,
            'isReadOnly': field.isReadOnly,
            'isRequired': field.isRequired,
            'maxLength': field.maxLength,
            'title': _buildFieldHint(field),
            'isMultiValueSelect': field.isMultiValueSuggested,
            'isSingleSelect': field.isDropdownSuggested && !field.isMultiValueSuggested,
            'isSelect': field.isDropdownSuggested,
            'isNotSelect': !field.isDropdownSuggested,
            'isDynamicSelect': field.hasDynamicLookup,
            'format': field.formatString,
            'inputMask': field.inputMask,
            'validationRule': field.validationRule,
            'rowSourceType': field.rowSourceType,
            'rowSource': field.rowSource,
            'displayControl': field.displayControl,
            'textFormat': field.textFormat,
            'dynamicFieldKey': field.lookup?.fieldRuntimeName,
            'options': field.dropdownOptions
                .map(
                  (option) => <String, Object?>{
                    'value': option,
                    'label': option,
                  },
                )
                .toList(growable: false),
          },
        )
        .toList(growable: false);

    final fieldPresentationSource = _buildFieldPresentationSource(module.fields);
    final dynamicLookupSource = _buildDynamicLookupSource(module.fields);

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
  final Map<String, List<LookupOption>> _lookupOptionsByField =
      <String, List<LookupOption>>{};
  static const Map<String, Map<String, Object?>> _fieldPresentation =
$fieldPresentationSource;
  static const Map<String, String> _dynamicLookupFields =
$dynamicLookupSource;

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
  void ngOnInit() {
    _loadLookupOptions();
  }

  List<String> get validationHints => $formLogicClassName.validationHints;

  String readField(String key) {
    final value = _draft[key];
    return _presentFieldValue(key, value);
  }

  String? readFieldError(String key) => validationErrors[key];

  List<LookupOption> lookupOptions(String key) {
    return _lookupOptionsByField[key] ?? const <LookupOption>[];
  }

  List<String> selectedFieldValues(String key) {
    final raw = _draft[key];
    if (raw == null) {
      return const <String>[];
    }
    if (raw is List) {
      return raw
          .map((value) => value?.toString() ?? '')
          .where((value) => value.isNotEmpty)
          .toList(growable: false);
    }
    final text = raw.toString().trim();
    if (text.isEmpty) {
      return const <String>[];
    }
    return text
        .split(';')
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .toList(growable: false);
  }

  bool isFieldOptionSelected(String key, String value) {
    return selectedFieldValues(key).contains(value);
  }

  void toggleFieldSelection(String key, String value, bool selected) {
    final values = selectedFieldValues(key).toSet();
    if (selected) {
      values.add(value);
    } else {
      values.remove(value);
    }
    _draft[key] = values.join(';');
    validationErrors.remove(key);
  }

  void updateField(String key, Object? value) {
    _draft[key] = _normalizeFieldValue(key, value);
    validationErrors.remove(key);
  }

  Future<void> _loadLookupOptions() async {
    if (_dynamicLookupFields.isEmpty) {
      return;
    }

    for (final entry in _dynamicLookupFields.entries) {
      try {
        _lookupOptionsByField[entry.key] = await _service.lookupOptions(entry.value);
      } catch (e) {
        validationErrors.putIfAbsent(
          entry.key,
          () => 'Falha ao carregar opcoes do campo \${entry.key}: \$e',
        );
      }
    }
  }

  String _presentFieldValue(String key, Object? value) {
    if (value == null) {
      return '';
    }
    if (value is! String) {
      return value.toString();
    }

    final metadata = _fieldPresentation[key] ?? const <String, Object?>{};
    var text = value;
    final inputMask = metadata['inputMask'] as String?;
    if (inputMask != null && inputMask.trim().isNotEmpty) {
      text = _applyAccessInputMask(text, inputMask);
    }
    return _applyAccessFormat(text, metadata['format'] as String?);
  }

  Object? _normalizeFieldValue(String key, Object? value) {
    if (value == null) {
      return value;
    }
    if (value is List) {
      return value
          .map((entry) => entry?.toString().trim() ?? '')
          .where((entry) => entry.isNotEmpty)
          .join(';');
    }
    if (value is! String) {
      return value;
    }

    final metadata = _fieldPresentation[key] ?? const <String, Object?>{};
    var text = _applyAccessFormat(value, metadata['format'] as String?);
    final inputMask = metadata['inputMask'] as String?;
    if (inputMask != null && inputMask.trim().isNotEmpty) {
      text = _applyAccessInputMask(text, inputMask);
    }

    final maxLength = metadata['maxLength'] as int?;
    if (maxLength != null && text.length > maxLength) {
      text = text.substring(0, maxLength);
    }

    final dartType = metadata['dartType'] as String?;
    switch (dartType) {
      case 'int?':
        return int.tryParse(text);
      case 'double?':
        return double.tryParse(text.replaceAll(',', '.'));
      case 'DateTime?':
        return DateTime.tryParse(text);
      default:
        return text;
    }
  }

  static String _applyAccessFormat(String value, String? format) {
    if (format == null || format.trim().isEmpty || value.isEmpty) {
      return value;
    }
    final normalized = format.trim();
    if (normalized.contains('>')) {
      return value.toUpperCase();
    }
    if (normalized.contains('<')) {
      return value.toLowerCase();
    }
    return value;
  }

  static String _applyAccessInputMask(String value, String mask) {
    final pattern = mask.split(';').first;
    if (pattern.trim().isEmpty || value.isEmpty) {
      return value;
    }

    final buffer = StringBuffer();
    var rawIndex = 0;
    var uppercase = false;
    var lowercase = false;
    var inQuotes = false;

    for (var index = 0; index < pattern.length; index++) {
      final token = pattern[index];
      if (token == '"') {
        inQuotes = !inQuotes;
        continue;
      }
      if (!inQuotes && token == '\\' && index + 1 < pattern.length) {
        if (rawIndex > 0 || rawIndex < value.length) {
          buffer.write(pattern[index + 1]);
        }
        index++;
        continue;
      }
      if (!inQuotes && token == '>') {
        uppercase = true;
        lowercase = false;
        continue;
      }
      if (!inQuotes && token == '<') {
        lowercase = true;
        uppercase = false;
        continue;
      }
      if (!inQuotes && token == '!') {
        continue;
      }

      final matcher = _maskMatcher(token, inQuotes);
      if (matcher == null) {
        if (buffer.isNotEmpty || rawIndex < value.length) {
          buffer.write(token);
        }
        continue;
      }

      final consumed = _consumeMatchingChar(value, rawIndex, matcher);
      if (consumed == null) {
        break;
      }
      rawIndex = consumed.nextIndex;

      var char = consumed.character;
      if (uppercase) {
        char = char.toUpperCase();
      } else if (lowercase) {
        char = char.toLowerCase();
      }
      buffer.write(char);
    }

    return buffer.toString();
  }

  static bool Function(String)? _maskMatcher(String token, bool inQuotes) {
    if (inQuotes) {
      return null;
    }
    switch (token) {
      case '0':
      case '9':
        return (char) => _isDigit(char);
      case 'L':
      case '?':
        return (char) => _isLetter(char);
      case 'A':
      case 'a':
        return (char) => _isLetter(char) || _isDigit(char);
      case 'C':
      case '&':
        return (char) => char.trim().isNotEmpty;
      default:
        return null;
    }
  }

  static _ConsumedChar? _consumeMatchingChar(
    String value,
    int start,
    bool Function(String) matcher,
  ) {
    for (var index = start; index < value.length; index++) {
      final char = value[index];
      if (!matcher(char)) {
        continue;
      }
      return _ConsumedChar(character: char, nextIndex: index + 1);
    }
    return null;
  }

  static bool _isDigit(String char) {
    final codeUnit = char.codeUnitAt(0);
    return codeUnit >= 48 && codeUnit <= 57;
  }

  static bool _isLetter(String char) {
    final codeUnit = char.toUpperCase().codeUnitAt(0);
    return codeUnit >= 65 && codeUnit <= 90;
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

class _ConsumedChar {
  final String character;
  final int nextIndex;

  const _ConsumedChar({required this.character, required this.nextIndex});
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

String? _buildFieldHint(GeneratedFieldDescriptor field) {
  final parts = <String>[];
  if (field.validationText != null && field.validationText!.trim().isNotEmpty) {
    parts.add(field.validationText!.trim());
  }
  if (field.description != null && field.description!.trim().isNotEmpty) {
    parts.add(field.description!.trim());
  }
  if (field.formatString != null && field.formatString!.trim().isNotEmpty) {
    parts.add('Formato Access: ${field.formatString!.trim()}');
  }
  if (field.inputMask != null && field.inputMask!.trim().isNotEmpty) {
    parts.add('Mascara Access: ${field.inputMask!.trim()}');
  }
  if (field.validationRule != null && field.validationRule!.trim().isNotEmpty) {
    parts.add('Regra Access: ${field.validationRule!.trim()}');
  }
  if (field.allowZeroLength == false) {
    parts.add('Nao aceita string vazia.');
  }
  if (field.isCalculated) {
    parts.add('Campo calculado do Access; leitura somente.');
  }
  if (field.displayControl != null) {
    parts.add('DisplayControl Access: ${field.displayControl}');
  }
  if (field.textFormat != null) {
    parts.add('TextFormat Access: ${field.textFormat}');
  }
  if (field.imeMode != null) {
    parts.add('IMEMode Access: ${field.imeMode}');
  }
  if (field.imeSentenceMode != null) {
    parts.add('IMESentenceMode Access: ${field.imeSentenceMode}');
  }
  if (field.allowMultipleValues == true) {
    parts.add('Campo multivalorado do Access.');
  }
  if (field.rowSourceType != null && field.rowSourceType!.trim().isNotEmpty) {
    parts.add('RowSourceType Access: ${field.rowSourceType!.trim()}');
  }
  if (field.rowSource != null && field.rowSource!.trim().isNotEmpty) {
    parts.add('RowSource Access: ${field.rowSource!.trim()}');
  }
  if (field.wssFieldId != null && field.wssFieldId!.trim().isNotEmpty) {
    parts.add('WSSFieldID Access: ${field.wssFieldId!.trim()}');
  }
  return parts.isEmpty ? null : parts.join(' | ');
}

String _buildFieldPresentationSource(List<GeneratedFieldDescriptor> fields) {
  if (fields.isEmpty) {
    return 'const <String, Map<String, Object?>>{}';
  }

  final entries = fields
      .where((field) => !field.isAutoNumber)
      .map((field) {
        final values = <String>[];
        values.add("'dartType': ${jsonEncode(field.dartType)}");
        if (field.formatString != null && field.formatString!.trim().isNotEmpty) {
          values.add("'format': ${jsonEncode(field.formatString!.trim())}");
        }
        if (field.inputMask != null && field.inputMask!.trim().isNotEmpty) {
          values.add("'inputMask': ${jsonEncode(field.inputMask!.trim())}");
        }
        if (field.maxLength != null) {
          values.add("'maxLength': ${field.maxLength}");
        }
        if (field.allowMultipleValues != null) {
          values.add("'allowMultipleValues': ${field.allowMultipleValues}");
        }
        if (field.rowSourceType != null && field.rowSourceType!.trim().isNotEmpty) {
          values.add("'rowSourceType': ${jsonEncode(field.rowSourceType!.trim())}");
        }
        if (field.rowSource != null && field.rowSource!.trim().isNotEmpty) {
          values.add("'rowSource': ${jsonEncode(field.rowSource!.trim())}");
        }
        if (field.wssFieldId != null && field.wssFieldId!.trim().isNotEmpty) {
          values.add("'wssFieldId': ${jsonEncode(field.wssFieldId!.trim())}");
        }
        return "    ${jsonEncode(field.runtimeName)}: <String, Object?>{${values.join(', ')}},";
      })
      .join('\n');

  return '<String, Map<String, Object?>>{\n$entries\n  }';
}

String _buildDynamicLookupSource(List<GeneratedFieldDescriptor> fields) {
  final entries = fields
      .where((field) => field.lookup != null)
      .map(
        (field) =>
            '    ${jsonEncode(field.runtimeName)}: ${jsonEncode(field.lookup!.fieldRuntimeName)},',
      )
      .join('\n');

  if (entries.isEmpty) {
    return 'const <String, String>{}';
  }

  return 'const <String, String>{\n$entries\n  }';
}