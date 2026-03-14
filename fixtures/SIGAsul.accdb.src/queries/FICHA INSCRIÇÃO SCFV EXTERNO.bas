Operation =1
Option =0
Begin InputTables
    Name ="DADOS PESSOAIS PARA FICHA SCFV"
    Name ="DADOS FICHA INSCR SCFV EXTERNO"
End
Begin OutputColumns
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].UnidadeNome"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Nº UNIDADE]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].LOGO"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].TbSCFVExtDetalhe.CodSCFVEDet"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].CodSCFVExtAtual"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].DATAINSCR"
    Alias ="MáxDeDataAtual"
    Expression ="Max([DADOS FICHA INSCR SCFV EXTERNO].DataAtual)"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].NomeGrupo"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].FXETARIA"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].TURNO"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].UNIDADE"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].SituaçãoUsuario"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].DataDesl"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].MotivoDesl"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Encaminhado"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Onde"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Obs"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].BeneficioMunic"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].BPC"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].PBF"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].CADUNICO"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Nome Respons Criança]"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[CPF Resp]"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Cel Resp]"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Parentesco Resp]"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Aco"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].PAF"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Motivo busca serviço]"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Qual politica encaminhou]"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Cuidador exclusivo]"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Cuidador exclusivo trabalha]"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].VacinaEmDia"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Medicamentos"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].QuaisMedicamentos"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].TratamentoSaude"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].QualTratamento"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Alergia"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].QualAlergia"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Pediatra"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Autorizado a sair sozinho]"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].QuemBusca"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].PessoaEmergencia"
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].TelEmergencia"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].NomePessoa"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].DNasc"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].IdadePessoa"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Parentesco"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Celular"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].CodFam"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].DataCad"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Nº Cras]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Endereço"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Bairro"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].UF"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].CEP"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Municipio"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Complemento"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Referencia"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Tel fixo]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].NomeMae"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].NomePai"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Tel recado detalhes]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].NIS"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].CPF"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].RG"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].OrgaoRG"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].DEmisRG"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[CERT LIVRO/FOLHA/TERMO]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Sexo"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Raça/Cor]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Escolaridade"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[NOME ESCOLA]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].FreqEscola"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Turno"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].BPCD"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].BPCI"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Estado Civil]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].MunicNasc"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].UFNasc"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Autismo"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Cegueira"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Baixa visão]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Surdez severa profunda]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Surdez leve moderada]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Deficiencia fisica]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Defic mental intelec]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Sindrome down]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Transt doença mental]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].DoencaCronica"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Qual DCronica]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Renda sem programas sociais]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Renda per capita]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Aposentado/pensionista]"
End
Begin Joins
    LeftTable ="DADOS PESSOAIS PARA FICHA SCFV"
    RightTable ="DADOS FICHA INSCR SCFV EXTERNO"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].CodPessoa = [DADOS FICHA INSCR SCFV EXTERNO].No"
        "me"
    Flag =1
End
Begin OrderBy
    Expression ="Max([DADOS FICHA INSCR SCFV EXTERNO].DataAtual)"
    Flag =1
