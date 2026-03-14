Operation =1
Option =0
Where ="(((TbEncaminhamento.RSA11)=Yes)) OR (((TbEncaminhamento.RSA5)=Yes)) OR (((TbEnca"
    "minhamento.RSA6)=Yes))"
Begin InputTables
    Name ="TbEncaminhamento"
End
Begin OutputColumns
    Expression ="TbEncaminhamento.DataEnc"
    Expression ="TbEncaminhamento.Nome"
    Alias ="creas"
    Expression ="TbEncaminhamento.RSA11"
    Alias ="ceam"
    Expression ="TbEncaminhamento.RSA5"
    Alias ="conselho"
    Expression ="TbEncaminhamento.RSA6"
End
Begin OrderBy
    Expression ="TbEncaminhamento.RSA11"
    Flag =0
    Expression ="TbEncaminhamento.RSA5"
    Flag =0
    Expression ="TbEncaminhamento.RSA6"
    Flag =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
dbMemo "OrderBy" ="[csEncCREAS].[DataEnc]"
Begin
    Begin
        dbText "Name" ="TbEncaminhamento.DataEnc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="conselho"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ceam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="creas"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA6"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA11"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =48
    Top =23
    Right =1045
    Bottom =466
    Left =-1
    Top =-1
    Right =973
    Bottom =179
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
