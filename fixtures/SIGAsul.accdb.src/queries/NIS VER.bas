dbMemo "SQL" ="SELECT TbComposicao.NomePessoa, TbComposicao.DNasPessoa, TbComposicao.Escola, Tb"
    "Composicao.NIS, [BASE MUNICIPAL COMPLETA].[NOME-CAUNICO], [BASE MUNICIPAL COMPLE"
    "TA].DNASCIMENTO, [BASE MUNICIPAL COMPLETA].[NOME-ESCOLA], [BASE MUNICIPAL COMPLE"
    "TA].NISCADUNICO, [BASE MUNICIPAL COMPLETA].[NOME RUA], [BASE MUNICIPAL COMPLETA]"
    ".NUMEROCASA, [BASE MUNICIPAL COMPLETA].COMPLEMEND\015\012FROM TbComposicao LEFT "
    "JOIN [BASE MUNICIPAL COMPLETA] ON TbComposicao.NomePessoa = [BASE MUNICIPAL COMP"
    "LETA].[NOME-CAUNICO];\015\012"
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
        dbText "Name" ="[BASE MUNICIPAL COMPLETA].[NOME-ESCOLA]"
        dbInteger "ColumnWidth" ="3495"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[BASE MUNICIPAL COMPLETA].DNASCIMENTO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[BASE MUNICIPAL COMPLETA].[NOME-CAUNICO]"
        dbInteger "ColumnWidth" ="2595"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbComposicao.Escola"
        dbInteger "ColumnWidth" ="2940"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbComposicao.DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbComposicao.NomePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbComposicao.NIS"
        dbInteger "ColumnWidth" ="1170"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[BASE MUNICIPAL COMPLETA].NISCADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[BASE MUNICIPAL COMPLETA].[NOME RUA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[BASE MUNICIPAL COMPLETA].NUMEROCASA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[BASE MUNICIPAL COMPLETA].COMPLEMEND"
        dbLong "AggregateType" ="-1"
    End
End
