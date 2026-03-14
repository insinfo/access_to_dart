Operation =1
Option =0
Where ="(((TbEncaminhamento.RSA11)=Yes)) OR (((TbEncaminhamento.RSA5)=Yes)) OR (((TbEnca"
    "minhamento.RSA6)=Yes))"
Begin InputTables
    Name ="TbEncaminhamento"
End
Begin OutputColumns
    Alias ="CREAS"
    Expression ="TbEncaminhamento.RSA11"
    Alias ="CEAM"
    Expression ="TbEncaminhamento.RSA5"
    Alias ="CONS TUTELAR"
    Expression ="TbEncaminhamento.RSA6"
    Expression ="TbEncaminhamento.DataEnc"
    Expression ="TbEncaminhamento.Nome"
    Expression ="TbEncaminhamento.Tel1"
    Expression ="TbEncaminhamento.Obs"
    Expression ="TbEncaminhamento.NomeFunc"
    Expression ="TbEncaminhamento.DataMonit"
    Expression ="TbEncaminhamento.ServidorMonitor"
    Expression ="TbEncaminhamento.[Monitoramento Sem Exito]"
    Expression ="TbEncaminhamento.ATENDIDO"
End
Begin OrderBy
    Expression ="TbEncaminhamento.DataEnc"
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
        dbText "Name" ="TbEncaminhamento.ATENDIDO"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="945"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.DataEnc"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1185"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.Nome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2610"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.NomeFunc"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1125"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.Tel1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.DataMonit"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1050"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.ServidorMonitor"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="945"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.[Monitoramento Sem Exito]"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1185"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.Obs"
        dbInteger "ColumnWidth" ="2010"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CONS TUTELAR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="creas"
        dbInteger "ColumnWidth" ="1050"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CEAM"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =51
    Top =33
    Right =1141
    Bottom =632
    Left =-1
    Top =-1
    Right =1066
    Bottom =140
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =209
        Top =7
        Right =372
        Bottom =248
        Top =0
        Name ="TbEncaminhamento"
        Name =""
    End
End
