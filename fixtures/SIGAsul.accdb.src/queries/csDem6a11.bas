Operation =1
Option =0
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR"
    Name ="csDemDescAtivBenefMun6a11"
End
Begin OutputColumns
    Expression ="csDemDescAtivBenefMun6a11.CodDemanda"
    Expression ="csDemDescAtivBenefMun6a11.LOGO"
    Expression ="csDemDescAtivBenefMun6a11.RODAPE"
    Expression ="csDemDescAtivBenefMun6a11.CodFam"
    Expression ="[CS RESPONSAVEL FAMILIAR].Nome"
    Expression ="csDemDescAtivBenefMun6a11.TbUnidade.Nome"
    Expression ="csDemDescAtivBenefMun6a11.[DIRETOR(A)]"
    Expression ="csDemDescAtivBenefMun6a11.FUNÇÃO"
    Expression ="csDemDescAtivBenefMun6a11.MATRICULA"
    Expression ="csDemDescAtivBenefMun6a11.TbDemandaReprimida.Nome"
    Expression ="csDemDescAtivBenefMun6a11.CelularPessoa"
    Expression ="csDemDescAtivBenefMun6a11.MulherCF"
    Expression ="csDemDescAtivBenefMun6a11.[PBF FAMILIA]"
    Expression ="csDemDescAtivBenefMun6a11.[Fam Extrema Pb]"
    Expression ="csDemDescAtivBenefMun6a11.[Renda per capita]"
    Expression ="csDemDescAtivBenefMun6a11.[Aposentado/pensionista]"
    Expression ="csDemDescAtivBenefMun6a11.[Area violencia]"
    Expression ="csDemDescAtivBenefMun6a11.[Area de risco]"
    Expression ="csDemDescAtivBenefMun6a11.[Demanda scfv atividade]"
    Expression ="csDemDescAtivBenefMun6a11.[6a11]"
    Expression ="csDemDescAtivBenefMun6a11.data"
    Expression ="csDemDescAtivBenefMun6a11.csBenefMunicipais.Nome"
    Expression ="csDemDescAtivBenefMun6a11.TipoBeneficio"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR"
    RightTable ="csDemDescAtivBenefMun6a11"
    Expression ="[CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun6a11.CodFam"
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
        dbText "Name" ="csDemDescAtivBenefMun6a11.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun6a11.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun6a11.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun6a11.CodDemanda"
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
        Left =266
        Top =25
        Right =410
        Bottom =335
        Top =0
        Name ="csDemDescAtivBenefMun6a11"
        Name =""
    End
End
