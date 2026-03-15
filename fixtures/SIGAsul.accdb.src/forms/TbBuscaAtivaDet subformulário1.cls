Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub Tecnicotxt_Click()
Me.Funçãotxt.Value = Me.Tecnicotxt.Column(2)
End Sub
