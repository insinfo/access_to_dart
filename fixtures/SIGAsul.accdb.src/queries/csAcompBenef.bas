Operation =1
Option =0
Having ="(((TbAcompDet.[PAF inicio]) Is Null Or (TbAcompDet.[PAF inicio])<=[DATA FINAL]) "
    "AND ((TbAcompDet.DataDesl) Is Null Or (TbAcompDet.DataDesl)>[DATA FINAL]))"
Begin InputTables
    Name ="TbAcomp"
    Name ="TbAcompDet"
    Name ="TbCadFuncionario"
    Name ="TbPessoa"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbAcompDet.CodTecnico"
    Expression ="TbAcompDet.NomeTec"
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Expression ="TbCadFuncionario.[Carga Horária]"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.[PAF fim]"
    Expression ="TbUnidade.LOGO"
    Expression ="TbAcompDet.[Motivo Deslig]"
    Expression ="TbAcompDet.Particular"
    Expression ="TbAcompDet.Coletivo"
    Expression ="TbAcompDet.Grupo"
    Expression ="TbAcompDet.Defic"
    Expression ="TbAcompDet.Idoso"
    Expression ="TbAcompDet.Gest"
    Expression ="TbAcompDet.Criança"
    Expression ="TbAcompDet.Adol"
    Expression ="TbAcompDet.[Alcool/Drogas]"
    Expression ="TbAcompDet.ConflitoFam"
    Expression ="TbAcompDet.FragilSocioEcon"
    Expression ="TbAcompDet.DataDesl"
    Expression ="TbPessoa.BPCD"
    Expression ="TbPessoa.BPCI"
    Expression ="TbPessoa.[Aposentado/pensionista]"
    Expression ="TbPessoa.[Renda sem programas sociais]"
End
Begin Joins
    LeftTable ="TbAcomp"
    RightTable ="TbAcompDet"
    Expression ="TbAcomp.CodAcomp = TbAcompDet.CodAcomp"
    Flag =1
    LeftTable ="TbCadFuncionario"
    RightTable ="TbAcompDet"
    Expression ="TbCadFuncionario.CodFunc = TbAcompDet.CodTecnico"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAcomp"
    Expression ="TbPessoa.CodPessoa = TbAcomp.Nome"
    Flag =1
End
Begin Groups
    Expression ="TbAcompDet.CodTecnico"
    GroupLevel =0
    Expression ="TbAcompDet.NomeTec"
    GroupLevel =0
    Expression ="TbPessoa.CodFam"
    GroupLevel =0
    Expression ="TbPessoa.CodPessoa"
    GroupLevel =0
    Expression ="TbPessoa.Nome"
    GroupLevel =0
    Expression ="TbPessoa.DNasc"
    GroupLevel =0
    Expression ="TbCadFuncionario.[Carga Horária]"
    GroupLevel =0
    Expression ="TbAcompDet.[PAF inicio]"
    GroupLevel =0
    Expression ="TbAcompDet.[PAF fim]"
    GroupLevel =0
    Expression ="TbAcompDet.[Motivo Deslig]"
    GroupLevel =0
    Expression ="TbAcompDet.Particular"
    GroupLevel =0
    Expression ="TbAcompDet.Coletivo"
    GroupLevel =0
    Expression ="TbAcompDet.Grupo"
    GroupLevel =0
    Expression ="TbAcompDet.Defic"
    GroupLevel =0
    Expression ="TbAcompDet.Idoso"
    GroupLevel =0
    Expression ="TbAcompDet.Gest"
    GroupLevel =0
    Expression ="TbAcompDet.Criança"
    GroupLevel =0
    Expression ="TbAcompDet.Adol"
    GroupLevel =0
    Expression ="TbAcompDet.[Alcool/Drogas]"
    GroupLevel =0
    Expression ="TbAcompDet.ConflitoFam"
    GroupLevel =0
    Expression ="TbAcompDet.FragilSocioEcon"
    GroupLevel =0
    Expression ="TbAcompDet.DataDesl"
    GroupLevel =0
    Expression ="TbPessoa.BPCD"
    GroupLevel =0
    Expression ="TbPessoa.BPCI"
    GroupLevel =0
    Expression ="TbPessoa.[Aposentado/pensionista]"
    GroupLevel =0
    Expression ="TbPessoa.[Renda sem programas sociais]"
    GroupLevel =0
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
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.NomeTec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.CodTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.FragilSocioEcon"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[Motivo Deslig]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Particular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Coletivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Defic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Idoso"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Gest"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Criança"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Adol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[Alcool/Drogas]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.ConflitoFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ContarDeNome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[CodTecnico]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[NomeTec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbCadFuncionario].[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[Defic]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[Idoso]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[Gest]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[DataDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[FragilSocioEcon]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[LOGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[Adol]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[Motivo Deslig]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[Alcool/Drogas]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[Particular]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[ConflitoFam]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[Coletivo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcomp].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcompDet].[Grupo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeNome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NomeTec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Carga Horária"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PAF inicio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PAF fim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Motivo Deslig"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Particular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Coletivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Defic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idoso"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Gest"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Criança"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Adol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Alcool/Drogas"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ConflitoFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FragilSocioEcon"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.DataIncl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbAcomp].[DataIncl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[Renda sem programas sociais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.BPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.BPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Renda sem programas sociais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[BPCD]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[BPCI]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Aposentado/pensionista"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Renda sem programas sociais"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[CodFam]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[DNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[CodPessoa]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1127
    Bottom =660
    Left =-1
    Top =-1
    Right =1103
    Bottom =247
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =257
        Top =32
        Right =401
        Bottom =176
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =473
        Top =29
        Right =617
        Bottom =226
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
    Begin
        Left =714
        Top =22
        Right =858
        Bottom =303
        Top =0
        Name ="TbCadFuncionario"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =315
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =906
        Top =12
        Right =1050
        Bottom =156
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