End
Begin Groups
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].UnidadeNome"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Nº UNIDADE]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].TbSCFVExtDetalhe.CodSCFVEDet"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].CodSCFVExtAtual"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].DATAINSCR"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].NomeGrupo"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].FXETARIA"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].TURNO"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].UNIDADE"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].SituaçãoUsuario"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].DataDesl"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].MotivoDesl"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Encaminhado"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Onde"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Obs"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].BeneficioMunic"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].BPC"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].PBF"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].CADUNICO"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Nome Respons Criança]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[CPF Resp]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Cel Resp]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Parentesco Resp]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Aco"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].PAF"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Motivo busca serviço]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Qual politica encaminhou]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Cuidador exclusivo]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Cuidador exclusivo trabalha]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].VacinaEmDia"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Medicamentos"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].QuaisMedicamentos"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].TratamentoSaude"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].QualTratamento"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Alergia"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].QualAlergia"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].Pediatra"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].[Autorizado a sair sozinho]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].QuemBusca"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].PessoaEmergencia"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV EXTERNO].TelEmergencia"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].NomePessoa"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].DNasc"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].IdadePessoa"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Parentesco"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Celular"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].CodFam"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].DataCad"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Nº Cras]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Endereço"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Bairro"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].UF"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].CEP"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Municipio"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Complemento"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Referencia"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Tel fixo]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].NomeMae"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].NomePai"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Tel recado detalhes]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].NIS"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].CPF"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].RG"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].OrgaoRG"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].DEmisRG"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[CERT LIVRO/FOLHA/TERMO]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Sexo"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Raça/Cor]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Escolaridade"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[NOME ESCOLA]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].FreqEscola"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Turno"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].BPCD"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].BPCI"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Estado Civil]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].MunicNasc"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].UFNasc"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Autismo"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Cegueira"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Baixa visão]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Surdez severa profunda]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Surdez leve moderada]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Deficiencia fisica]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Defic mental intelec]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Sindrome down]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Transt doença mental]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].DoencaCronica"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Qual DCronica]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Renda sem programas sociais]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Renda per capita]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Aposentado/pensionista]"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].IdadePessoa"
    GroupLevel =0
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
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Tel fixo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Renda sem programas sociais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Sindrome down]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Nº Cras]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].CodCREAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[NOME ESCOLA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[CERT LIVRO/FOLHA/TERMO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].BPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Tel recado detalhes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Qual DCronica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Escolaridade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].FreqEscola"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].BPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Estado Civil]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Baixa visão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Surdez severa profunda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Surdez leve moderada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Deficiencia fisica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Defic mental intelec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Transt doença mental]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].NOMECRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Turno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].NomePai"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].NomePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].PAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].Medicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].VacinaEmDia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].PBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Cuidador exclusivo trabalha]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].Pediatra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].TelEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].TbSCFVExtDetalhe.CodSCFVEDet"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1545"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].CodSCFVExtAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].CADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].FXETARIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].TURNO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].Nome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3540"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].Idade"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1605"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Autorizado a sair sozinho]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].Encaminhado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].Onde"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].BeneficioMunic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].BPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[CPF Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].Aco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Motivo busca serviço]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Qual politica encaminhou]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Cuidador exclusivo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].QuaisMedicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].TratamentoSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].QualTratamento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].Alergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].QualAlergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].QuemBusca"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].PessoaEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DADOS FICHA INSCR SCFV EXTERNO.Turno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DADOS FICHA INSCR SCFV EXTERNO.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DADOS FICHA INSCR SCFV EXTERNO.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].NomeGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].IdadePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1010"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NomePessoa"
        dbInteger "ColumnWidth" ="3540"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[RG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[OrgaoRG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[PessoaEmergencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Celular]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[CodFam]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[QuemBusca]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[CADUNICO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[NomeMae]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Aco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].NomePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[UnidadeNome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Nº UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[LOGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[TbSCFVExtDetalhe].[CodSCFVEDet]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[CodSCFVExtAtual]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[DATAINSCR]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[NomeGrupo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[FXETARIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[TURNO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[DNasPessoa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[SituaçãoUsuario]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[DataDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[UFNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[MotivoDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Encaminhado]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Onde]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Obs]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[BeneficioMunic]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[BPC]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Pediatra]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[PBF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[PAF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[VacinaEmDia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Medicamentos]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[QuaisMedicamentos]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[TratamentoSaude]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[QualTratamento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[Alergia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[QualAlergia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[TelEmergencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[NomePessoa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[DNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[IdadePessoa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Escolaridade]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Parentesco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[DataCad]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Endereço]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Bairro]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[UF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[CEP]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Municipio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Complemento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Referencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[NomePai]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[NIS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[CPF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[DEmisRG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Sexo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[FreqEscola]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Turno]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[BPCD]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[BPCI]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[MunicNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Autismo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Cegueira]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[DoencaCronica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnidadeNome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nº UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodSCFVEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodSCFVExtAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NomeGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FXETARIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nome"
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
        dbText "Name" ="DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MotivoDesl"
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
        dbText "Name" ="Obs"
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
        dbText "Name" ="DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="IdadePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Parentesco"
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
        dbText "Name" ="NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DEmisRG"
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
        dbText "Name" ="DADOS PESSOAIS PARA FICHA SCFV.Turno"
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
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].UnidadeNome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[NomePessoa]"
        dbInteger "ColumnWidth" ="1605"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="nomeusuario"
        dbInteger "ColumnWidth" ="3540"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].DNascPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV EXTERNO].[DNascPessoa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DNascPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1011"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1094
    Bottom =660
    Left =-1
    Top =-1
    Right =1070
    Bottom =270
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =95
        Top =1
        Right =363
        Bottom =272
        Top =0
        Name ="DADOS PESSOAIS PARA FICHA SCFV"
        Name =""
    End
    Begin
        Left =445
        Top =16
        Right =680
        Bottom =270
        Top =0
        Name ="DADOS FICHA INSCR SCFV EXTERNO"
        Name =""
    End
End
