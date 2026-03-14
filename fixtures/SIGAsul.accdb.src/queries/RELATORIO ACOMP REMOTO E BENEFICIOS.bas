Operation =1
Option =0
Begin InputTables
    Name ="RELATORIO ACOMP REMOTO SCFV E PAF"
    Name ="csBMD"
    Name ="csBMI"
    Name ="csBSF"
End
Begin OutputColumns
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].CodAtend"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].[DATA DO ACOMP REMOTO]"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].NomeFunc"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].FuncaoFuncionario"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].CodPessoa"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].CodFam"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].Nome"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].Grupo"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].[PAF inicio]"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaBPC"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaINSS"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaSCFV"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaEduc"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaSaude"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaJustiça"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaBenefMun"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaAuxNatal"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaGratTransp"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaDocCivil"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaApoioAlim"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Outra Demanda]"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Especif Outra]"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].OBS"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].PROVICN"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].PROVIRG"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].PROVICTPS"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].PROVICPF"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].PROVITE"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].Autismo"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].Cegueira"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Baixa visão]"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Surdez severa profunda]"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Surdez leve moderada]"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Deficiencia fisica]"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Defic mental intelec]"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Sindrome down]"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Transt doença mental]"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].DoencaCronica"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].BPCD"
    Expression ="[RELATORIO ACOMP REMOTO SCFV E PAF].BPCI"
    Alias ="BMD"
    Expression ="csBMD.TipoBeneficio"
    Alias ="BMI"
    Expression ="csBMI.TipoBeneficio"
    Alias ="BSF"
    Expression ="csBSF.TipoBeneficio"
End
Begin Joins
    LeftTable ="csBMD"
    RightTable ="RELATORIO ACOMP REMOTO SCFV E PAF"
    Expression ="csBMD.CodPessoa = [RELATORIO ACOMP REMOTO SCFV E PAF].CodPessoa"
    Flag =3
    LeftTable ="csBMI"
    RightTable ="RELATORIO ACOMP REMOTO SCFV E PAF"
    Expression ="csBMI.CodPessoa = [RELATORIO ACOMP REMOTO SCFV E PAF].CodPessoa"
    Flag =3
    LeftTable ="csBSF"
    RightTable ="RELATORIO ACOMP REMOTO SCFV E PAF"
    Expression ="csBSF.CodPessoa = [RELATORIO ACOMP REMOTO SCFV E PAF].CodPessoa"
    Flag =3
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].BPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Deficiencia fisica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].[DATA DO ACOMP REMOTO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].FuncaoFuncionario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].NomeFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Baixa visão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBSF.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaINSS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaEduc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaJustiça"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaBenefMun"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaAuxNatal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaGratTransp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Sindrome down]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaRecJus"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Transt doença mental]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].DemandaDocCivil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Defic mental intelec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Outra Demanda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Especif Outra]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Surdez leve moderada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].OBS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].PROVICN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].PROVIRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].PROVICTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].PROVICPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].PROVITE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].[Surdez severa profunda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO SCFV E PAF].BPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMD.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBMI.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DemandaRecJus"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-318
    Top =40
    Right =1002
    Bottom =660
    Left =-1
    Top =-1
    Right =1296
    Bottom =340
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =47
        Top =18
        Right =276
        Bottom =347
        Top =0
        Name ="RELATORIO ACOMP REMOTO SCFV E PAF"
        Name =""
    End
    Begin
        Left =403
        Top =-9
        Right =547
        Bottom =130
        Top =0
        Name ="csBMD"
        Name =""
    End
    Begin
        Left =406
        Top =119
        Right =550
        Bottom =226
        Top =0
        Name ="csBMI"
        Name =""
    End
    Begin
        Left =404
        Top =244
        Right =548
        Bottom =388
        Top =0
        Name ="csBSF"
        Name =""
    End
End
