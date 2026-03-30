import 'dart:io';

import 'package:args/args.dart';
import 'package:win32/win32.dart';

import '_com_automation.dart';

const int acForm = 2;
const int acSaveYes = 1;
const int acDetail = 0;
const int acLabel = 100;
const int acOptionButton = 105;
const int acOptionGroup = 107;

const _accessProgIds = <String>[
  'Access.Application',
];

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      'output',
      abbr: 'o',
      help: 'Caminho do arquivo .accdb a ser criado.',
      defaultsTo: r'C:\Temp\option_group_probe.accdb',
    )
    ..addFlag(
      'include-external-label',
      help: 'Inclui um label externo acima do OptionGroup para comparacao.',
      defaultsTo: false,
    )
    ..addFlag(
      'accent-visuals',
      help: 'Aplica propriedades visuais para forcar persistencia no Blob.',
      defaultsTo: true,
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

  createOptionGroupProbeDatabase(
    args['output'] as String,
    includeExternalLabel: args['include-external-label'] as bool,
    accentVisuals: args['accent-visuals'] as bool,
    visibleAtEnd: args['visible'] as bool,
    overwrite: args['overwrite'] as bool,
  );
}

void createOptionGroupProbeDatabase(
  String dbPath, {
  bool includeExternalLabel = false,
  bool accentVisuals = true,
  bool visibleAtEnd = false,
  bool overwrite = true,
}) {
  dbPath = File(dbPath).absolute.path;
  initializeComApartment();

  Dispatcher? access;
  Dispatcher? db;
  Dispatcher? doCmd;
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
      'CREATE TABLE OptionGroupProbe ('
          'ID COUNTER CONSTRAINT PK_OptionGroupProbe PRIMARY KEY, '
          'EstadoOpcao LONG)'
    ]);
    invokeMethod(db, 'Execute',
        ['INSERT INTO OptionGroupProbe (EstadoOpcao) VALUES (2)']);

    _createOptionGroupProbeForm(
      access,
      doCmd,
      dispatchers,
      includeExternalLabel: includeExternalLabel,
      accentVisuals: accentVisuals,
    );

    if (visibleAtEnd) {
      invokeMethod(doCmd, 'OpenForm', ['frmOptionGroupProbe']);
      setProperty(access, 'Visible', true);
    } else {
      invokeMethod(access, 'CloseCurrentDatabase');
      invokeMethod(access, 'Quit');
    }

    stdout.writeln('Banco de OptionGroup criado com sucesso em: $dbPath');
    stdout.writeln('Formulario criado: frmOptionGroupProbe.');
  } finally {
    for (final dispatcher in dispatchers.reversed) {
      releaseDispatcher(dispatcher);
    }
    releaseDispatcher(doCmd);
    releaseDispatcher(db);
    releaseDispatcher(access);
  }
}

