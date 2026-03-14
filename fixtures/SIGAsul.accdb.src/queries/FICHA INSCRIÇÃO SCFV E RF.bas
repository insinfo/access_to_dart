Operation =1
Option =0
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR"
    Name ="FICHA INSCRIÇÃO SCFV"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="[FICHA INSCRIÇÃO SCFV].CodOfSEDet"
    Expression ="TbUnidade.LOGO"
    Expression ="[FICHA INSCRIÇÃO SCFV].MáxDeDataAtual"
    Expression ="[FICHA INSCRIÇÃO SCFV].DNasc"
    Expression ="[FICHA INSCRIÇÃO SCFV].NomePessoa"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[FICHA INSCRIÇÃO SCFV].[dnasc],Date())/365.25)"
    Expression ="[FICHA INSCRIÇÃO SCFV].Parentesco"
    Expression ="[FICHA INSCRIÇÃO SCFV].Celular"
    Expression ="[FICHA INSCRIÇÃO SCFV].CodFam"
    Expression ="[FICHA INSCRIÇÃO SCFV].DataCad"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Nº Cras]"
    Alias ="nomeUnidade"
    Expression ="TbUnidade.NOME"
    Alias ="nomerespons"
    Expression ="[CS RESPONSAVEL FAMILIAR].Nome"
    Expression ="[CS RESPONSAVEL FAMILIAR].Parentesco"
    Expression ="[CS RESPONSAVEL FAMILIAR].RG"
    Expression ="[CS RESPONSAVEL FAMILIAR].OrgaoRG"
    Expression ="[CS RESPONSAVEL FAMILIAR].DEmisRG"
    Expression ="[CS RESPONSAVEL FAMILIAR].NIS"
    Expression ="[CS RESPONSAVEL FAMILIAR].CPF"
    Expression ="[FICHA INSCRIÇÃO SCFV].Endereço"
    Expression ="[FICHA INSCRIÇÃO SCFV].Bairro"
    Expression ="[FICHA INSCRIÇÃO SCFV].UF"
    Expression ="[FICHA INSCRIÇÃO SCFV].CEP"
    Expression ="[FICHA INSCRIÇÃO SCFV].Municipio"
    Expression ="[FICHA INSCRIÇÃO SCFV].Complemento"
    Expression ="[FICHA INSCRIÇÃO SCFV].Referencia"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Tel fixo]"
    Expression ="[FICHA INSCRIÇÃO SCFV].NomeMae"
    Expression ="[FICHA INSCRIÇÃO SCFV].NomePai"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Tel recado detalhes]"
    Expression ="[FICHA INSCRIÇÃO SCFV].NIS"
    Expression ="[FICHA INSCRIÇÃO SCFV].CPF"
    Expression ="[FICHA INSCRIÇÃO SCFV].RG"
    Expression ="[FICHA INSCRIÇÃO SCFV].OrgaoRG"
    Expression ="[FICHA INSCRIÇÃO SCFV].DEmisRG"
    Expression ="[FICHA INSCRIÇÃO SCFV].[CERT LIVRO/FOLHA/TERMO]"
    Expression ="[FICHA INSCRIÇÃO SCFV].Sexo"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Raça/Cor]"
    Expression ="[FICHA INSCRIÇÃO SCFV].Escolaridade"
    Expression ="[FICHA INSCRIÇÃO SCFV].[NOME ESCOLA]"
    Expression ="[FICHA INSCRIÇÃO SCFV].FreqEscola"
    Expression ="[FICHA INSCRIÇÃO SCFV].Turno"
    Expression ="[FICHA INSCRIÇÃO SCFV].BPCD"
    Expression ="[FICHA INSCRIÇÃO SCFV].BPCI"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Estado Civil]"
    Expression ="[FICHA INSCRIÇÃO SCFV].MunicNasc"
    Expression ="[FICHA INSCRIÇÃO SCFV].UFNasc"
    Expression ="[FICHA INSCRIÇÃO SCFV].Autismo"
    Expression ="[FICHA INSCRIÇÃO SCFV].Cegueira"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Baixa visão]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Surdez severa profunda]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Surdez leve moderada]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Deficiencia fisica]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Defic mental intelec]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Sindrome down]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Transt doença mental]"
    Expression ="[FICHA INSCRIÇÃO SCFV].DoencaCronica"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Qual DCronica]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Renda sem programas sociais]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Renda per capita]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Aposentado/pensionista]"
    Expression ="[FICHA INSCRIÇÃO SCFV].DataDesl"
    Expression ="[FICHA INSCRIÇÃO SCFV].MotivoDesl"
    Expression ="[FICHA INSCRIÇÃO SCFV].SituaçãoUsuario"
    Expression ="[FICHA INSCRIÇÃO SCFV].BeneficioMunic"
    Expression ="[FICHA INSCRIÇÃO SCFV].BPC"
    Expression ="[FICHA INSCRIÇÃO SCFV].PBF"
    Expression ="[FICHA INSCRIÇÃO SCFV].CADUNICO"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Nome Respons Criança]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[CPF Resp]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Cel Resp]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Parentesco Resp]"
    Expression ="[FICHA INSCRIÇÃO SCFV].Aco"
    Expression ="[FICHA INSCRIÇÃO SCFV].PAF"
    Expression ="[FICHA INSCRIÇÃO SCFV].Obs"
    Expression ="[FICHA INSCRIÇÃO SCFV].Encaminhado"
    Expression ="[FICHA INSCRIÇÃO SCFV].Onde"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Motivo busca serviço]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Qual politica encaminhou]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Cuidador exclusivo]"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Cuidador exclusivo trabalha]"
    Expression ="[FICHA INSCRIÇÃO SCFV].VacinaEmDia"
    Expression ="[FICHA INSCRIÇÃO SCFV].Medicamentos"
    Expression ="[FICHA INSCRIÇÃO SCFV].QuaisMedicamentos"
    Expression ="[FICHA INSCRIÇÃO SCFV].TratamentoSaude"
    Expression ="[FICHA INSCRIÇÃO SCFV].QualTratamento"
    Expression ="[FICHA INSCRIÇÃO SCFV].Alergia"
    Expression ="[FICHA INSCRIÇÃO SCFV].QualAlergia"
    Expression ="[FICHA INSCRIÇÃO SCFV].Pediatra"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Autorizado a sair sozinho]"
    Expression ="[FICHA INSCRIÇÃO SCFV].QuemBusca"
    Expression ="[FICHA INSCRIÇÃO SCFV].PessoaEmergencia"
    Expression ="[FICHA INSCRIÇÃO SCFV].TelEmergencia"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR"
    RightTable ="FICHA INSCRIÇÃO SCFV"
    Expression ="[CS RESPONSAVEL FAMILIAR].CodFam = [FICHA INSCRIÇÃO SCFV].CodFam"
    Flag =1
