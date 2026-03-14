Operation =1
Option =0
Begin InputTables
    Name ="csDemandaDESCRITIVAcasaCri"
    Name ="CS RESPONSAVEL FAMILIAR"
End
Begin OutputColumns
    Expression ="csDemandaDESCRITIVAcasaCri.CodDemanda"
    Expression ="csDemandaDESCRITIVAcasaCri.LOGO"
    Expression ="csDemandaDESCRITIVAcasaCri.RODAPE"
    Expression ="csDemandaDESCRITIVAcasaCri.CodFam"
    Expression ="[CS RESPONSAVEL FAMILIAR].Nome"
    Expression ="csDemandaDESCRITIVAcasaCri.TbUnidade.Nome"
    Expression ="csDemandaDESCRITIVAcasaCri.[DIRETOR(A)]"
    Expression ="csDemandaDESCRITIVAcasaCri.FUNÇÃO"
    Expression ="csDemandaDESCRITIVAcasaCri.MATRICULA"
    Expression ="csDemandaDESCRITIVAcasaCri.TbDemandaReprimida.Nome"
    Expression ="csDemandaDESCRITIVAcasaCri.CelularPessoa"
    Expression ="csDemandaDESCRITIVAcasaCri.MulherCF"
    Expression ="csDemandaDESCRITIVAcasaCri.[PBF FAMILIA]"
    Expression ="csDemandaDESCRITIVAcasaCri.[Fam Extrema Pb]"
    Expression ="csDemandaDESCRITIVAcasaCri.[Renda per capita]"
    Expression ="csDemandaDESCRITIVAcasaCri.[Aposentado/pensionista]"
    Expression ="csDemandaDESCRITIVAcasaCri.[Area violencia]"
    Expression ="csDemandaDESCRITIVAcasaCri.[Area de risco]"
    Expression ="csDemandaDESCRITIVAcasaCri.[Demanda CASA DA CRIANÇA 1 A 6]"
    Expression ="csDemandaDESCRITIVAcasaCri.data"
    Expression ="csDemandaDESCRITIVAcasaCri.TipoBeneficio"
    Expression ="csDemandaDESCRITIVAcasaCri.CodFam"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR"
    RightTable ="csDemandaDESCRITIVAcasaCri"
    Expression ="[CS RESPONSAVEL FAMILIAR].CodFam = csDemandaDESCRITIVAcasaCri.CodFam"
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
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.CodDemanda"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.TbUnidade.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.TbDemandaReprimida.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.CelularPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.MulherCF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[Fam Extrema Pb]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[Area violencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[Area de risco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[Demanda CASA DA CRIANÇA 1 A 6]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.LOGO"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =142
    Top =52
    Right =1277
    Bottom =672
    Left =-1
    Top =-1
    Right =1111
    Bottom =348
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =137
        Top =52
        Right =373
        Bottom =317
        Top =0
        Name ="csDemandaDESCRITIVAcasaCri"
        Name =""
    End
    Begin
        Left =459
        Top =39
        Right =730
        Bottom =332
        Top =0
        Name ="CS RESPONSAVEL FAMILIAR"
        Name =""
    End
End
