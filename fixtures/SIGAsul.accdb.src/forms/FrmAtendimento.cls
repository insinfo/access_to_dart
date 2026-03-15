Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database



Private Sub cmdSair_Click()
DoCmd.Close

End Sub

Private Sub CodFuncTXT_Click()
Me.NomeFuncTXT.Value = Me.CodFuncTXT.Column(1)
Me.FuncaoFuncionarioTXT.Value = Me.CodFuncTXT.Column(2)
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


Private Sub NomeTXT_GotFocus()
Me.Nometxt.Dropdown
End Sub

Private Sub VDAMDcx_Click()
Me.VDcx = yes = Me.VDAMDcx = yes
End Sub

Private Sub VDAMFcx_Click()
Me.VDcx = yes = Me.VDAMFcx = yes
End Sub

Private Sub VDASFcx_Click()
Me.VDcx = yes = Me.VDASFcx = yes
End Sub

Private Sub VDCDLcx_Click()
Me.VDcx = yes = Me.VDCDLcx = yes
End Sub

Private Sub VDDCPcx_Click()
Me.VDcx = yes = Me.VDDCPcx = yes
End Sub

Private Sub VDDPAFcx_Click()
Me.VDcx = yes = Me.VDDPAFcx = yes
End Sub

Private Sub VDFVIcx_Click()
Me.VDcx = yes = Me.VDFVIcx = yes
End Sub

Private Sub VDLFRcx_Click()
Me.VDcx = yes = Me.vdlfrcx = yes
End Sub

Private Sub VDNLOCcx_Click()
Me.VDcx = yes = Me.VDNLOCcx = yes
End Sub

Private Sub VDOUTcx_Click()
Me.VDcx = yes = Me.VDOUTcx = yes
End Sub

Private Sub VDPBFcx_Click()
Me.VDcx = yes = Me.VDPBF = yes
End Sub

Private Sub VDSCFVcx_Click()
Me.VDcx = yes = Me.VDSCFVcx = yes
End Sub
