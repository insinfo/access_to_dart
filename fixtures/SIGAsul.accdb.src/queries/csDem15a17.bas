Operation =1
Option =0
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR"
    Name ="csDemDescAtivBenefMun15a17"
End
Begin OutputColumns
    Expression ="csDemDescAtivBenefMun15a17.CodDemanda"
    Expression ="csDemDescAtivBenefMun15a17.LOGO"
    Expression ="csDemDescAtivBenefMun15a17.RODAPE"
    Expression ="csDemDescAtivBenefMun15a17.CodFam"
    Expression ="[CS RESPONSAVEL FAMILIAR].Nome"
    Expression ="csDemDescAtivBenefMun15a17.TbUnidade.Nome"
    Expression ="csDemDescAtivBenefMun15a17.[DIRETOR(A)]"
    Expression ="csDemDescAtivBenefMun15a17.FUNÇÃO"
    Expression ="csDemDescAtivBenefMun15a17.MATRICULA"
    Expression ="csDemDescAtivBenefMun15a17.TbDemandaReprimida.Nome"
    Expression ="csDemDescAtivBenefMun15a17.CelularPessoa"
    Expression ="csDemDescAtivBenefMun15a17.MulherCF"
    Expression ="csDemDescAtivBenefMun15a17.[PBF FAMILIA]"
    Expression ="csDemDescAtivBenefMun15a17.[Fam Extrema Pb]"
    Expression ="csDemDescAtivBenefMun15a17.[Renda per capita]"
    Expression ="csDemDescAtivBenefMun15a17.[Aposentado/pensionista]"
    Expression ="csDemDescAtivBenefMun15a17.[Area violencia]"
    Expression ="csDemDescAtivBenefMun15a17.[Area de risco]"
    Expression ="csDemDescAtivBenefMun15a17.[Demanda scfv atividade]"
    Expression ="csDemDescAtivBenefMun15a17.[15a17]"
    Expression ="csDemDescAtivBenefMun15a17.data"
    Expression ="csDemDescAtivBenefMun15a17.csBenefMunicipais.Nome"
    Expression ="csDemDescAtivBenefMun15a17.TipoBeneficio"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR"
    RightTable ="csDemDescAtivBenefMun15a17"
    Expression ="[CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun15a17.CodFam"
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
        dbText "Name" ="csDemDescAtivBenefMun15a17.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun15a17.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun15a17.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemDescAtivBenefMun15a17.CodDemanda"
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
        Right =227
        Bottom =269
        Top =0
        Name ="CS RESPONSAVEL FAMILIAR"
        Name =""
    End
    Begin
        Left =344
        Top =-12
        Right =587
        Bottom =279
        Top =0
        Name ="csDemDescAtivBenefMun15a17"
        Name =""
    End
End
