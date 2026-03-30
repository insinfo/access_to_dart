import 'dart:io';

import 'package:args/args.dart';
import 'package:win32/win32.dart';

import '_com_automation.dart';

const int acForm = 2;
const int acSaveYes = 1;
const int acDetail = 0;
const int acLabel = 100;
const int acCommandButton = 104;
const int acCheckBox = 106;
const int acTextBox = 109;
const int acComboBox = 111;

const _accessProgIds = <String>[
  'Access.Application',
];

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      'output',
      abbr: 'o',
      help: 'Caminho do arquivo .accdb a ser criado.',
      defaultsTo: r'C:\Temp\layout_diff_probe.accdb',
    )
    ..addOption(
      'left',
      defaultsTo: '1200',
      help: 'Valor Left do controle principal.',
    )
    ..addOption(
      'top',
      defaultsTo: '900',
      help: 'Valor Top do controle principal.',
    )
    ..addOption(
      'width',
      defaultsTo: '2200',
      help: 'Valor Width do controle principal.',
    )
    ..addOption(
      'height',
      defaultsTo: '330',
      help: 'Valor Height do controle principal.',
    )
    ..addOption(
      'control-kind',
      allowed: const ['textbox', 'combo', 'checkbox'],
      defaultsTo: 'textbox',
      help: 'Tipo do controle principal.',
    )
    ..addOption(
      'control-caption',
      defaultsTo: 'Selecionar',
      help: 'Caption do controle principal quando aplicavel.',
    )
    ..addOption(
      'row-source-type',
      defaultsTo: 'Value List',
      help: 'RowSourceType para combobox.',
    )
    ..addOption(
      'row-source',
      defaultsTo: 'A;B;C;D',
      help: 'RowSource para combobox.',
    )
    ..addOption('back-color', help: 'BackColor opcional do controle principal.')
    ..addOption('fore-color', help: 'ForeColor opcional do controle principal.')
    ..addOption('border-color',
        help: 'BorderColor opcional do controle principal.')
    ..addOption('border-style',
        help: 'BorderStyle opcional do controle principal.')
    ..addOption('border-width',
        help: 'BorderWidth opcional do controle principal.')
    ..addOption('special-effect',
        help: 'SpecialEffect opcional do controle principal.')
    ..addOption('text-align', help: 'TextAlign opcional do controle principal.')
    ..addOption('font-name', help: 'FontName opcional do controle principal.')
    ..addOption('font-size', help: 'FontSize opcional do controle principal.')
    ..addOption('font-weight',
        help: 'FontWeight opcional do controle principal.')
    ..addOption(
      'visible-state',
      allowed: const ['inherit', 'true', 'false'],
      defaultsTo: 'inherit',
      help: 'Forca Visible no controle principal.',
    )
    ..addOption(
      'enabled-state',
      allowed: const ['inherit', 'true', 'false'],
      defaultsTo: 'inherit',
      help: 'Forca Enabled no controle principal.',
    )
    ..addOption(
      'tab-stop-state',
      allowed: const ['inherit', 'true', 'false'],
      defaultsTo: 'inherit',
      help: 'Forca TabStop no controle principal.',
    )
    ..addOption('tab-index', help: 'TabIndex opcional do controle principal.')
    ..addOption(
      'vba-message',
      defaultsTo: 'Probe v1',
      help: 'Mensagem usada no VBA do formulario.',
    )
    ..addFlag(
      'include-vba',
      defaultsTo: true,
      help: 'Inclui codigo VBA no formulario.',
    )
    ..addFlag(
      'visible',
      help: 'Abre o Microsoft Access ao final.',
      defaultsTo: false,
    )
    ..addFlag(
      'overwrite',
      help: 'Sobrescreve o arquivo se ele ja existir.',
      defaultsTo: true,
    )
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Mostra esta ajuda.',
    );

  final args = parser.parse(arguments);
  if (args['help'] as bool) {
    stdout.writeln(parser.usage);
    return;
  }

  _createLayoutDiffFixture(
    args['output'] as String,
    left: int.parse(args['left'] as String),
    top: int.parse(args['top'] as String),
    width: int.parse(args['width'] as String),
    height: int.parse(args['height'] as String),
    controlKind: args['control-kind'] as String,
    controlCaption: args['control-caption'] as String,
    rowSourceType: args['row-source-type'] as String,
    rowSource: args['row-source'] as String,
    visualOptions: _ControlVisualOptions(
      backColor: _parseOptionalInt(args['back-color'] as String?),
      foreColor: _parseOptionalInt(args['fore-color'] as String?),
      borderColor: _parseOptionalInt(args['border-color'] as String?),
      borderStyle: _parseOptionalInt(args['border-style'] as String?),
      borderWidth: _parseOptionalInt(args['border-width'] as String?),
      specialEffect: _parseOptionalInt(args['special-effect'] as String?),
      textAlign: _parseOptionalInt(args['text-align'] as String?),
      fontName: (args['font-name'] as String?)?.trim(),
      fontSize: _parseOptionalInt(args['font-size'] as String?),
      fontWeight: _parseOptionalInt(args['font-weight'] as String?),
      visible: _parseTriState(args['visible-state'] as String),
      enabled: _parseTriState(args['enabled-state'] as String),
      tabStop: _parseTriState(args['tab-stop-state'] as String),
      tabIndex: _parseOptionalInt(args['tab-index'] as String?),
    ),
    vbaMessage: args['vba-message'] as String,
    includeVba: args['include-vba'] as bool,
    visibleAtEnd: args['visible'] as bool,
    overwrite: args['overwrite'] as bool,
  );
}

