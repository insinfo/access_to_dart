dbMemo "SQL" ="SELECT DISTINCT TbPBF08.TITULAR, TbPessoa.CodPessoa, TbPessoa.Nome, CadResidenci"
    "a.CodFam, CadResidencia.[PBF FAMILIA], TbPessoa.Parentesco\015\012FROM CadReside"
    "ncia INNER JOIN (TbPBF08 INNER JOIN TbPessoa ON TbPBF08.TITULAR = TbPessoa.Nome)"
    " ON CadResidencia.CodFam = TbPessoa.CodFam\015\012WHERE (((TbPessoa.Parentesco)="
    "\"pessoa de referencia\"))\015\012ORDER BY CadResidencia.[PBF FAMILIA];\015\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbMemo "OrderBy" ="[PBFFAMILIA-SIM].[CodFam]"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="CadResidencia.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPBF08.TITULAR"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1845"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
End
