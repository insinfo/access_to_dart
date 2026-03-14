Operation =1
Option =0
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR"
    Name ="csDemandaDESCRITIVAcic13a17"
End
Begin OutputColumns
    Expression ="csDemandaDESCRITIVAcic13a17.CodDemanda"
    Expression ="csDemandaDESCRITIVAcic13a17.LOGO"
    Expression ="csDemandaDESCRITIVAcic13a17.RODAPE"
    Expression ="csDemandaDESCRITIVAcic13a17.CodFam"
    Expression ="[CS RESPONSAVEL FAMILIAR].Nome"
    Expression ="csDemandaDESCRITIVAcic13a17.TbUnidade.Nome"
    Expression ="csDemandaDESCRITIVAcic13a17.[DIRETOR(A)]"
    Expression ="csDemandaDESCRITIVAcic13a17.FUNÇÃO"
    Expression ="csDemandaDESCRITIVAcic13a17.MATRICULA"
    Expression ="csDemandaDESCRITIVAcic13a17.TbDemandaReprimida.Nome"
    Expression ="csDemandaDESCRITIVAcic13a17.CelularPessoa"
    Expression ="csDemandaDESCRITIVAcic13a17.MulherCF"
    Expression ="csDemandaDESCRITIVAcic13a17.[PBF FAMILIA]"
    Expression ="csDemandaDESCRITIVAcic13a17.[Fam Extrema Pb]"
    Expression ="csDemandaDESCRITIVAcic13a17.[Renda per capita]"
    Expression ="csDemandaDESCRITIVAcic13a17.[Aposentado/pensionista]"
    Expression ="csDemandaDESCRITIVAcic13a17.[Area violencia]"
    Expression ="csDemandaDESCRITIVAcic13a17.[Area de risco]"
    Expression ="csDemandaDESCRITIVAcic13a17.[Demanda CIC 13 A 17]"
    Expression ="csDemandaDESCRITIVAcic13a17.data"
    Expression ="csDemandaDESCRITIVAcic13a17.TipoBeneficio"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR"
    RightTable ="csDemandaDESCRITIVAcic13a17"
    Expression ="[CS RESPONSAVEL FAMILIAR].CodFam = csDemandaDESCRITIVAcic13a17.CodFam"
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
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.CodDemanda"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.TbUnidade.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.TbDemandaReprimida.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.CelularPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.MulherCF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.[Fam Extrema Pb]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.[Area violencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.[Area de risco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.[Demanda CIC 13 A 17]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[Area violencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[Fam Extrema Pb]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.TbUnidade.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.MulherCF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.CodDemanda"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[Demanda CASA DA CRIANÇA 1 A 6]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.CelularPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.[Area de risco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.TbDemandaReprimida.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcasaCri.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic13a17.RODAPE"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-113
    Top =50
    Right =1022
    Bottom =670
    Left =-1
    Top =-1
    Right =1111
    Bottom =238
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =613
        Top =16
        Right =884
        Bottom =309
        Top =0
        Name ="CS RESPONSAVEL FAMILIAR"
        Name =""
    End
    Begin
        Left =353
        Top =31
        Right =531
        Bottom =288
        Top =0
        Name ="csDemandaDESCRITIVAcic13a17"
        Name =""
    End
End
