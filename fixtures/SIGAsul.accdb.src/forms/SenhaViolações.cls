Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub btCancelar_Click()
If MsgBox("Deseja realmente fechar o programa?", vbYesNo, "Fechar") = vbYes Then
Application.Quit
Else
Exit Sub
End If
End Sub

Private Sub Texto0_AfterUpdate()


End Sub

Private Sub btLogin_Click()
Dim criterio As String

  criterio = "Senha='" & txtSenha & "'"
  If DCount("Senha", "SenhaFrontEnd", criterio) = 1 Then
      DoCmd.Close
    DoCmd.OpenForm "JURIDICO"


  Else
    MsgBox "Senha incorreta! Por favor, tente novamente.", vbExclamation, "Login"
    txtSenha.SetFocus
  End If

End Sub

Private Sub Comando242_Click()
Dim criterio As String

  criterio = "Senha='" & txtSenha & "'"
  If DCount("Senha", "SenhaFrontEnd", criterio) = 1 Then
      DoCmd.Close
    DoCmd.OpenForm "FrmViolacoes"


  Else
    MsgBox "Senha incorreta! Por favor, tente novamente.", vbExclamation, "Login"
    txtSenha.SetFocus
  End If
End Sub

Private Sub Form_Load()
Caption = fVersao
End Sub
