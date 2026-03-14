Operation =1
Option =0
Where ="(((TbBuscaAtivaDet.DataBA) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbBuscaAtiva"
    Name ="TbBuscaAtivaDet"
End
Begin OutputColumns
    Expression ="TbBuscaAtivaDet.CodBADet"
    Expression ="TbBuscaAtivaDet.DataBA"
    Expression ="TbBuscaAtivaDet.Tecnico"
    Expression ="TbBuscaAtivaDet.[Nao Localizado]"
    Expression ="TbBuscaAtivaDet.[Motivo Não localizado]"
    Expression ="TbBuscaAtiva.DataBA"
    Expression ="TbBuscaAtiva.Origem"
    Expression ="TbBuscaAtiva.Nome"
    Expression ="TbBuscaAtiva.Endereço"
    Expression ="TbBuscaAtiva.Bairro"
    Expression ="TbBuscaAtiva.TelFixo"
    Expression ="TbBuscaAtiva.Celular"
    Expression ="TbBuscaAtiva.Referencia"
    Expression ="TbBuscaAtiva.Obs"
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
        dbText "Name" ="TbBuscaAtivaDet.Tecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtivaDet.DataBA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.DataBA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtivaDet.CodBADet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtivaDet.[Motivo Não localizado]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtivaDet.[Nao Localizado]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.Origem"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.TelFixo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.Referencia"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1192
    Bottom =660
    Left =-1
    Top =-1
    Right =1124
    Bottom =219
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =191
        Bottom =288
        Top =0
        Name ="TbBuscaAtiva"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =245
        Top =0
        Name ="TbBuscaAtivaDet"
        Name =""
    End
End
