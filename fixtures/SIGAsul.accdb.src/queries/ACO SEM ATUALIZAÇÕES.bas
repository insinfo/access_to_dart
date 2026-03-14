Operation =1
Option =0
Where ="((([Encontrar duplicatas para acoAtualizadoAtendido].Nome) Is Null))"
Begin InputTables
    Name ="csACOatualizado"
    Name ="Encontrar duplicatas para acoAtualizadoAtendido"
End
Begin OutputColumns
    Alias ="em aco"
    Expression ="csACOatualizado.Nome"
    Expression ="[Encontrar duplicatas para acoAtualizadoAtendido].Nome"
    Expression ="csACOatualizado.NomeTec"
End
Begin Joins
    LeftTable ="Encontrar duplicatas para acoAtualizadoAtendido"
    RightTable ="csACOatualizado"
    Expression ="[Encontrar duplicatas para acoAtualizadoAtendido].Nome = csACOatualizado.Nome"
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
dbBoolean "TotalsRow" ="-1"
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="em aco"
        dbInteger "ColumnWidth" ="3315"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="[Encontrar duplicatas para acoAtualizadoAtendido].Nome"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="csACOatualizado.NomeTec"
        dbInteger "ColumnWidth" ="2610"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csACOatualizado.Nome"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =34
    Top =29
    Right =1007
    Bottom =622
    Left =-1
    Top =-1
    Right =949
    Bottom =258
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =229
        Top =25
        Right =442
        Bottom =320
        Top =0
        Name ="csACOatualizado"
        Name =""
    End
    Begin
        Left =481
        Top =28
        Right =892
        Bottom =292
        Top =0
        Name ="Encontrar duplicatas para acoAtualizadoAtendido"
        Name =""
    End
End
