Operation =1
Option =0
Begin InputTables
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.CRAS"
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
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =952
    Bottom =524
    Left =-1
    Top =-1
    Right =884
    Bottom =271
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
