dbMemo "SQL" ="SELECT TbViolacoes.CodViol, TbPessoa.Nome, TbViolacoes.TecnicoResp, TbViolacoes."
    "CodFam, TbViolacoesSubF.CodVSF, TbViolacoesSubF.CodViol, TbViolacoesSubF.DataRet"
    "orno, TbViolacoesSubF.TrabInf, TbViolacoesSubF.SupTrabInf, TbViolacoesSubF.ExplS"
    "ex, TbViolacoesSubF.SupExplSex, TbViolacoesSubF.AbuViolSex, TbViolacoesSubF.SupA"
    "buViolSex, TbViolacoesSubF.ViolFis, TbViolacoesSubF.SupViolFis, TbViolacoesSubF."
    "VioPsic, TbViolacoesSubF.SupVioPsic, TbViolacoesSubF.NeglIdoso, TbViolacoesSubF."
    "SupNeglIdoso, TbViolacoesSubF.NegliCri, TbViolacoesSubF.SupNegliCri, TbViolacoes"
    "SubF.NegliPCD, TbViolacoesSubF.SupNegliPCD, TbViolacoesSubF.TrajRua, TbViolacoes"
    "SubF.SupTrajRua, TbViolacoesSubF.TrafPess, TbViolacoesSubF.SupTrafPess, TbViolac"
    "oesSubF.ViolPatrIdoso, TbViolacoesSubF.SupViolPatrIdoso, TbViolacoesSubF.ViolPat"
    "riPCD, TbViolacoesSubF.SupViolPatriPCD, TbViolacoesSubF.Outra, TbViolacoesSubF.S"
    "upOutra\015\012FROM TbPessoa INNER JOIN (TbViolacoes INNER JOIN TbViolacoesSubF "
    "ON TbViolacoes.CodViol = TbViolacoesSubF.CodViol) ON TbPessoa.CodPessoa = TbViol"
    "acoes.NomePessoa\015\012WHERE (((TbViolacoesSubF.DataRetorno) Between [DATA INIC"
    "IAL] And [DATA FINAL]));\015\012"
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
        dbText "Name" ="TbViolacoesSubF.SupOutra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoes.CodViol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.TrajRua"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoes.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoes.TecnicoResp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.TrafPess"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoes.NomePessoa"
        dbInteger "ColumnWidth" ="2880"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.DataRetorno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.CodViol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.CodVSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.TrabInf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.SupTrabInf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.ExplSex"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.SupExplSex"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.AbuViolSex"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.SupAbuViolSex"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.ViolFis"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.SupViolFis"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.VioPsic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.SupVioPsic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.NeglIdoso"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.SupNeglIdoso"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.SupViolPatrIdoso"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.NegliCri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.SupNegliCri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.NegliPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.SupNegliPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.SupTrafPess"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.SupTrajRua"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.ViolPatrIdoso"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.ViolPatriPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.SupViolPatriPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoesSubF.Outra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NomePessoa"
        dbInteger "ColumnWidth" ="2880"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbInteger "ColumnWidth" ="2880"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
