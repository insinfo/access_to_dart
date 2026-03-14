Operation =1
Option =0
Where ="(((TbDemandaReprimida.[Nome]) In (SELECT [Nome] FROM [TbDemandaReprimida] As Tmp"
    " GROUP BY [Nome] HAVING Count(*)>1 )))"
Begin InputTables
    Name ="TbDemandaReprimida"
End
Begin OutputColumns
    Expression ="TbDemandaReprimida.[Nome]"
    Expression ="TbDemandaReprimida.[data]"
    Expression ="TbDemandaReprimida.[CodDemanda]"
End
Begin OrderBy
    Expression ="TbDemandaReprimida.[Nome]"
    Flag =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
dbMemo "OrderBy" ="[Lookup_Nome].[Nome], [Encontrar duplicatas para TbDemandaReprimida].[data]"
Begin
    Begin
        dbText "Name" ="TbDemandaReprimida.[Nome]"
        dbInteger "ColumnWidth" ="3810"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[CodDemanda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[data]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1103
    Bottom =660
    Left =-1
    Top =-1
    Right =1035
    Bottom =271
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="TbDemandaReprimida"
        Name =""
    End
End
