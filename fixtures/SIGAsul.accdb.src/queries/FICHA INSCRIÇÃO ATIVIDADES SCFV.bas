Operation =1
Option =0
Begin InputTables
    Name ="DADOS SCFV GRUPOS E FX ETARIA"
    Name ="FICHA INSCRIÇÃO SCFV"
End
Begin OutputColumns
    Alias ="Expr1"
    Expression ="[FICHA INSCRIÇÃO SCFV].DataAtual"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].Grupo"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].Tipo"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].FxEtaria"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].Horario"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].DiaSemana"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].NomeOficineiro"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].CodDiario"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].Nome"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].DNasc"
    Expression ="[FICHA INSCRIÇÃO SCFV].Parentesco"
    Expression ="[FICHA INSCRIÇÃO SCFV].Celular"
    Expression ="[FICHA INSCRIÇÃO SCFV].CodFam"
    Expression ="[FICHA INSCRIÇÃO SCFV].DataCad"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Nº Cras]"
    Alias ="Expr2"
    Expression ="[FICHA INSCRIÇÃO SCFV].CodCREAS"
    Expression ="[FICHA INSCRIÇÃO SCFV].Endereço"
    Expression ="[FICHA INSCRIÇÃO SCFV].Bairro"
    Expression ="[FICHA INSCRIÇÃO SCFV].UF"
    Expression ="[FICHA INSCRIÇÃO SCFV].CEP"
    Expression ="[FICHA INSCRIÇÃO SCFV].Municipio"
    Expression ="[FICHA INSCRIÇÃO SCFV].Complemento"
    Expression ="[FICHA INSCRIÇÃO SCFV].Referencia"
    Expression ="[FICHA INSCRIÇÃO SCFV].[Tel fixo]"
    Expression ="[FICHA INSCRIÇÃO SCFV].NomeMae"
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
    Expression ="[FICHA INSCRIÇÃO SCFV].CodOfSEDet"
    Alias ="Expr3"
    Expression ="[FICHA INSCRIÇÃO SCFV].[DADOS FICHA INSCR SCFV].Nome"
    Expression ="[FICHA INSCRIÇÃO SCFV].NomePessoa"
    Alias ="Expr4"
    Expression ="[FICHA INSCRIÇÃO SCFV].DNasPessoa"
    Alias ="Expr5"
    Expression ="[FICHA INSCRIÇÃO SCFV].Idade"
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
    LeftTable ="FICHA INSCRIÇÃO SCFV"
    RightTable ="DADOS SCFV GRUPOS E FX ETARIA"
    Expression ="[FICHA INSCRIÇÃO SCFV].CodPessoa = [DADOS SCFV GRUPOS E FX ETARIA].Nome"
    Flag =2
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
Begin
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].TelEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].BPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].QuaisMedicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Estado Civil]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].NomeOficineiro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].CodDiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].CodFam"
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
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].CodCREAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Transt doença mental]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Sindrome down]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Qual politica encaminhou]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Tel fixo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Deficiencia fisica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Tel recado detalhes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].BeneficioMunic"
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
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].NomePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Qual DCronica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[CERT LIVRO/FOLHA/TERMO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Escolaridade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[DADOS FICHA INSCR SCFV].Nome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2925"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Renda sem programas sociais]"
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
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].CodOfSEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].BPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Baixa visão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Surdez severa profunda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Surdez leve moderada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Defic mental intelec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].SituaçãoUsuario"
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
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].QualTratamento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Cuidador exclusivo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].[Cuidador exclusivo trabalha]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].VacinaEmDia"
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
        dbText "Name" ="[FICHA INSCRIÇÃO SCFV].DataAtual"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1050
    Bottom =524
    Left =-1
    Top =-1
    Right =1026
    Bottom =223
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =301
        Top =12
        Right =501
        Bottom =287
        Top =0
        Name ="DADOS SCFV GRUPOS E FX ETARIA"
        Name =""
    End
    Begin
        Left =581
        Top =5
        Right =974
        Bottom =315
        Top =0
        Name ="FICHA INSCRIÇÃO SCFV"
        Name =""
    End
End
