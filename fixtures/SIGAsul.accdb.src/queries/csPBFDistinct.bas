Operation =1
Option =2
Where ="(((TbPBF08.CRAS) Like [DIGITE O CRAS]+\"*\"))"
Begin InputTables
    Name ="TbPBF08"
End
Begin OutputColumns
    Expression ="TbPBF08.TITULAR"
    Expression ="TbPBF08.CRAS"
End
Begin OrderBy
    Expression ="TbPBF08.TITULAR"
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
        dbText "Name" ="TbPBF08.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPBF08.TITULAR"
        dbInteger "ColumnWidth" ="2625"
        dbBoolean "ColumnHidden" ="0"
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
    Bottom =169
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =110
        Top =3
        Right =347
        Bottom =272
        Top =0
        Name ="TbPBF08"
        Name =""
    End
End
