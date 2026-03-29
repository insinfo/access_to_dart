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
      allowed: const ['textbox', 'combo'],
      defaultsTo: 'textbox',
      help: 'Tipo do controle principal.',
    )
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

  createLayoutDiffFixture(
    args['output'] as String,
    left: int.parse(args['left'] as String),
    top: int.parse(args['top'] as String),
    width: int.parse(args['width'] as String),
    height: int.parse(args['height'] as String),
    controlKind: args['control-kind'] as String,
    vbaMessage: args['vba-message'] as String,
    includeVba: args['include-vba'] as bool,
    visibleAtEnd: args['visible'] as bool,
    overwrite: args['overwrite'] as bool,
  );
}

void createLayoutDiffFixture(
  String dbPath, {
  required int left,
  required int top,
  required int width,
  required int height,
  required String controlKind,
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
    invokeMethod(db, 'Execute', [
      "INSERT INTO LayoutProbe (CampoAlpha, FlagAtivo) VALUES ('A', True)"
    ]);

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
      setProperty(combo, 'RowSourceType', 'Value List');
      setProperty(combo, 'RowSource', 'A;B;C;D');
      setProperty(combo, 'LimitToList', false);
      setProperty(combo, 'ColumnCount', 1);
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
      setProperty(textBox, 'InputMask', '>??????????????????????????????????????????????????');
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
    ProbeSummary = "left=$left;top=$top;width=$width;height=$height;kind=${_escapeVbaString(controlKind)}"
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
      'Formulario frmDiffProbe com controlKind=$controlKind left=$left top=$top width=$width height=$height includeVba=$includeVba.',
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
