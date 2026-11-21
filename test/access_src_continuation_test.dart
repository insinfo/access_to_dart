import 'dart:io';

import 'package:access_to_dart/src/access_src_reader.dart';
import 'package:test/test.dart';

void main() {
  test('preserva caption completa do export real de ajuda do SIGAsul',
      () async {
    final directory = await Directory.systemTemp.createTemp('access_src_help_');
    addTearDown(() => directory.delete(recursive: true));
    final forms = await Directory('${directory.path}/forms').create();
    await File('fixtures/SIGAsul.accdb.src/forms/ajuda-Acompanhamento.bas')
        .copy('${forms.path}/ajuda-Acompanhamento.bas');

    final project = await AccessSrcReader().readDirectory(directory.path);
    final form = project.forms.single;
    final label =
        form.controls.singleWhere((control) => control.name == 'Rótulo1');

    expect(label.caption, contains('Nunca incluir a mesma pessoa'));
    expect(label.caption, contains('Botão "Acompanhamento" na Tela Inicial.'));
    expect(
        label.caption, endsWith('histórico de Acompanhamento dessa família.'));
    // O controle seguinte deve continuar separado da propriedade multilinha.
    expect(form.controls.any((control) => control.caption == 'Fechar ajuda'),
        isTrue);
  });

  test(
      'preserva SQL e expressoes multilinha sem interpretar igualdade como propriedade',
      () async {
    final directory =
        await Directory.systemTemp.createTemp('access_src_multiline_');
    addTearDown(() => directory.delete(recursive: true));
    final forms = await Directory('${directory.path}/forms').create();
    await File('${forms.path}/Clientes.bas').writeAsString(r'''
Version =20
Begin Form
    RecordSource ="SELECT [Id], [Nome] FROM [Clientes] "
        "WHERE [Ativo] = True AND [Nome] <> \"\";"
    Caption ="Clientes "
        "ativos"
    Begin Section
        Name ="Detalhe"
        Begin
            Begin TextBox
                Name ="Saudacao"
                ControlSource ="=IIf([Ativo] = True, "
                    "\"Olá, \" & [Nome], \"Inativo\")"
                Caption ="Situação "
                    "do cliente"
            End
            Begin CommandButton
                Name ="Salvar"
                Caption ="Salvar"
                OnClickEmMacro = Begin
                    Begin
                        Action ="SaveRecord"
                    End
                End
            End
        End
    End
End
''');

    final project = await AccessSrcReader().readDirectory(directory.path);
    final form = project.forms.single;
    expect(form.recordSource,
        'SELECT [Id], [Nome] FROM [Clientes] WHERE [Ativo] = True AND [Nome] <> "";');
    expect(form.caption, 'Clientes ativos');
    expect(form.controls, hasLength(2));
    expect(form.controls.first.controlSource,
        '=IIf([Ativo] = True, "Olá, " & [Nome], "Inativo")');
    expect(form.controls.first.caption, 'Situação do cliente');
    expect(form.controls.last.macros['OnClickEmMacro'], ['SaveRecord']);
  });
}
