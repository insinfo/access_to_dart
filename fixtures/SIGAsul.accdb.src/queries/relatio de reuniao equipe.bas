Operation =1
Option =0
Where ="(((TbReuniao.Assunto) Like \"*\"+[digite o assunto]+\"*\"))"
Begin InputTables
    Name ="TbReuniao"
    Name ="TbReuniaoDet"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbReuniao.Data"
    Expression ="TbReuniao.Assunto"
    Expression ="TbReuniaoDet.Nome"
    Expression ="TbReuniaoDet.Função"
    Expression ="TbReuniaoDet.Celular"
    Expression ="TbReuniaoDet.Email"
    Expression ="TbReuniaoDet.[Local de trabalho]"
    Expression ="TbReuniao.Ata"
    Expression ="TbReuniao.Interna"
    Expression ="TbReuniao.Externa"
    Expression ="TbReuniao.Local"
    Expression ="TbReuniao.Intersetorial"
    Expression ="TbReuniao.Qual"
    Expression ="TbReuniao.Volante"
End
Begin Joins
    LeftTable ="TbReuniao"
    RightTable ="TbReuniaoDet"
    Expression ="TbReuniao.CodReuniao = TbReuniaoDet.CodReuniao"
    Flag =1
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
        dbText "Name" ="TbReuniaoDet.Nome"
        dbInteger "ColumnWidth" ="2970"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Assunto"
        dbInteger "ColumnWidth" ="7755"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Intersetorial"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Local"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniaoDet.[Local de trabalho]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Externa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniaoDet.Email"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Interna"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniaoDet.Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Ata"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniaoDet.Função"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Volante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Qual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-459
    Top =29
    Right =1158
    Bottom =846
    Left =-1
    Top =-1
    Right =1593
    Bottom =489
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =271
        Top =0
        Name ="TbReuniao"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =337
        Top =0
        Name ="TbReuniaoDet"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =466
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
