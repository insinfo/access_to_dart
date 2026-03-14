dbMemo "SQL" ="SELECT DISTINCT PrincipalAtendDemEsp.CodFam, PrincipalAtendDemEsp.[Demanda espon"
    "tanea]\015\012FROM PrincipalAtendDemEsp\015\012WHERE (((PrincipalAtendDemEsp.[De"
    "manda espontanea])=Yes));\015\012"
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
        dbText "Name" ="PrincipalAtendDemEsp.[Demanda espontanea]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalAtendDemEsp.CodFam"
        dbLong "AggregateType" ="-1"
    End
End
