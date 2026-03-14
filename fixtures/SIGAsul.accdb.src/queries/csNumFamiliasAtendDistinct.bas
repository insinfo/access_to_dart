dbMemo "SQL" ="SELECT DISTINCT CadResidencia.CodFam\015\012FROM (CadResidencia INNER JOIN TbPes"
    "soa ON CadResidencia.CodFam = TbPessoa.CodFam) INNER JOIN TbAtend ON TbPessoa.Co"
    "dPessoa = TbAtend.Nome\015\012WHERE (((TbAtend.Data) Between [DATA INICIAL] And "
    "[DATA FINAL]));\015\012"
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
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="-1"
    End
End
