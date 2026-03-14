Operation =1
Option =0
Where ="(((TbOfSocioEduDetalhe.DataDesl) Is Null Or (TbOfSocioEduDetalhe.DataDesl)>[DATA"
    " FINAL]))"
Begin InputTables
    Name ="TbOfSocioEduDetalhe"
    Name ="TbPessoa"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="TbOfSocioEduDetalhe.CodOfSEDet"
    Expression ="TbPessoa.CodPessoa"
    Alias ="NomePessoa"
    Expression ="TbPessoa.Nome"
    Expression ="CadResidencia.CodFam"
    Expression ="TbOfSocioEduDetalhe.DataInsc"
    Expression ="TbOfSocioEduDetalhe.Nome"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    Expression ="TbOfSocioEduDetalhe.SituaçãoUsuario"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbOfSocioEduDetalhe"
    Expression ="TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome"
    Flag =1
End
Begin OrderBy
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Flag =0
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Nome"
        dbInteger "ColumnWidth" ="3180"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1005"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.CodOfSEDet"
        dbInteger "ColumnWidth" ="1080"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NomePessoa"
        dbInteger "ColumnWidth" ="3870"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbInteger "ColumnWidth" ="3870"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-178
    Top =30
    Right =1026
    Bottom =652
    Left =-1
    Top =-1
    Right =1020
    Bottom =105
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =277
        Top =0
        Name ="TbOfSocioEduDetalhe"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =279
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =156
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
