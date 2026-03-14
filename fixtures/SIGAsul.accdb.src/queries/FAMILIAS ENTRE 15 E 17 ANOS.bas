Operation =1
Option =0
Where ="(((Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)) Between 15 And 17))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="CadResidencia.[CRAS Origem]"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Expression ="TbPessoa.Celular"
    Expression ="TbPessoa.NomeMae"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="-1"
dbMemo "OrderBy" ="[FAMILIAS ENTRE 15 E 17 ANOS].[CodFam], [FAMILIAS ENTRE 15 E 17 ANOS].[Nome]"
Begin
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1290"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1305"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[CRAS Origem]"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1725"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Volante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NomeMae"
        dbInteger "ColumnWidth" ="2145"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1070
    Bottom =660
    Left =-1
    Top =-1
    Right =1046
    Bottom =326
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =261
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =318
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
