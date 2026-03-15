Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub cmdSair_Click()
DoCmd.Close

End Sub

Private Sub Comando677_Click()
If MsgBox("ATENÇÃO!!! Este procedimento irá excluir este registro definitivamente. CONFIRMA A EXCLUSÃO? ", vbYesNo + vbDefaultButton2 + vbQuestion, "Aviso") = vbYes Then
DoCmd.SetWarnings False
DoCmd.RunCommand acCmdDeleteRecord
DoCmd.SetWarnings True
Else
Exit Sub
End If
End Sub

Private Sub Form_Close()
DoCmd.Close acForm, "PesquisarAtend", acSaveYes
End Sub

Private Sub Form_Load()
Caption = fVersao
DoCmd.GoToRecord , , acLast

End Sub

Private Sub NomeTXT_AfterUpdate()
Me.DataCadTXT.Value = Me.Nometxt.Column(2)
Me.CodFamTxt.Value = Me.Nometxt.Column(3)
End Sub
