Operation =1
Option =0
Begin InputTables
    Name ="DADOS FICHA INSCR SCFV"
    Name ="DADOS PESSOAIS PARA FICHA SCFV"
End
Begin OutputColumns
    Expression ="[DADOS FICHA INSCR SCFV].CodOfSEDet"
    Expression ="[DADOS FICHA INSCR SCFV].DataInsc"
    Alias ="MáxDeDataAtual"
    Expression ="Max([DADOS FICHA INSCR SCFV].DataAtual)"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].CodPessoa"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].NomePessoa"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].DNasc"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Parentesco"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].Celular"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].CodFam"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].DataCad"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Nº Cras]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].UnidadeNome"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Nº UNIDADE]"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].LOGO"
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
    Expression ="[DADOS FICHA INSCR SCFV].DataDesl"
    Expression ="[DADOS FICHA INSCR SCFV].MotivoDesl"
    Expression ="[DADOS FICHA INSCR SCFV].SituaçãoUsuario"
    Expression ="[DADOS FICHA INSCR SCFV].BeneficioMunic"
    Expression ="[DADOS FICHA INSCR SCFV].BPC"
    Expression ="[DADOS FICHA INSCR SCFV].PBF"
    Expression ="[DADOS FICHA INSCR SCFV].CADUNICO"
    Expression ="[DADOS FICHA INSCR SCFV].[Nome Respons Criança]"
    Expression ="[DADOS FICHA INSCR SCFV].[CPF Resp]"
    Expression ="[DADOS FICHA INSCR SCFV].[Cel Resp]"
    Expression ="[DADOS FICHA INSCR SCFV].[Parentesco Resp]"
    Expression ="[DADOS FICHA INSCR SCFV].Aco"
    Expression ="[DADOS FICHA INSCR SCFV].PAF"
    Expression ="[DADOS FICHA INSCR SCFV].Obs"
    Expression ="[DADOS FICHA INSCR SCFV].Encaminhado"
    Expression ="[DADOS FICHA INSCR SCFV].Onde"
    Expression ="[DADOS FICHA INSCR SCFV].[Motivo busca serviço]"
    Expression ="[DADOS FICHA INSCR SCFV].[Qual politica encaminhou]"
    Expression ="[DADOS FICHA INSCR SCFV].[Cuidador exclusivo]"
    Expression ="[DADOS FICHA INSCR SCFV].[Cuidador exclusivo trabalha]"
    Expression ="[DADOS FICHA INSCR SCFV].VacinaEmDia"
    Expression ="[DADOS FICHA INSCR SCFV].Medicamentos"
    Expression ="[DADOS FICHA INSCR SCFV].QuaisMedicamentos"
    Expression ="[DADOS FICHA INSCR SCFV].TratamentoSaude"
    Expression ="[DADOS FICHA INSCR SCFV].QualTratamento"
    Expression ="[DADOS FICHA INSCR SCFV].Alergia"
    Expression ="[DADOS FICHA INSCR SCFV].QualAlergia"
    Expression ="[DADOS FICHA INSCR SCFV].Pediatra"
    Expression ="[DADOS FICHA INSCR SCFV].[Autorizado a sair sozinho]"
    Expression ="[DADOS FICHA INSCR SCFV].QuemBusca"
    Expression ="[DADOS FICHA INSCR SCFV].PessoaEmergencia"
    Expression ="[DADOS FICHA INSCR SCFV].TelEmergencia"
End
Begin Joins
    LeftTable ="DADOS PESSOAIS PARA FICHA SCFV"
    RightTable ="DADOS FICHA INSCR SCFV"
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].CodPessoa = [DADOS FICHA INSCR SCFV].Nome"
    Flag =1
End
Begin Groups
    Expression ="[DADOS FICHA INSCR SCFV].CodOfSEDet"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].DataInsc"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].CodPessoa"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].NomePessoa"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].DNasc"
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
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].UnidadeNome"
    GroupLevel =0
    Expression ="[DADOS PESSOAIS PARA FICHA SCFV].[Nº UNIDADE]"
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
    Expression ="[DADOS FICHA INSCR SCFV].DataDesl"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].MotivoDesl"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].SituaçãoUsuario"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].BeneficioMunic"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].BPC"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].PBF"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].CADUNICO"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].[Nome Respons Criança]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].[CPF Resp]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].[Cel Resp]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].[Parentesco Resp]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].Aco"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].PAF"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].Obs"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].Encaminhado"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].Onde"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].[Motivo busca serviço]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].[Qual politica encaminhou]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].[Cuidador exclusivo]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].[Cuidador exclusivo trabalha]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].VacinaEmDia"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].Medicamentos"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].QuaisMedicamentos"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].TratamentoSaude"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].QualTratamento"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].Alergia"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].QualAlergia"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].Pediatra"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].[Autorizado a sair sozinho]"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].QuemBusca"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].PessoaEmergencia"
    GroupLevel =0
    Expression ="[DADOS FICHA INSCR SCFV].TelEmergencia"
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
        dbText "Name" ="[DADOS FICHA INSCR SCFV].TelEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].DataDesl"
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
        dbText "Name" ="[DADOS FICHA INSCR SCFV].PAF"
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
        dbText "Name" ="[DADOS FICHA INSCR SCFV].MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].QualTratamento"
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
        dbText "Name" ="[DADOS FICHA INSCR SCFV].Nome"
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
        dbText "Name" ="[DADOS FICHA INSCR SCFV].CodOfSEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].Medicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].NomePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].BeneficioMunic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].BPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].PBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].CADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[CPF Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].Aco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].Encaminhado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].Onde"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Motivo busca serviço]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Qual politica encaminhou]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Cuidador exclusivo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Cuidador exclusivo trabalha]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].VacinaEmDia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].QuaisMedicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].TratamentoSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].Alergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].QualAlergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].Pediatra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Autorizado a sair sozinho]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].QuemBusca"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].PessoaEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].NOMECRAS"
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
        dbText "Name" ="[DADOS FICHA INSCR SCFV].DataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].TbPessoa.Nome"
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
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].TbUnidade.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Nº UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].NomePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].UnidadeNome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[DataCad]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[PBF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[DEmisRG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Pediatra]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[RG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[QualAlergia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[MotivoDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[UF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[DataDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[VacinaEmDia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].DataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[CodOfSEDet]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Obs]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[DataInsc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[CodPessoa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[NomePessoa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[QuaisMedicamentos]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[DNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Parentesco]"
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
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[UnidadeNome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[LOGO]"
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
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[CEP]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Municipio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[PessoaEmergencia]"
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
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[NomeMae]"
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
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[OrgaoRG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Sexo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[Escolaridade]"
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
        dbText "Name" ="[DADOS PESSOAIS PARA FICHA SCFV].[UFNasc]"
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
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[SituaçãoUsuario]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[BeneficioMunic]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[BPC]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[CADUNICO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Aco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[PAF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Encaminhado]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Onde]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Medicamentos]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[TratamentoSaude]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[QualTratamento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[Alergia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[QuemBusca]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS FICHA INSCR SCFV].[TelEmergencia]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1120
    Bottom =685
    Left =-1
    Top =-1
    Right =1096
    Bottom =343
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =492
        Top =21
        Right =712
        Bottom =295
        Top =0
        Name ="DADOS FICHA INSCR SCFV"
        Name =""
    End
    Begin
        Left =156
        Top =5
        Right =424
        Bottom =276
        Top =0
        Name ="DADOS PESSOAIS PARA FICHA SCFV"
        Name =""
    End
End