void _createOptionGroupProbeForm(
  Dispatcher access,
  Dispatcher doCmd,
  List<Dispatcher> dispatchers, {
  required bool includeExternalLabel,
  required bool accentVisuals,
}) {
  final form = invokeDispatchMethod(access, 'CreateForm');
  dispatchers.add(form);
  final tempFormName = getStringProperty(form, 'Name');

  setProperty(form, 'Caption', 'OptionGroup Probe');
  setProperty(form, 'RecordSource', 'OptionGroupProbe');
  setProperty(form, 'NavigationButtons', false);
  setProperty(form, 'RecordSelectors', false);
  setProperty(form, 'ScrollBars', 0);
  setProperty(form, 'DividingLines', false);
  setProperty(form, 'DefaultView', 0);
  if (accentVisuals) {
    _trySetProperty(form, 'BackColor', 16776176);
  }

  if (includeExternalLabel) {
    final label = _createLabel(
      access,
      tempFormName,
      dispatchers,
      name: 'lblEstadoGrupoProbe',
      caption: 'Estado da solicitacao',
      left: 720,
      top: 420,
      width: 2100,
      height: 300,
    );
    if (accentVisuals) {
      _applyVisualHints(label, foreColor: 8388736, fontWeight: 700);
    }
  }

  final optionGroup = invokeDispatchMethod(access, 'CreateControl', [
    tempFormName,
    acOptionGroup,
    acDetail,
  ]);
  dispatchers.add(optionGroup);
  setProperty(optionGroup, 'Name', 'grpEstadoIsolado');
  setProperty(optionGroup, 'ControlSource', 'EstadoOpcao');
  setProperty(optionGroup, 'Left', 720);
  setProperty(optionGroup, 'Top', includeExternalLabel ? 900 : 540);
  setProperty(optionGroup, 'Width', 3000);
  setProperty(optionGroup, 'Height', 1680);
  if (accentVisuals) {
    _applyVisualHints(
      optionGroup,
      backColor: 16775650,
      borderColor: 8388736,
      borderStyle: 1,
      specialEffect: 2,
      tabIndex: 0,
    );
  }

  _createOptionButton(
    access,
    tempFormName,
    dispatchers,
    parentName: 'grpEstadoIsolado',
    name: 'optEstadoAberto',
    caption: 'Aberto',
    optionValue: 1,
    left: 1020,
    top: (includeExternalLabel ? 1260 : 900),
    width: 2100,
    height: 240,
  );
  _createOptionButton(
    access,
    tempFormName,
    dispatchers,
    parentName: 'grpEstadoIsolado',
    name: 'optEstadoAnalise',
    caption: 'Em analise',
    optionValue: 2,
    left: 1020,
    top: (includeExternalLabel ? 1560 : 1200),
    width: 2100,
    height: 240,
  );
  _createOptionButton(
    access,
    tempFormName,
    dispatchers,
    parentName: 'grpEstadoIsolado',
    name: 'optEstadoFechado',
    caption: 'Fechado',
    optionValue: 3,
    left: 1020,
    top: (includeExternalLabel ? 1860 : 1500),
    width: 2100,
    height: 240,
  );

  invokeMethod(doCmd, 'Close', [acForm, tempFormName, acSaveYes]);
  invokeMethod(doCmd, 'Rename', ['frmOptionGroupProbe', acForm, tempFormName]);
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

void _createOptionButton(
  Dispatcher access,
  String formName,
  List<Dispatcher> dispatchers, {
  required String parentName,
  required String name,
  required String caption,
  required int optionValue,
  required int left,
  required int top,
  required int width,
  required int height,
}) {
  final optionButton = invokeDispatchMethod(access, 'CreateControl', [
    formName,
    acOptionButton,
    acDetail,
    parentName,
  ]);
  dispatchers.add(optionButton);
  setProperty(optionButton, 'Name', name);
  _trySetProperty(optionButton, 'Caption', caption);
  _trySetProperty(optionButton, 'OptionValue', optionValue);
  setProperty(optionButton, 'Left', left);
  setProperty(optionButton, 'Top', top);
  setProperty(optionButton, 'Width', width);
  setProperty(optionButton, 'Height', height);
}

void _applyVisualHints(
  Dispatcher control, {
  int? backColor,
  int? foreColor,
  int? borderColor,
  int? borderStyle,
  int? specialEffect,
  int? fontWeight,
  int? tabIndex,
}) {
  _trySetProperty(control, 'BackColor', backColor);
  _trySetProperty(control, 'ForeColor', foreColor);
  _trySetProperty(control, 'BorderColor', borderColor);
  _trySetProperty(control, 'BorderStyle', borderStyle);
  _trySetProperty(control, 'SpecialEffect', specialEffect);
  _trySetProperty(control, 'FontWeight', fontWeight);
  _trySetProperty(control, 'TabIndex', tabIndex);
}

void _trySetProperty(Dispatcher dispatcher, String name, Object? value) {
  if (value == null) {
    return;
  }
  try {
    setProperty(dispatcher, name, value);
  } catch (_) {}
}
