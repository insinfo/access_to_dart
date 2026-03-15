Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database



Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 Then
MsgBox "Tecla Enter desabilitada.", vbInformation, " SIGASEMBES"
KeyCode = 0
End If
End Sub

Private Sub Form_Load()
Me.KeyPreview = True
End Sub
