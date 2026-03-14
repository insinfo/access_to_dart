Operation =1
Option =0
Begin InputTables
    Name ="ACOMP REMOTO DIARIO"
    Name ="ACOMP REMOTO E GRUPOS"
    Name ="TbAcomp"
End
Begin OutputColumns
    Expression ="[ACOMP REMOTO DIARIO].CodAtend"
    Expression ="[ACOMP REMOTO DIARIO].Data"
    Expression ="[ACOMP REMOTO DIARIO].NomeFunc"
    Expression ="[ACOMP REMOTO DIARIO].FuncaoFuncionario"
    Expression ="[ACOMP REMOTO DIARIO].CodPessoa"
    Expression ="[ACOMP REMOTO DIARIO].CodFam"
    Expression ="[ACOMP REMOTO DIARIO].Nome"
    Expression ="[ACOMP REMOTO E GRUPOS].Grupo"
    Expression ="[ACOMP REMOTO DIARIO].DemandaBPC"
    Expression ="[ACOMP REMOTO DIARIO].DemandaINSS"
    Expression ="[ACOMP REMOTO DIARIO].DemandaSCFV"
    Expression ="[ACOMP REMOTO DIARIO].DemandaEduc"
    Expression ="[ACOMP REMOTO DIARIO].DemandaSaude"
    Expression ="[ACOMP REMOTO DIARIO].DemandaJustiça"
    Expression ="[ACOMP REMOTO DIARIO].DemandaBenefMun"
    Expression ="[ACOMP REMOTO DIARIO].DemandaAuxNatal"
    Expression ="[ACOMP REMOTO DIARIO].DemandaGratTransp"
    Expression ="[ACOMP REMOTO DIARIO].DemandaDocCivil"
    Expression ="[ACOMP REMOTO DIARIO].DemandaApoioAlim"
    Expression ="[ACOMP REMOTO DIARIO].[Outra Demanda]"
    Expression ="[ACOMP REMOTO DIARIO].[Especif Outra]"
    Expression ="[ACOMP REMOTO DIARIO].OBS"
    Expression ="[ACOMP REMOTO DIARIO].PROVICN"
    Expression ="[ACOMP REMOTO DIARIO].PROVIRG"
    Expression ="[ACOMP REMOTO DIARIO].PROVICTPS"
    Expression ="[ACOMP REMOTO DIARIO].PROVICPF"
    Expression ="[ACOMP REMOTO DIARIO].PROVITE"
    Expression ="[ACOMP REMOTO DIARIO].Autismo"
    Expression ="[ACOMP REMOTO DIARIO].Cegueira"
    Expression ="[ACOMP REMOTO DIARIO].[Baixa visão]"
    Expression ="[ACOMP REMOTO DIARIO].[Surdez severa profunda]"
    Expression ="[ACOMP REMOTO DIARIO].[Surdez leve moderada]"
    Expression ="[ACOMP REMOTO DIARIO].[Deficiencia fisica]"
    Expression ="[ACOMP REMOTO DIARIO].[Defic mental intelec]"
    Expression ="[ACOMP REMOTO DIARIO].[Sindrome down]"
    Expression ="[ACOMP REMOTO DIARIO].[Transt doença mental]"
    Expression ="[ACOMP REMOTO DIARIO].DoencaCronica"
    Expression ="[ACOMP REMOTO DIARIO].BPCD"
    Expression ="[ACOMP REMOTO DIARIO].BPCI"
End
Begin Joins
    LeftTable ="ACOMP REMOTO DIARIO"
    RightTable ="ACOMP REMOTO E GRUPOS"
    Expression ="[ACOMP REMOTO DIARIO].CodPessoa = [ACOMP REMOTO E GRUPOS].CodPessoa"
    Flag =2
    LeftTable ="ACOMP REMOTO DIARIO"
    RightTable ="TbAcomp"
    Expression ="[ACOMP REMOTO DIARIO].CodPessoa = TbAcomp.Nome"
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
        dbText "Name" ="[ACOMP REMOTO E GRUPOS].Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].DemandaSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].DemandaINSS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].DemandaBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].DemandaEduc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].DemandaSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].DemandaJustiça"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].DemandaBenefMun"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].DemandaAuxNatal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].DemandaGratTransp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].DemandaRecJus"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].DemandaDocCivil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].DemandaApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].[Outra Demanda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].[Especif Outra]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].OBS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].BPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].NomeFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].FuncaoFuncionario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].[Defic mental intelec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].[Transt doença mental]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].[Sindrome down]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].PROVICN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].PROVIRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].PROVICTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].PROVICPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].PROVITE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].[Baixa visão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].[Surdez severa profunda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].[Surdez leve moderada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].[Deficiencia fisica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[ACOMP REMOTO DIARIO].BPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DemandaRecJus"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-123
    Top =16
    Right =1001
    Bottom =636
    Left =-1
    Top =-1
    Right =1100
    Bottom =291
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =328
        Top =7
        Right =516
        Bottom =311
        Top =0
        Name ="ACOMP REMOTO DIARIO"
        Name =""
    End
    Begin
        Left =633
        Top =9
        Right =849
        Bottom =282
        Top =0
        Name ="ACOMP REMOTO E GRUPOS"
        Name =""
    End
    Begin
        Left =90
        Top =23
        Right =234
        Bottom =167
        Top =0
        Name ="TbAcomp"
        Name =""
    End
End
