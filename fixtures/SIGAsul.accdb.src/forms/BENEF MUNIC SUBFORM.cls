Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database


Private Sub CodFuncTXT_Click()
Me.NomeFuncTXT.Value = Me.CodFuncTXT.Column(1)
End Sub
