Operation =1
Option =0
Where ="(((BPC.CRAS) Like [DIGITE O CRAS]+\"*\"))"
Begin InputTables
    Name ="BPC"
End
Begin OutputColumns
    Expression ="BPC.NomeTitular"
    Expression ="BPC.CRAS"
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
        dbText "Name" ="BPC.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.NomeTitular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.[Nome Titular]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1126
    Bottom =524
    Left =-1
    Top =-1
    Right =1102
    Bottom =196
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =104
        Top =10
        Right =284
        Bottom =272
        Top =0
        Name ="BPC"
        Name =""
    End
End
