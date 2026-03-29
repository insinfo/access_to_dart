import 'dart:io';

import 'package:args/args.dart';
import 'package:win32/win32.dart';

import '_com_automation.dart';

const int acForm = 2;
const int acSaveYes = 1;
const int acDetail = 0;
const int acLabel = 100;
const int acCommandButton = 104;
const int acTextBox = 109;
const int acCheckBox = 106;

const _accessProgIds = <String>[
  'Access.Application',
];

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      'output',
      abbr: 'o',
      help: 'Caminho do arquivo .accdb a ser criado.',
      defaultsTo: r'C:\Temp\layout_probe_demo.accdb',
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

  createLayoutProbeDatabase(
    args['output'] as String,
    visibleAtEnd: args['visible'] as bool,
    overwrite: args['overwrite'] as bool,
  );
}

void createLayoutProbeDatabase(
  String dbPath, {
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
      'CREATE TABLE LayoutProbe ('
          'ID COUNTER CONSTRAINT PK_LayoutProbe PRIMARY KEY, '
          'CampoAlpha TEXT(50), '
          'CampoBeta TEXT(50), '
          'FlagAtivo YESNO)'
    ]);
    invokeMethod(db, 'Execute', [
      "INSERT INTO LayoutProbe (CampoAlpha, CampoBeta, FlagAtivo) VALUES "
          "('A', 'B', True)"
    ]);

    _createProbeForm(access, doCmd, dispatchers);

    if (visibleAtEnd) {
      invokeMethod(doCmd, 'OpenForm', ['frmLayoutProbe']);
      setProperty(access, 'Visible', true);
    } else {
      invokeMethod(access, 'CloseCurrentDatabase');
      invokeMethod(access, 'Quit');
    }

    stdout.writeln('Banco de layout criado com sucesso em: $dbPath');
    stdout.writeln('Formulario criado: frmLayoutProbe.');
  } finally {
    for (final dispatcher in dispatchers.reversed) {
      releaseDispatcher(dispatcher);
    }
    releaseDispatcher(doCmd);
    releaseDispatcher(db);
    releaseDispatcher(access);
  }
}

void _createProbeForm(
  Dispatcher access,
  Dispatcher doCmd,
  List<Dispatcher> dispatchers,
) {
  final form = invokeDispatchMethod(access, 'CreateForm');
  dispatchers.add(form);
  final tempFormName = getStringProperty(form, 'Name');

  setProperty(form, 'Caption', 'Layout Probe');
  setProperty(form, 'RecordSource', 'LayoutProbe');
  setProperty(form, 'NavigationButtons', false);
  setProperty(form, 'RecordSelectors', false);
  setProperty(form, 'ScrollBars', 0);
  setProperty(form, 'DividingLines', false);
  setProperty(form, 'DefaultView', 0);

  final lblBanner = _createLabel(
    access,
    tempFormName,
    dispatchers,
    name: 'lblBanner',
    caption: 'Probe Banner',
    left: 333,
    top: 177,
    width: 2111,
  );
  setProperty(lblBanner, 'Height', 277);

  _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtAlpha',
    controlSource: 'CampoAlpha',
    left: 1234,
    top: 456,
    width: 2345,
    height: 321,
    label: 'Alpha',
  );

  _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtBeta',
    controlSource: 'CampoBeta',
    left: 4321,
    top: 987,
    width: 1543,
    height: 287,
    label: 'Beta',
  );

  final chkLabel = _createLabel(
    access,
    tempFormName,
    dispatchers,
    name: 'lblFlagAtivo',
    caption: 'Flag Ativo',
    left: 2468,
    top: 2222,
    width: 1333,
  );
  setProperty(chkLabel, 'Height', 288);

  final checkBox = invokeDispatchMethod(access, 'CreateControl', [
    tempFormName,
    acCheckBox,
    acDetail,
  ]);
  dispatchers.add(checkBox);
  setProperty(checkBox, 'Name', 'chkFlagAtivo');
  setProperty(checkBox, 'ControlSource', 'FlagAtivo');
  setProperty(checkBox, 'Left', 2642);
  setProperty(checkBox, 'Top', 2579);
  setProperty(checkBox, 'Width', 444);
  setProperty(checkBox, 'Height', 219);

  final button = invokeDispatchMethod(access, 'CreateControl', [
    tempFormName,
    acCommandButton,
    acDetail,
  ]);
  dispatchers.add(button);
  setProperty(button, 'Name', 'cmdApplyProbe');
  setProperty(button, 'Caption', 'Aplicar');
  setProperty(button, 'Left', 5555);
  setProperty(button, 'Top', 3333);
  setProperty(button, 'Width', 1111);
  setProperty(button, 'Height', 377);

  invokeMethod(doCmd, 'Close', [acForm, tempFormName, acSaveYes]);
  invokeMethod(doCmd, 'Rename', ['frmLayoutProbe', acForm, tempFormName]);
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
  return label;
}

Dispatcher _createBoundTextBox(
  Dispatcher access,
  String formName,
  List<Dispatcher> dispatchers, {
  required String name,
  required String controlSource,
  required int left,
  required int top,
  required int width,
  required int height,
  required String label,
}) {
  final labelControl = _createLabel(
    access,
    formName,
    dispatchers,
    name: 'lbl$name',
    caption: label,
    left: left,
    top: top,
    width: 1200,
  );
  setProperty(labelControl, 'Height', 299);

  final textBox = invokeDispatchMethod(access, 'CreateControl', [
    formName,
    acTextBox,
    acDetail,
  ]);
  dispatchers.add(textBox);
  setProperty(textBox, 'Name', name);
  setProperty(textBox, 'ControlSource', controlSource);
  setProperty(textBox, 'Left', left);
  setProperty(textBox, 'Top', top + 401);
  setProperty(textBox, 'Width', width);
  setProperty(textBox, 'Height', height);
  return textBox;
}