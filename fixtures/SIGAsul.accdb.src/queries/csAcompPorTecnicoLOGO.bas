Operation =1
Option =0
Begin InputTables
    Name ="TbUnidade"
    Name ="csAcompPorTecnico"
End
Begin OutputColumns
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="csAcompPorTecnico.CodAcomp"
    Expression ="csAcompPorTecnico.CodTecnico"
    Expression ="csAcompPorTecnico.NomeTec"
    Expression ="csAcompPorTecnico.Nome"
    Expression ="csAcompPorTecnico.[Carga Horária]"
    Expression ="csAcompPorTecnico.[PAF inicio]"
    Expression ="csAcompPorTecnico.[PAF fim]"
    Expression ="csAcompPorTecnico.[Motivo Deslig]"
    Expression ="csAcompPorTecnico.Particular"
    Expression ="csAcompPorTecnico.Coletivo"
    Expression ="csAcompPorTecnico.Grupo"
    Expression ="csAcompPorTecnico.Defic"
    Expression ="csAcompPorTecnico.Idoso"
    Expression ="csAcompPorTecnico.Gest"
    Expression ="csAcompPorTecnico.Criança"
    Expression ="csAcompPorTecnico.Adol"
    Expression ="csAcompPorTecnico.[Alcool/Drogas]"
    Expression ="csAcompPorTecnico.ConflitoFam"
    Expression ="csAcompPorTecnico.FragilSocioEcon"
    Expression ="csAcompPorTecnico.DataDesl"
End
Begin Groups
    Expression ="csAcompPorTecnico.CodAcomp"
    GroupLevel =0
    Expression ="csAcompPorTecnico.CodTecnico"
    GroupLevel =0
    Expression ="csAcompPorTecnico.NomeTec"
    GroupLevel =0
    Expression ="csAcompPorTecnico.Nome"
    GroupLevel =0
    Expression ="csAcompPorTecnico.[Carga Horária]"
    GroupLevel =0
    Expression ="csAcompPorTecnico.[PAF inicio]"
    GroupLevel =0
    Expression ="csAcompPorTecnico.[PAF fim]"
    GroupLevel =0
    Expression ="csAcompPorTecnico.[Motivo Deslig]"
    GroupLevel =0
    Expression ="csAcompPorTecnico.Particular"
    GroupLevel =0
    Expression ="csAcompPorTecnico.Coletivo"
    GroupLevel =0
    Expression ="csAcompPorTecnico.Grupo"
    GroupLevel =0
    Expression ="csAcompPorTecnico.Defic"
    GroupLevel =0
    Expression ="csAcompPorTecnico.Idoso"
    GroupLevel =0
    Expression ="csAcompPorTecnico.Gest"
    GroupLevel =0
    Expression ="csAcompPorTecnico.Criança"
    GroupLevel =0
    Expression ="csAcompPorTecnico.Adol"
    GroupLevel =0
    Expression ="csAcompPorTecnico.[Alcool/Drogas]"
    GroupLevel =0
    Expression ="csAcompPorTecnico.ConflitoFam"
    GroupLevel =0
    Expression ="csAcompPorTecnico.FragilSocioEcon"
    GroupLevel =0
    Expression ="csAcompPorTecnico.DataDesl"
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
        dbText "Name" ="TbAcoRetorno.DataRetorno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ÚltimoDeDataRetorno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeDataRetorno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.CodTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.NomeTec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.[Motivo Deslig]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.Particular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.Coletivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.Defic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.Idoso"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.Gest"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.Criança"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.Adol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.[Alcool/Drogas]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.ConflitoFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[Grupo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.FragilSocioEcon"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[CodAcomp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[RODAPE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[CodTecnico]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[NomeTec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[Motivo Deslig]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[Particular]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[Coletivo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[Defic]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[Idoso]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[Gest]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[Adol]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[Alcool/Drogas]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[ConflitoFam]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[FragilSocioEcon]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[DataDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[DataDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnicoDATAATUALIZ.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[CodAcomp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[MáxDeDataRetorno]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[ConflitoFam]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[CodTecnico]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[NomeTec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[Motivo Deslig]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[Particular]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[Coletivo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[Grupo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[Defic]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[Idoso]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[Gest]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[Adol]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[Alcool/Drogas]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnicoDATAATUALIZ].[FragilSocioEcon]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnicoDATAATUALIZ.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1620
    Bottom =857
    Left =-1
    Top =-1
    Right =1596
    Bottom =386
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =568
        Top =40
        Right =807
        Bottom =348
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =1049
        Top =76
        Right =1193
        Bottom =387
        Top =0
        Name ="csAcompPorTecnico"
        Name =""
    End
End
