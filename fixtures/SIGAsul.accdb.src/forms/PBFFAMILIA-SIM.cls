Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub CodFam_Click()
DoCmd.OpenForm "FrmCadGeral", acNormal, "", "[CodFam]=[Forms]![PBFFAMILIA-SIM]![CodFam]", , acNormal

End Sub
