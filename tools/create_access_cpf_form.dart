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

const _accessProgIds = <String>[
  'Access.Application',
];

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      'output',
      abbr: 'o',
      help: 'Caminho do arquivo .accdb a ser criado.',
      defaultsTo: r'C:\Temp\cpf_demo.accdb',
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

  createAccessDatabaseWithCpfForm(
    args['output'] as String,
    visibleAtEnd: args['visible'] as bool,
    overwrite: args['overwrite'] as bool,
  );
}

void createAccessDatabaseWithCpfForm(
  String dbPath, {
  bool visibleAtEnd = false,
  bool overwrite = true,
}) {
  dbPath = File(dbPath).absolute.path;
  initializeComApartment();

  Dispatcher? access;
  Dispatcher? db;
  Dispatcher? lblCpf;
  Dispatcher? form;
  Dispatcher? txtCpf;
  Dispatcher? cmdSalvar;
  Dispatcher? formModule;
  Dispatcher? doCmd;
  String? tempFormName;
  const targetFormName = 'frmCadastroCPF';

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

    try {
      access = createDispatcher(_accessProgIds);
    } catch (error) {
      throw StateError(
        'Nao foi possivel instanciar Access.Application via win32/COM. '
        'O bloqueio atual esta na automacao do servidor COM do Access a partir do Dart. '
        'Erro: $error',
      );
    }

    setProperty(access, 'Visible', false);
    invokeMethod(access, 'NewCurrentDatabase', [dbPath]);
    doCmd = getDispatchProperty(access, 'DoCmd');

    db = invokeDispatchMethod(access, 'CurrentDb');

    invokeMethod(db, 'Execute', [
      'CREATE TABLE Pessoas ('
          'ID COUNTER CONSTRAINT PK_Pessoas PRIMARY KEY, '
          'CPF TEXT(14)'
          ')'
    ]);

    form = invokeDispatchMethod(access, 'CreateForm');
    tempFormName = getStringProperty(form, 'Name');

    setProperty(form, 'Caption', 'Cadastro com Validacao de CPF');
    setProperty(form, 'RecordSource', 'Pessoas');
    setProperty(form, 'HasModule', true);
    setProperty(form, 'NavigationButtons', false);
    setProperty(form, 'RecordSelectors', false);
    setProperty(form, 'ScrollBars', 0);
    setProperty(form, 'DividingLines', false);
    setProperty(form, 'DefaultView', 0);

    lblCpf = invokeDispatchMethod(access, 'CreateControl', [
      tempFormName,
      acLabel,
      acDetail,
    ]);

    setProperty(lblCpf, 'Name', 'lblCPF');
    setProperty(lblCpf, 'Caption', 'CPF');
    setProperty(lblCpf, 'Left', 600);
    setProperty(lblCpf, 'Top', 600);
    setProperty(lblCpf, 'Width', 1200);
    setProperty(lblCpf, 'Height', 300);

    txtCpf = invokeDispatchMethod(access, 'CreateControl', [
      tempFormName,
      acTextBox,
      acDetail,
    ]);

    setProperty(txtCpf, 'Name', 'txtCPF');
    setProperty(txtCpf, 'ControlSource', 'CPF');
    setProperty(txtCpf, 'Left', 600);
    setProperty(txtCpf, 'Top', 950);
    setProperty(txtCpf, 'Width', 2500);
    setProperty(txtCpf, 'Height', 330);
    setProperty(txtCpf, 'Format', '@@@@@@@@@@@@@@');
    setProperty(txtCpf, 'InputMask', r'000\.000\.000\-00;0;_');

    cmdSalvar = invokeDispatchMethod(access, 'CreateControl', [
      tempFormName,
      acCommandButton,
      acDetail,
    ]);

    setProperty(cmdSalvar, 'Name', 'cmdSalvar');
    setProperty(cmdSalvar, 'Caption', 'Salvar');
    setProperty(cmdSalvar, 'Left', 600);
    setProperty(cmdSalvar, 'Top', 1500);
    setProperty(cmdSalvar, 'Width', 1500);
    setProperty(cmdSalvar, 'Height', 420);

    formModule = getDispatchProperty(form, 'Module');

    setProperty(txtCpf, 'BeforeUpdate', '[Event Procedure]');
    final beforeUpdateLine = invokeIntMethod(
      formModule,
      'CreateEventProc',
      ['BeforeUpdate', 'txtCPF'],
    );

    invokeMethod(formModule, 'InsertLines', [
      beforeUpdateLine + 1,
      r'''
    Dim v As String
    v = LimparCPF(Nz(Me.txtCPF.Value, ""))

    If Not IsCpfValido(v) Then
        MsgBox "CPF invalido.", vbExclamation, "Validacao"
        Cancel = True
    End If
'''
    ]);

    setProperty(cmdSalvar, 'OnClick', '[Event Procedure]');
    final clickLine = invokeIntMethod(
      formModule,
      'CreateEventProc',
      ['Click', 'cmdSalvar'],
    );

    invokeMethod(formModule, 'InsertLines', [
      clickLine + 1,
      r'''
    If IsNull(Me.txtCPF) Or Trim$(Nz(Me.txtCPF, "")) = "" Then
        MsgBox "Informe o CPF.", vbExclamation, "Validacao"
        Exit Sub
    End If

    If Me.Dirty Then
        Me.Dirty = False
    End If

    MsgBox "Registro salvo com sucesso.", vbInformation, "OK"
'''
    ]);

    final insertAt = getIntProperty(formModule, 'CountOfLines') + 1;

    invokeMethod(formModule, 'InsertLines', [
      insertAt,
      r'''
Private Function LimparCPF(ByVal valor As String) As String
    valor = Replace(valor, ".", "")
    valor = Replace(valor, "-", "")
    valor = Replace(valor, "/", "")
    valor = Replace(valor, " ", "")
    LimparCPF = valor
End Function

Private Function IsCpfValido(ByVal cpf As String) As Boolean
    Dim i As Integer
    Dim soma As Integer
    Dim resto As Integer
    Dim dig1 As Integer
    Dim dig2 As Integer
    Dim n As Integer
    Dim todosIguais As Boolean

    cpf = LimparCPF(cpf)

    If Len(cpf) <> 11 Then
        IsCpfValido = False
        Exit Function
    End If

    todosIguais = True
    For i = 2 To 11
        If Mid$(cpf, i, 1) <> Mid$(cpf, 1, 1) Then
            todosIguais = False
            Exit For
        End If
    Next i

    If todosIguais Then
        IsCpfValido = False
        Exit Function
    End If

    soma = 0
    For i = 1 To 9
        n = CInt(Mid$(cpf, i, 1))
        soma = soma + (n * (11 - i))
    Next i

    resto = (soma * 10) Mod 11
    If resto = 10 Then resto = 0
    dig1 = resto

    soma = 0
    For i = 1 To 10
        n = CInt(Mid$(cpf, i, 1))
        soma = soma + (n * (12 - i))
    Next i

    resto = (soma * 10) Mod 11
    If resto = 10 Then resto = 0
    dig2 = resto

    IsCpfValido = _
        (dig1 = CInt(Mid$(cpf, 10, 1))) And _
        (dig2 = CInt(Mid$(cpf, 11, 1)))
End Function
'''
    ]);

    invokeMethod(doCmd, 'Close', [acForm, tempFormName, acSaveYes]);
    invokeMethod(doCmd, 'Rename', [targetFormName, acForm, tempFormName]);

    if (visibleAtEnd) {
      invokeMethod(doCmd, 'OpenForm', [targetFormName]);
      setProperty(access, 'Visible', true);
    } else {
      invokeMethod(access, 'CloseCurrentDatabase');
      invokeMethod(access, 'Quit');
    }

    stdout.writeln('Banco criado com sucesso em: $dbPath');
    stdout.writeln('Formulario frmCadastroCPF criado com validacao VBA de CPF.');
    stdout.writeln(
      'Pre-requisito: Microsoft Access desktop instalado e acesso ao modelo VBA habilitado.',
    );
  } finally {
    releaseDispatcher(formModule);
    releaseDispatcher(cmdSalvar);
    releaseDispatcher(txtCpf);
    releaseDispatcher(lblCpf);
    releaseDispatcher(form);
    releaseDispatcher(db);
    releaseDispatcher(doCmd);

    releaseDispatcher(access);

    CoUninitialize();

    if (!visibleAtEnd) {
      sleep(const Duration(milliseconds: 2500));
      terminateProcessesByExecutableName('MSACCESS.EXE');
    }
  }
}
