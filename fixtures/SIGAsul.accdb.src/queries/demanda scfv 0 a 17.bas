Operation =1
Option =0
Where ="(((TbDemandaReprimida.[0a5])=Yes) AND ((TbDemandaReprimida.[Data saída]) Is Null"
    ")) OR (((TbDemandaReprimida.[6a11])=Yes) AND ((TbDemandaReprimida.[Data saída]) "
    "Is Null)) OR (((TbDemandaReprimida.[12a14])=Yes) AND ((TbDemandaReprimida.[Data "
    "saída]) Is Null)) OR (((TbDemandaReprimida.[15a17])=Yes) AND ((TbDemandaReprimid"
    "a.[Data saída]) Is Null))"
Begin InputTables
    Name ="TbDemandaReprimida"
End
Begin OutputColumns
    Expression ="TbDemandaReprimida.CodDemanda"
    Expression ="TbDemandaReprimida.data"
    Expression ="TbDemandaReprimida.Nome"
    Expression ="TbDemandaReprimida.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[DNasc],Date())/365.25)"
    Expression ="TbDemandaReprimida.CelularPessoa"
    Expression ="TbDemandaReprimida.[0a5]"
    Expression ="TbDemandaReprimida.[6a11]"
    Expression ="TbDemandaReprimida.[12a14]"
    Expression ="TbDemandaReprimida.[15a17]"
    Expression ="TbDemandaReprimida.[Data saída]"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbMemo "OrderBy" ="[Lookup_Nome].[Nome]"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbDemandaReprimida.[15a17]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.CelularPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.CodDemanda"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Data saída]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[0a5]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[6a11]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[12a14]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.Nome"
        dbInteger "ColumnWidth" ="2280"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.DNasc"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =183
    Top =128
    Right =1391
    Bottom =639
    Left =-1
    Top =-1
    Right =1184
    Bottom =247
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =367
        Top =6
        Right =589
        Bottom =224
        Top =0
        Name ="TbDemandaReprimida"
        Name =""
    End
End
