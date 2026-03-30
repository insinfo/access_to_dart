import 'dart:io';

import 'package:args/args.dart';
import 'package:win32/win32.dart';

import '_com_automation.dart';

const int acForm = 2;
const int acSaveYes = 1;
const int acDetail = 0;
const int acLabel = 100;
const int acCommandButton = 104;
const int acOptionButton = 105;
const int acCheckBox = 106;
const int acOptionGroup = 107;
const int acTextBox = 109;
const int acListBox = 110;
const int acComboBox = 111;
const int acSubForm = 112;

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
      'include-combo',
      help: 'Inclui ComboBox de prova com RowSource explicito.',
      defaultsTo: true,
    )
    ..addFlag(
      'include-listbox',
      help: 'Inclui ListBox de prova com RowSource explicito.',
      defaultsTo: true,
    )
    ..addFlag(
      'include-option-group',
      help: 'Inclui OptionGroup com botoes internos.',
      defaultsTo: true,
    )
    ..addFlag(
      'include-subform',
      help: 'Inclui SubForm real vinculado por chave mestre/detalhe.',
      defaultsTo: true,
    )
    ..addFlag(
      'accent-visuals',
      help:
          'Aplica propriedades visuais para forcar persistencia em PropData/Blob.',
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

  createLayoutProbeDatabase(
    args['output'] as String,
    includeCombo: args['include-combo'] as bool,
    includeListBox: args['include-listbox'] as bool,
    includeOptionGroup: args['include-option-group'] as bool,
    includeSubform: args['include-subform'] as bool,
    accentVisuals: args['accent-visuals'] as bool,
    visibleAtEnd: args['visible'] as bool,
    overwrite: args['overwrite'] as bool,
  );
}

