dbMemo "SQL" ="SELECT DISTINCT csRMAD1a.Nome\015\012FROM csRMAD1a INNER JOIN TbAcomp ON csRMAD1"
    "a.Nome = TbAcomp.Nome;\015\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="csRMAD1a.Nome"
        dbLong "AggregateType" ="-1"
    End
End
