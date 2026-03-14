dbMemo "SQL" ="SELECT DISTINCT CadResidencia.CodFam\015\012FROM (TbPessoa INNER JOIN TbOfSocioE"
    "duDetalhe ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome) INNER JOIN CadReside"
    "ncia ON TbPessoa.CodFam = CadResidencia.CodFam\015\012WHERE (((TbOfSocioEduDetal"
    "he.DataDesl) Is Null))\015\012ORDER BY CadResidencia.CodFam;\015\012"
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
End
