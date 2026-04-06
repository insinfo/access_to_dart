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
            'label': _htmlTextLiteral(field.label),
            'readKey': field.runtimeName,
            'updateKey': field.runtimeName,
            'ngControl': field.fieldName,
            'inputType': field.inputType,
            'inputMode': field.inputMode,
            'selectSize': field.selectSize,
            'isReadOnly': field.isReadOnly,
            'isRequired': field.isRequired,
            'maxLength': field.maxLength,
            'title': _buildFieldHint(field) == null
                ? null
                : _htmlTextLiteral(_buildFieldHint(field)!),
            'isCheckboxControl': field.isCheckboxControl,
            'isTextAreaControl': field.isTextAreaControl,
            'isAttachmentField': field.isAttachmentField,
            'isMultiValueSelect': field.isMultiValueSuggested,
            'isSingleSelect': field.isDropdownSuggested && !field.isMultiValueSuggested,
            'isSelect': field.isDropdownSuggested,
            'isNotSelect': !field.isDropdownSuggested,
            'isPlainInput': !field.isDropdownSuggested && !field.isCheckboxControl && !field.isTextAreaControl && !field.isAttachmentField,
            'isDynamicSelect': field.hasDynamicLookup,
            'attachmentTableName': field.attachmentTableName == null
              ? null
              : _htmlTextLiteral(field.attachmentTableName!),
            'attachmentLinkColumn': field.attachmentLinkColumn == null
              ? null
              : _htmlTextLiteral(field.attachmentLinkColumn!),
            'format': field.formatString == null
                ? null
                : _htmlTextLiteral(field.formatString!),
            'inputMask': field.inputMask == null
                ? null
                : _htmlTextLiteral(field.inputMask!),
            'validationRule': field.validationRule == null
                ? null
                : _htmlTextLiteral(field.validationRule!),
            'rowSourceType': field.rowSourceType == null
                ? null
                : _htmlTextLiteral(field.rowSourceType!),
            'rowSource': field.rowSource == null
                ? null
                : _htmlTextLiteral(field.rowSource!),
            'displayControl': field.displayControl,
            'textFormat': field.textFormat,
            'dynamicFieldKey': field.lookup?.fieldRuntimeName,
            'options': field.dropdownOptions
                .map(
                  (option) => <String, Object?>{
                    'value': _htmlTextLiteral(option),
                    'label': _htmlTextLiteral(option),
                  },
                )
                .toList(growable: false),
          },
        )
        .toList(growable: false);

    final fieldPresentationSource = _buildFieldPresentationSource(module.fields);
    final dynamicLookupSource = _buildDynamicLookupSource(module.fields);
    final attachmentPresentationSource = _buildAttachmentPresentationSource(
      module.attachments,
    );

    final htmlContent = _buildIncluirPageHtml(
      namePascal: namePascal,
      fields: formFields,
    );

    final dartContent = '''
  import 'dart:async';
  import 'dart:html' as html;

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
  final Map<String, List<Map<String, dynamic>>> _attachmentRowsByField =
      <String, List<Map<String, dynamic>>>{};
  final Map<String, Map<String, String>> _attachmentDraftsByField =
      <String, Map<String, String>>{};
  final Map<String, Map<String, String>> _attachmentSelectedFilesByField =
      <String, Map<String, String>>{};
  final Map<String, String> _attachmentErrorsByField =
      <String, String>{};
  final Set<String> _attachmentLoadingFields = <String>{};
  static const Map<String, Map<String, Object?>> _fieldPresentation =
$fieldPresentationSource;
  static const Map<String, String> _dynamicLookupFields =
$dynamicLookupSource;
  static const Map<String, Map<String, Object?>> _attachmentPresentation =
$attachmentPresentationSource;

  @Input('entity')
  set entityInput($namePascal? val) {
    _draft
      ..clear()
      ..addAll(val?.toMap() ?? $namePascal.defaultValues());
    _attachmentDraftsByField.clear();
    _attachmentSelectedFilesByField.clear();
    _loadAttachmentSubresources();
  }

  final _updateEntityController = StreamController<$namePascal>.broadcast();

  @Output('onUpdateEntity')
  Stream<$namePascal> get onUpdateEntity => _updateEntityController.stream;

  @override
  void ngOnInit() {
    _loadLookupOptions();
    _loadAttachmentSubresources();
  }

  List<String> get validationHints => $formLogicClassName.validationHints;

  String readField(String key) {
    final value = _draft[key];
    return _presentFieldValue(key, value);
  }

  bool readFieldBool(String key) {
    final value = _draft[key];
    if (value is bool) {
      return value;
    }
    final normalized = (value?.toString() ?? '').trim().toLowerCase();
    return normalized == 'true' ||
        normalized == '1' ||
        normalized == '-1' ||
        normalized == 'yes';
  }

  String? readFieldError(String key) => validationErrors[key];

  List<LookupOption> lookupOptions(String key) {
    return _lookupOptionsByField[key] ?? const <LookupOption>[];
  }

  List<Map<String, dynamic>> attachmentRows(String key) {
    return _attachmentRowsByField[key] ?? const <Map<String, dynamic>>[];
  }

  List<Map<String, Object?>> attachmentColumns(String key) {
    final metadata = _attachmentPresentation[key] ?? const <String, Object?>{};
    final columns = metadata['columns'];
    if (columns is! List) {
      return const <Map<String, Object?>>[];
    }
    return columns.whereType<Map>().map((entry) {
      return entry.cast<String, Object?>();
    }).toList(growable: false);
  }

  String? attachmentError(String key) => _attachmentErrorsByField[key];

  bool isAttachmentLoading(String key) {
    return _attachmentLoadingFields.contains(key);
  }

  bool hasAttachmentParentId() {
    return _currentEntityIdOrNull() != null;
  }

  String attachmentDraftValue(String key, String columnRuntimeName) {
    return _attachmentDraftsByField[key]?[columnRuntimeName] ?? '';
  }

  String? attachmentSelectedFileName(String key, String columnRuntimeName) {
    return _attachmentSelectedFilesByField[key]?[columnRuntimeName];
  }

  void updateAttachmentDraftField(
    String key,
    String columnRuntimeName,
    Object? value,
  ) {
    final draft = _attachmentDraftsByField.putIfAbsent(
      key,
      () => <String, String>{},
    );
    draft[columnRuntimeName] = value?.toString() ?? '';
    _attachmentErrorsByField.remove(key);
  }

  String attachmentColumnRuntimeName(Map<String, Object?> column) {
    return column['runtimeName']?.toString() ?? '';
  }

  String attachmentColumnLabel(Map<String, Object?> column) {
    return column['label']?.toString() ?? attachmentColumnRuntimeName(column);
  }

  bool attachmentColumnIsBinary(Map<String, Object?> column) {
    return column['isBinary'] == true;
  }

  Future<void> onAttachmentFileSelected(
    String key,
    String columnRuntimeName,
    html.Event event,
  ) async {
    final target = event.target;
    if (target is! html.FileUploadInputElement) {
      return;
    }
    final files = target.files;
    if (files == null || files.isEmpty) {
      final fieldDrafts = _attachmentDraftsByField[key];
      fieldDrafts?.remove(columnRuntimeName);
      _attachmentSelectedFilesByField[key]?.remove(columnRuntimeName);
      return;
    }

    final file = files.first;
    try {
      final encoded = await _readAttachmentFileAsBase64(file);
      updateAttachmentDraftField(key, columnRuntimeName, encoded);
      final selectedFiles = _attachmentSelectedFilesByField.putIfAbsent(
        key,
        () => <String, String>{},
      );
      selectedFiles[columnRuntimeName] = file.name;
      _autoFillAttachmentFileName(key, file.name);
    } catch (e) {
      _attachmentErrorsByField[key] =
          'Falha ao ler arquivo do attachment no campo \$key: \$e';
    }
  }

  Future<void> createAttachment(String key) async {
    final id = _currentEntityIdOrNull();
    if (id == null) {
      _attachmentErrorsByField[key] =
          'Salve o registro principal antes de incluir anexos.';
      return;
    }

    final payload = <String, dynamic>{};
    final draft = _attachmentDraftsByField[key] ?? const <String, String>{};
    for (final column in attachmentColumns(key)) {
      final runtimeName = attachmentColumnRuntimeName(column);
      if (runtimeName.isEmpty) {
        continue;
      }
      final text = draft[runtimeName]?.trim() ?? '';
      if (text.isEmpty) {
        continue;
      }
      payload[runtimeName] = text;
    }
    if (payload.isEmpty) {
      _attachmentErrorsByField[key] =
          'Informe ao menos um campo do attachment antes de incluir.';
      return;
    }

    _attachmentLoadingFields.add(key);
    _attachmentErrorsByField.remove(key);
    try {
      await _service.createAttachmentRow(id, key, payload);
      _attachmentDraftsByField[key] = <String, String>{};
      _attachmentSelectedFilesByField[key] = <String, String>{};
      await _reloadAttachmentField(key, id);
    } catch (e) {
      _attachmentErrorsByField[key] =
          'Falha ao incluir attachment no campo \$key: \$e';
    } finally {
      _attachmentLoadingFields.remove(key);
    }
  }

  Future<void> removeAttachment(String key, int ordinal) async {
    final id = _currentEntityIdOrNull();
    if (id == null) {
      return;
    }
    _attachmentLoadingFields.add(key);
    _attachmentErrorsByField.remove(key);
    try {
      await _service.removeAttachmentRow(id, key, ordinal);
      await _reloadAttachmentField(key, id);
    } catch (e) {
      _attachmentErrorsByField[key] =
          'Falha ao remover attachment do campo \$key: \$e';
    } finally {
      _attachmentLoadingFields.remove(key);
    }
  }

  String attachmentRowSummary(String key, Map<String, dynamic> row) {
    final metadata = _attachmentPresentation[key] ?? const <String, Object?>{};
    final columns = (metadata['columns'] as List?) ?? const <Object?>[];
    final parts = <String>[];
    for (final entry in columns.whereType<Map>()) {
      final column = entry.cast<String, Object?>();
      final runtimeName = column['runtimeName'] as String?;
      final label = column['label'] as String? ?? runtimeName;
      if (runtimeName == null || runtimeName.isEmpty) {
        continue;
      }
      final value = row[runtimeName];
      if (value == null) {
        continue;
      }
      final text = value.toString().trim();
      if (text.isEmpty) {
        continue;
      }
      parts.add('\$label: \$text');
    }
    if (parts.isEmpty) {
      return row.toString();
    }
    return parts.join(' | ');
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

  Future<void> _loadAttachmentSubresources() async {
    if (_attachmentPresentation.isEmpty) {
      return;
    }

    final id = _currentEntityIdOrNull();
    if (id == null) {
      _attachmentRowsByField.clear();
      _attachmentDraftsByField.clear();
      _attachmentSelectedFilesByField.clear();
      _attachmentErrorsByField.clear();
      _attachmentLoadingFields.clear();
      return;
    }

    for (final entry in _attachmentPresentation.entries) {
      await _reloadAttachmentField(entry.key, id);
    }
  }

  Future<void> _reloadAttachmentField(
    String fieldKey,
    ${module.primaryKeyParamType} id,
  ) async {
    _attachmentLoadingFields.add(fieldKey);
    _attachmentErrorsByField.remove(fieldKey);
    try {
      _attachmentRowsByField[fieldKey] = await _service.attachmentRows(
        id,
        fieldKey,
      );
    } catch (e) {
      _attachmentErrorsByField[fieldKey] =
          'Falha ao carregar anexos do campo \$fieldKey: \$e';
    } finally {
      _attachmentLoadingFields.remove(fieldKey);
    }
  }

  void _autoFillAttachmentFileName(String key, String fileName) {
    final targetColumn = _attachmentFileNameColumn(key);
    if (targetColumn == null || targetColumn.isEmpty) {
      return;
    }
    final draft = _attachmentDraftsByField.putIfAbsent(
      key,
      () => <String, String>{},
    );
    final current = draft[targetColumn]?.trim() ?? '';
    if (current.isEmpty) {
      draft[targetColumn] = fileName;
    }
  }

  String? _attachmentFileNameColumn(String key) {
    for (final column in attachmentColumns(key)) {
      if (attachmentColumnIsBinary(column)) {
        continue;
      }
      final runtimeName = attachmentColumnRuntimeName(column);
      final label = attachmentColumnLabel(column);
      if (_looksLikeAttachmentFileNameColumn(runtimeName, label)) {
        return runtimeName;
      }
    }
    return null;
  }

  bool _looksLikeAttachmentFileNameColumn(String runtimeName, String label) {
    final combined =
      '\${runtimeName.toLowerCase()} \${label.toLowerCase()}';
    return combined.contains('file') ||
        combined.contains('nome') ||
        combined.contains('arquivo') ||
        combined.contains('anexo') ||
        combined.contains('title') ||
        combined.contains('titulo');
  }

  Future<String> _readAttachmentFileAsBase64(html.File file) {
    final completer = Completer<String>();
    final reader = html.FileReader();

    StreamSubscription<html.ProgressEvent>? loadSubscription;
    StreamSubscription<html.ProgressEvent>? errorSubscription;

    loadSubscription = reader.onLoad.listen((_) {
      final result = reader.result;
      if (result is! String) {
        completer.completeError(
          StateError('Leitura do arquivo nao retornou Data URL.'),
        );
        return;
      }
      final separator = result.indexOf(',');
      completer.complete(separator >= 0 ? result.substring(separator + 1) : result);
      loadSubscription?.cancel();
      errorSubscription?.cancel();
    });

    errorSubscription = reader.onError.listen((_) {
      completer.completeError(
        reader.error ?? StateError('Falha ao ler arquivo selecionado.'),
      );
      loadSubscription?.cancel();
      errorSubscription?.cancel();
    });

    reader.readAsDataUrl(file);
    return completer.future;
  }

  ${module.primaryKeyParamType}? _currentEntityIdOrNull() {
    final entity = $namePascal.fromMap(_draft);
    return entity.${module.primaryKeyField};
  }

  String _presentFieldValue(String key, Object? value) {
    if (value == null) {
      return '';
    }
    final metadata = _fieldPresentation[key] ?? const <String, Object?>{};
    if (value is DateTime) {
      return _formatTemporalInputValue(
        metadata['inputType'] as String?,
        value,
      );
    }
    if (value is! String) {
      return value.toString();
    }

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
        return _parseTemporalInputValue(
          metadata['inputType'] as String?,
          text,
        );
      default:
        return text;
    }
  }

  static String _formatTemporalInputValue(String? inputType, DateTime value) {
    final utc = value.toUtc();
    final year = utc.year.toString().padLeft(4, '0');
    final month = utc.month.toString().padLeft(2, '0');
    final day = utc.day.toString().padLeft(2, '0');
    final hour = utc.hour.toString().padLeft(2, '0');
    final minute = utc.minute.toString().padLeft(2, '0');
    final second = utc.second.toString().padLeft(2, '0');
    switch (inputType) {
      case 'date':
        return '\$year-\$month-\$day';
      case 'time':
        return '\$hour:\$minute:\$second';
      case 'datetime-local':
        return '\$year-\$month-\$day' 'T' '\$hour:\$minute:\$second';
      default:
        return utc.toIso8601String();
    }
  }

  static DateTime? _parseTemporalInputValue(String? inputType, String value) {
    final text = value.trim();
    if (text.isEmpty) {
      return null;
    }
    switch (inputType) {
      case 'date':
      case 'datetime-local':
        return DateTime.tryParse(text);
      case 'time':
        final parts = text.split(':');
        if (parts.length < 2) {
          return null;
        }
        final hour = int.tryParse(parts[0]);
        final minute = int.tryParse(parts[1]);
        final second = parts.length >= 3 ? int.tryParse(parts[2]) : 0;
        if (hour == null || minute == null || second == null) {
          return null;
        }
        return DateTime.utc(1899, 12, 30, hour, minute, second);
      default:
        return DateTime.tryParse(text);
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
      if (!inQuotes && token == '\\\\' && index + 1 < pattern.length) {
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
        : 'const <String>[\n${hints.map((hint) => '    ${_dartStringLiteral(hint)},').join('\n')}\n  ]';
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
  if (field.accessDefaultValue != null && field.accessDefaultValue!.trim().isNotEmpty) {
    parts.add('Default Access: ${field.accessDefaultValue!.trim()}');
  }
  if (field.semanticDefaultExpression != null && field.semanticDefaultExpression!.trim().isNotEmpty) {
    parts.add('Default semantico aplicado no scaffold.');
  }
  if (field.allowZeroLength == false) {
    parts.add('Nao aceita string vazia.');
  }
  if (field.isUuidSuggested) {
    parts.add('Campo UUID/GUID do Access.');
  }
  if (field.isCalculated) {
    parts.add('Campo calculado do Access; leitura somente.');
  }
  if (field.isAttachmentField) {
    final attachmentTableName = field.attachmentTableName?.trim();
    final attachmentLinkColumn = field.attachmentLinkColumn?.trim();
    parts.add('Campo de anexos do Access; o scaffold atual lista, inclui e remove linhas da relacao materializada.');
    parts.add('Campos binarios do attachment usam upload real de arquivo no formulario gerado.');
    if (attachmentTableName != null && attachmentTableName.isNotEmpty) {
      parts.add('Tabela auxiliar de anexos: $attachmentTableName.');
    }
    if (attachmentLinkColumn != null && attachmentLinkColumn.isNotEmpty) {
      parts.add('Coluna de vinculo do attachment: $attachmentLinkColumn.');
    }
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
        values.add("'dartType': ${_dartStringLiteral(field.dartType)}");
        values.add("'inputType': ${_dartStringLiteral(field.inputType)}");
        if (field.formatString != null && field.formatString!.trim().isNotEmpty) {
          values.add("'format': ${_dartStringLiteral(field.formatString!.trim())}");
        }
        if (field.inputMask != null && field.inputMask!.trim().isNotEmpty) {
          values.add("'inputMask': ${_dartStringLiteral(field.inputMask!.trim())}");
        }
        if (field.maxLength != null) {
          values.add("'maxLength': ${field.maxLength}");
        }
        if (field.accessDefaultValue != null && field.accessDefaultValue!.trim().isNotEmpty) {
          values.add("'accessDefaultValue': ${_dartStringLiteral(field.accessDefaultValue!.trim())}");
        }
        if (field.semanticDefaultExpression != null && field.semanticDefaultExpression!.trim().isNotEmpty) {
          values.add("'hasSemanticDefault': true");
        }
        if (field.allowMultipleValues != null) {
          values.add("'allowMultipleValues': ${field.allowMultipleValues}");
        }
        if (field.rowSourceType != null && field.rowSourceType!.trim().isNotEmpty) {
          values.add("'rowSourceType': ${_dartStringLiteral(field.rowSourceType!.trim())}");
        }
        if (field.rowSource != null && field.rowSource!.trim().isNotEmpty) {
          values.add("'rowSource': ${_dartStringLiteral(field.rowSource!.trim())}");
        }
        if (field.wssFieldId != null && field.wssFieldId!.trim().isNotEmpty) {
          values.add("'wssFieldId': ${_dartStringLiteral(field.wssFieldId!.trim())}");
        }
        return "    ${_dartStringLiteral(field.runtimeName)}: <String, Object?>{${values.join(', ')}},";
      })
      .join('\n');

  return '<String, Map<String, Object?>>{\n$entries\n  }';
}

String _buildDynamicLookupSource(List<GeneratedFieldDescriptor> fields) {
  final entries = fields
      .where((field) => field.lookup != null)
      .map(
        (field) =>
          '    ${_dartStringLiteral(field.runtimeName)}: ${_dartStringLiteral(field.lookup!.fieldRuntimeName)},',
      )
      .join('\n');

  if (entries.isEmpty) {
    return 'const <String, String>{}';
  }

  return 'const <String, String>{\n$entries\n  }';
}

String _buildAttachmentPresentationSource(
  List<GeneratedAttachmentSubresource> attachments,
) {
  if (attachments.isEmpty) {
    return 'const <String, Map<String, Object?>>{}';
  }

  final entries = attachments.map((attachment) {
    final columns = attachment.columns
        .map(
          (column) =>
              "        <String, Object?>{'runtimeName': ${_dartStringLiteral(column.runtimeName)}, 'label': ${_dartStringLiteral(column.label)}, 'isBinary': ${column.isBinary}},",
        )
        .join('\n');
    return "    ${_dartStringLiteral(attachment.fieldRuntimeName)}: <String, Object?>{'fieldLabel': ${_dartStringLiteral(attachment.fieldLabel)}, 'attachmentTableName': ${_dartStringLiteral(attachment.attachmentTableName)}, 'attachmentLinkColumn': ${_dartStringLiteral(attachment.attachmentLinkColumnName)}, 'columns': <Map<String, Object?>>[\n$columns\n      ]},";
  }).join('\n');

  return '<String, Map<String, Object?>>{\n$entries\n  }';
}