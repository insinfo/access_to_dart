Operation =1
Option =0
Begin InputTables
    Name ="SISC PRESENÇA COLETIVO"
End
Begin OutputColumns
    Expression ="[SISC PRESENÇA COLETIVO].Nome"
    Expression ="[SISC PRESENÇA COLETIVO].DNasc"
    Expression ="[SISC PRESENÇA COLETIVO].Idade"
    Expression ="[SISC PRESENÇA COLETIVO].NIS"
    Expression ="[SISC PRESENÇA COLETIVO].Grupo"
    Expression ="[SISC PRESENÇA COLETIVO].horario"
    Expression ="[SISC PRESENÇA COLETIVO].fxetariadoscfv"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbSingle "ECLScaleFactor" ="1"
dbByte "RecordsetType" ="0"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="[SISC PRESENÇA COLETIVO].fxetariadoscfv"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC PRESENÇA COLETIVO].horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MUNICIPIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.ENDEREÇO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[Nº UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC PRESENÇA COLETIVO].DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC PRESENÇA COLETIVO].Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC PRESENÇA COLETIVO].NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC PRESENÇA COLETIVO].[DNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC PRESENÇA COLETIVO].[Idade]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC PRESENÇA COLETIVO].[NIS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC PRESENÇA COLETIVO].[horario]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC PRESENÇA COLETIVO].[fxetariadoscfv]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[Nº UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[ENDEREÇO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[MUNICIPIO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[UF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[LOGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC PRESENÇA COLETIVO].Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC PRESENÇA COLETIVO].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UNIDADE"
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
    Bottom =219
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =268
        Top =6
        Right =412
        Bottom =150
        Top =0
        Name ="SISC PRESENÇA COLETIVO"
        Name =""
    End
End
