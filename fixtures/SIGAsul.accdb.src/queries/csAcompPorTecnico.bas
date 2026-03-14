Operation =1
Option =0
Where ="(((TbAcompDet.DataDesl) Is Null Or (TbAcompDet.DataDesl)>[DATA FINAL]))"
Begin InputTables
    Name ="TbAcomp"
    Name ="TbAcompDet"
    Name ="TbCadFuncionario"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbAcomp.CodAcomp"
    Expression ="TbAcompDet.CodTecnico"
    Expression ="TbAcompDet.NomeTec"
    Expression ="TbPessoa.Nome"
    Expression ="TbCadFuncionario.[Carga Horária]"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.[PAF fim]"
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
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
dbMemo "Filter" ="([csAcompPorTecnico].[NomeTec]=\"CHRISTIAN DOS SANTOS CLAUDINO\")"
dbMemo "OrderBy" ="[csAcompPorTecnico].[NomeTec]"
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
        dbText "Name" ="TbCadFuncionario.[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.NomeTec"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3465"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcompDet.CodTecnico"
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
        dbText "Name" ="[TbAcompDet].[Grupo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1557
    Bottom =696
    Left =-1
    Top =-1
    Right =1489
    Bottom =233
    Left =0
    Top =0
    ColumnsShown =539
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
        Left =759
        Top =11
        Right =903
        Bottom =325
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
    Begin
        Left =959
        Top =-5
        Right =1103
        Bottom =276
        Top =0
        Name ="TbCadFuncionario"
        Name =""
    End
    Begin
        Left =92
        Top =41
        Right =236
        Bottom =185
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
