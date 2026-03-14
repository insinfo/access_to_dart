Operation =1
Option =2
Where ="(((TbPBF08.CRAS)=[DIGITE O CRAS]))"
Begin InputTables
    Name ="TbPBF08"
End
Begin OutputColumns
    Expression ="TbPBF08.TITULAR"
    Expression ="TbPBF08.CRAS"
    Expression ="TbPBF08.COMPETFOLHA"
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
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3390"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPBF08.COMPETFOLHA"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1080"
        dbBoolean "ColumnHidden" ="0"
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
    Bottom =281
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =327
        Bottom =327
        Top =0
        Name ="TbPBF08"
        Name =""
    End
End