void createLayoutProbeDatabase(
  String dbPath, {
  bool includeCombo = true,
  bool includeListBox = true,
  bool includeOptionGroup = true,
  bool includeSubform = true,
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
      'CREATE TABLE LayoutProbe ('
          'ID COUNTER CONSTRAINT PK_LayoutProbe PRIMARY KEY, '
          'CampoAlpha TEXT(50), '
          'CampoBeta TEXT(50), '
          'CampoModo TEXT(20), '
          'CampoLista TEXT(20), '
          'EstadoOpcao LONG, '
          'FlagAtivo YESNO)'
    ]);
    invokeMethod(db, 'Execute', [
      'CREATE TABLE LayoutProbeItens ('
          'ID COUNTER CONSTRAINT PK_LayoutProbeItens PRIMARY KEY, '
          'LayoutProbeID LONG, '
          'Descricao TEXT(80))'
    ]);
    invokeMethod(db, 'Execute', [
      'INSERT INTO LayoutProbe (CampoAlpha, CampoBeta, CampoModo, CampoLista, EstadoOpcao, FlagAtivo) VALUES '
          "('A', 'B', 'C', 'B', 2, True)"
    ]);
    invokeMethod(db, 'Execute', [
      "INSERT INTO LayoutProbeItens (LayoutProbeID, Descricao) VALUES (1, 'Primeiro item do subform')"
    ]);
    invokeMethod(db, 'Execute', [
      "INSERT INTO LayoutProbeItens (LayoutProbeID, Descricao) VALUES (1, 'Segundo item do subform')"
    ]);

    if (includeSubform) {
      _createSubformProbe(access, doCmd, dispatchers,
          accentVisuals: accentVisuals);
    }

    _createProbeForm(
      access,
      doCmd,
      dispatchers,
      includeCombo: includeCombo,
      includeListBox: includeListBox,
      includeOptionGroup: includeOptionGroup,
      includeSubform: includeSubform,
      accentVisuals: accentVisuals,
    );

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
  List<Dispatcher> dispatchers, {
  required bool includeCombo,
  required bool includeListBox,
  required bool includeOptionGroup,
  required bool includeSubform,
  required bool accentVisuals,
}) {
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
  if (accentVisuals) {
    _trySetProperty(form, 'BackColor', 16775650);
  }

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
  if (accentVisuals) {
    _applyVisualHints(
      lblBanner,
      foreColor: 16737792,
      fontName: 'Calibri',
      fontSize: 16,
      fontWeight: 700,
    );
  }

  final txtAlpha = _createBoundTextBox(
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
  if (accentVisuals) {
    _applyVisualHints(
      txtAlpha,
      backColor: 16777190,
      foreColor: 8404992,
      borderColor: 255,
      borderStyle: 1,
      borderWidth: 2,
      specialEffect: 2,
      textAlign: 2,
      tabIndex: 1,
    );
  }

  final txtBeta = _createBoundTextBox(
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
  if (accentVisuals) {
    _applyVisualHints(
      txtBeta,
      backColor: 15724527,
      foreColor: 4144959,
      borderColor: 32768,
      borderStyle: 1,
      specialEffect: 1,
      fontName: 'Consolas',
      fontSize: 11,
      tabIndex: 2,
    );
  }

  if (includeCombo) {
    final lblModo = _createLabel(
      access,
      tempFormName,
      dispatchers,
      name: 'lblModo',
      caption: 'Modo',
      left: 1320,
      top: 1500,
      width: 1200,
    );
    setProperty(lblModo, 'Height', 299);
    if (accentVisuals) {
      _applyVisualHints(lblModo, foreColor: 12611584, fontWeight: 600);
    }

    final combo = invokeDispatchMethod(access, 'CreateControl', [
      tempFormName,
      acComboBox,
      acDetail,
    ]);
    dispatchers.add(combo);
    setProperty(combo, 'Name', 'cmbModo');
    setProperty(combo, 'ControlSource', 'CampoModo');
    setProperty(combo, 'Left', 1320);
    setProperty(combo, 'Top', 1900);
    setProperty(combo, 'Width', 1888);
    setProperty(combo, 'Height', 315);
    setProperty(combo, 'RowSourceType', 'Value List');
    setProperty(combo, 'RowSource', 'A;B;C;D');
    setProperty(combo, 'LimitToList', false);
    setProperty(combo, 'ColumnCount', 1);
    if (accentVisuals) {
      _applyVisualHints(
        combo,
        backColor: 16777164,
        foreColor: 8388608,
        borderColor: 8421376,
        borderStyle: 1,
        specialEffect: 2,
        tabIndex: 3,
      );
    }
  }

  if (includeListBox) {
    final lblLista = _createLabel(
      access,
      tempFormName,
      dispatchers,
      name: 'lblLista',
      caption: 'Lista',
      left: 3480,
      top: 1500,
      width: 1200,
    );
    setProperty(lblLista, 'Height', 299);
    if (accentVisuals) {
      _applyVisualHints(lblLista, foreColor: 32896, fontWeight: 600);
    }

    final listBox = invokeDispatchMethod(access, 'CreateControl', [
      tempFormName,
      acListBox,
      acDetail,
    ]);
    dispatchers.add(listBox);
    setProperty(listBox, 'Name', 'lstModo');
    setProperty(listBox, 'ControlSource', 'CampoLista');
    setProperty(listBox, 'Left', 3480);
    setProperty(listBox, 'Top', 1900);
    setProperty(listBox, 'Width', 1888);
    setProperty(listBox, 'Height', 900);
    setProperty(listBox, 'RowSourceType', 'Value List');
    setProperty(listBox, 'RowSource', 'A;B;C;D');
    _trySetProperty(listBox, 'ColumnCount', 1);
    _trySetProperty(listBox, 'BoundColumn', 1);
    _trySetProperty(listBox, 'MultiSelect', 0);
    if (accentVisuals) {
      _applyVisualHints(
        listBox,
        backColor: 15794160,
        foreColor: 128,
        borderColor: 32896,
        borderStyle: 1,
        specialEffect: 1,
        tabIndex: 4,
      );
    }
  }

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
  if (accentVisuals) {
    _applyVisualHints(chkLabel, foreColor: 12615680, fontWeight: 600);
  }

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
  if (accentVisuals) {
    _applyVisualHints(
      checkBox,
      foreColor: 16711680,
      backColor: 16777164,
      tabIndex: 5,
    );
  }

  if (includeOptionGroup) {
    final lblGrupo = _createLabel(
      access,
      tempFormName,
      dispatchers,
      name: 'lblEstadoGrupo',
      caption: 'Estado',
      left: 600,
      top: 3720,
      width: 1200,
    );
    setProperty(lblGrupo, 'Height', 288);
    if (accentVisuals) {
      _applyVisualHints(lblGrupo, foreColor: 8388736, fontWeight: 600);
    }

    final optionGroup = invokeDispatchMethod(access, 'CreateControl', [
      tempFormName,
      acOptionGroup,
      acDetail,
    ]);
    dispatchers.add(optionGroup);
    setProperty(optionGroup, 'Name', 'grpEstado');
    setProperty(optionGroup, 'ControlSource', 'EstadoOpcao');
    setProperty(optionGroup, 'Left', 600);
    setProperty(optionGroup, 'Top', 4050);
    setProperty(optionGroup, 'Width', 2400);
    setProperty(optionGroup, 'Height', 1200);
    if (accentVisuals) {
      _applyVisualHints(
        optionGroup,
        backColor: 16776176,
        borderColor: 8388736,
        borderStyle: 1,
        specialEffect: 2,
        tabIndex: 6,
      );
    }

    _createOptionButton(
      access,
      tempFormName,
      dispatchers,
      parentName: 'grpEstado',
      name: 'optEstadoA',
      caption: 'Aberto',
      optionValue: 1,
      left: 840,
      top: 4320,
      width: 1800,
      height: 240,
    );
    _createOptionButton(
      access,
      tempFormName,
      dispatchers,
      parentName: 'grpEstado',
      name: 'optEstadoB',
      caption: 'Em analise',
      optionValue: 2,
      left: 840,
      top: 4620,
      width: 1800,
      height: 240,
    );
    _createOptionButton(
      access,
      tempFormName,
      dispatchers,
      parentName: 'grpEstado',
      name: 'optEstadoC',
      caption: 'Fechado',
      optionValue: 3,
      left: 840,
      top: 4920,
      width: 1800,
      height: 240,
    );
  }

  if (includeSubform) {
    final lblSubform = _createLabel(
      access,
      tempFormName,
      dispatchers,
      name: 'lblSubItens',
      caption: 'Itens relacionados',
      left: 3240,
      top: 3720,
      width: 2100,
    );
    setProperty(lblSubform, 'Height', 288);
    if (accentVisuals) {
      _applyVisualHints(lblSubform, foreColor: 128, fontWeight: 600);
    }

    final subform = invokeDispatchMethod(access, 'CreateControl', [
      tempFormName,
      acSubForm,
      acDetail,
    ]);
    dispatchers.add(subform);
    setProperty(subform, 'Name', 'subfrmItens');
    setProperty(subform, 'SourceObject', 'Form.frmLayoutProbeItensSubform');
    setProperty(subform, 'LinkChildFields', 'LayoutProbeID');
    setProperty(subform, 'LinkMasterFields', 'ID');
    setProperty(subform, 'Left', 3240);
    setProperty(subform, 'Top', 4050);
    setProperty(subform, 'Width', 3420);
    setProperty(subform, 'Height', 1500);
    if (accentVisuals) {
      _applyVisualHints(
        subform,
        borderColor: 128,
        borderStyle: 1,
        specialEffect: 1,
        tabIndex: 7,
      );
    }
  }

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
  if (accentVisuals) {
    _applyVisualHints(
      button,
      backColor: 49407,
      foreColor: 16777215,
      specialEffect: 2,
      fontWeight: 700,
      tabIndex: 8,
    );
  }

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

void _createSubformProbe(
  Dispatcher access,
  Dispatcher doCmd,
  List<Dispatcher> dispatchers, {
  required bool accentVisuals,
}) {
  final form = invokeDispatchMethod(access, 'CreateForm');
  dispatchers.add(form);
  final tempFormName = getStringProperty(form, 'Name');

  setProperty(form, 'Caption', 'Layout Probe Itens');
  setProperty(form, 'RecordSource', 'LayoutProbeItens');
  setProperty(form, 'NavigationButtons', false);
  setProperty(form, 'RecordSelectors', false);
  setProperty(form, 'ScrollBars', 0);
  setProperty(form, 'DividingLines', false);
  setProperty(form, 'DefaultView', 1);

  final txtProbeId = _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtLayoutProbeID',
    controlSource: 'LayoutProbeID',
    left: 300,
    top: 120,
    width: 900,
    height: 240,
    label: 'ProbeID',
  );
  _trySetProperty(txtProbeId, 'Visible', false);

  final txtDescricao = _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtDescricaoItem',
    controlSource: 'Descricao',
    left: 300,
    top: 520,
    width: 2400,
    height: 280,
    label: 'Descricao',
  );
  if (accentVisuals) {
    _applyVisualHints(
      txtDescricao,
      backColor: 16777190,
      borderColor: 8421376,
      borderStyle: 1,
      specialEffect: 1,
    );
  }

  invokeMethod(doCmd, 'Close', [acForm, tempFormName, acSaveYes]);
  invokeMethod(
      doCmd, 'Rename', ['frmLayoutProbeItensSubform', acForm, tempFormName]);
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
  int? borderWidth,
  int? specialEffect,
  int? textAlign,
  String? fontName,
  int? fontSize,
  int? fontWeight,
  int? tabIndex,
}) {
  _trySetProperty(control, 'BackColor', backColor);
  _trySetProperty(control, 'ForeColor', foreColor);
  _trySetProperty(control, 'BorderColor', borderColor);
  _trySetProperty(control, 'BorderStyle', borderStyle);
  _trySetProperty(control, 'BorderWidth', borderWidth);
  _trySetProperty(control, 'SpecialEffect', specialEffect);
  _trySetProperty(control, 'TextAlign', textAlign);
  _trySetProperty(control, 'FontName', fontName);
  _trySetProperty(control, 'FontSize', fontSize);
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
