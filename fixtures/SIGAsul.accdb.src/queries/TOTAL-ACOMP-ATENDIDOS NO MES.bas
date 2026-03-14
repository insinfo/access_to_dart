dbMemo "SQL" ="SELECT DISTINCT [TOTAL-FAM-ACOMPANHAMENTO].Nome\015\012FROM [TOTAL-FAM-ACOMPANHA"
    "MENTO] INNER JOIN [TOTAL-ATENDIDOS NO MES] ON [TOTAL-FAM-ACOMPANHAMENTO].CodPess"
    "oa = [TOTAL-ATENDIDOS NO MES].Nome;\015\012"
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
        dbText "Name" ="[TOTAL-FAM-ACOMPANHAMENTO].Nome"
        dbLong "AggregateType" ="-1"
    End
End
