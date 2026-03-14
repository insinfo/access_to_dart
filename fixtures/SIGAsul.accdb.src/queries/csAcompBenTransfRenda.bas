Operation =1
Option =0
Begin InputTables
    Name ="csAcompBenef"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="csAcompBenef.CodTecnico"
    Expression ="csAcompBenef.NomeTec"
    Expression ="csAcompBenef.CodPessoa"
    Expression ="csAcompBenef.Nome"
    Expression ="csAcompBenef.Idade"
    Expression ="csAcompBenef.[Carga Horária]"
    Expression ="csAcompBenef.[PAF inicio]"
    Expression ="csAcompBenef.[PAF fim]"
    Expression ="csAcompBenef.LOGO"
    Expression ="csAcompBenef.[Motivo Deslig]"
    Expression ="csAcompBenef.Particular"
    Expression ="csAcompBenef.Coletivo"
    Expression ="csAcompBenef.Grupo"
    Expression ="csAcompBenef.Defic"
    Expression ="csAcompBenef.Idoso"
    Expression ="csAcompBenef.DataDesl"
    Expression ="csAcompBenef.BPCD"
    Expression ="csAcompBenef.BPCI"
    Expression ="CadResidencia.[Fam Extrema Pb]"
    Expression ="csAcompBenef.FragilSocioEcon"
    Expression ="CadResidencia.[PBF FAMILIA]"
    Expression ="CadResidencia.CADUNICO"
    Expression ="CadResidencia.[Outros Programas Priori]"
    Expression ="csAcompBenef.[Aposentado/pensionista]"
    Expression ="csAcompBenef.[Renda sem programas sociais]"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="csAcompBenef"
    Expression ="CadResidencia.CodFam = csAcompBenef.CodFam"
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
        dbText "Name" ="csAcompBenef.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.[Alcool/Drogas]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.[Renda sem programas sociais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Fam Extrema Pb]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CadResidencia].[Outros Programas Priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Outros Programas Priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.CodTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CadResidencia].[CADUNICO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.FragilSocioEcon"
        dbInteger "ColumnWidth" ="2565"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CadResidencia].[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.NomeTec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.[Motivo Deslig]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.Particular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.Coletivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.Defic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.Idoso"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.BPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.BPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CadResidencia].[Fam Extrema Pb]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.Carga Horária"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.PAF inicio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.PAF fim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.Motivo Deslig"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Fam Extrema Pb"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PBF FAMILIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Outros Programas Priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.Aposentado/pensionista"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.Renda sem programas sociais"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompBenef.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1115
    Bottom =685
    Left =-1
    Top =-1
    Right =1091
    Bottom =258
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =108
        Top =-2
        Right =386
        Bottom =327
        Top =0
        Name ="csAcompBenef"
        Name =""
    End
    Begin
        Left =434
        Top =12
        Right =578
        Bottom =290
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
