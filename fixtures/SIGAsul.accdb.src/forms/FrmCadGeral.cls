Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub cmdNovo_Click()

End Sub



Private Sub cmdGravar_Click()
On Error Resume Next

If Me.Dirty Then
If MsgBox("O Registo foi alterado ou incluído. Deseja salvar?", vbExclamation + vbYesNo, Me.Caption) = vbYes Then

DoCmd.RunCommand acCmdSave

Else
Me.Undo
DoCmd.CancelEvent
DoCmd.Close
End If
End If
End Sub

Private Sub cmdSair_Click()
DoCmd.Close

End Sub

Private Sub CodResid_AfterUpdate()
If DLookup("CodFam", "CADUNICOATUALIZACAO", "CADUNICO.NOME =" & Forms![FrmCadGeral]!CodFam) Then
Me.CADUNICtxt = 1
End If
End Sub

Private Sub Comando677_Click()
If MsgBox("ATENÇÃO!!! Este procedimento irá excluir este registro definitivamente. CONFIRMA A EXCLUSÃO? ", vbYesNo + vbDefaultButton2 + vbQuestion, "Aviso") = vbYes Then
DoCmd.SetWarnings False
DoCmd.RunCommand acCmdDeleteRecord
DoCmd.SetWarnings True
Else
Exit Sub
End If
End Sub



Private Sub DataCad_Click()
If Not IsNull(Me.DataCad) Then
Me.[COMPOSIÇÃO FAMILIAR SUBFORM].Enabled = True
End If
End Sub

Private Sub Form_BeforeInsert(Cancel As Integer)
If DCount("*", "CadResidencia") < 1 Then
    Me.CodFam = 1
Else
    Me.CodFam = DMax("CodFam", "CadResidencia") + 1
 End If
End Sub

Private Sub Form_Close()
DoCmd.Close acForm, "PesquisarNome", acSaveYes
End Sub





Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 Then
MsgBox "Tecla Enter desabilitada.", vbInformation, " SIGASEMBES"
KeyCode = 0
End If
Select Case KeyCode
 Case vbKeyF5
DoCmd.OpenForm "FrmCadGeral", acNormal
KeyCode = 0
 Case Else
End Select
End Sub



Private Sub Form_Load()
DoCmd.GoToRecord , , acLast
Caption = fVersao
Me.KeyPreview = True
Me.[COMPOSIÇÃO FAMILIAR SUBFORM].Enabled = False
End Sub



Private Sub txtcrasorigem_Click()
Me.txtnrcras.Value = Me.txtcrasorigem.Column(2)
End Sub
