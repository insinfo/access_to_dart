Operation =1
Option =0
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR"
    Name ="csDemDescAtivBenefMun30a59"
End
Begin OutputColumns
    Expression ="csDemDescAtivBenefMun30a59.CodDemanda"
    Expression ="csDemDescAtivBenefMun30a59.LOGO"
    Expression ="csDemDescAtivBenefMun30a59.RODAPE"
    Expression ="csDemDescAtivBenefMun30a59.CodFam"
    Expression ="[CS RESPONSAVEL FAMILIAR].Nome"
    Expression ="csDemDescAtivBenefMun30a59.TbUnidade.Nome"
    Expression ="csDemDescAtivBenefMun30a59.[DIRETOR(A)]"
    Expression ="csDemDescAtivBenefMun30a59.FUNÇÃO"
    Expression ="csDemDescAtivBenefMun30a59.MATRICULA"
    Expression ="csDemDescAtivBenefMun30a59.TbDemandaReprimida.Nome"
    Expression ="csDemDescAtivBenefMun30a59.CelularPessoa"
    Expression ="csDemDescAtivBenefMun30a59.MulherCF"
    Expression ="csDemDescAtivBenefMun30a59.[PBF FAMILIA]"
    Expression ="csDemDescAtivBenefMun30a59.[Fam Extrema Pb]"
    Expression ="csDemDescAtivBenefMun30a59.[Renda per capita]"
    Expression ="csDemDescAtivBenefMun30a59.[Aposentado/pensionista]"
    Expression ="csDemDescAtivBenefMun30a59.[Area violencia]"
    Expression ="csDemDescAtivBenefMun30a59.[Area de risco]"
    Expression ="csDemDescAtivBenefMun30a59.[Demanda scfv atividade]"
    Expression ="csDemDescAtivBenefMun30a59.[30a59]"
    Expression ="csDemDescAtivBenefMun30a59.data"
    Expression ="csDemDescAtivBenefMun30a59.csBenefMunicipais.Nome"
    Expression ="csDemDescAtivBenefMun30a59.TipoBeneficio"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR"
    RightTable ="csDemDescAtivBenefMun30a59"
    Expression ="[CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun30a59.CodFam"
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
        dbText "Name" ="csDemDescAtivBenefMun30a59.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun30a59.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun30a59.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun30a59.CodDemanda"
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
        Left =237
        Top =0
        Right =581
        Bottom =308
        Top =0
        Name ="csDemDescAtivBenefMun30a59"
        Name =""
    End
End
