Operation =1
Option =2
Begin InputTables
    Name ="csRMAD4"
End
Begin OutputColumns
    Expression ="csRMAD4.Nome"
    Expression ="csRMAD4.Idade"
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
        dbText "Name" ="csRMAD4.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD4.Idade"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1113
    Bottom =660
    Left =-1
    Top =-1
    Right =1045
    Bottom =237
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =216
        Top =9
        Right =360
        Bottom =195
        Top =0
        Name ="csRMAD4"
        Name =""
    End
End
