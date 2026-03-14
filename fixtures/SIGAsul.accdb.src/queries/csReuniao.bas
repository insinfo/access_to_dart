Operation =1
Option =0
Where ="(((TbReuniao.Data) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbReuniao"
    Name ="TbReuniaoDet"
End
Begin OutputColumns
    Expression ="TbReuniao.CodReuniao"
    Expression ="TbReuniaoDet.CodReuniao"
    Expression ="TbReuniao.Data"
    Expression ="TbReuniao.Assunto"
    Expression ="TbReuniao.Interna"
    Expression ="TbReuniao.Externa"
    Expression ="TbReuniao.Local"
    Expression ="TbReuniao.Intersetorial"
    Expression ="TbReuniao.Qual"
    Expression ="TbReuniao.Ata"
    Expression ="TbReuniaoDet.Nome"
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
        dbText "Name" ="TbReuniao.Ata"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.CodReuniao"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Local"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Externa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Interna"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Assunto"
        dbInteger "ColumnWidth" ="5535"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Intersetorial"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniao.Qual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniaoDet.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbReuniaoDet.CodReuniao"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-22
    Top =52
    Right =1113
    Bottom =672
    Left =-1
    Top =-1
    Right =1111
    Bottom =289
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =119
        Top =0
        Right =263
        Bottom =341
        Top =0
        Name ="TbReuniao"
        Name =""
    End
    Begin
        Left =398
        Top =36
        Right =542
        Bottom =319
        Top =0
        Name ="TbReuniaoDet"
        Name =""
    End
End
