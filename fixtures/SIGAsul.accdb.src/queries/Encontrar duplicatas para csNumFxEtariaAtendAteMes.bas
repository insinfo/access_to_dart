Operation =1
Option =0
Where ="(((csNumFxEtariaAtendAteMes.[Nome]) In (SELECT [Nome] FROM [csNumFxEtariaAtendAt"
    "eMes] As Tmp GROUP BY [Nome] HAVING Count(*)>1 )))"
Begin InputTables
    Name ="csNumFxEtariaAtendAteMes"
End
Begin OutputColumns
    Expression ="csNumFxEtariaAtendAteMes.[Nome]"
    Expression ="csNumFxEtariaAtendAteMes.[Idade]"
End
Begin OrderBy
    Expression ="csNumFxEtariaAtendAteMes.[Nome]"
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
Begin
    Begin
        dbText "Name" ="[Idade]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Nome]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1175
    Bottom =660
    Left =-1
    Top =-1
    Right =1151
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
        Name ="csNumFxEtariaAtendAteMes"
        Name =""
    End
End
