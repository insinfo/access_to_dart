Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub BtFechar_Click()
DoCmd.Close

End Sub

Private Sub BtVizualizar_Click()
DoCmd.OpenReport "RMA", acViewPreview
DoCmd.Close acForm, "RelatorioRMAfrm"

End Sub

Private Sub BtVizualizar_Enter()
DoCmd.RefreshRecord
End Sub

Private Sub Comando6_Click()
Me.TxtDataInicial.SetFocus
Me.TxtDataInicial.Value = Empty
Me.TxtDataFinal.Value = Empty
End Sub
