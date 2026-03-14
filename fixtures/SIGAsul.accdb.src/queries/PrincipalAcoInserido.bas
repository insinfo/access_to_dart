Operation =1
Option =0
Where ="(((csAcoPorTecnicoUnion.[PAF inicio]) Between [DATA INICIAL] And [DATA FINAL]) A"
    "ND ((csAcoPorTecnicoUnion.DataDesl) Is Null))"
Begin InputTables
    Name ="TbUnidade"
    Name ="csAcoPorTecnicoUnion"
End
Begin OutputColumns
    Expression ="csAcoPorTecnicoUnion.CodTecnico"
    Expression ="csAcoPorTecnicoUnion.NomeTec"
    Expression ="csAcoPorTecnicoUnion.[Carga Horária]"
    Expression ="csAcoPorTecnicoUnion.Nome"
    Expression ="csAcoPorTecnicoUnion.[PAF inicio]"
    Expression ="csAcoPorTecnicoUnion.DataDesl"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbUnidade.LOGO"
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
        dbText "Name" ="csAcompPorTecnico.NomeTec"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3045"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.CodTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[FUNÇÃO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[NOME]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
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
        dbText "Name" ="TbUnidade.RODAPE"
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
        dbText "Name" ="[csAcompPorTecnico].[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[MATRICULA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[LOGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[RODAPE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[DataDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.CodTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.NomeTec"
        dbInteger "ColumnWidth" ="3045"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =35
    Top =2
    Right =1166
    Bottom =569
    Left =-1
    Top =-1
    Right =1107
    Bottom =264
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =380
        Top =10
        Right =524
        Bottom =254
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =573
        Top =0
        Right =717
        Bottom =265
        Top =0
        Name ="csAcoPorTecnicoUnion"
        Name =""
    End
End
