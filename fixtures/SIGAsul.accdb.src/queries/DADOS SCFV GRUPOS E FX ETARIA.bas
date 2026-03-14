Operation =1
Option =0
Begin InputTables
    Name ="TbDiario"
    Name ="TbDiarioDet"
    Name ="TbGrupo"
End
Begin OutputColumns
    Expression ="TbDiario.Grupo"
    Expression ="TbDiario.Tipo"
    Expression ="TbDiario.FxEtaria"
    Expression ="TbDiario.Horario"
    Expression ="TbDiario.DiaSemana"
    Expression ="TbDiario.NomeOficineiro"
    Expression ="TbDiario.CodDiario"
    Expression ="TbDiarioDet.CodDiarioDet"
    Expression ="TbDiarioDet.Nome"
    Expression ="TbDiarioDet.DNasc"
End
Begin Joins
    LeftTable ="TbDiario"
    RightTable ="TbDiarioDet"
    Expression ="TbDiario.CodDiario = TbDiarioDet.CodDiario"
    Flag =1
    LeftTable ="TbGrupo"
    RightTable ="TbDiario"
    Expression ="TbGrupo.CodGrupo = TbDiario.Grupo"
    Flag =1
    LeftTable ="TbDiario"
    RightTable ="TbDiarioDet"
    Expression ="TbDiario.CodDiario = TbDiarioDet.CodDiario"
    Flag =1
    LeftTable ="TbGrupo"
    RightTable ="TbDiario"
    Expression ="TbGrupo.CodGrupo = TbDiario.Grupo"
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
        dbText "Name" ="TbDiario.NomeOficineiro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.DiaSemana"
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
        dbText "Name" ="TbDiarioDet.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiarioDet.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.CodDiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiarioDet.CodDiarioDet"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-83
    Top =39
    Right =888
    Bottom =523
    Left =-1
    Top =-1
    Right =947
    Bottom =186
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =323
        Top =15
        Right =539
        Bottom =255
        Top =0
        Name ="TbDiario"
        Name =""
    End
    Begin
        Left =70
        Top =28
        Right =214
        Bottom =172
        Top =0
        Name ="TbDiarioDet"
        Name =""
    End
    Begin
        Left =610
        Top =12
        Right =754
        Bottom =231
        Top =0
        Name ="TbGrupo"
        Name =""
    End
End
