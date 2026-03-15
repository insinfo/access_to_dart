Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database



Private Sub BTEXCLUIR_Click()
If MsgBox("ATENÇÃO!!! Este procedimento irá excluir este registro definitivamente. CONFIRMA A EXCLUSÃO? ", vbYesNo + vbQuestion, "Aviso") = vbYes Then
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

Private Sub CodFuncTXT_Click()
Me.NomeOficineiroTXT.Value = Me.CodFuncTXT.Column(1)
End Sub



Private Sub Form_Close()
DoCmd.Close acForm, "PesquisarDiario", acSaveYes
End Sub

Private Sub Form_Load()
Caption = fVersao
DoCmd.GoToRecord , , acLast

End Sub



Private Sub Grupotxt_AfterUpdate()
Me.Tipotxt.Value = Me.Grupotxt.Column(5)
Me.FxEtariaTXT.Value = Me.Grupotxt.Column(2)
Me.Horariotxt.Value = Me.Grupotxt.Column(4)
Me.DiaSemanatxt.Value = Me.Grupotxt.Column(3)
End Sub
