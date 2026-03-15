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

Private Sub CODCRAStxt_Click()
Me.NomeCrasTXT.Value = Me.CodCrasTXT.Column(1)
End Sub



Private Sub CodTecnicotxt_Click()
Me.NomeTectxt.Value = Me.CodTecnicotxt.Column(1)
Me.MatriculaTecTXT.Value = Me.CodTecnicotxt.Column(2)
End Sub


Private Sub Comando677_Click()
If MsgBox("ATENÇÃO!!! Este procedimento irá excluir este registro definitivamente. CONFIRMA A EXCLUSÃO? ", vbYesNo + vbQuestion, "Aviso") = vbYes Then
DoCmd.SetWarnings False
DoCmd.RunCommand acCmdDeleteRecord
DoCmd.SetWarnings True
Else
Exit Sub
End If
End Sub

Private Sub Form_Close()
DoCmd.Close acForm, "PesquisarAcphmt", acSaveYes
End Sub

Private Sub Form_Load()
Caption = fVersao
DoCmd.GoToRecord , , acLast
End Sub


Private Sub Form_Open(Cancel As Integer)
DoCmd.Close acForm, "PesquisarBenefEmerg", acSaveYes
End Sub

Private Sub Nometxt_Click()
Me.CodFamTxt.Value = Me.Nometxt.Column(2)
Me.EndereçoTXT.Value = Me.Nometxt.Column(3)
Me.Bairrotxt.Value = Me.Nometxt.Column(4)
Me.TelPessoaTXT.Value = Me.Nometxt.Column(5)
Me.CPFPessoaTXT.Value = Me.Nometxt.Column(6)
Me.RGPessoaTXT.Value = Me.Nometxt.Column(7)
End Sub

Private Sub NomeTXT_GotFocus()
Me.Nometxt.Dropdown
End Sub
