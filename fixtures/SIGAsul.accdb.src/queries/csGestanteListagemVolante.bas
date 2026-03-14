Operation =1
Option =0
Where ="(((TbUnidade.NOME) Like \"*\"+[DIGITE A UNIDADE]+\"*\") AND ((TbGestante.Volante"
    ")=Yes) AND ((TbGestDet.DataDesl) Is Null))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbGestante"
    Name ="TbGestDet"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbGestante.Volante"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbGestDet.DataCad"
    Expression ="TbGestDet.DPP"
    Expression ="TbGestDet.DPSaida"
    Expression ="TbGestDet.DataDesl"
    Expression ="TbPessoa.Nome"
    Expression ="TbGestante.Celular"
End
Begin Joins
    LeftTable ="TbGestante"
    RightTable ="TbGestDet"
    Expression ="TbGestante.CodGestante = TbGestDet.CodGestante"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbGestante"
    Expression ="TbPessoa.CodPessoa = TbGestante.Nome"
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
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGestDet.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGestDet.DPP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGestDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGestDet.DPSaida"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGestante.Celular"
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
    Begin
        dbText "Name" ="TbGestante.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =978
    Bottom =660
    Left =-1
    Top =-1
    Right =910
    Bottom =229
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
        Top =0
        Name ="TbGestante"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =156
        Top =0
        Name ="TbGestDet"
        Name =""
    End
    Begin
        Left =96
        Top =112
        Right =240
        Bottom =275
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
