Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Dim VarEspaco


Private Sub Form_KeyPress(KeyAscii As Integer)
If KeyAscii = 32 Then
VarEspaco = 1
End If
End Sub



Private Sub listausuario_Click()
DoCmd.OpenForm "FrmDiario", acNormal, "", "[CodDiario]=[Forms]![PesquisarDiario]![listausuario]", , acNormal
End Sub

Private Sub TxtNome_AfterUpdate()
Me.listausuario.Requery
End Sub

Private Sub TxtNome_Change()
If VarEspaco = 1 Then
VarEspaco = 0
Else
     Me.Recalc
     SendKeys "{F2}"
     End If
End Sub