void _createLayoutDiffFixture(
  String dbPath, {
  required int left,
  required int top,
  required int width,
  required int height,
  required String controlKind,
  required String controlCaption,
  required String rowSourceType,
  required String rowSource,
  required _ControlVisualOptions visualOptions,
  required String vbaMessage,
  required bool includeVba,
  bool visibleAtEnd = false,
  bool overwrite = true,
}) {
  dbPath = File(dbPath).absolute.path;
  initializeComApartment();

  Dispatcher? access;
  Dispatcher? db;
  Dispatcher? doCmd;
  Dispatcher? form;
  Dispatcher? formModule;
  final dispatchers = <Dispatcher>[];

  try {
    final file = File(dbPath);
    file.parent.createSync(recursive: true);

    terminateProcessesByExecutableName('MSACCESS.EXE');

    if (file.existsSync()) {
      if (!overwrite) {
        throw StateError('O arquivo ja existe: $dbPath');
      }
      file.deleteSync();
    }

    access = createDispatcher(_accessProgIds);
    setProperty(access, 'Visible', false);
    invokeMethod(access, 'NewCurrentDatabase', [dbPath]);
    doCmd = getDispatchProperty(access, 'DoCmd');
    db = invokeDispatchMethod(access, 'CurrentDb');

    invokeMethod(db, 'Execute', [
      'CREATE TABLE LayoutProbe ('
          'ID COUNTER CONSTRAINT PK_LayoutProbe PRIMARY KEY, '
          'CampoAlpha TEXT(50), '
          'FlagAtivo YESNO)'
    ]);
    invokeMethod(db, 'Execute',
        ["INSERT INTO LayoutProbe (CampoAlpha, FlagAtivo) VALUES ('A', True)"]);

    form = invokeDispatchMethod(access, 'CreateForm');
    dispatchers.add(form);
    final tempFormName = getStringProperty(form, 'Name');

    setProperty(form, 'Caption', 'Diff Probe');
    setProperty(form, 'RecordSource', 'LayoutProbe');
    setProperty(form, 'NavigationButtons', false);
    setProperty(form, 'RecordSelectors', false);
    setProperty(form, 'ScrollBars', 0);
    setProperty(form, 'DividingLines', false);
    setProperty(form, 'DefaultView', 0);
    setProperty(form, 'HasModule', includeVba);

    _createLabel(
      access,
      tempFormName,
      dispatchers,
      name: 'lblProbe',
      caption: 'Probe Field',
      left: left,
      top: top - 300,
      width: 1200,
      height: 260,
    );

    if (controlKind == 'combo') {
      final combo = invokeDispatchMethod(access, 'CreateControl', [
        tempFormName,
        acComboBox,
        acDetail,
      ]);
      dispatchers.add(combo);
      setProperty(combo, 'Name', 'ctlProbe');
      setProperty(combo, 'ControlSource', 'CampoAlpha');
      setProperty(combo, 'Left', left);
      setProperty(combo, 'Top', top);
      setProperty(combo, 'Width', width);
      setProperty(combo, 'Height', height);
      setProperty(combo, 'RowSourceType', rowSourceType);
      setProperty(combo, 'RowSource', rowSource);
      setProperty(combo, 'LimitToList', false);
      setProperty(combo, 'ColumnCount', 1);
      _applyVisualOptions(combo, visualOptions);
    } else if (controlKind == 'checkbox') {
      final checkBox = invokeDispatchMethod(access, 'CreateControl', [
        tempFormName,
        acCheckBox,
        acDetail,
      ]);
      dispatchers.add(checkBox);
      setProperty(checkBox, 'Name', 'ctlProbe');
      setProperty(checkBox, 'ControlSource', 'FlagAtivo');
      _trySetProperty(checkBox, 'Caption', controlCaption);
      setProperty(checkBox, 'Left', left);
      setProperty(checkBox, 'Top', top);
      setProperty(checkBox, 'Width', width);
      setProperty(checkBox, 'Height', height);
      _applyVisualOptions(checkBox, visualOptions);
    } else {
      final textBox = invokeDispatchMethod(access, 'CreateControl', [
        tempFormName,
        acTextBox,
        acDetail,
      ]);
      dispatchers.add(textBox);
      setProperty(textBox, 'Name', 'ctlProbe');
      setProperty(textBox, 'ControlSource', 'CampoAlpha');
      setProperty(textBox, 'Left', left);
      setProperty(textBox, 'Top', top);
      setProperty(textBox, 'Width', width);
      setProperty(textBox, 'Height', height);
      setProperty(textBox, 'Format', '>');
      setProperty(textBox, 'InputMask',
          '>??????????????????????????????????????????????????');
      _applyVisualOptions(textBox, visualOptions);
    }

    final button = invokeDispatchMethod(access, 'CreateControl', [
      tempFormName,
      acCommandButton,
      acDetail,
    ]);
    dispatchers.add(button);
    setProperty(button, 'Name', 'cmdProbe');
    setProperty(button, 'Caption', 'Executar');
    setProperty(button, 'Left', left);
    setProperty(button, 'Top', top + 700);
    setProperty(button, 'Width', 1400);
    setProperty(button, 'Height', 380);

    if (includeVba) {
      formModule = getDispatchProperty(form, 'Module');
      setProperty(button, 'OnClick', '[Event Procedure]');
      final clickLine = invokeIntMethod(
        formModule,
        'CreateEventProc',
        ['Click', 'cmdProbe'],
      );
      invokeMethod(formModule, 'InsertLines', [
        clickLine + 1,
        '''
    Dim msg As String
    msg = "${_escapeVbaString(vbaMessage)}"
    MsgBox msg, vbInformation, "Probe"
'''
      ]);

      final insertAt = getIntProperty(formModule, 'CountOfLines') + 1;
      invokeMethod(formModule, 'InsertLines', [
        insertAt,
        '''
Private Function ProbeSummary() As String
    ProbeSummary = "left=$left;top=$top;width=$width;height=$height;kind=${_escapeVbaString(controlKind)};style=${_escapeVbaString(visualOptions.summary)}"
End Function
'''
      ]);
    }

    invokeMethod(doCmd, 'Close', [acForm, tempFormName, acSaveYes]);
    invokeMethod(doCmd, 'Rename', ['frmDiffProbe', acForm, tempFormName]);

    if (visibleAtEnd) {
      invokeMethod(doCmd, 'OpenForm', ['frmDiffProbe']);
      setProperty(access, 'Visible', true);
    } else {
      invokeMethod(access, 'CloseCurrentDatabase');
      invokeMethod(access, 'Quit');
    }

    stdout.writeln('Banco de diff criado em: $dbPath');
    stdout.writeln(
      'Formulario frmDiffProbe com controlKind=$controlKind left=$left top=$top width=$width height=$height includeVba=$includeVba style=${visualOptions.summary}.',
    );
  } finally {
    for (final dispatcher in dispatchers.reversed) {
      releaseDispatcher(dispatcher);
    }
    releaseDispatcher(formModule);
    releaseDispatcher(doCmd);
    releaseDispatcher(db);
    releaseDispatcher(access);
    CoUninitialize();

    if (!visibleAtEnd) {
      sleep(const Duration(milliseconds: 2500));
      terminateProcessesByExecutableName('MSACCESS.EXE');
    }
  }
}

