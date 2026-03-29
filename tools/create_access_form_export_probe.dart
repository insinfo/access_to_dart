import 'dart:io';

import 'package:args/args.dart';
import 'package:win32/win32.dart';

import '_com_automation.dart';

const int acForm = 2;
const int acSaveYes = 1;
const int acDetail = 0;
const int acDesign = 1;
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
      defaultsTo: r'C:\Temp\despacho_automatico.accdb',
    )
    ..addOption(
      'form-name',
      help: 'Nome final do formulario.',
      defaultsTo: 'frmDespachoAutomatico',
    )
    ..addOption(
      'native-export-dir',
      help: 'Diretorio para exportacao nativa via SaveAsText.',
    )
    ..addFlag(
      'run-native-export',
      help: 'Executa a exportacao nativa usando Application.SaveAsText.',
      defaultsTo: true,
    )
    ..addFlag(
      'run-vcs-export',
      help: 'Tenta executar a exportacao via MSAccess-VCS-Addin.',
      defaultsTo: true,
    )
    ..addOption(
      'addin-path',
      help: 'Caminho do add-in do Version Control/MSAccessVCS.',
    )
    ..addOption(
      'vcs-procedure',
      help: 'Procedure VBA chamada via Application.Run para o add-in.',
      defaultsTo: 'HandleRibbonCommand',
    )
    ..addOption(
      'vcs-command',
      help: 'Parametro passado para a procedure do add-in.',
      defaultsTo: 'btnExport',
    )
    ..addFlag(
      'run-second-export',
      help: 'Executa uma segunda exportacao apos pequenas mutacoes de layout.',
      defaultsTo: true,
    )
    ..addOption(
      'second-export-dir',
      help: 'Diretorio para a segunda exportacao SaveAsText apos mutacoes.',
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
      'kill-access-before-start',
      help: 'Encerra processos MSACCESS.EXE antes de iniciar.',
      defaultsTo: true,
    )
    ..addFlag(
      'kill-access-on-exit',
      help: 'Encerra processos MSACCESS.EXE ao finalizar quando nao estiver visivel.',
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

  gerarFormularioEExportar(
    args['output'] as String,
    formName: args['form-name'] as String,
    nativeExportDir: args['native-export-dir'] as String?,
    runNativeExport: args['run-native-export'] as bool,
    runVcsExport: args['run-vcs-export'] as bool,
    addinPath: args['addin-path'] as String?,
    vcsProcedure: args['vcs-procedure'] as String?,
    vcsCommand: args['vcs-command'] as String?,
    runSecondExport: args['run-second-export'] as bool,
    secondExportDir: args['second-export-dir'] as String?,
    visibleAtEnd: args['visible'] as bool,
    overwrite: args['overwrite'] as bool,
    killAccessBeforeStart: args['kill-access-before-start'] as bool,
    killAccessOnExit: args['kill-access-on-exit'] as bool,
  );
}

