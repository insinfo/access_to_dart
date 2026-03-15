Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub BtFechar_Click()
DoCmd.Close

End Sub

Private Sub BtVizualizar_Click()
DoCmd.OpenReport "prontuario16-REGISTRO-SINTETICO-fr-VERSO", acViewPreview
DoCmd.OpenReport "prontuario15-planej-evol-IMPRIMIR-FR-VERSO", acViewPreview
DoCmd.OpenReport "prontuario14-planej-evolu-frente-verso-2", acViewPreview
DoCmd.OpenReport "prontuario13-planej-evolu-frente-verso", acViewPreview
DoCmd.OpenReport "prontuario12-mse-frente-verso", acViewPreview
DoCmd.OpenReport "prontuario11-violenc-violacoes-fr-verso", acViewPreview
DoCmd.OpenReport "prontuario10-serv-progr-projetos-fr-verso", acViewPreview
DoCmd.OpenReport "prontuario9-ConvFamilComun-frente-verso", acViewPreview
DoCmd.OpenReport "prontuario8-Condi-Educ-TEXTO", acViewPreview
DoCmd.OpenReport "prontuario8-Condi-Educ", acViewPreview
DoCmd.OpenReport "prontuario7-Beneficios-FRENTE-VERSO", acViewPreview
DoCmd.OpenReport "prontuario6-Condi-SAUDE-TEXTO", acViewPreview
DoCmd.OpenReport "prontuario6-Condi-SAUDE", acViewPreview
DoCmd.OpenReport "prontuario5-Condi-TRAB-RENDA-TEXTO", acViewPreview
DoCmd.OpenReport "prontuario5-Condi-TRAB-RENDA", acViewPreview
DoCmd.OpenReport "prontuario4-Condi-Habit", acViewPreview
DoCmd.OpenReport "prontuario3-composicao-texto", acViewPreview
DoCmd.OpenReport "prontuario3-composicao", acViewPreview
DoCmd.OpenReport "prontuario2-ENDEREÇO", acViewPreview
DoCmd.OpenReport "prontuario1", acViewPreview
End Sub

Private Sub CodFamTxt_Click()
Me.Refresh
End Sub
Private Sub Comando6_Click()
Me.Refresh
Me.CodFamTxt.SetFocus
Me.CodFamTxt.Value = Empty
Me.CodFamTxt.Requery
End Sub
