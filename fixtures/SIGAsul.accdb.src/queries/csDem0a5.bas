Operation =1
Option =0
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR"
    Name ="csDemDescAtivBenefMun0a5"
End
Begin OutputColumns
    Expression ="csDemDescAtivBenefMun0a5.CodDemanda"
    Expression ="csDemDescAtivBenefMun0a5.LOGO"
    Expression ="csDemDescAtivBenefMun0a5.RODAPE"
    Expression ="csDemDescAtivBenefMun0a5.CodFam"
    Expression ="[CS RESPONSAVEL FAMILIAR].Nome"
    Expression ="csDemDescAtivBenefMun0a5.TbUnidade.Nome"
    Expression ="csDemDescAtivBenefMun0a5.[DIRETOR(A)]"
    Expression ="csDemDescAtivBenefMun0a5.FUNÇÃO"
    Expression ="csDemDescAtivBenefMun0a5.MATRICULA"
    Expression ="csDemDescAtivBenefMun0a5.TbDemandaReprimida.Nome"
    Expression ="csDemDescAtivBenefMun0a5.CelularPessoa"
    Expression ="csDemDescAtivBenefMun0a5.MulherCF"
    Expression ="csDemDescAtivBenefMun0a5.[PBF FAMILIA]"
    Expression ="csDemDescAtivBenefMun0a5.[Fam Extrema Pb]"
    Expression ="csDemDescAtivBenefMun0a5.[Renda per capita]"
    Expression ="csDemDescAtivBenefMun0a5.[Aposentado/pensionista]"
    Expression ="csDemDescAtivBenefMun0a5.[Area violencia]"
    Expression ="csDemDescAtivBenefMun0a5.[Area de risco]"
    Expression ="csDemDescAtivBenefMun0a5.[Demanda scfv atividade]"
    Expression ="csDemDescAtivBenefMun0a5.[0a5]"
    Expression ="csDemDescAtivBenefMun0a5.data"
    Expression ="csDemDescAtivBenefMun0a5.csBenefMunicipais.Nome"
    Expression ="csDemDescAtivBenefMun0a5.TipoBeneficio"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR"
    RightTable ="csDemDescAtivBenefMun0a5"
    Expression ="[CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun0a5.CodFam"
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
        dbText "Name" ="csDemDescAtivBenefMun0a5.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.CodDemanda"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.TbUnidade.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.TbDemandaReprimida.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.CelularPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.MulherCF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.[Fam Extrema Pb]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.[Area violencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.[Area de risco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.[Demanda scfv atividade]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.[0a5]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.csBenefMunicipais.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun0a5.LOGO"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1135
    Bottom =660
    Left =-1
    Top =-1
    Right =1111
    Bottom =306
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =268
        Bottom =272
        Top =0
        Name ="CS RESPONSAVEL FAMILIAR"
        Name =""
    End
    Begin
        Left =325
        Top =11
        Right =558
        Bottom =297
        Top =0
        Name ="csDemDescAtivBenefMun0a5"
        Name =""
    End
End
