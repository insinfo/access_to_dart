Operation =1
Option =2
Where ="(((csRMAD7.DataCol) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="csRMAD7"
End
Begin OutputColumns
    Expression ="csRMAD7.Nome"
    Expression ="csRMAD7.Autismo"
    Expression ="csRMAD7.Cegueira"
    Expression ="csRMAD7.[Baixa visão]"
    Expression ="csRMAD7.[Surdez severa profunda]"
    Expression ="csRMAD7.[Surdez leve moderada]"
    Expression ="csRMAD7.[Deficiencia fisica]"
    Expression ="csRMAD7.[Defic mental intelec]"
    Expression ="csRMAD7.[Sindrome down]"
    Expression ="csRMAD7.[Transt doença mental]"
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
        dbText "Name" ="csRMAD7.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD7.[Sindrome down]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD7.Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD7.[Surdez severa profunda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD7.[Baixa visão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD7.Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD7.[Deficiencia fisica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD7.[Surdez leve moderada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD7.[Defic mental intelec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD7.[Transt doença mental]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD7.DataCol"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =41
    Top =60
    Right =1177
    Bottom =599
    Left =-1
    Top =-1
    Right =1112
    Bottom =218
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =287
        Top =0
        Name ="csRMAD7"
        Name =""
    End
End
