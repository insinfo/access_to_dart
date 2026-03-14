Operation =1
Option =0
Where ="(((TbRecepção.Data) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbRecepção.AC"
    "OCOLETIVA) Is Not Null))"
Begin InputTables
    Name ="TbRecepção"
End
Begin OutputColumns
    Expression ="TbRecepção.CodRecepcao"
    Expression ="TbRecepção.Data"
    Expression ="TbRecepção.ACOCOLETIVA"
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
        dbText "Name" ="TbRecepção.ACOCOLETIVA"
        dbLong "AggregateType" ="0"
    End
    Begin
        dbText "Name" ="TbRecepção.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRecepção.CodRecepcao"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1106
    Bottom =660
    Left =-1
    Top =-1
    Right =1038
    Bottom =239
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =360
        Bottom =270
        Top =0
        Name ="TbRecepção"
        Name =""
    End
End
