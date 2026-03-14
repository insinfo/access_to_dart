Operation =1
Option =0
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR"
    Name ="csDemDescAtivBenefMun12a14"
End
Begin OutputColumns
    Expression ="csDemDescAtivBenefMun12a14.CodDemanda"
    Expression ="csDemDescAtivBenefMun12a14.LOGO"
    Expression ="csDemDescAtivBenefMun12a14.RODAPE"
    Expression ="csDemDescAtivBenefMun12a14.CodFam"
    Expression ="[CS RESPONSAVEL FAMILIAR].Nome"
    Expression ="csDemDescAtivBenefMun12a14.TbUnidade.Nome"
    Expression ="csDemDescAtivBenefMun12a14.[DIRETOR(A)]"
    Expression ="csDemDescAtivBenefMun12a14.FUNÇÃO"
    Expression ="csDemDescAtivBenefMun12a14.MATRICULA"
    Expression ="csDemDescAtivBenefMun12a14.TbDemandaReprimida.Nome"
    Expression ="csDemDescAtivBenefMun12a14.CelularPessoa"
    Expression ="csDemDescAtivBenefMun12a14.MulherCF"
    Expression ="csDemDescAtivBenefMun12a14.[PBF FAMILIA]"
    Expression ="csDemDescAtivBenefMun12a14.[Fam Extrema Pb]"
    Expression ="csDemDescAtivBenefMun12a14.[Renda per capita]"
    Expression ="csDemDescAtivBenefMun12a14.[Aposentado/pensionista]"
    Expression ="csDemDescAtivBenefMun12a14.[Area violencia]"
    Expression ="csDemDescAtivBenefMun12a14.[Area de risco]"
    Expression ="csDemDescAtivBenefMun12a14.[Demanda scfv atividade]"
    Expression ="csDemDescAtivBenefMun12a14.[12a14]"
    Expression ="csDemDescAtivBenefMun12a14.data"
    Expression ="csDemDescAtivBenefMun12a14.csBenefMunicipais.Nome"
    Expression ="csDemDescAtivBenefMun12a14.TipoBeneficio"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR"
    RightTable ="csDemDescAtivBenefMun12a14"
    Expression ="[CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun12a14.CodFam"
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
        dbText "Name" ="csDemDescAtivBenefMun12a14.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun12a14.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun12a14.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun12a14.CodDemanda"
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
        Left =313
        Top =12
        Right =457
        Bottom =318
        Top =0
        Name ="csDemDescAtivBenefMun12a14"
        Name =""
    End
End
