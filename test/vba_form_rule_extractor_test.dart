import 'package:access_to_dart/src/vba_parser/form_rule_extractor.dart';
import 'package:test/test.dart';

void main() {
  test('extracts field rules from Access form VBA events', () {
    final source = r'''
Private Sub txtNome_BeforeUpdate(Cancel As Integer)
    If Trim$(Nz(Me.txtNome.Value, "")) = "" Then
        MsgBox "Informe o nome da pessoa.", vbExclamation, "Validacao"
        Cancel = True
    End If
End Sub

Private Sub cmdSalvar_Click()
    If IsNull(Me.txtCPF) Or Trim$(Nz(Me.txtCPF, "")) = "" Then
        MsgBox "Informe o CPF.", vbExclamation, "Validacao"
        Exit Sub
    End If
End Sub

Private Sub txtCPF_BeforeUpdate(Cancel As Integer)
    If Not IsCpfValido(v) Then
        MsgBox "CPF invalido.", vbExclamation, "Validacao"
        Cancel = True
    End If
End Sub

Private Sub txtEmail_BeforeUpdate(Cancel As Integer)
    If InStr(1, Nz(Me.txtEmail, ""), "@") = 0 Then
        MsgBox "Email invalido.", vbExclamation, "Validacao"
        Cancel = True
    End If
End Sub
''';

    final ruleSet = AccessFormRuleExtractor.extract(source);
    final byControl = <String, AccessFormFieldRule>{
      for (final rule in ruleSet.fieldRules) rule.controlName: rule,
    };

    expect(byControl['txtNome'], isNotNull);
    expect(
      byControl['txtNome']!.kinds.contains(AccessFormFieldRuleKind.required),
      isTrue,
    );
    expect(
      byControl['txtNome']!.messages,
      contains('Informe o nome da pessoa.'),
    );

    expect(byControl['txtCPF'], isNotNull);
    expect(
      byControl['txtCPF']!.kinds.contains(AccessFormFieldRuleKind.required),
      isTrue,
    );
    expect(
      byControl['txtCPF']!.kinds.contains(AccessFormFieldRuleKind.cpf),
      isTrue,
    );

    expect(byControl['txtEmail'], isNotNull);
    expect(
      byControl['txtEmail']!.kinds.contains(AccessFormFieldRuleKind.email),
      isTrue,
    );
  });
}