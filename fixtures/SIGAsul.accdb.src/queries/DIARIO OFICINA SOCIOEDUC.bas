dbMemo "SQL" ="SELECT [DIARIO CS OFICINA SOCIOEDUC].CodOfSEduc, [DIARIO CS OFICINA SOCIOEDUC].D"
    "ataDesl, TbUnidade.LOGO, TbPessoa.DataDesligPes, TbUnidade.NOME, [DIARIO CS OFIC"
    "INA SOCIOEDUC].DataInsc, [DIARIO CS OFICINA SOCIOEDUC].CodGrupo, [DIARIO CS OFIC"
    "INA SOCIOEDUC].FxEtaria, [DIARIO CS OFICINA SOCIOEDUC].Grupo, [DIARIO CS OFICINA"
    " SOCIOEDUC].Dia, [DIARIO CS OFICINA SOCIOEDUC].Horario, [DIARIO CS OFICINA SOCIO"
    "EDUC].CodOrientador, [DIARIO CS OFICINA SOCIOEDUC].NomeOrientador, [DIARIO CS OF"
    "ICINA SOCIOEDUC].Nome, [DIARIO CS OFICINA SOCIOEDUC].DNasPessoa, [DIARIO CS OFIC"
    "INA SOCIOEDUC].Idade, TbPessoa.Celular\015\012FROM TbUnidade, TbCadFuncionario I"
    "NNER JOIN (TbPessoa INNER JOIN [DIARIO CS OFICINA SOCIOEDUC] ON TbPessoa.CodPess"
    "oa = [DIARIO CS OFICINA SOCIOEDUC].Nome) ON TbCadFuncionario.CodFunc = [DIARIO C"
    "S OFICINA SOCIOEDUC].CodOrientador\015\012WHERE ((([DIARIO CS OFICINA SOCIOEDUC]"
    ".CodOfSEduc)=[Formulários]![FrmOficinaSocioeducativa]![CodOfSEduc]) AND (([DIARI"
    "O CS OFICINA SOCIOEDUC].DataDesl) Is Null) AND ((TbPessoa.DataDesligPes) Is Null"
    "));\015\012"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="[DIARIO CS OFICINA SOCIOEDUC].DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO CS OFICINA SOCIOEDUC].CodOfSEduc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO CS OFICINA SOCIOEDUC].Dia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO CS OFICINA SOCIOEDUC].DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO CS OFICINA SOCIOEDUC].Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO CS OFICINA SOCIOEDUC].DataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO CS OFICINA SOCIOEDUC].CodGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO CS OFICINA SOCIOEDUC].FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO CS OFICINA SOCIOEDUC].Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO CS OFICINA SOCIOEDUC].CodOrientador"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO CS OFICINA SOCIOEDUC].NomeOrientador"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO CS OFICINA SOCIOEDUC].Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO CS OFICINA SOCIOEDUC].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
End
