Operation =1
Option =0
Begin InputTables
    Name ="TbBeneficiosMunicipais"
    Name ="csAcompBenTransfRenda"
End
Begin OutputColumns
    Expression ="csAcompBenTransfRenda.csAcompBenef.NomeTec"
    Expression ="csAcompBenTransfRenda.csAcompBenef.Nome"
    Expression ="csAcompBenTransfRenda.csAcompBenef.Idade"
    Expression ="csAcompBenTransfRenda.csAcompBenef.Defic"
    Expression ="csAcompBenTransfRenda.csAcompBenef.BPCD"
    Expression ="csAcompBenTransfRenda.csAcompBenef.BPCI"
    Expression ="TbBeneficiosMunicipais.TipoBeneficio"
    Expression ="csAcompBenTransfRenda.csAcompBenef.DataDesl"
    Expression ="csAcompBenTransfRenda.[Fam Extrema Pb]"
    Expression ="csAcompBenTransfRenda.csAcompBenef.FragilSocioEcon"
    Expression ="csAcompBenTransfRenda.[PBF FAMILIA]"
    Expression ="csAcompBenTransfRenda.CADUNICO"
End
Begin Joins
    LeftTable ="csAcompBenTransfRenda"
    RightTable ="TbBeneficiosMunicipais"
    Expression ="csAcompBenTransfRenda.csAcompBenef.CodPessoa = TbBeneficiosMunicipais.Nome"
    Flag =2
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
        dbText "Name" ="TbBeneficiosMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.CADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.csAcompBenef.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.csAcompBenef.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.csAcompBenef.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.csAcompBenef.NomeTec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.csAcompBenef.Defic"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2295"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.csAcompBenef.Idoso"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2115"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[TipoBeneficio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.csAcompBenef.DataDesl"
        dbInteger "ColumnWidth" ="3870"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.csAcompBenef.BPCD"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1290"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.csAcompBenef.BPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.[Fam Extrema Pb]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.csAcompBenef.FragilSocioEcon"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.Fam Extrema Pb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenTransfRenda.PBF FAMILIA"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =992
    Bottom =685
    Left =-1
    Top =-1
    Right =968
    Bottom =277
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =432
        Top =32
        Right =628
        Bottom =363
        Top =0
        Name ="TbBeneficiosMunicipais"
        Name =""
    End
    Begin
        Left =46
        Top =8
        Right =386
        Bottom =327
        Top =0
        Name ="csAcompBenTransfRenda"
        Name =""
    End
End
