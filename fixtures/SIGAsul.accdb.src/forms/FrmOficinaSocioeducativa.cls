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
DoCmd.Close acForm, "PesquisarSCFVinterno", acSaveYes
End Sub

Private Sub Form_Load()
DoCmd.GoToRecord , , acLast
End Sub

Private Sub NomeTXT_AfterUpdate()

Me.DNasPessoaTXT.Value = Me.Nometxt.Column(2)

End Sub

Private Sub NomeTXT_GotFocus()
Me.Nometxt.Dropdown
End Sub
