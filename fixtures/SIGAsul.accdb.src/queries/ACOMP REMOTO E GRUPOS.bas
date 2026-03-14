Operation =1
Option =0
Begin InputTables
    Name ="TbGrupo"
    Name ="TbDiario"
    Name ="TbDiarioDet"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbDiarioDet.Nome"
    Expression ="TbGrupo.Grupo"
    Expression ="TbGrupo.FxEtaria"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.CodFam"
    Expression ="TbDiario.Volante"
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
        dbText "Name" ="TbGrupo.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.Grupo"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2250"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbDiarioDet.Nome"
        dbInteger "ColumnWidth" ="2565"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-251
    Top =36
    Right =1125
    Bottom =582
    Left =-1
    Top =-1
    Right =1352
    Bottom =258
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =164
        Top =53
        Right =308
        Bottom =272
        Top =0
        Name ="TbGrupo"
        Name =""
    End
    Begin
        Left =401
        Top =9
        Right =545
        Bottom =262
        Top =0
        Name ="TbDiario"
        Name =""
    End
    Begin
        Left =624
        Top =12
        Right =768
        Bottom =156
        Top =0
        Name ="TbDiarioDet"
        Name =""
    End
    Begin
        Left =816
        Top =12
        Right =960
        Bottom =296
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
