Operation =1
Option =0
Where ="(((TbDemandaReprimida.[Demanda scfv atividade]) Is Not Null) AND ((TbDemandaRepr"
    "imida.[Data saída]) Is Null))"
Begin InputTables
    Name ="TbDemandaReprimida"
End
Begin OutputColumns
    Expression ="TbDemandaReprimida.[Demanda scfv atividade]"
    Expression ="TbDemandaReprimida.Nome"
    Expression ="TbDemandaReprimida.CelularPessoa"
End
Begin OrderBy
    Expression ="TbDemandaReprimida.[Demanda scfv atividade]"
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
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbDemandaReprimida.[Demanda scfv atividade]"
        dbInteger "ColumnWidth" ="2205"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.CelularPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.Nome"
        dbInteger "ColumnWidth" ="3390"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1376
    Bottom =677
    Left =-1
    Top =-1
    Right =1352
    Bottom =326
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =411
        Bottom =344
        Top =0
        Name ="TbDemandaReprimida"
        Name =""
    End
End
