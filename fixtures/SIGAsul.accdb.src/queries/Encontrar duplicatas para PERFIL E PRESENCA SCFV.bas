Operation =1
Option =0
Where ="((([PERFIL E PRESENCA SCFV].Nome) In (SELECT [Nome] FROM [PERFIL E PRESENCA SCFV"
    "] As Tmp GROUP BY [Nome] HAVING Count(*)>1 )))"
Begin InputTables
    Name ="PERFIL E PRESENCA SCFV"
End
Begin OutputColumns
    Expression ="[PERFIL E PRESENCA SCFV].Nome"
    Expression ="[PERFIL E PRESENCA SCFV].DataInsc"
End
Begin OrderBy
    Expression ="[PERFIL E PRESENCA SCFV].Nome"
    Flag =0
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
        dbText "Name" ="[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DataInsc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PERFIL E PRESENCA SCFV].[DataInsc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PERFIL E PRESENCA SCFV].[Nome]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1168
    Bottom =660
    Left =-1
    Top =-1
    Right =1144
    Bottom =254
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="PERFIL E PRESENCA SCFV"
        Name =""
    End
End
