Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database



Private Sub BTEXCLUIR_Click()
If MsgBox("ATENÇÃO!!! Este procedimento irá excluir este registro definitivamente. CONFIRMA A EXCLUSÃO? ", vbYesNo + vbDefaultButton2 + vbQuestion, "Aviso") = vbYes Then
DoCmd.SetWarnings False
DoCmd.RunCommand acCmdDeleteRecord
DoCmd.SetWarnings True
Else
Exit Sub
End If
End Sub

Private Sub cmdSair_Click()
DoCmd.Close

End Sub





Private Sub Form_Close()
DoCmd.Close acForm, "PesquisarDiario", acSaveYes
End Sub

Private Sub Form_Load()
Caption = fVersao
DoCmd.GoToRecord , , acLast

End Sub



Private Sub NomePessoatxt_AfterUpdate()
Me.CodFamTxt.Value = Me.NomePessoatxt.Column(2)

End Sub

Private Sub NomePessoatxt_GotFocus()
Me.NomePessoatxt.Dropdown
End Sub