End
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
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Defic mental intelec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Tel fixo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Cuidador exclusivo trabalha]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[DADOS FICHA INSCR SCFV].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].NOMECRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[CERT LIVRO/FOLHA/TERMO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Sindrome down]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Turno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].TelEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Transt doença mental]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[DADOS PESSOAIS PARA FICHA SCFV].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Baixa visão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].QuaisMedicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Celular"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3600"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Nº Cras]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Surdez severa profunda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].NomePai"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Surdez leve moderada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Tel recado detalhes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Escolaridade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[NOME ESCOLA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].FreqEscola"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].BPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].BPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Estado Civil]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].VacinaEmDia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Deficiencia fisica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Qual DCronica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Renda sem programas sociais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].CodOfSEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].NomePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[DADOS FICHA INSCR SCFV].Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].BeneficioMunic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].BPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].PBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].CADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[CPF Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Aco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].PAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Encaminhado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Onde"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Motivo busca serviço]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Qual politica encaminhou]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Cuidador exclusivo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Medicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].TratamentoSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].QualTratamento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Alergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].QualAlergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Pediatra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Autorizado a sair sozinho]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].QuemBusca"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].PessoaEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodOfSEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DADOS PESSOAIS PARA FICHA SCFV.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nº Cras"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NOMECRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR.OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR.DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Tel fixo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NomePai"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Tel recado detalhes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CERT LIVRO/FOLHA/TERMO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Raça/Cor"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Escolaridade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NOME ESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FreqEscola"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Turno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Estado Civil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Baixa visão"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Surdez severa profunda"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Surdez leve moderada"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Deficiencia fisica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Defic mental intelec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Sindrome down"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Transt doença mental"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Qual DCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Renda sem programas sociais"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Renda per capita"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Aposentado/pensionista"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DADOS FICHA INSCR SCFV.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NomePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BeneficioMunic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nome Respons Criança"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CPF Resp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Cel Resp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Parentesco Resp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Aco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Encaminhado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Onde"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Motivo busca serviço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Qual politica encaminhou"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Cuidador exclusivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Cuidador exclusivo trabalha"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="VacinaEmDia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Medicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="QuaisMedicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TratamentoSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="QualTratamento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Alergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="QualAlergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Pediatra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Autorizado a sair sozinho"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="QuemBusca"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PessoaEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TelEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Medicamentos]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[OrgaoRG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Parentesco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[DNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[TratamentoSaude]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[QuaisMedicamentos]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[CEP]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Municipio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[NomePai]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].[DEmisRG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[NIS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Sexo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[BPCD]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[MotivoDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[UF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Referencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Autismo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[CADUNICO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[TelEmergencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[QuemBusca]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[CodOfSEDet]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[DataCad]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Cegueira]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[NomePessoa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[LOGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[DADOS PESSOAIS PARA FICHA SCFV].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Celular]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[CodFam]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[NOMECRAS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].[Parentesco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].[RG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].[OrgaoRG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].[NIS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].[CPF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Endereço]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Bairro]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Complemento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[NomeMae]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[CPF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[RG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[DEmisRG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Escolaridade]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[FreqEscola]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Turno]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[BPCI]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[MunicNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[UFNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[DoencaCronica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[DataDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[DADOS FICHA INSCR SCFV].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[DNasPessoa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[SituaçãoUsuario]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[BeneficioMunic]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[BPC]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[PBF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Aco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[PAF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Obs]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Encaminhado]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Onde]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[VacinaEmDia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[QualTratamento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Alergia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[QualAlergia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Pediatra]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[PessoaEmergencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[NOME]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="nomerespons"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="nomeUnida"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="nomeUnidade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.CodOfSEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.NomePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Nº Cras"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Tel fixo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.NomePai"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Tel recado detalhes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.CERT LIVRO/FOLHA/TERMO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Raça/Cor"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Escolaridade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.NOME ESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.FreqEscola"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Turno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.BPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.BPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Estado Civil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Baixa visão"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Surdez severa profunda"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Surdez leve moderada"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Deficiencia fisica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Defic mental intelec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Sindrome down"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Transt doença mental"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Qual DCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Renda sem programas sociais"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Renda per capita"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Aposentado/pensionista"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.BeneficioMunic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.BPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.PBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.CADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Nome Respons Criança"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.CPF Resp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Cel Resp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Parentesco Resp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Aco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.PAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Encaminhado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Onde"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Motivo busca serviço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Qual politica encaminhou"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Cuidador exclusivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Cuidador exclusivo trabalha"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.VacinaEmDia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Medicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.QuaisMedicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.TratamentoSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.QualTratamento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Alergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.QualAlergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Pediatra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.Autorizado a sair sozinho"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.QuemBusca"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.PessoaEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FICHA INSCRIÇÃO SCFV.TelEmergencia"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1075
    Bottom =660
    Left =-1
    Top =-1
    Right =1007
    Bottom =299
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =543
        Top =16
        Right =807
        Bottom =208
        Top =0
        Name ="CS RESPONSAVEL FAMILIAR"
        Name =""
    End
    Begin
        Left =139
        Top =5
        Right =443
        Bottom =282
        Top =0
        Name ="FICHA INSCRIÇÃO SCFV"
        Name =""
    End
    Begin
        Left =855
        Top =12
        Right =999
        Bottom =202
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
