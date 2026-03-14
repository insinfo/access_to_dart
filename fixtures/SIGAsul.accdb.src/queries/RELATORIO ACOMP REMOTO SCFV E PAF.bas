Operation =1
Option =0
Begin InputTables
    Name ="RELATORIO ACOMP REMOTO E SCFV"
    Name ="ACOMP REMOTO DIARIO E PAF"
End
Begin OutputColumns
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].CodAtend"
    Alias ="DATA DO ACOMP REMOTO"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].Data"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].NomeFunc"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].FuncaoFuncionario"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].CodPessoa"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].CodFam"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].Nome"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].Grupo"
    Expression ="[ACOMP REMOTO DIARIO E PAF].[PAF inicio]"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].DemandaBPC"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].DemandaINSS"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].DemandaSCFV"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].DemandaEduc"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].DemandaSaude"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].DemandaJustiça"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].DemandaBenefMun"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].DemandaAuxNatal"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].DemandaGratTransp"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].DemandaDocCivil"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].DemandaApoioAlim"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].[Outra Demanda]"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].[Especif Outra]"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].OBS"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].PROVICN"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].PROVIRG"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].PROVICTPS"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].PROVICPF"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].PROVITE"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].Autismo"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].Cegueira"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].[Baixa visão]"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].[Surdez severa profunda]"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].[Surdez leve moderada]"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].[Deficiencia fisica]"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].[Defic mental intelec]"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].[Sindrome down]"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].[Transt doença mental]"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].DoencaCronica"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].BPCD"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].BPCI"
End
Begin Joins
    LeftTable ="RELATORIO ACOMP REMOTO E SCFV"
    RightTable ="ACOMP REMOTO DIARIO E PAF"
    Expression ="[RELATORIO ACOMP REMOTO E SCFV].CodPessoa = [ACOMP REMOTO DIARIO E PAF].CodPesso"
        "a"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DemandaDocCivil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO E PAF].[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DESDOBRAMENTO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].Nome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3570"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DemandaBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DemandaINSS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DemandaSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DemandaEduc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DemandaSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DemandaJustiça"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DemandaBenefMun"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DemandaAuxNatal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DemandaGratTransp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DemandaRecJus"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DemandaApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].[Outra Demanda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].[Especif Outra]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompComPAF.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DATA DO ACOMP REMOTO"
        dbInteger "ColumnWidth" ="2250"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].OBS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].BPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].FuncaoFuncionario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].PROVITE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].[Sindrome down]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].NomeFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].PROVICN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].PROVIRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].PROVICTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].PROVICPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].[Baixa visão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].[Surdez severa profunda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].[Surdez leve moderada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].[Deficiencia fisica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].[Defic mental intelec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].[Transt doença mental]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RELATORIO ACOMP REMOTO E SCFV].BPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DemandaRecJus"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1083
    Bottom =660
    Left =-1
    Top =-1
    Right =1059
    Bottom =292
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =78
        Top =14
        Right =367
        Bottom =287
        Top =0
        Name ="RELATORIO ACOMP REMOTO E SCFV"
        Name =""
    End
    Begin
        Left =429
        Top =20
        Right =710
        Bottom =308
        Top =0
        Name ="ACOMP REMOTO DIARIO E PAF"
        Name =""
    End
End
