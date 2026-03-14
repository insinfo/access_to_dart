dbMemo "SQL" ="SELECT TbOfSocioEduc.CodOfSEduc, TbOfSocioEduc.CodGrupo, TbOfSocioEduc.FxEtaria,"
    " TbOfSocioEduc.Grupo, TbOfSocioEduc.Dia, TbOfSocioEduc.Horario, TbOfSocioEduc.Co"
    "dOrientador, TbOfSocioEduc.NomeOrientador, CadResidencia.CodFam, TbOfSocioEduDet"
    "alhe.DataInsc, TbOfSocioEduDetalhe.DataDesl, TbOfSocioEduDetalhe.MotivoDesl, TbP"
    "essoa.Nome, TbDadosPessoaisSCFV.NCalçado, TbAtualSCFV.CodAtual, TbAtualSCFV.CodD"
    "Pscfv, TbAtualSCFV.Data, TbAtualSCFV.Obs\015\012FROM ((CadResidencia INNER JOIN "
    "TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam) INNER JOIN (TbDadosPessoaisS"
    "CFV INNER JOIN TbAtualSCFV ON TbDadosPessoaisSCFV.CodDPscfv = TbAtualSCFV.CodDPs"
    "cfv) ON TbPessoa.CodPessoa = TbDadosPessoaisSCFV.NomePessoa) INNER JOIN (TbOfSoc"
    "ioEduc INNER JOIN TbOfSocioEduDetalhe ON TbOfSocioEduc.CodOfSEduc = TbOfSocioEdu"
    "Detalhe.CodOfSEduc) ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome;\015\012"
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
        dbText "Name" ="TbOfSocioEduc.CodGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduc.NomeOrientador"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduc.CodOfSEduc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtualSCFV.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDadosPessoaisSCFV.NCalçado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduc.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduc.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduc.Dia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduc.Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduc.CodOrientador"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtualSCFV.CodAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtualSCFV.CodDPscfv"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtualSCFV.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
End
