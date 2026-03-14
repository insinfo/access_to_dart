Operation =1
Option =2
Begin InputTables
    Name ="csGestantes"
    Name ="csFamExtPbz"
End
Begin OutputColumns
    Expression ="csGestantes.Nome"
End
Begin Joins
    LeftTable ="csFamExtPbz"
    RightTable ="csGestantes"
    Expression ="csFamExtPbz.Nome = csGestantes.Nome"
    Flag =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbByte "RecordsetType" ="0"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="csGestantes.Nome"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1066
    Bottom =677
    Left =-1
    Top =-1
    Right =1042
    Bottom =323
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="csGestantes"
        Name =""
    End
    Begin
        Left =251
        Top =-5
        Right =395
        Bottom =139
        Top =0
        Name ="csFamExtPbz"
        Name =""
    End
End
