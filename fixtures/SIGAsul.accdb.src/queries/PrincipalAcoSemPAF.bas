Operation =1
Option =0
Where ="(((csAcoPorTecnicoUnion.[PAF inicio]) Is Null) AND ((csAcoPorTecnicoUnion.DataDe"
    "sl) Is Null Or (csAcoPorTecnicoUnion.DataDesl)>=[DATA FINAL]))"
Begin InputTables
    Name ="csAcoPorTecnicoUnion"
End
Begin OutputColumns
    Expression ="csAcoPorTecnicoUnion.CodTecnico"
    Expression ="csAcoPorTecnicoUnion.NomeTec"
    Expression ="csAcoPorTecnicoUnion.[Carga Horária]"
    Expression ="csAcoPorTecnicoUnion.Nome"
    Expression ="csAcoPorTecnicoUnion.[PAF inicio]"
    Expression ="csAcoPorTecnicoUnion.DataDesl"
    Expression ="csAcoPorTecnicoUnion.LOGO"
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
        dbText "Name" ="csAcoPorTecnicoUnion.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.CodTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.NomeTec"
        dbInteger "ColumnWidth" ="3045"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.LOGO"
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
    Bottom =186
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =454
        Top =11
        Right =598
        Bottom =206
        Top =0
        Name ="csAcoPorTecnicoUnion"
        Name =""
    End
End
