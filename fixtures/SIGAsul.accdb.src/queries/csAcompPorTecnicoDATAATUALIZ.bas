Operation =1
Option =0
Begin InputTables
    Name ="TbAcoRetorno"
    Name ="csAcompPorTecnico"
End
Begin OutputColumns
    Expression ="csAcompPorTecnico.CodAcomp"
    Alias ="MáxDeDataRetorno"
    Expression ="Max(TbAcoRetorno.DataRetorno)"
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
Begin Joins
    LeftTable ="TbAcoRetorno"
    RightTable ="csAcompPorTecnico"
    Expression ="TbAcoRetorno.CodAcomp = csAcompPorTecnico.CodAcomp"
    Flag =1
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
        dbText "Name" ="[csAcompPorTecnico].[CodAcomp]"
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
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1643
    Bottom =865
    Left =-1
    Top =-1
    Right =1619
    Bottom =250
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =565
        Top =57
        Right =709
        Bottom =251
        Top =0
        Name ="TbAcoRetorno"
        Name =""
    End
    Begin
        Left =139
        Top =16
        Right =283
        Bottom =251
        Top =0
        Name ="csAcompPorTecnico"
        Name =""
    End
End
