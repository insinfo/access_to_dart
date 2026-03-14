Operation =1
Option =0
Begin InputTables
    Name ="TbGrupo"
    Name ="TbDiario"
    Name ="TbDiarioDet"
End
Begin OutputColumns
    Expression ="TbGrupo.Grupo"
    Expression ="TbGrupo.FxEtaria"
    Expression ="TbGrupo.DiaSemana"
    Expression ="TbGrupo.Horario"
    Expression ="TbGrupo.TIPO"
    Alias ="ContarDeNome"
    Expression ="Count(TbDiarioDet.Nome)"
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
End
Begin Groups
    Expression ="TbGrupo.Grupo"
    GroupLevel =0
    Expression ="TbGrupo.FxEtaria"
    GroupLevel =0
    Expression ="TbGrupo.DiaSemana"
    GroupLevel =0
    Expression ="TbGrupo.Horario"
    GroupLevel =0
    Expression ="TbGrupo.TIPO"
    GroupLevel =0
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
        dbText "Name" ="TbGrupo.TIPO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ContarDeNome"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1376
    Bottom =677
    Left =-1
    Top =-1
    Right =1352
    Bottom =326
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =56
        Top =0
        Right =200
        Bottom =247
        Top =0
        Name ="TbGrupo"
        Name =""
    End
    Begin
        Left =369
        Top =13
        Right =513
        Bottom =157
        Top =0
        Name ="TbDiario"
        Name =""
    End
    Begin
        Left =673
        Top =14
        Right =817
        Bottom =158
        Top =0
        Name ="TbDiarioDet"
        Name =""
    End
End
