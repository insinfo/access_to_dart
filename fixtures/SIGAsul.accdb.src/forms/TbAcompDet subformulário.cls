Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub CodTecnicotxt_Click()
Me.NomeTectxt.Value = Me.CodTecnicotxt.Column(1)
End Sub
