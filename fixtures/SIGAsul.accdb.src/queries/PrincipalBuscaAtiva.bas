Operation =1
Option =0
Where ="(((TbBuscaAtivaDet.DataBA) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbBuscaAtiva"
    Name ="TbBuscaAtivaDet"
End
Begin OutputColumns
    Expression ="TbBuscaAtiva.DataBA"
    Expression ="TbBuscaAtivaDet.DataBA"
    Expression ="TbBuscaAtivaDet.Tecnico"
    Expression ="TbBuscaAtivaDet.Função"
    Expression ="TbBuscaAtivaDet.[Nao Localizado]"
    Expression ="TbBuscaAtivaDet.[Motivo Não localizado]"
End
Begin Joins
    LeftTable ="TbBuscaAtiva"
    RightTable ="TbBuscaAtivaDet"
    Expression ="TbBuscaAtiva.CodBA = TbBuscaAtivaDet.CodBA"
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
        dbText "Name" ="TbBuscaAtiva.DataBA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtivaDet.[Motivo Não localizado]"
        dbInteger "ColumnWidth" ="2295"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtivaDet.[Nao Localizado]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtivaDet.Função"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtivaDet.Tecnico"
        dbInteger "ColumnWidth" ="2175"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtivaDet.DataBA"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-26
    Top =289
    Right =1083
    Bottom =629
    Left =-1
    Top =-1
    Right =1085
    Bottom =142
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =315
        Bottom =168
        Top =0
        Name ="TbBuscaAtiva"
        Name =""
    End
    Begin
        Left =435
        Top =8
        Right =579
        Bottom =157
        Top =0
        Name ="TbBuscaAtivaDet"
        Name =""
    End
End
