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





Private Sub ENG1CAIXA_Click()
Me.ENGcx = yes = Me.ENG1CAIXA = yes
End Sub

Private Sub ENG2CAIXA_Click()
Me.ENGcx = yes = Me.ENG2CAIXA = yes
End Sub

Private Sub ENG3CAIXA_Click()
Me.ENGcx = yes = Me.ENG3CAIXA = yes
End Sub

Private Sub ENG4CAIXA_Click()
Me.ENGcx = yes = Me.ENG4CAIXA = yes
End Sub

Private Sub ENG5CAIXA_Click()
Me.ENGcx = yes = Me.ENG5CAIXA = yes
End Sub

Private Sub ENG6CAIXA_Click()
Me.ENGcx = yes = Me.ENG6CAIXA = yes
End Sub

Private Sub ENGOUTTXT_BeforeUpdate(Cancel As Integer)
Me.ENGcx = yes = Me.engouttxt = NotNull
End Sub

Private Sub Form_Close()
DoCmd.Close acForm, "PesquisarEncaminhamento", acSaveYes
End Sub

Private Sub Form_Load()
DoCmd.GoToRecord , , acLast
Caption = fVersao
End Sub

Private Sub Nometxt_Click()
Me.Tel1txt.Value = Me.Nometxt.Column(2)
End Sub

Private Sub NomeTXT_GotFocus()
Me.Nometxt.Dropdown
End Sub

Private Sub OP10cx_Click()
Me.OPcx = yes = Me.OP10cx = yes
End Sub

Private Sub OP11cx_Click()
Me.OPcx = yes = Me.OP11cx = yes
End Sub

Private Sub OP12cx_Click()
Me.OPcx = yes = Me.OP12cx = yes
End Sub

Private Sub OP13cx_Click()
Me.OPcx = yes = Me.OP13cx = yes
End Sub

Private Sub OP14cx_Click()
Me.OPcx = yes = Me.OP14cx = yes
End Sub

Private Sub OP15cx_Click()
Me.OPcx = yes = Me.OP15cx = yes
End Sub

Private Sub OP16cx_Click()
Me.OPcx = yes = Me.OP16cx = yes
End Sub

Private Sub OP17cx_Click()
Me.OPcx = yes = Me.OP17cx = yes
End Sub

Private Sub OP18cx_Click()
Me.OPcx = yes = Me.OP18cx = yes
End Sub

Private Sub OP19cx_Click()
Me.OPcx = yes = Me.OP19cx = yes
End Sub

Private Sub OP1cx_Click()
Me.OPcx = yes = Me.OP1cx = yes
End Sub

Private Sub OP20cx_Click()
Me.OPcx = yes = Me.OP20cx = yes
End Sub

Private Sub OP2cx_Click()
Me.OPcx = yes = Me.OP2cx = yes
End Sub

Private Sub OP3cx_Click()
Me.OPcx = yes = Me.OP3cx = yes
End Sub

Private Sub OP4cx_Click()
Me.OPcx = yes = Me.OP4cx = yes
End Sub

Private Sub OP5cx_Click()
Me.OPcx = yes = Me.OP5cx = yes
End Sub

Private Sub OP6cx_Click()
Me.OPcx = yes = Me.OP6cx = yes
End Sub

Private Sub OP7cx_Click()
Me.OPcx = yes = Me.OP7cx = yes
End Sub

Private Sub OP8cx_Click()
Me.OPcx = yes = Me.OP8cx = yes
End Sub

Private Sub OP9cx_Click()
Me.OPcx = yes = Me.OP9cx = yes
End Sub

Private Sub OPOUTROSTXT_BeforeUpdate(Cancel As Integer)
Me.OPcx = yes = Me.OPOUTROSTXT = NotNull
End Sub



Private Sub RE1cx_Click()
Me.REcx = yes = Me.RE1cx = yes
End Sub

Private Sub RE2cx_Click()
Me.REcx = yes = Me.RE2cx = yes
End Sub

Private Sub RE3cx_Click()
Me.REcx = yes = Me.RE3cx = yes
End Sub