void gerarFormularioEExportar(
  String dbPath, {
  required String formName,
  String? nativeExportDir,
  bool runNativeExport = true,
  bool runVcsExport = true,
  String? addinPath,
  String? vcsProcedure,
  String? vcsCommand,
  bool runSecondExport = true,
  String? secondExportDir,
  bool visibleAtEnd = false,
  bool overwrite = true,
  bool killAccessBeforeStart = true,
  bool killAccessOnExit = true,
}) {
  dbPath = File(dbPath).absolute.path;
  initializeComApartment();

  Dispatcher? access;
  Dispatcher? db;
  Dispatcher? doCmd;
  final dispatchers = <Dispatcher>[];

  try {
    final dbFile = File(dbPath);
    dbFile.parent.createSync(recursive: true);

    if (killAccessBeforeStart) {
      terminateProcessesByExecutableName('MSACCESS.EXE');
    }

    if (dbFile.existsSync()) {
      if (!overwrite) {
        throw StateError('O arquivo ja existe: $dbPath');
      }
      dbFile.deleteSync();
    }

    access = createDispatcher(_accessProgIds);
    setProperty(access, 'Visible', false);

    invokeMethod(access, 'NewCurrentDatabase', [dbPath]);
    doCmd = getDispatchProperty(access, 'DoCmd');
    db = invokeDispatchMethod(access, 'CurrentDb');

    _criarTabela(db);
    _inserirDadosExemplo(db);
    _criarFormulario(access, doCmd, dispatchers, formName);

    stdout.writeln('Formulario $formName criado com sucesso em $dbPath');

    if (runNativeExport) {
      final exportPath = _exportarNativamente(
        access,
        dbPath: dbPath,
        formName: formName,
        nativeExportDir: nativeExportDir,
      );
      stdout.writeln('[OK] Exportacao nativa concluida: $exportPath');

      if (runSecondExport) {
        final mutatedExportPath = _mutarLayoutEExportarNovamente(
          access,
          doCmd,
          formName: formName,
          dbPath: dbPath,
          secondExportDir: secondExportDir ?? nativeExportDir,
        );
        stdout.writeln(
          '[OK] Segunda exportacao apos mutacao concluida: $mutatedExportPath',
        );
      }
    }

    if (runVcsExport) {
      setProperty(access, 'Visible', true);
      setProperty(access, 'UserControl', true);
      sleep(const Duration(milliseconds: 1000));

      final vcsResult = _tentarExportacaoViaVcsAddin(
        access,
        addinPath: addinPath,
        procedureName: vcsProcedure,
        commandName: vcsCommand,
      );
      if (vcsResult.success) {
        stdout.writeln(
          '[OK] Exportacao via add-in concluida: ${vcsResult.message}',
        );
      } else {
        stdout.writeln(
          '[AVISO] Exportacao via add-in nao executada: ${vcsResult.message}',
        );
      }
    }

    if (visibleAtEnd) {
      invokeMethod(doCmd, 'OpenForm', [formName]);
      setProperty(access, 'Visible', true);
    } else {
      invokeMethod(access, 'CloseCurrentDatabase');
      invokeMethod(access, 'Quit');
    }
  } finally {
    for (final dispatcher in dispatchers.reversed) {
      releaseDispatcher(dispatcher);
    }
    releaseDispatcher(doCmd);
    releaseDispatcher(db);
    releaseDispatcher(access);

    CoUninitialize();

    if (!visibleAtEnd && killAccessOnExit) {
      sleep(const Duration(milliseconds: 1500));
      terminateProcessesByExecutableName('MSACCESS.EXE');
    }
  }
}

void _criarTabela(Dispatcher db) {
  invokeMethod(db, 'Execute', [
    'CREATE TABLE ProcessosDespacho ('
        'ID COUNTER CONSTRAINT PK_Despacho PRIMARY KEY, '
        'NumeroProcesso TEXT(50), '
        'Assunto TEXT(255), '
        'RequerAssinatura YESNO)'
  ]);
}

void _inserirDadosExemplo(Dispatcher db) {
  invokeMethod(db, 'Execute', [
    "INSERT INTO ProcessosDespacho (NumeroProcesso, Assunto, RequerAssinatura) "
        "VALUES ('2026/000123', 'Despacho inicial do processo', True)"
  ]);
}

