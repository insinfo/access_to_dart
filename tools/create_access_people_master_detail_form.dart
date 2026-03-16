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
      defaultsTo: r'C:\Temp\people_master_detail_demo.accdb',
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

  createPeopleMasterDetailDatabase(
    args['output'] as String,
    visibleAtEnd: args['visible'] as bool,
    overwrite: args['overwrite'] as bool,
  );
}

void createPeopleMasterDetailDatabase(
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

    _createTables(db);
    _seedData(db);

    _createEnderecosForm(access, doCmd, dispatchers);
    _createTelefonesForm(access, doCmd, dispatchers);
    _createPessoasForm(access, doCmd, dispatchers);

    if (visibleAtEnd) {
      invokeMethod(doCmd, 'OpenForm', ['frmPessoasCadastro']);
      setProperty(access, 'Visible', true);
    } else {
      invokeMethod(access, 'CloseCurrentDatabase');
      invokeMethod(access, 'Quit');
    }

    stdout.writeln('Banco mestre-detalhe criado com sucesso em: $dbPath');
    stdout.writeln('Tabelas: Pessoas, PessoaEnderecos e Telefones com relacionamentos 1:N.');
    stdout.writeln('Formularios criados: frmPessoasCadastro, frmPessoaEnderecos, frmPessoaTelefones.');
    stdout.writeln('Validacoes VBA no form principal: nome obrigatorio, CPF obrigatorio/valido e email valido.');
  } finally {
    for (final dispatcher in dispatchers.reversed) {
      releaseDispatcher(dispatcher);
    }
    releaseDispatcher(doCmd);
    releaseDispatcher(db);
    releaseDispatcher(access);
  }
}

void _createTables(Dispatcher db) {
  invokeMethod(db, 'Execute', [
    'CREATE TABLE Pessoas ('
        'ID COUNTER CONSTRAINT PK_Pessoas PRIMARY KEY, '
        'Nome TEXT(120), '
        'CPF TEXT(14), '
        'Email TEXT(120), '
        'Ativo YESNO)'
  ]);
  invokeMethod(db, 'Execute', [
    'CREATE TABLE PessoaEnderecos ('
      'ID COUNTER CONSTRAINT PK_PessoaEnderecos PRIMARY KEY, '
        'PessoaID LONG, '
        'TipoEndereco TEXT(20), '
        'Logradouro TEXT(120), '
        'Cidade TEXT(80), '
        'UF TEXT(2), '
        'CEP TEXT(9))'
  ]);
  invokeMethod(db, 'Execute', [
    'CREATE TABLE Telefones ('
        'ID COUNTER CONSTRAINT PK_Telefones PRIMARY KEY, '
        'PessoaID LONG, '
        'TipoTelefone TEXT(20), '
        'Numero TEXT(20), '
        'Principal YESNO)'
  ]);
  invokeMethod(db, 'Execute', [
    'ALTER TABLE PessoaEnderecos ADD CONSTRAINT FK_PessoaEnderecos_Pessoas '
        'FOREIGN KEY (PessoaID) REFERENCES Pessoas (ID)'
  ]);
  invokeMethod(db, 'Execute', [
    'ALTER TABLE Telefones ADD CONSTRAINT FK_Telefones_Pessoas '
        'FOREIGN KEY (PessoaID) REFERENCES Pessoas (ID)'
  ]);
}

void _seedData(Dispatcher db) {
  invokeMethod(db, 'Execute', [
    "INSERT INTO Pessoas (Nome, CPF, Email, Ativo) VALUES "
        "('Ana Souza', '529.982.247-25', 'ana@example.com', True)"
  ]);
  invokeMethod(db, 'Execute', [
    "INSERT INTO PessoaEnderecos (PessoaID, TipoEndereco, Logradouro, Cidade, UF, CEP) VALUES "
        "(1, 'Residencial', 'Rua das Flores, 100', 'Goiania', 'GO', '74000-000')"
  ]);
  invokeMethod(db, 'Execute', [
    "INSERT INTO Telefones (PessoaID, TipoTelefone, Numero, Principal) VALUES "
        "(1, 'Celular', '(62) 99999-1234', True)"
  ]);
}

