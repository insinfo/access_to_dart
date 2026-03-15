Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database



Private Sub Nometxt_Click()
Me.DNascPessoaTXT.Value = Me.Nometxt.Column(2)
Me.NIStxt.Value = Me.Nometxt.Column(3)
Me.NomeMaetxt.Value = Me.Nometxt.Column(4)
Me.CelularMaeTXT.Value = Me.Nometxt.Column(5)
End Sub
