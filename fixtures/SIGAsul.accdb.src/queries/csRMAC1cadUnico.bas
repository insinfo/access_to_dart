Operation =1
Option =0
Where ="(((TbRecepção.Data) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbRecepção"
End
Begin OutputColumns
    Expression ="TbRecepção.Data"
    Expression ="TbRecepção.CAD1VEZ"
    Expression ="TbRecepção.CADATUALIZ"
    Expression ="TbRecepção.CADORI"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbRecepção.CAD1VEZ"
        dbLong "AggregateType" ="0"
    End
    Begin
        dbText "Name" ="TbRecepção.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRecepção.CADATUALIZ"
        dbLong "AggregateType" ="0"
    End
    Begin
        dbText "Name" ="TbRecepção.CADORI"
        dbLong "AggregateType" ="0"
    End
End
Begin
    State =0
    Left =96
    Top =67
    Right =1035
    Bottom =528
    Left =-1
    Top =-1
    Right =915
    Bottom =166
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =301
        Bottom =213
        Top =0
        Name ="TbRecepção"
        Name =""
    End
End
