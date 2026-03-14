Operation =1
Option =0
Where ="(((TbEncaminhamento.OP1)=Yes))"
Begin InputTables
    Name ="TbEncaminhamento"
End
Begin OutputColumns
    Expression ="TbEncaminhamento.DataEnc"
    Expression ="TbEncaminhamento.OP1"
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
        dbText "Name" ="TbEncaminhamento.DataEnc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP1"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1118
    Bottom =524
    Left =-1
    Top =-1
    Right =1094
    Bottom =248
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =98
        Top =6
        Right =406
        Bottom =269
        Top =0
        Name ="TbEncaminhamento"
        Name =""
    End
End