void _createPessoasForm(
  Dispatcher access,
  Dispatcher doCmd,
  List<Dispatcher> dispatchers,
) {
  final form = invokeDispatchMethod(access, 'CreateForm');
  dispatchers.add(form);
  final tempFormName = getStringProperty(form, 'Name');

  setProperty(form, 'Caption', 'Cadastro de Pessoas');
  setProperty(form, 'RecordSource', 'Pessoas');
  setProperty(form, 'HasModule', true);
  setProperty(form, 'NavigationButtons', false);
  setProperty(form, 'RecordSelectors', false);
  setProperty(form, 'ScrollBars', 0);
  setProperty(form, 'DividingLines', false);
  setProperty(form, 'DefaultView', 0);

  final titulo = _createLabel(
    access,
    tempFormName,
    dispatchers,
    name: 'lblTitulo',
    caption: 'Pessoa com enderecos e telefones',
    left: 500,
    top: 250,
    width: 4200,
  );
  setProperty(titulo, 'Height', 300);

  _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtID',
    controlSource: 'ID',
    top: 700,
    left: 600,
    width: 1000,
    label: 'ID',
    visible: false,
  );
  final txtNome = _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtNome',
    controlSource: 'Nome',
    top: 700,
    left: 600,
    width: 3200,
    label: 'Nome',
  );
  final txtCpf = _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtCPF',
    controlSource: 'CPF',
    top: 1350,
    left: 600,
    width: 2200,
    label: 'CPF',
  );
  final txtEmail = _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtEmail',
    controlSource: 'Email',
    top: 2000,
    left: 600,
    width: 3200,
    label: 'Email',
  );

  _createLabel(
    access,
    tempFormName,
    dispatchers,
    name: 'lblRelacionamentos',
    caption: 'Subforms vinculados de enderecos e telefones.',
    left: 600,
    top: 2700,
    width: 6000,
  );

  final subformEnderecos = invokeDispatchMethod(access, 'CreateControl', [
    tempFormName,
    acSubForm,
    acDetail,
  ]);
  dispatchers.add(subformEnderecos);
  setProperty(subformEnderecos, 'Name', 'subfrmEnderecos');
  setProperty(subformEnderecos, 'SourceObject', 'Form.frmPessoaEnderecos');
  setProperty(subformEnderecos, 'LinkChildFields', 'PessoaID');
  setProperty(subformEnderecos, 'LinkMasterFields', 'ID');
  setProperty(subformEnderecos, 'Left', 600);
  setProperty(subformEnderecos, 'Top', 3120);
  setProperty(subformEnderecos, 'Width', 3200);
  setProperty(subformEnderecos, 'Height', 1600);

  final subformTelefones = invokeDispatchMethod(access, 'CreateControl', [
    tempFormName,
    acSubForm,
    acDetail,
  ]);
  dispatchers.add(subformTelefones);
  setProperty(subformTelefones, 'Name', 'subfrmTelefones');
  setProperty(subformTelefones, 'SourceObject', 'Form.frmPessoaTelefones');
  setProperty(subformTelefones, 'LinkChildFields', 'PessoaID');
  setProperty(subformTelefones, 'LinkMasterFields', 'ID');
  setProperty(subformTelefones, 'Left', 4000);
  setProperty(subformTelefones, 'Top', 3120);
  setProperty(subformTelefones, 'Width', 2600);
  setProperty(subformTelefones, 'Height', 1600);

  final chkAtivoLabel = _createLabel(
    access,
    tempFormName,
    dispatchers,
    name: 'lblAtivo',
    caption: 'Ativo',
    left: 600,
    top: 4850,
    width: 900,
  );
  setProperty(chkAtivoLabel, 'Height', 300);

  final chkAtivo = invokeDispatchMethod(access, 'CreateControl', [
    tempFormName,
    acCheckBox,
    acDetail,
  ]);
  dispatchers.add(chkAtivo);
  setProperty(chkAtivo, 'Name', 'chkAtivo');
  setProperty(chkAtivo, 'ControlSource', 'Ativo');
  setProperty(chkAtivo, 'Left', 1700);
  setProperty(chkAtivo, 'Top', 4830);
  setProperty(chkAtivo, 'Width', 400);
  setProperty(chkAtivo, 'Height', 320);

  final cmdSalvar = invokeDispatchMethod(access, 'CreateControl', [
    tempFormName,
    acCommandButton,
    acDetail,
  ]);
  dispatchers.add(cmdSalvar);
  setProperty(cmdSalvar, 'Name', 'cmdSalvar');
  setProperty(cmdSalvar, 'Caption', 'Salvar cadastro');
  setProperty(cmdSalvar, 'Left', 600);
  setProperty(cmdSalvar, 'Top', 5450);
  setProperty(cmdSalvar, 'Width', 1800);
  setProperty(cmdSalvar, 'Height', 420);

  final module = getDispatchProperty(form, 'Module');
  dispatchers.add(module);

  setProperty(txtNome, 'BeforeUpdate', '[Event Procedure]');
  var line = invokeIntMethod(module, 'CreateEventProc', ['BeforeUpdate', 'txtNome']);
  invokeMethod(module, 'InsertLines', [
    line + 1,
    r'''
    If Trim$(Nz(Me.txtNome.Value, "")) = "" Then
        MsgBox "Informe o nome da pessoa.", vbExclamation, "Validacao"
        Cancel = True
    End If
'''
  ]);

  setProperty(txtCpf, 'BeforeUpdate', '[Event Procedure]');
  line = invokeIntMethod(module, 'CreateEventProc', ['BeforeUpdate', 'txtCPF']);
  invokeMethod(module, 'InsertLines', [
    line + 1,
    r'''
    Dim v As String
    v = LimparCPF(Nz(Me.txtCPF.Value, ""))

    If Trim$(v) = "" Then
        MsgBox "Informe o CPF.", vbExclamation, "Validacao"
        Cancel = True
        Exit Sub
    End If

    If Not IsCpfValido(v) Then
        MsgBox "CPF invalido.", vbExclamation, "Validacao"
        Cancel = True
    End If
'''
  ]);

  setProperty(txtEmail, 'BeforeUpdate', '[Event Procedure]');
  line = invokeIntMethod(module, 'CreateEventProc', ['BeforeUpdate', 'txtEmail']);
  invokeMethod(module, 'InsertLines', [
    line + 1,
    r'''
    Dim vEmail As String
    vEmail = Trim$(Nz(Me.txtEmail.Value, ""))

    If vEmail <> "" Then
        If InStr(1, vEmail, "@") = 0 Then
            MsgBox "Email invalido.", vbExclamation, "Validacao"
            Cancel = True
        End If
    End If
'''
  ]);

  setProperty(cmdSalvar, 'OnClick', '[Event Procedure]');
  line = invokeIntMethod(module, 'CreateEventProc', ['Click', 'cmdSalvar']);
  invokeMethod(module, 'InsertLines', [
    line + 1,
    r'''
    If IsNull(Me.txtNome) Or Trim$(Nz(Me.txtNome, "")) = "" Then
        MsgBox "Informe o nome da pessoa.", vbExclamation, "Validacao"
        Exit Sub
    End If

    If IsNull(Me.txtCPF) Or Trim$(Nz(Me.txtCPF, "")) = "" Then
        MsgBox "Informe o CPF.", vbExclamation, "Validacao"
        Exit Sub
    End If

    If Me.Dirty Then
        Me.Dirty = False
    End If

    MsgBox "Cadastro salvo com sucesso.", vbInformation, "OK"
'''
  ]);

  invokeMethod(module, 'InsertLines', [
    getIntProperty(module, 'CountOfLines') + 1,
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
  invokeMethod(doCmd, 'Rename', ['frmPessoasCadastro', acForm, tempFormName]);
}

void _createEnderecosForm(
  Dispatcher access,
  Dispatcher doCmd,
  List<Dispatcher> dispatchers,
) {
  final form = invokeDispatchMethod(access, 'CreateForm');
  dispatchers.add(form);
  final tempFormName = getStringProperty(form, 'Name');

  setProperty(form, 'Caption', 'Enderecos da Pessoa');
  setProperty(form, 'RecordSource', 'PessoaEnderecos');
  setProperty(form, 'NavigationButtons', false);
  setProperty(form, 'RecordSelectors', false);
  setProperty(form, 'DefaultView', 0);

  _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtPessoaIDEndereco',
    controlSource: 'PessoaID',
    top: 600,
    left: 600,
    width: 1200,
    label: 'PessoaID',
  );
  _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtLogradouro',
    controlSource: 'Logradouro',
    top: 1250,
    left: 600,
    width: 3200,
    label: 'Logradouro',
  );
  _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtCidade',
    controlSource: 'Cidade',
    top: 1900,
    left: 600,
    width: 2200,
    label: 'Cidade',
  );

  invokeMethod(doCmd, 'Close', [acForm, tempFormName, acSaveYes]);
  invokeMethod(doCmd, 'Rename', ['frmPessoaEnderecos', acForm, tempFormName]);
}

