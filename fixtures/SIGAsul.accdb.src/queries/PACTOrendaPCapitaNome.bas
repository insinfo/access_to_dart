Operation =1
Option =2
Where ="(((csCADUNICOCrasSul.NOME) Is Not Null) AND ((csCADUNICOCrasSul.[RENDA MED])<=60"
    "6))"
Begin InputTables
    Name ="csCADUNICOCrasSul"
End
Begin OutputColumns
    Expression ="csCADUNICOCrasSul.CODFAM"
    Expression ="csCADUNICOCrasSul.NOME"
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
        dbText "Name" ="csCADUNICOCrasSul.CODFAM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCADUNICOCrasSul.NOME"
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
    Bottom =239
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =273
        Top =0
        Name ="csCADUNICOCrasSul"
        Name =""
    End
End