void _criarFormulario(
  Dispatcher access,
  Dispatcher doCmd,
  List<Dispatcher> dispatchers,
  String targetFormName,
) {
  final form = invokeDispatchMethod(access, 'CreateForm');
  dispatchers.add(form);

  final tempFormName = getStringProperty(form, 'Name');

  setProperty(form, 'Caption', 'Despacho Automatico de Processos');
  setProperty(form, 'RecordSource', 'ProcessosDespacho');
  setProperty(form, 'HasModule', true);
  setProperty(form, 'NavigationButtons', false);
  setProperty(form, 'RecordSelectors', false);
  setProperty(form, 'ScrollBars', 0);
  setProperty(form, 'DividingLines', false);
  setProperty(form, 'DefaultView', 0);
  setProperty(form, 'Width', 9000);

  _createLabel(
    access,
    tempFormName,
    dispatchers,
    name: 'lblTitulo',
    caption: 'Despacho Automatico de Processos (SALI)',
    left: 600,
    top: 300,
    width: 5000,
    height: 350,
  );

  _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtNumeroProcesso',
    controlSource: 'NumeroProcesso',
    labelCaption: 'Numero do Processo',
    left: 600,
    top: 900,
    width: 2800,
    height: 330,
  );

  _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtAssunto',
    controlSource: 'Assunto',
    labelCaption: 'Assunto',
    left: 600,
    top: 1650,
    width: 4200,
    height: 330,
  );

  _createLabel(
    access,
    tempFormName,
    dispatchers,
    name: 'lblAssinatura',
    caption: 'Requer Assinatura Digital',
    left: 600,
    top: 2400,
    width: 2600,
    height: 300,
  );

  final chkAssinatura = invokeDispatchMethod(access, 'CreateControl', [
    tempFormName,
    acCheckBox,
    acDetail,
  ]);
  dispatchers.add(chkAssinatura);
  setProperty(chkAssinatura, 'Name', 'chkRequerAssinatura');
  setProperty(chkAssinatura, 'ControlSource', 'RequerAssinatura');
  setProperty(chkAssinatura, 'Left', 3300);
  setProperty(chkAssinatura, 'Top', 2360);
  setProperty(chkAssinatura, 'Width', 300);
  setProperty(chkAssinatura, 'Height', 300);

  final cmdProbeVba = invokeDispatchMethod(access, 'CreateControl', [
    tempFormName,
    acCommandButton,
    acDetail,
  ]);
  dispatchers.add(cmdProbeVba);
  setProperty(cmdProbeVba, 'Name', 'cmdProbeVba');
  setProperty(cmdProbeVba, 'Caption', 'Executar Probe VBA');
  setProperty(cmdProbeVba, 'Left', 600);
  setProperty(cmdProbeVba, 'Top', 3000);
  setProperty(cmdProbeVba, 'Width', 1900);
  setProperty(cmdProbeVba, 'Height', 360);

  final module = getDispatchProperty(form, 'Module');
  dispatchers.add(module);
  setProperty(cmdProbeVba, 'OnClick', '[Event Procedure]');
  final clickLine = invokeIntMethod(
    module,
    'CreateEventProc',
    ['Click', 'cmdProbeVba'],
  );
  invokeMethod(module, 'InsertLines', [
    clickLine + 1,
    '''
    Dim probeMsg As String
    probeMsg = ProbeSummary()
    MsgBox probeMsg, vbInformation, "Probe"
'''
  ]);
  invokeMethod(module, 'InsertLines', [
    getIntProperty(module, 'CountOfLines') + 1,
    '''
Private Function ProbeSummary() As String
    ProbeSummary = "form=frmDespachoAutomatico;controle=txtAssunto;width=4200"
End Function
'''
  ]);

  invokeMethod(doCmd, 'Close', [acForm, tempFormName, acSaveYes]);
  invokeMethod(doCmd, 'Rename', [targetFormName, acForm, tempFormName]);
}

String _exportarNativamente(
  Dispatcher access, {
  required String dbPath,
  required String formName,
  String? nativeExportDir,
  String fileSuffix = '',
}) {
  final exportDir = Directory(
    nativeExportDir == null || nativeExportDir.trim().isEmpty
        ? '${File(dbPath).parent.path}\\src\\forms'
        : nativeExportDir,
  );
  exportDir.createSync(recursive: true);

  final exportPath =
      File('${exportDir.path}${Platform.pathSeparator}$formName$fileSuffix.txt')
          .absolute
          .path;
  invokeMethod(access, 'SaveAsText', [acForm, formName, exportPath]);
  return exportPath;
}

String _mutarLayoutEExportarNovamente(
  Dispatcher access,
  Dispatcher doCmd, {
  required String formName,
  required String dbPath,
  String? secondExportDir,
}) {
  invokeMethod(doCmd, 'OpenForm', [formName, acDesign]);
  sleep(const Duration(milliseconds: 600));

  final screen = getDispatchProperty(access, 'Screen');
  final form = getDispatchProperty(screen, 'ActiveForm');
  final controls = getDispatchProperty(form, 'Controls');

  try {
    final txtAssunto =
        _resolverControleDoFormulario(form, controls, 'txtAssunto');
    final chkAssinatura = _resolverControleDoFormulario(
      form,
      controls,
      'chkRequerAssinatura',
    );
    final lblTitulo = _resolverControleDoFormulario(form, controls, 'lblTitulo');

    try {
      setProperty(txtAssunto, 'Left', 720);
      setProperty(txtAssunto, 'Top', 1710);
      setProperty(txtAssunto, 'Width', 4560);

      setProperty(chkAssinatura, 'Left', 3450);
      setProperty(chkAssinatura, 'Top', 2440);

      setProperty(lblTitulo, 'Width', 5360);
    } finally {
      releaseDispatcher(txtAssunto);
      releaseDispatcher(chkAssinatura);
      releaseDispatcher(lblTitulo);
    }
  } finally {
    releaseDispatcher(controls);
    releaseDispatcher(form);
    releaseDispatcher(screen);
  }

  invokeMethod(doCmd, 'Close', [acForm, formName, acSaveYes]);
  return _exportarNativamente(
    access,
    dbPath: dbPath,
    formName: formName,
    nativeExportDir: secondExportDir,
    fileSuffix: '_mutated',
  );
}