void _createTelefonesForm(
  Dispatcher access,
  Dispatcher doCmd,
  List<Dispatcher> dispatchers,
) {
  final form = invokeDispatchMethod(access, 'CreateForm');
  dispatchers.add(form);
  final tempFormName = getStringProperty(form, 'Name');

  setProperty(form, 'Caption', 'Telefones da Pessoa');
  setProperty(form, 'RecordSource', 'Telefones');
  setProperty(form, 'NavigationButtons', false);
  setProperty(form, 'RecordSelectors', false);
  setProperty(form, 'DefaultView', 0);

  _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtPessoaIDTelefone',
    controlSource: 'PessoaID',
    top: 600,
    left: 600,
    width: 1200,
    label: 'PessoaID',
  );
  _createBoundTextBox(
    access,
    tempFormName,
    dispatchers,
    name: 'txtNumero',
    controlSource: 'Numero',
    top: 1250,
    left: 600,
    width: 2400,
    label: 'Numero',
  );

  invokeMethod(doCmd, 'Close', [acForm, tempFormName, acSaveYes]);
  invokeMethod(doCmd, 'Rename', ['frmPessoaTelefones', acForm, tempFormName]);
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
  bool visible = true,
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
  setProperty(label, 'Visible', visible);
  return label;
}

Dispatcher _createBoundTextBox(
  Dispatcher access,
  String formName,
  List<Dispatcher> dispatchers, {
  required String name,
  required String controlSource,
  required int top,
  required int left,
  required int width,
  required String label,
  bool visible = true,
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
    visible: visible,
  );
  setProperty(labelControl, 'Height', 300);

  final textBox = invokeDispatchMethod(access, 'CreateControl', [
    formName,
    acTextBox,
    acDetail,
  ]);
  dispatchers.add(textBox);
  setProperty(textBox, 'Name', name);
  setProperty(textBox, 'ControlSource', controlSource);
  setProperty(textBox, 'Left', left);
  setProperty(textBox, 'Top', top + 320);
  setProperty(textBox, 'Width', width);
  setProperty(textBox, 'Height', 330);
  setProperty(textBox, 'Visible', visible);
  return textBox;
}