Dispatcher _createLabel(
  Dispatcher access,
  String formName,
  List<Dispatcher> dispatchers, {
  required String name,
  required String caption,
  required int left,
  required int top,
  required int width,
  required int height,
}) {
  final label = invokeDispatchMethod(access, 'CreateControl', [
    formName,
    acLabel,
    acDetail,
  ]);
  dispatchers.add(label);
  setProperty(label, 'Name', name);
  setProperty(label, 'Caption', caption);
  setProperty(label, 'Left', left);
  setProperty(label, 'Top', top);
  setProperty(label, 'Width', width);
  setProperty(label, 'Height', height);
  return label;
}

String _escapeVbaString(String value) {
  return value.replaceAll('"', '""');
}

void _applyVisualOptions(Dispatcher control, _ControlVisualOptions options) {
  _trySetProperty(control, 'BackColor', options.backColor);
  _trySetProperty(control, 'ForeColor', options.foreColor);
  _trySetProperty(control, 'BorderColor', options.borderColor);
  _trySetProperty(control, 'BorderStyle', options.borderStyle);
  _trySetProperty(control, 'BorderWidth', options.borderWidth);
  _trySetProperty(control, 'SpecialEffect', options.specialEffect);
  _trySetProperty(control, 'TextAlign', options.textAlign);
  _trySetProperty(control, 'FontName', options.fontName);
  _trySetProperty(control, 'FontSize', options.fontSize);
  _trySetProperty(control, 'FontWeight', options.fontWeight);
  _trySetProperty(control, 'Visible', options.visible);
  _trySetProperty(control, 'Enabled', options.enabled);
  _trySetProperty(control, 'TabStop', options.tabStop);
  _trySetProperty(control, 'TabIndex', options.tabIndex);
}

