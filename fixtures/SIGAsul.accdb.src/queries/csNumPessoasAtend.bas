dbMemo "SQL" ="SELECT DISTINCT TbAtend.Nome\015\012FROM TbPessoa INNER JOIN TbAtend ON TbPessoa"
    ".CodPessoa = TbAtend.Nome\015\012WHERE (((TbAtend.Data) Between [DATA INICIAL] A"
    "nd [DATA FINAL]));\015\012"
dbMemo "Connect" =""
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
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="-1"
    End
End
