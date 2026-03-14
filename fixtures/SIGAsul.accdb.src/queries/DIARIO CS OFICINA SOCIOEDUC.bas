dbMemo "SQL" ="SELECT TbOfSocioEduc.CodOfSEduc, TbOfSocioEduDetalhe.DataDesl, TbOfSocioEduc.Cod"
    "Grupo, TbOfSocioEduc.FxEtaria, TbOfSocioEduc.Grupo, TbOfSocioEduc.Dia, TbOfSocio"
    "Educ.Horario, TbOfSocioEduc.CodOrientador, TbOfSocioEduc.NomeOrientador, TbOfSoc"
    "ioEduDetalhe.DataInsc, TbOfSocioEduDetalhe.Nome, TbOfSocioEduDetalhe.DNasPessoa,"
    " TbOfSocioEduDetalhe.Idade, TbOfSocioEduDetalhe.SituaçãoUsuario\015\012FROM TbOf"
    "SocioEduc INNER JOIN TbOfSocioEduDetalhe ON TbOfSocioEduc.CodOfSEduc = TbOfSocio"
    "EduDetalhe.CodOfSEduc\015\012WHERE (((TbOfSocioEduDetalhe.DataDesl) Is Null));\015"
    "\012"
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
        dbText "Name" ="TbOfSocioEduc.Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduc.CodOfSEduc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduc.NomeOrientador"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduc.Dia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduc.CodGrupo"
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
        dbText "Name" ="TbOfSocioEduc.CodOrientador"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Nome"
        dbLong "AggregateType" ="-1"
    End
End
