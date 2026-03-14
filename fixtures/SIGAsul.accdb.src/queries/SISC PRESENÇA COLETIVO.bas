Operation =1
Option =2
Having ="(((TbAtColetivo.DataCol) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbOfSocioEduDetalhe"
    Name ="TbAtColetivoDet"
    Name ="TbAtColetivo"
    Name ="TbGrupo"
End
Begin OutputColumns
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Expression ="TbPessoa.NIS"
    Expression ="TbGrupo.Grupo"
    Expression ="TbAtColetivo.horario"
    Expression ="TbAtColetivo.fxetariadoscfv"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="TbOfSocioEduDetalhe"
    Expression ="TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome"
    Flag =1
    LeftTable ="TbAtColetivoDet"
    RightTable ="TbAtColetivo"
    Expression ="TbAtColetivoDet.CodColetivo = TbAtColetivo.CodColetivo"
    Flag =1
    LeftTable ="TbOfSocioEduDetalhe"
    RightTable ="TbAtColetivoDet"
    Expression ="TbOfSocioEduDetalhe.Nome = TbAtColetivoDet.Nome"
    Flag =1
    LeftTable ="TbGrupo"
    RightTable ="TbAtColetivo"
    Expression ="TbGrupo.CodGrupo = TbAtColetivo.GRUPOSCFV"
    Flag =1
End
Begin Groups
    Expression ="TbPessoa.Nome"
    GroupLevel =0
    Expression ="TbPessoa.DNasc"
    GroupLevel =0
    Expression ="TbPessoa.NIS"
    GroupLevel =0
    Expression ="TbGrupo.Grupo"
    GroupLevel =0
    Expression ="TbAtColetivo.horario"
    GroupLevel =0
    Expression ="TbAtColetivo.fxetariadoscfv"
    GroupLevel =0
    Expression ="TbAtColetivo.DataCol"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbAtColetivo.fxetariadoscfv"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[DNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[NIS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAtColetivo].[horario]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAtColetivo].[fxetariadoscfv]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.Grupo"
        dbInteger "ColumnWidth" ="2535"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbInteger "ColumnWidth" ="3180"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1124
    Bottom =660
    Left =-1
    Top =-1
    Right =1100
    Bottom =222
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =276
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =274
        Top =0
        Name ="TbOfSocioEduDetalhe"
        Name =""
    End
    Begin
        Left =432
        Top =56
        Right =576
        Bottom =306
        Top =0
        Name ="TbAtColetivoDet"
        Name =""
    End
    Begin
        Left =605
        Top =-3
        Right =906
        Bottom =312
        Top =0
        Name ="TbAtColetivo"
        Name =""
    End
    Begin
        Left =954
        Top =12
        Right =1098
        Bottom =156
        Top =0
        Name ="TbGrupo"
        Name =""
    End
End
