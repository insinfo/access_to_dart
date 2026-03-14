Attribute VB_Name = "mod_IdadeCompleta"
Option Compare Database

Public Function fncIdadeCompleta(DNasc As Date) As String
On Error GoTo trataerro
Dim Anos As Byte, Meses As Variant, Dias As Byte, DataRef As Date
If DNasc > Date Or DNasc = 0 Then
    fncIdadeCompleta = ""
    Exit Function
End If
If DNasc = Date Then
    fncIdadeCompleta = 0
    Exit Function
End If

'Ajusta dataNascimento se cair em ano bissexto
DNasc = IIf(Format(DNasc, "mm/dd") = "02/29", DNasc - 1, Data_Nascimento)

Anos = Int(IIf(DateDiff("d", DNasc, Date) = 365, 365.25, DateDiff("d", DNasc, Date)) / 365.25)
DataRef = DateSerial(Year(Date) + (Format(DNasc, "mmdd") > Format(Date, "mmdd")), Format(DNasc, "mm"), Format(DNasc, "dd"))
Meses = DateDiff("m", DataRef, Date) + (Format(DNasc, "dd") > Format(Date, "dd"))
DataRef = DateSerial(Year(Date), Format(Date, "mm") + (Format(DNasc, "dd") > Format(Date, "dd")), Format(DNasc, "dd"))
DataRef = IIf(Format(DNasc, "dd") <> Format(DataRef, "dd"), DataRef - Format(DataRef, "dd"), DataRef)
Dias = CDbl(Date) - CDbl(DataRef)
fncIdadeCompleta = IIf(Anos <= 1, IIf(Anos = 0, "", Anos & " ano "), Anos & " anos ") & _
                   IIf(Meses <= 1, IIf(Meses = 0, "", Meses & " mes "), Meses & " meses ") & _
                   IIf(Dias <= 1, IIf(Dias = 0, "", Dias & " dia "), Dias & " dias ")
sair:
    Exit Function
trataerro:
    MsgBox "Erro: " & Err.Number & vbCrLf & Err.Description, vbCritical, "Aviso", Err.HelpFile, Err.HelpContext
    Resume sair:
End Function
