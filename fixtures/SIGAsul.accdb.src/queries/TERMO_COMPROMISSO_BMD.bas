Operation =1
Option =0
Where ="(((csBMD.CodBenef)=[Formulários]![FrmBeneficios]![CodBenef]) AND ((csBMD.TipoBen"
    "eficio)=\"BMD\"))"
Begin InputTables
    Name ="csBMD"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="csBMD.CodBenef"
    Expression ="csBMD.Nome"
    Expression ="csBMD.CPF"
    Expression ="csBMD.TipoBeneficio"
    Expression ="csBMD.DataDesl"
    Expression ="csBMD.CodPessoa"
    Expression ="csBMD.CodFam"
    Alias ="UNIDADE"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="csBMD.RG"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="csBMD.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMD.CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMD.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMD.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMD.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMD.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMD.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-351
    Top =88
    Right =978
    Bottom =655
    Left =-1
    Top =-1
    Right =1305
    Bottom =230
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =243
        Top =13
        Right =518
        Bottom =274
        Top =0
        Name ="csBMD"
        Name =""
    End
    Begin
        Left =60
        Top =17
        Right =204
        Bottom =163
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
