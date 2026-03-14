Operation =1
Option =0
Where ="(((TbUnidade.CRAS)=Yes) AND ((TbPessoa.Nome) Like [DIGITE O NOME]+\"*\"))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbDiarioDet"
    Name ="TbDiario"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.LOGO"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbDiarioDet.CodDiarioDet"
    Expression ="TbUnidade.CRAS"
    Expression ="TbDiario.Volante"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Expression ="TbDiario.Grupo"
    Expression ="TbDiario.FxEtaria"
    Expression ="TbDiario.Horario"
    Expression ="TbDiario.DiaSemana"
    Expression ="TbDiario.CodFunc"
    Expression ="TbDiario.NomeOficineiro"
End
Begin Joins
    LeftTable ="TbDiarioDet"
    RightTable ="TbDiario"
    Expression ="TbDiarioDet.CodDiario = TbDiario.CodDiario"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbDiarioDet"
    Expression ="TbPessoa.CodPessoa = TbDiarioDet.Nome"
    Flag =1
End
Begin OrderBy
    Expression ="TbDiario.Horario"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbDiario.CodFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiarioDet.CodDiarioDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.NomeOficineiro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
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
        dbText "Name" ="TbDiario.[DIA DA SEMANA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Atividade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr4"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Volante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1160
    Bottom =660
    Left =-1
    Top =-1
    Right =1136
    Bottom =235
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =22
        Top =21
        Right =166
        Bottom =253
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
        Name ="TbDiarioDet"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =289
        Top =0
        Name ="TbDiario"
        Name =""
    End
    Begin
        Left =624
        Top =12
        Right =768
        Bottom =238
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
