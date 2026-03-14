Operation =1
Option =0
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR"
    Name ="csDemandaDESCRITIVAcic6a12"
End
Begin OutputColumns
    Expression ="csDemandaDESCRITIVAcic6a12.CodDemanda"
    Expression ="csDemandaDESCRITIVAcic6a12.LOGO"
    Expression ="csDemandaDESCRITIVAcic6a12.RODAPE"
    Expression ="csDemandaDESCRITIVAcic6a12.CodFam"
    Expression ="[CS RESPONSAVEL FAMILIAR].Nome"
    Expression ="csDemandaDESCRITIVAcic6a12.TbUnidade.Nome"
    Expression ="csDemandaDESCRITIVAcic6a12.[DIRETOR(A)]"
    Expression ="csDemandaDESCRITIVAcic6a12.FUNÇÃO"
    Expression ="csDemandaDESCRITIVAcic6a12.MATRICULA"
    Expression ="csDemandaDESCRITIVAcic6a12.TbDemandaReprimida.Nome"
    Expression ="csDemandaDESCRITIVAcic6a12.CelularPessoa"
    Expression ="csDemandaDESCRITIVAcic6a12.MulherCF"
    Expression ="csDemandaDESCRITIVAcic6a12.[PBF FAMILIA]"
    Expression ="csDemandaDESCRITIVAcic6a12.[Fam Extrema Pb]"
    Expression ="csDemandaDESCRITIVAcic6a12.[Renda per capita]"
    Expression ="csDemandaDESCRITIVAcic6a12.[Aposentado/pensionista]"
    Expression ="csDemandaDESCRITIVAcic6a12.[Area violencia]"
    Expression ="csDemandaDESCRITIVAcic6a12.[Area de risco]"
    Expression ="csDemandaDESCRITIVAcic6a12.[Demanda CIC 6 A 12]"
    Expression ="csDemandaDESCRITIVAcic6a12.data"
    Expression ="csDemandaDESCRITIVAcic6a12.TipoBeneficio"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR"
    RightTable ="csDemandaDESCRITIVAcic6a12"
    Expression ="[CS RESPONSAVEL FAMILIAR].CodFam = csDemandaDESCRITIVAcic6a12.CodFam"
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
        dbText "Name" ="csDemandaDESCRITIVAcic6a12.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic6a12.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic6a12.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAcic6a12.CodDemanda"
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
    Bottom =238
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =459
        Top =39
        Right =730
        Bottom =332
        Top =0
        Name ="CS RESPONSAVEL FAMILIAR"
        Name =""
    End
    Begin
        Left =115
        Top =9
        Right =375
        Bottom =256
        Top =0
        Name ="csDemandaDESCRITIVAcic6a12"
        Name =""
    End
End
