Operation =1
Option =0
Begin InputTables
    Name ="TbDiario"
    Name ="TbDiarioDet"
    Name ="TbGrupo"
End
Begin OutputColumns
    Expression ="TbGrupo.CodGrupo"
    Expression ="TbGrupo.Grupo"
    Expression ="TbGrupo.FxEtaria"
    Expression ="TbGrupo.DiaSemana"
    Expression ="TbGrupo.Horario"
    Expression ="TbGrupo.TIPO"
    Expression ="TbDiarioDet.Nome"
End
Begin Joins
    LeftTable ="TbDiario"
    RightTable ="TbDiarioDet"
    Expression ="TbDiario.CodDiario = TbDiarioDet.CodDiario"
    Flag =1
    LeftTable ="TbGrupo"
    RightTable ="TbDiario"
    Expression ="TbGrupo.CodGrupo = TbDiario.Grupo"
    Flag =3
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
        dbText "Name" ="TbDiarioDet.Nome"
        dbLong "AggregateType" ="-1"
    End
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
        dbInteger "ColumnWidth" ="2880"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.CodGrupo"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-258
    Top =42
    Right =1118
    Bottom =679
    Left =-1
    Top =-1
    Right =1352
    Bottom =309
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =433
        Top =48
        Right =577
        Bottom =192
        Top =0
        Name ="TbDiario"
        Name =""
    End
    Begin
        Left =663
        Top =31
        Right =807
        Bottom =175
        Top =0
        Name ="TbDiarioDet"
        Name =""
    End
    Begin
        Left =158
        Top =17
        Right =298
        Bottom =195
        Top =0
        Name ="TbGrupo"
        Name =""
    End
End
