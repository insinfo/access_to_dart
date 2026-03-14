Operation =1
Option =0
Where ="(((TbRecepção.Data) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbRecepção"
End
Begin OutputColumns
    Expression ="TbRecepção.CodRecepcao"
    Expression ="TbRecepção.Data"
    Expression ="TbRecepção.[RECEPÇÃO-QTD]"
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
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="TbRecepção.CADATUALIZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRecepção.CodRecepcao"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRecepção.CAD1VEZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRecepção.[RECEPÇÃO-QTD]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRecepção.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRecepção.CADORI"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =40
    Top =357
    Right =1009
    Bottom =788
    Left =-1
    Top =-1
    Right =945
    Bottom =135
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =169
        Top =29
        Right =468
        Bottom =272
        Top =0
        Name ="TbRecepção"
        Name =""
    End
End
