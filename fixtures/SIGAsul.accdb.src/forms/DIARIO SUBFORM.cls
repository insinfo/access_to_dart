Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub CodPessoatxt_Click()

End Sub

Private Sub Nometxt_Click()
Me.DNasctxt.Value = Me.Nometxt.Column(2)
End Sub

Private Sub NomeTXT_GotFocus()
Me.Nometxt.Dropdown
End Sub