void _trySetProperty(Dispatcher dispatcher, String name, Object? value) {
  if (value == null) {
    return;
  }
  try {
    setProperty(dispatcher, name, value);
  } catch (_) {}
}

int? _parseOptionalInt(String? value) {
  if (value == null) {
    return null;
  }
  final trimmed = value.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  return int.tryParse(trimmed);
}

bool? _parseTriState(String value) {
  switch (value.trim().toLowerCase()) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      return null;
  }
}

final class _ControlVisualOptions {
  final int? backColor;
  final int? foreColor;
  final int? borderColor;
  final int? borderStyle;
  final int? borderWidth;
  final int? specialEffect;
  final int? textAlign;
  final String? fontName;
  final int? fontSize;
  final int? fontWeight;
  final bool? visible;
  final bool? enabled;
  final bool? tabStop;
  final int? tabIndex;

  const _ControlVisualOptions({
    required this.backColor,
    required this.foreColor,
    required this.borderColor,
    required this.borderStyle,
    required this.borderWidth,
    required this.specialEffect,
    required this.textAlign,
    required this.fontName,
    required this.fontSize,
    required this.fontWeight,
    required this.visible,
    required this.enabled,
    required this.tabStop,
    required this.tabIndex,
  });

  String get summary {
    final parts = <String>[];
    if (backColor != null) parts.add('backColor=$backColor');
    if (foreColor != null) parts.add('foreColor=$foreColor');
    if (borderColor != null) parts.add('borderColor=$borderColor');
    if (borderStyle != null) parts.add('borderStyle=$borderStyle');
    if (borderWidth != null) parts.add('borderWidth=$borderWidth');
    if (specialEffect != null) parts.add('specialEffect=$specialEffect');
    if (textAlign != null) parts.add('textAlign=$textAlign');
    if (fontName != null && fontName!.isNotEmpty) {
      parts.add('fontName=$fontName');
    }
    if (fontSize != null) parts.add('fontSize=$fontSize');
    if (fontWeight != null) parts.add('fontWeight=$fontWeight');
    if (visible != null) parts.add('visible=$visible');
    if (enabled != null) parts.add('enabled=$enabled');
    if (tabStop != null) parts.add('tabStop=$tabStop');
    if (tabIndex != null) parts.add('tabIndex=$tabIndex');
    return parts.isEmpty ? 'default' : parts.join(';');
  }
}
