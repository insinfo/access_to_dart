Operation =1
Option =0
Begin InputTables
    Name ="TbDiario"
    Name ="TbDiarioDet"
End
Begin OutputColumns
    Expression ="TbDiario.CodDiario"
    Expression ="TbDiario.CodFunc"
    Expression ="TbDiario.NomeOficineiro"
    Expression ="TbDiarioDet.Nome"
    Expression ="TbDiarioDet.DNasc"
    Expression ="TbDiario.Grupo"
    Expression ="TbDiario.Tipo"
    Expression ="TbDiario.FxEtaria"
    Expression ="TbDiario.Horario"
    Expression ="TbDiario.DiaSemana"
End
Begin Joins
    LeftTable ="TbDiario"
    RightTable ="TbDiarioDet"
    Expression ="TbDiario.CodDiario = TbDiarioDet.CodDiario"
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
        dbText "Name" ="TbDiario.HORARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.CodDiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Atividade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.[DIA DA SEMANA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.CodFunc"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1005"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbDiario.NomeOficineiro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiarioDet.NomePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiarioDet.CodPessoa"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1065"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbDiario.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NomePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiarioDet.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiarioDet.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Atividade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DIA DA SEMANA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.DiaSemana"
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
End
Begin
    State =0
    Left =11
    Top =24
    Right =1110
    Bottom =569
    Left =-1
    Top =-1
    Right =1075
    Bottom =236
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =185
        Bottom =240
        Top =0
        Name ="TbDiario"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =243
        Top =0
        Name ="TbDiarioDet"
        Name =""
    End
End
