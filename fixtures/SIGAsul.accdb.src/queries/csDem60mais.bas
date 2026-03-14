Operation =1
Option =0
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR"
    Name ="csDemDescAtivBenefMun60mais"
End
Begin OutputColumns
    Expression ="csDemDescAtivBenefMun60mais.CodDemanda"
    Expression ="csDemDescAtivBenefMun60mais.LOGO"
    Expression ="csDemDescAtivBenefMun60mais.RODAPE"
    Expression ="csDemDescAtivBenefMun60mais.CodFam"
    Expression ="[CS RESPONSAVEL FAMILIAR].Nome"
    Expression ="csDemDescAtivBenefMun60mais.TbUnidade.Nome"
    Expression ="csDemDescAtivBenefMun60mais.[DIRETOR(A)]"
    Expression ="csDemDescAtivBenefMun60mais.FUNÇÃO"
    Expression ="csDemDescAtivBenefMun60mais.MATRICULA"
    Expression ="csDemDescAtivBenefMun60mais.TbDemandaReprimida.Nome"
    Expression ="csDemDescAtivBenefMun60mais.CelularPessoa"
    Expression ="csDemDescAtivBenefMun60mais.MulherCF"
    Expression ="csDemDescAtivBenefMun60mais.[PBF FAMILIA]"
    Expression ="csDemDescAtivBenefMun60mais.[Fam Extrema Pb]"
    Expression ="csDemDescAtivBenefMun60mais.[Renda per capita]"
    Expression ="csDemDescAtivBenefMun60mais.[Aposentado/pensionista]"
    Expression ="csDemDescAtivBenefMun60mais.[Area violencia]"
    Expression ="csDemDescAtivBenefMun60mais.[Area de risco]"
    Expression ="csDemDescAtivBenefMun60mais.[Demanda scfv atividade]"
    Expression ="csDemDescAtivBenefMun60mais.[60mais]"
    Expression ="csDemDescAtivBenefMun60mais.data"
    Expression ="csDemDescAtivBenefMun60mais.csBenefMunicipais.Nome"
    Expression ="csDemDescAtivBenefMun60mais.TipoBeneficio"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR"
    RightTable ="csDemDescAtivBenefMun60mais"
    Expression ="[CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun60mais.CodFam"
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
        dbText "Name" ="csDemDescAtivBenefMun60mais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun60mais.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun60mais.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun60mais.CodDemanda"
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
        Left =293
        Top =0
        Right =604
        Bottom =318
        Top =0
        Name ="csDemDescAtivBenefMun60mais"
        Name =""
    End
End