Private Sub REOUTTXT_BeforeUpdate(Cancel As Integer)
Me.REcx = yes = Me.REOUTTXT = NotNull
End Sub

Private Sub RS10cx_Click()
Me.RScx = yes = Me.RS10cx = yes
End Sub

Private Sub RS11cx_Click()
Me.RScx = yes = Me.RS11cx = yes
End Sub

Private Sub RS12cx_Click()
Me.RScx = yes = Me.RS12cx = yes
End Sub

Private Sub RS13cx_Click()
Me.RScx = yes = Me.RS13cx = yes
End Sub

Private Sub RS14cx_Click()
Me.RScx = yes = Me.RS14cx = yes
End Sub

Private Sub RS15cx_Click()
Me.RScx = yes = Me.RS15cx = yes
End Sub

Private Sub RS16cx_Click()
Me.RScx = yes = Me.RS16cx = yes
End Sub

Private Sub RS17cx_Click()
Me.RScx = yes = Me.RS17cx = yes
End Sub

Private Sub RS18cx_Click()
Me.RScx = yes = Me.RS18cx = yes
End Sub

Private Sub RS19cx_Click()
Me.RScx = yes = Me.RS19cx = yes
End Sub

Private Sub RS1cx_Click()
Me.RScx = yes = Me.RS1cx = yes
End Sub

Private Sub RS20cx_Click()
Me.RScx = yes = Me.RS20cx = yes
End Sub

Private Sub RS2cx_Click()
Me.RScx = yes = Me.RS2cx = yes
End Sub

Private Sub RS3cx_Click()
Me.RScx = yes = Me.RS3cx = yes
End Sub

Private Sub RS4cx_Click()
Me.RScx = yes = Me.RS4cx = yes
End Sub

Private Sub RS5cx_Click()
Me.RScx = yes = Me.RS5cx = yes
End Sub

Private Sub RS6cx_Click()
Me.RScx = yes = Me.RS6cx = yes
End Sub

Private Sub RS7cx_Click()
Me.RScx = yes = Me.RS7cx = yes
End Sub

Private Sub RS8cx_Click()
Me.RScx = yes = Me.RS8cx = yes
End Sub

Private Sub RS9cx_Click()
Me.RScx = yes = Me.RS9cx = yes
End Sub

Private Sub RSA10cx_Click()
Me.RSAcx = yes = Me.RSA10cx = yes
End Sub

Private Sub RSA11cx_Click()
Me.RSAcx = yes = Me.RSA11cx = yes
End Sub

Private Sub RSA12cx_Click()
Me.RSAcx = yes = Me.RSA12cx = yes
End Sub

Private Sub RSA13cx_Click()
Me.RSAcx = yes = Me.RSA13cx = yes
End Sub

Private Sub RSA14cx_Click()
Me.RSAcx = yes = Me.RSA14cx = yes
End Sub



Private Sub RSA5cx_Click()
Me.RSAcx = yes = Me.RSA5cx = yes
End Sub

Private Sub RSA6cx_Click()
Me.RSAcx = yes = Me.RSA6cx = yes
End Sub

Private Sub RSA7cx_Click()
Me.RSAcx = yes = Me.RSA7cx = yes
End Sub

Private Sub RSA8cx_Click()
Me.RSAcx = yes = Me.RSA8cx = yes
End Sub

Private Sub RSA9cx_Click()
Me.RSAcx = yes = Me.RSA9cx = yes
End Sub

Private Sub RSAOUTTXT_BeforeUpdate(Cancel As Integer)
Me.RSAcx = yes = Me.RSAOUTTXT = NotNull
End Sub

Private Sub RSOUTTXT_BeforeUpdate(Cancel As Integer)
Me.RScx = yes = Me.RSOUTTXT = NotNull
End Sub

Private Sub SF1cx_Click()
Me.SFcx = yes = Me.SF1cx = yes
End Sub

Private Sub SF2cx_Click()
Me.SFcx = yes = Me.SF2cx = yes
End Sub

Private Sub SFOUTTXT_BeforeUpdate(Cancel As Integer)
Me.SFcx = yes = Me.SFOUTTXT = NotNull
End Sub
