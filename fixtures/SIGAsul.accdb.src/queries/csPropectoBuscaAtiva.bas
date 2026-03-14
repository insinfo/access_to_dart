Operation =1
Option =0
Where ="(((TbBuscaAtiva.CodBA)=[Formulários]![FrmBuscaAtiva]![CodBA]))"
Begin InputTables
    Name ="TbBuscaAtiva"
    Name ="TbBuscaAtivaDet"
    Name ="TbCadFuncionario"
End
Begin OutputColumns
    Expression ="TbBuscaAtiva.CodBA"
    Expression ="TbBuscaAtiva.DataBA"
    Expression ="TbBuscaAtiva.Origem"
    Expression ="TbBuscaAtiva.Nome"
    Expression ="TbBuscaAtiva.Endereço"
    Expression ="TbBuscaAtiva.Bairro"
    Expression ="TbBuscaAtiva.TelFixo"
    Expression ="TbBuscaAtiva.Celular"
    Expression ="TbBuscaAtiva.Referencia"
    Expression ="TbBuscaAtiva.Obs"
    Expression ="TbBuscaAtivaDet.CodBADet"
    Expression ="TbBuscaAtivaDet.CodBA"
    Expression ="TbBuscaAtivaDet.DataBA"
    Expression ="TbCadFuncionario.Nome"
    Expression ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
    Expression ="TbBuscaAtivaDet.[Nao Localizado]"
    Expression ="TbBuscaAtivaDet.[Motivo Não localizado]"
End
Begin Joins
    LeftTable ="TbBuscaAtiva"
    RightTable ="TbBuscaAtivaDet"
    Expression ="TbBuscaAtiva.CodBA = TbBuscaAtivaDet.CodBA"
    Flag =1
    LeftTable ="TbCadFuncionario"
    RightTable ="TbBuscaAtivaDet"
    Expression ="TbCadFuncionario.CodFunc = TbBuscaAtivaDet.Tecnico"
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
        dbText "Name" ="TbBuscaAtivaDet.[Motivo Não localizado]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.DataBA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.CodBA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtiva.Origem"
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
    Begin
        dbText "Name" ="TbBuscaAtivaDet.CodBADet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtivaDet.CodBA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtivaDet.DataBA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtivaDet.Localizado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Localizado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBuscaAtivaDet.[Nao Localizado]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =22
    Top =40
    Right =1266
    Bottom =660
    Left =-1
    Top =-1
    Right =1220
    Bottom =236
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =304
        Top =0
        Name ="TbBuscaAtiva"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =488
        Bottom =271
        Top =0
        Name ="TbBuscaAtivaDet"
        Name =""
    End
    Begin
        Left =622
        Top =25
        Right =766
        Bottom =169
        Top =0
        Name ="TbCadFuncionario"
        Name =""
    End
End