Dispatcher _resolverControleDoFormulario(
  Dispatcher form,
  Dispatcher controls,
  String controlName,
) {
  try {
    return invokeDispatchMethod(controls, 'Item', [controlName]);
  } catch (_) {
    return getDispatchProperty(form, controlName);
  }
}

_VcsRunResult _tentarExportacaoViaVcsAddin(
  Dispatcher access, {
  String? addinPath,
  String? procedureName,
  String? commandName,
}) {
  final procedure = (procedureName ?? '').trim();
  final command = (commandName ?? '').trim();

  if (procedure.isEmpty) {
    return const _VcsRunResult(
      success: false,
      message: 'Procedure do add-in nao informada.',
    );
  }

  final runTargets = _buildVcsRunTargets(
    addinPath: addinPath,
    procedureName: procedure,
  );

  final errors = <String>[];
  for (final runTarget in runTargets) {
    try {
      if (command.isNotEmpty) {
        invokeMethod(access, 'Run', [runTarget, command]);
        return _VcsRunResult(
          success: true,
          message: 'Run("$runTarget", "$command") executado.',
        );
      }

      invokeMethod(access, 'Run', [runTarget]);
      return _VcsRunResult(
        success: true,
        message: 'Run("$runTarget") executado.',
      );
    } catch (error) {
      errors.add('$runTarget => $error');
    }
  }

  return _VcsRunResult(
    success: false,
    message: 'Falha ao chamar Application.Run com os alvos testados: '
        '${runTargets.join(' | ')}. Erros: ${errors.join(' || ')}',
  );
}

List<String> _buildVcsRunTargets({
  required String? addinPath,
  required String procedureName,
}) {
  final procedure = procedureName.trim();
  final bareProcedure = procedure.contains('.')
      ? procedure.substring(procedure.lastIndexOf('.') + 1)
      : procedure;
  final normalizedAddin = _normalizeVcsLibraryPath(addinPath);

  final targets = <String>[];
  void add(String value) {
    if (value.isEmpty || targets.contains(value)) {
      return;
    }
    targets.add(value);
  }

  if (normalizedAddin.isNotEmpty) {
    add('$normalizedAddin.$bareProcedure');
    add('$normalizedAddin!$bareProcedure');
  }
  add(procedure);
  add('Version Control.$bareProcedure');
  add(bareProcedure);
  return targets;
}

String _normalizeVcsLibraryPath(String? addinPath) {
  final resolvedPath = _resolveAddinPath(addinPath);
  if (resolvedPath == null || resolvedPath.trim().isEmpty) {
    return '';
  }

  final normalized = resolvedPath.replaceAll('/', '\\').trim();
  if (normalized.toLowerCase().endsWith('.accda')) {
    return normalized.substring(0, normalized.length - '.accda'.length);
  }
  return normalized;
}

String? _resolveAddinPath(String? addinPath) {
  final explicit = addinPath?.trim();
  if (explicit != null && explicit.isNotEmpty) {
    return explicit;
  }

  final appData = Platform.environment['APPDATA'];
  if (appData == null || appData.isEmpty) {
    return null;
  }

  final candidates = <String>[
    '$appData\\MSAccessVCS\\Version Control.accda',
    '$appData\\Microsoft\\AddIns\\MSAccessVCS.accda',
  ];
  for (final candidate in candidates) {
    if (File(candidate).existsSync()) {
      return candidate;
    }
  }
  return candidates.first;
}

void _createLabel(
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
}

void _createBoundTextBox(
  Dispatcher access,
  String formName,
  List<Dispatcher> dispatchers, {
  required String name,
  required String controlSource,
  required String labelCaption,
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

  setProperty(label, 'Name', 'lbl$name');
  setProperty(label, 'Caption', labelCaption);
  setProperty(label, 'Left', left);
  setProperty(label, 'Top', top - 300);
  setProperty(label, 'Width', 2200);
  setProperty(label, 'Height', 250);

  final textBox = invokeDispatchMethod(access, 'CreateControl', [
    formName,
    acTextBox,
    acDetail,
  ]);
  dispatchers.add(textBox);

  setProperty(textBox, 'Name', name);
  setProperty(textBox, 'ControlSource', controlSource);
  setProperty(textBox, 'Left', left);
  setProperty(textBox, 'Top', top);
  setProperty(textBox, 'Width', width);
  setProperty(textBox, 'Height', height);
}

class _VcsRunResult {
  final bool success;
  final String message;

  const _VcsRunResult({
    required this.success,
    required this.message,
  });
}