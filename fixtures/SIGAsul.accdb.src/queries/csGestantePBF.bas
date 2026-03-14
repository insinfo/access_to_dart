dbMemo "SQL" ="SELECT DISTINCT csGestantes.Nome\015\012FROM csGestantes INNER JOIN TbPBF08 ON c"
    "sGestantes.Nome = TbPBF08.TITULAR;\015\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
Begin
    Begin
        dbText "Name" ="csGestantes.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPBF08.TITULAR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csGestantes.TITULAR"
        dbLong "AggregateType" ="-1"
    End
End
