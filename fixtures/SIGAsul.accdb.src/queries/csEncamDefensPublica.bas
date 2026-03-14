Operation =1
Option =0
Where ="(((TbEncaminhamento.DataEnc) Between [data inicial] And [data final]) AND ((TbEn"
    "caminhamento.OP13)=Yes))"
Begin InputTables
    Name ="TbEncaminhamento"
End
Begin OutputColumns
    Expression ="TbEncaminhamento.DataEnc"
    Expression ="TbEncaminhamento.Nome"
    Expression ="TbEncaminhamento.OP13"
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
        dbText "Name" ="TbEncaminhamento.OP13"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.DataEnc"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1155
    Bottom =660
    Left =-1
    Top =-1
    Right =1131
    Bottom =309
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =295
        Bottom =272
        Top =0
        Name ="TbEncaminhamento"
        Name =""
    End
End
