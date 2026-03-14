Operation =1
Option =2
Where ="(((TbPBF08.CRAS) Like [DIGITE O CRAS]+\"*\"))"
Begin InputTables
    Name ="TbPBF08"
End
Begin OutputColumns
    Expression ="TbPBF08.CODFAM"
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
        dbText "Name" ="TbPBF08.CODFAM"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1200
    Bottom =660
    Left =-1
    Top =-1
    Right =1132
    Bottom =284
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =265
        Bottom =275
        Top =0
        Name ="TbPBF08"
        Name =""
    End
End
