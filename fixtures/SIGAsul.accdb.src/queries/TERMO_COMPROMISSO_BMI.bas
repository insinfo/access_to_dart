Operation =1
Option =0
Where ="(((csBMI.CodBenef)=[Formulários]![FrmBeneficios]![CodBenef]))"
Begin InputTables
    Name ="TbUnidade"
    Name ="csBMI"
End
Begin OutputColumns
    Expression ="csBMI.CodBenef"
    Expression ="csBMI.Nome"
    Expression ="csBMI.CPF"
    Expression ="csBMI.RG"
    Expression ="csBMI.TipoBeneficio"
    Expression ="csBMI.DataDesl"
    Expression ="csBMI.CodPessoa"
    Expression ="csBMI.CodFam"
    Alias ="UNIDADE"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
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
        dbText "Name" ="csBMI.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMI.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMI.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMI.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMI.CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMI.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMI.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMI.RG"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1402
    Bottom =685
    Left =-1
    Top =-1
    Right =1378
    Bottom =213
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =60
        Top =17
        Right =204
        Bottom =163
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =261
        Top =1
        Right =405
        Bottom =214
        Top =0
        Name ="csBMI"
        Name =""
    End
End
