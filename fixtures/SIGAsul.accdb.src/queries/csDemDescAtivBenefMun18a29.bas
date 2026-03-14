Operation =1
Option =0
Where ="(((csDemandaDESCRITIVAativ.[18a29])=Yes))"
Begin InputTables
    Name ="csBenefMunicipais"
    Name ="csDemandaDESCRITIVAativ"
End
Begin OutputColumns
    Expression ="csDemandaDESCRITIVAativ.CodDemanda"
    Expression ="csDemandaDESCRITIVAativ.LOGO"
    Expression ="csDemandaDESCRITIVAativ.RODAPE"
    Expression ="csDemandaDESCRITIVAativ.CodFam"
    Expression ="csDemandaDESCRITIVAativ.TbUnidade.Nome"
    Expression ="csDemandaDESCRITIVAativ.[DIRETOR(A)]"
    Expression ="csDemandaDESCRITIVAativ.FUNÇÃO"
    Expression ="csDemandaDESCRITIVAativ.MATRICULA"
    Expression ="csDemandaDESCRITIVAativ.TbDemandaReprimida.Nome"
    Expression ="csDemandaDESCRITIVAativ.CelularPessoa"
    Expression ="csDemandaDESCRITIVAativ.MulherCF"
    Expression ="csDemandaDESCRITIVAativ.[PBF FAMILIA]"
    Expression ="csDemandaDESCRITIVAativ.[Fam Extrema Pb]"
    Expression ="csDemandaDESCRITIVAativ.[Renda per capita]"
    Expression ="csDemandaDESCRITIVAativ.[Aposentado/pensionista]"
    Expression ="csDemandaDESCRITIVAativ.[Area violencia]"
    Expression ="csDemandaDESCRITIVAativ.[Area de risco]"
    Expression ="csDemandaDESCRITIVAativ.[Demanda scfv atividade]"
    Expression ="csDemandaDESCRITIVAativ.[18a29]"
    Expression ="csDemandaDESCRITIVAativ.data"
    Expression ="csBenefMunicipais.Nome"
    Expression ="csBenefMunicipais.TipoBeneficio"
End
Begin Joins
    LeftTable ="csDemandaDESCRITIVAativ"
    RightTable ="csBenefMunicipais"
    Expression ="csDemandaDESCRITIVAativ.CodDemanda = csBenefMunicipais.CodBenef"
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
Begin
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.TbUnidade.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBenefMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.CodDemanda"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBenefMunicipais.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.TbDemandaReprimida.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.CelularPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.MulherCF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[Fam Extrema Pb]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[Area violencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[Area de risco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[Demanda scfv atividade]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[0a5]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[6a11]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[12a14]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[15a17]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[18a29]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[30a59]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[60mais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.LOGO"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1103
    Bottom =660
    Left =-1
    Top =-1
    Right =1079
    Bottom =170
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =346
        Top =16
        Right =494
        Bottom =191
        Top =0
        Name ="csBenefMunicipais"
        Name =""
    End
    Begin
        Left =118
        Top =7
        Right =278
        Bottom =185
        Top =0
        Name ="csDemandaDESCRITIVAativ"
        Name =""
    End
End
