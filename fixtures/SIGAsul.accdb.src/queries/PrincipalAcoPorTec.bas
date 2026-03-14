Operation =1
Option =0
Having ="(((csAcompPorTecnico.CodTecnico)<>False And (csAcompPorTecnico.CodTecnico)<>Fals"
    "e))"
Begin InputTables
    Name ="csAcompPorTecnico"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="csAcompPorTecnico.CodTecnico"
    Expression ="csAcompPorTecnico.NomeTec"
    Expression ="csAcompPorTecnico.[Carga Horária]"
    Alias ="ContarDeNome"
    Expression ="Count(csAcompPorTecnico.Nome)"
    Alias ="ContarDePAF inicio"
    Expression ="Count(csAcompPorTecnico.[PAF inicio])"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
End
Begin Groups
    Expression ="csAcompPorTecnico.CodTecnico"
    GroupLevel =0
    Expression ="csAcompPorTecnico.NomeTec"
    GroupLevel =0
    Expression ="csAcompPorTecnico.[Carga Horária]"
    GroupLevel =0
    Expression ="TbUnidade.NOME"
    GroupLevel =0
    Expression ="TbUnidade.[DIRETOR(A)]"
    GroupLevel =0
    Expression ="TbUnidade.FUNÇÃO"
    GroupLevel =0
    Expression ="TbUnidade.MATRICULA"
    GroupLevel =0
    Expression ="csAcompPorTecnico.CodTecnico"
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
        dbText "Name" ="ContarDeNome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1695"
        dbBoolean "ColumnHidden" ="0"
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
        dbText "Name" ="TbUnidade.CRAS"
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
        dbText "Name" ="CodTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NomeTec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Carga Horária"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DIRETOR(A)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ContarDePAF inicio"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1980"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[DataDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[TbCadFuncionario].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.TbCadFuncionario.Nome"
        dbInteger "ColumnWidth" ="3045"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[TbPessoa].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcompPorTecnico].[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcoPorTecnicoUnion].[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcoPorTecnicoUnion].[CodTecnico]"
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
        dbText "Name" ="csAcoPorTecnicoUnion.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcoPorTecnicoUnion.CodTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcoPorTecnicoUnion].[NomeTec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcoPorTecnicoUnion].[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csAcoPorTecnicoUnion].[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ContarDeNomeTec"
        dbInteger "ColumnWidth" ="3045"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csAcompPorTecnico.Carga Horária"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeNome"
        dbInteger "ColumnWidth" ="1695"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePAF inicio"
        dbInteger "ColumnWidth" ="1980"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ContarDeDataDesl"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1335"
        dbBoolean "ColumnHidden" ="0"
    End
End
Begin
    State =0
    Left =5
    Top =71
    Right =1136
    Bottom =638
    Left =-1
    Top =-1
    Right =1107
    Bottom =167
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="csAcompPorTecnico"
        Name =""
    End
    Begin
        Left =332
        Top =6
        Right =476
        Bottom =250
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
