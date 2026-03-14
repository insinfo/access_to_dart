dbMemo "SQL" ="SELECT DISTINCT acoAtualizadoAtendido.Nome\015\012FROM acoAtualizadoAtendido;\015"
    "\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
dbSingle "ECLScaleFactor" ="1"
dbMemo "OrderBy" ="[Lookup_Nome].[Nome]"
Begin
    Begin
        dbText "Name" ="acoAtualizadoAtendido.[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="acoAtualizadoAtendido.Nome"
        dbLong "AggregateType" ="-1"
    End
End
