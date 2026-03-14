dbMemo "SQL" ="SELECT DISTINCT TbPessoa.Nome, TbPessoa.DNasc, Int(DateDiff(\"d\",[TbPessoa].[DN"
    "asc],Date())/365.25) AS Idade\015\012FROM TbPessoa INNER JOIN TbAtend ON TbPesso"
    "a.CodPessoa = TbAtend.Nome\015\012WHERE (((TbAtend.Data) Between [DATA INICIAL] "
    "And [DATA FINAL]));\015\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbByte "RecordsetType" ="0"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
End
