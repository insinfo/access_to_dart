Operation =1
Option =0
Begin InputTables
    Name ="TbDiario"
    Name ="TbDiarioDet"
    Name ="TbGrupo"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbDiario.Grupo"
    Expression ="TbGrupo.CodGrupo"
    Expression ="TbDiario.CodDiario"
    Expression ="TbDiario.Tipo"
    Expression ="TbDiario.FxEtaria"
    Expression ="TbDiario.Horario"
    Expression ="TbDiario.DiaSemana"
    Expression ="TbDiario.CodFunc"
    Expression ="TbDiario.NomeOficineiro"
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
    LeftTable ="TbPessoa"
    RightTable ="TbDiarioDet"
    Expression ="TbPessoa.CodPessoa = TbDiarioDet.Nome"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbDiario.NomeOficineiro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.CodDiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Grupo"
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
        dbText "Name" ="TbDiario.Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.CodFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.CodGrupo"
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
End
Begin
    State =0
    Left =0
    Top =40
    Right =1088
    Bottom =660
    Left =-1
    Top =-1
    Right =1064
    Bottom =292
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =300
        Top =16
        Right =444
        Bottom =282
        Top =0
        Name ="TbDiario"
        Name =""
    End
    Begin
        Left =537
        Top =14
        Right =681
        Bottom =158
        Top =0
        Name ="TbDiarioDet"
        Name =""
    End
    Begin
        Left =70
        Top =20
        Right =214
        Bottom =164
        Top =0
        Name ="TbGrupo"
        Name =""
    End
    Begin
        Left =729
        Top =12
        Right =873
        Bottom =271
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
