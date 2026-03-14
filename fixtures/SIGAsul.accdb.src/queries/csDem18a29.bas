Operation =1
Option =0
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR"
    Name ="csDemDescAtivBenefMun18a29"
End
Begin OutputColumns
    Expression ="csDemDescAtivBenefMun18a29.CodDemanda"
    Expression ="csDemDescAtivBenefMun18a29.LOGO"
    Expression ="csDemDescAtivBenefMun18a29.RODAPE"
    Expression ="csDemDescAtivBenefMun18a29.CodFam"
    Expression ="[CS RESPONSAVEL FAMILIAR].Nome"
    Expression ="csDemDescAtivBenefMun18a29.TbUnidade.Nome"
    Expression ="csDemDescAtivBenefMun18a29.[DIRETOR(A)]"
    Expression ="csDemDescAtivBenefMun18a29.FUNÇÃO"
    Expression ="csDemDescAtivBenefMun18a29.MATRICULA"
    Expression ="csDemDescAtivBenefMun18a29.TbDemandaReprimida.Nome"
    Expression ="csDemDescAtivBenefMun18a29.CelularPessoa"
    Expression ="csDemDescAtivBenefMun18a29.MulherCF"
    Expression ="csDemDescAtivBenefMun18a29.[PBF FAMILIA]"
    Expression ="csDemDescAtivBenefMun18a29.[Fam Extrema Pb]"
    Expression ="csDemDescAtivBenefMun18a29.[Renda per capita]"
    Expression ="csDemDescAtivBenefMun18a29.[Aposentado/pensionista]"
    Expression ="csDemDescAtivBenefMun18a29.[Area violencia]"
    Expression ="csDemDescAtivBenefMun18a29.[Area de risco]"
    Expression ="csDemDescAtivBenefMun18a29.[Demanda scfv atividade]"
    Expression ="csDemDescAtivBenefMun18a29.[18a29]"
    Expression ="csDemDescAtivBenefMun18a29.data"
    Expression ="csDemDescAtivBenefMun18a29.csBenefMunicipais.Nome"
    Expression ="csDemDescAtivBenefMun18a29.TipoBeneficio"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR"
    RightTable ="csDemDescAtivBenefMun18a29"
    Expression ="[CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun18a29.CodFam"
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
        dbText "Name" ="csDemDescAtivBenefMun18a29.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun18a29.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun18a29.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun18a29.CodDemanda"
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
    Bottom =323
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="CS RESPONSAVEL FAMILIAR"
        Name =""
    End
    Begin
        Left =283
        Top =-7
        Right =533
        Bottom =334
        Top =0
        Name ="csDemDescAtivBenefMun18a29"
        Name =""
    End
End
