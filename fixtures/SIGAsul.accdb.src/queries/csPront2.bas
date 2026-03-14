Operation =1
Option =0
Having ="(((TbPessoa.CodFam)=[Formulários]![FormProntuario]![CodFamTxt]) AND ((CadResiden"
    "cia.DataDesligResid) Is Null) AND ((TbPessoa.Parentesco)=\"Pessoa de Referencia\""
    "))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
    Name ="CadResidAtualizacao"
End
Begin OutputColumns
    Expression ="TbPessoa.CodFam"
    Expression ="CadResidencia.DataDesligResid"
    Alias ="MáxDeDATA ATUALIZ"
    Expression ="Max(CadResidAtualizacao.[DATA ATUALIZ])"
    Expression ="TbPessoa.Parentesco"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.DataCadPes"
    Expression ="TbPessoa.Nome"
    Expression ="CadResidencia.MulherCF"
    Expression ="CadResidencia.RendaFamiliar"
    Expression ="TbPessoa.Apelido"
    Expression ="TbPessoa.NomeMae"
    Expression ="TbPessoa.Celular"
    Expression ="TbPessoa.NIS"
    Expression ="TbPessoa.CPF"
    Expression ="TbPessoa.RG"
    Expression ="TbPessoa.OrgaoRG"
    Expression ="TbPessoa.DEmisRG"
    Expression ="TbPessoa.Sexo"
    Expression ="TbPessoa.DNasc"
    Expression ="TbPessoa.Idade"
    Expression ="TbPessoa.Autismo"
    Expression ="TbPessoa.Cegueira"
    Expression ="TbPessoa.[Baixa visão]"
    Expression ="TbPessoa.[Surdez severa profunda]"
    Expression ="TbPessoa.[Surdez leve moderada]"
    Expression ="TbPessoa.[Deficiencia fisica]"
    Expression ="TbPessoa.[Defic mental intelec]"
    Expression ="TbPessoa.[Sindrome down]"
    Expression ="TbPessoa.[Transt doença mental]"
    Expression ="TbPessoa.DoencaCronica"
    Expression ="TbPessoa.[Qual DCronica]"
    Expression ="TbPessoa.SituaçãoRua"
    Expression ="CadResidencia.Quilombola"
    Expression ="CadResidencia.Ribeirinha"
    Expression ="CadResidencia.Cigana"
    Expression ="CadResidencia.IndigenaResAldeia"
    Expression ="CadResidencia.IndigenaNaoResidAldeia"
    Expression ="CadResidencia.IndigenaEtnia"
    Expression ="CadResidencia.OutraEtnia"
    Expression ="TbPessoa.LerEscrever"
    Expression ="TbPessoa.FreqEscola"
    Expression ="TbPessoa.Escolaridade"
    Expression ="TbPessoa.CTPS"
    Expression ="TbPessoa.[Condição Ocupação]"
    Expression ="TbPessoa.[Renda sem programas sociais]"
    Expression ="TbPessoa.[Renda per capita]"
    Expression ="TbPessoa.[Recebe programa social]"
    Expression ="TbPessoa.[Aposentado/pensionista]"
    Expression ="TbPessoa.DataDesligPes"
    Expression ="TbPessoa.MotivoDeslPes"
    Expression ="CadResidencia.DataCad"
    Expression ="CadResidencia.[CRAS Origem]"
    Expression ="CadResidencia.Endereço"
    Expression ="CadResidencia.Bairro"
    Expression ="CadResidencia.UF"
    Expression ="CadResidencia.CEP"
    Expression ="CadResidencia.Municipio"
    Expression ="CadResidencia.Complemento"
    Expression ="CadResidencia.Referencia"
    Expression ="CadResidencia.[Tel fixo]"
    Expression ="CadResidencia.[Domicilio Urbano]"
    Expression ="CadResidencia.[Domicilio Rural]"
    Expression ="CadResidencia.Abrigo"
    Expression ="CadResidencia.[Demanda espontanea]"
    Expression ="CadResidencia.[Busca ativa]"
    Expression ="CadResidencia.[Enc Unidades Proteção Basica]"
    Expression ="CadResidencia.[Enc Unidades Proteção Especial]"
    Expression ="CadResidencia.[Enc Saude]"
    Expression ="CadResidencia.[Enc Educação]"
    Expression ="CadResidencia.[Enc Politicas Setoriais]"
    Expression ="CadResidencia.[Enc Conselho Tutelar]"
    Expression ="CadResidencia.[Enc Poder Judiciario]"
    Expression ="CadResidencia.[Enc Defens Publica/MP/Delegacias]"
    Expression ="CadResidencia.[Enc outros]"
    Expression ="CadResidencia.[Nome Encaminhador]"
    Expression ="CadResidencia.TelEncaminhador"
    Expression ="CadResidencia.[PBF FAMILIA]"
    Expression ="CadResidencia.[Outros Programas Priori]"
    Expression ="CadResidencia.[Resid Propria]"
    Expression ="CadResidencia.[Resid Alugada]"
    Expression ="CadResidencia.[Resid Cedida]"
    Expression ="CadResidencia.[Resid Ocupada]"
    Expression ="CadResidencia.[Alvenaria/madeira aparelhada]"
    Expression ="CadResidencia.[Madeira aproveitada/taipa/outros]"
    Expression ="CadResidencia.[Medidor compart]"
    Expression ="CadResidencia.[Sem Medidor]"
    Expression ="CadResidencia.[Sem energia eletrica]"
    Expression ="CadResidencia.[Medidor proprio]"
    Expression ="CadResidencia.[Agua canalizada]"
    Expression ="CadResidencia.[Abast Rede geral]"
    Expression ="CadResidencia.[Poço/Nascente]"
    Expression ="CadResidencia.[Cisterna/Captação]"
    Expression ="CadResidencia.[Carro pipa]"
    Expression ="CadResidencia.[Outra forma abast]"
    Expression ="CadResidencia.[Rede Coletora esgoto]"
    Expression ="CadResidencia.[Fossa septica]"
    Expression ="CadResidencia.[Fossa rudimentar]"
    Expression ="CadResidencia.[Vala Rio Lago]"
    Expression ="CadResidencia.[Sem banheiro]"
    Expression ="CadResidencia.[Coleta lixo direta]"
    Expression ="CadResidencia.[Coleta lixo indireta]"
    Expression ="CadResidencia.[Sem Coleta lixo]"
    Expression ="CadResidencia.[Nº Comodos]"
    Expression ="CadResidencia.[Nº Dormitorios]"
    Expression ="CadResidencia.[Nº pessoas/Dormitorio]"
    Expression ="CadResidencia.[Domicilio tem acessib total]"
    Expression ="CadResidencia.[Domicilio tem acessib interno]"
    Expression ="CadResidencia.[Domicilio sem acessib]"
    Expression ="CadResidencia.[Area de risco]"
    Expression ="CadResidencia.[Area dif acesso geografico]"
    Expression ="CadResidencia.[Area violencia]"
    Expression ="CadResidencia.MotivoDeslResid"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.[CodFam] = TbPessoa.[CodFam]"
    Flag =1
    LeftTable ="CadResidencia"
    RightTable ="CadResidAtualizacao"
    Expression ="CadResidencia.CodFam = CadResidAtualizacao.CodCadResd"
    Flag =2
End
Begin OrderBy
    Expression ="Max(CadResidAtualizacao.[DATA ATUALIZ])"
    Flag =0
End
Begin Groups
    Expression ="TbPessoa.CodFam"
    GroupLevel =0
    Expression ="CadResidencia.DataDesligResid"
    GroupLevel =0
    Expression ="TbPessoa.Parentesco"
    GroupLevel =0
    Expression ="TbPessoa.CodPessoa"
    GroupLevel =0
    Expression ="TbPessoa.DataCadPes"
    GroupLevel =0
    Expression ="TbPessoa.Nome"
    GroupLevel =0
    Expression ="CadResidencia.MulherCF"
    GroupLevel =0
    Expression ="CadResidencia.RendaFamiliar"
    GroupLevel =0
    Expression ="TbPessoa.Apelido"
    GroupLevel =0
    Expression ="TbPessoa.NomeMae"
    GroupLevel =0
    Expression ="TbPessoa.Celular"
    GroupLevel =0
    Expression ="TbPessoa.NIS"
    GroupLevel =0
    Expression ="TbPessoa.CPF"
    GroupLevel =0
    Expression ="TbPessoa.RG"
    GroupLevel =0
    Expression ="TbPessoa.OrgaoRG"
    GroupLevel =0
    Expression ="TbPessoa.DEmisRG"
    GroupLevel =0
    Expression ="TbPessoa.Sexo"
    GroupLevel =0
    Expression ="TbPessoa.DNasc"
    GroupLevel =0
    Expression ="TbPessoa.Idade"
    GroupLevel =0
    Expression ="TbPessoa.Autismo"
    GroupLevel =0
    Expression ="TbPessoa.Cegueira"
    GroupLevel =0
    Expression ="TbPessoa.[Baixa visão]"
    GroupLevel =0
    Expression ="TbPessoa.[Surdez severa profunda]"
    GroupLevel =0
    Expression ="TbPessoa.[Surdez leve moderada]"
    GroupLevel =0
    Expression ="TbPessoa.[Deficiencia fisica]"
    GroupLevel =0
    Expression ="TbPessoa.[Defic mental intelec]"
    GroupLevel =0
    Expression ="TbPessoa.[Sindrome down]"
    GroupLevel =0
    Expression ="TbPessoa.[Transt doença mental]"
    GroupLevel =0
    Expression ="TbPessoa.DoencaCronica"
    GroupLevel =0
    Expression ="TbPessoa.[Qual DCronica]"
    GroupLevel =0
    Expression ="TbPessoa.SituaçãoRua"
    GroupLevel =0
    Expression ="CadResidencia.Quilombola"
    GroupLevel =0
    Expression ="CadResidencia.Ribeirinha"
    GroupLevel =0
    Expression ="CadResidencia.Cigana"
    GroupLevel =0
    Expression ="CadResidencia.IndigenaResAldeia"
    GroupLevel =0
    Expression ="CadResidencia.IndigenaNaoResidAldeia"
    GroupLevel =0
    Expression ="CadResidencia.IndigenaEtnia"
    GroupLevel =0
    Expression ="CadResidencia.OutraEtnia"
    GroupLevel =0
    Expression ="TbPessoa.LerEscrever"
    GroupLevel =0
    Expression ="TbPessoa.FreqEscola"
    GroupLevel =0
    Expression ="TbPessoa.Escolaridade"
    GroupLevel =0
    Expression ="TbPessoa.CTPS"
    GroupLevel =0
    Expression ="TbPessoa.[Condição Ocupação]"
    GroupLevel =0
    Expression ="TbPessoa.[Renda sem programas sociais]"
    GroupLevel =0
    Expression ="TbPessoa.[Renda per capita]"
    GroupLevel =0
    Expression ="TbPessoa.[Recebe programa social]"
    GroupLevel =0
    Expression ="TbPessoa.[Aposentado/pensionista]"
    GroupLevel =0
    Expression ="TbPessoa.DataDesligPes"
    GroupLevel =0
    Expression ="TbPessoa.MotivoDeslPes"
    GroupLevel =0
    Expression ="CadResidencia.DataCad"
    GroupLevel =0
    Expression ="CadResidencia.[CRAS Origem]"
    GroupLevel =0
    Expression ="CadResidencia.Endereço"
    GroupLevel =0
    Expression ="CadResidencia.Bairro"
    GroupLevel =0
    Expression ="CadResidencia.UF"
    GroupLevel =0
    Expression ="CadResidencia.CEP"
    GroupLevel =0
    Expression ="CadResidencia.Municipio"
    GroupLevel =0
    Expression ="CadResidencia.Complemento"
    GroupLevel =0
    Expression ="CadResidencia.Referencia"
    GroupLevel =0
    Expression ="CadResidencia.[Tel fixo]"
    GroupLevel =0
    Expression ="CadResidencia.[Domicilio Urbano]"
    GroupLevel =0
    Expression ="CadResidencia.[Domicilio Rural]"
    GroupLevel =0
    Expression ="CadResidencia.Abrigo"
    GroupLevel =0
    Expression ="CadResidencia.[Demanda espontanea]"
    GroupLevel =0
    Expression ="CadResidencia.[Busca ativa]"
    GroupLevel =0
    Expression ="CadResidencia.[Enc Unidades Proteção Basica]"
    GroupLevel =0
    Expression ="CadResidencia.[Enc Unidades Proteção Especial]"
    GroupLevel =0
    Expression ="CadResidencia.[Enc Saude]"
    GroupLevel =0
    Expression ="CadResidencia.[Enc Educação]"
    GroupLevel =0
    Expression ="CadResidencia.[Enc Politicas Setoriais]"
    GroupLevel =0
    Expression ="CadResidencia.[Enc Conselho Tutelar]"
    GroupLevel =0
    Expression ="CadResidencia.[Enc Poder Judiciario]"
    GroupLevel =0
    Expression ="CadResidencia.[Enc Defens Publica/MP/Delegacias]"
    GroupLevel =0
    Expression ="CadResidencia.[Enc outros]"
    GroupLevel =0
    Expression ="CadResidencia.[Nome Encaminhador]"
    GroupLevel =0
    Expression ="CadResidencia.TelEncaminhador"
    GroupLevel =0
    Expression ="CadResidencia.[PBF FAMILIA]"
    GroupLevel =0
    Expression ="CadResidencia.[Outros Programas Priori]"
    GroupLevel =0
    Expression ="CadResidencia.[Resid Propria]"
    GroupLevel =0
    Expression ="CadResidencia.[Resid Alugada]"
    GroupLevel =0
    Expression ="CadResidencia.[Resid Cedida]"
    GroupLevel =0
    Expression ="CadResidencia.[Resid Ocupada]"
    GroupLevel =0
    Expression ="CadResidencia.[Alvenaria/madeira aparelhada]"
    GroupLevel =0
    Expression ="CadResidencia.[Madeira aproveitada/taipa/outros]"
    GroupLevel =0
    Expression ="CadResidencia.[Medidor compart]"
    GroupLevel =0
    Expression ="CadResidencia.[Sem Medidor]"
    GroupLevel =0
    Expression ="CadResidencia.[Sem energia eletrica]"
    GroupLevel =0
    Expression ="CadResidencia.[Medidor proprio]"
    GroupLevel =0
    Expression ="CadResidencia.[Agua canalizada]"
    GroupLevel =0
    Expression ="CadResidencia.[Abast Rede geral]"
    GroupLevel =0
    Expression ="CadResidencia.[Poço/Nascente]"
    GroupLevel =0
    Expression ="CadResidencia.[Cisterna/Captação]"
    GroupLevel =0
    Expression ="CadResidencia.[Carro pipa]"
    GroupLevel =0
    Expression ="CadResidencia.[Outra forma abast]"
    GroupLevel =0
    Expression ="CadResidencia.[Rede Coletora esgoto]"
    GroupLevel =0
    Expression ="CadResidencia.[Fossa septica]"
    GroupLevel =0
    Expression ="CadResidencia.[Fossa rudimentar]"
    GroupLevel =0
    Expression ="CadResidencia.[Vala Rio Lago]"
    GroupLevel =0
    Expression ="CadResidencia.[Sem banheiro]"
    GroupLevel =0
    Expression ="CadResidencia.[Coleta lixo direta]"
    GroupLevel =0
    Expression ="CadResidencia.[Coleta lixo indireta]"
    GroupLevel =0
    Expression ="CadResidencia.[Sem Coleta lixo]"
    GroupLevel =0
    Expression ="CadResidencia.[Nº Comodos]"
    GroupLevel =0
    Expression ="CadResidencia.[Nº Dormitorios]"
    GroupLevel =0
    Expression ="CadResidencia.[Nº pessoas/Dormitorio]"
    GroupLevel =0
    Expression ="CadResidencia.[Domicilio tem acessib total]"
    GroupLevel =0
    Expression ="CadResidencia.[Domicilio tem acessib interno]"
    GroupLevel =0
    Expression ="CadResidencia.[Domicilio sem acessib]"
    GroupLevel =0
    Expression ="CadResidencia.[Area de risco]"
    GroupLevel =0
    Expression ="CadResidencia.[Area dif acesso geografico]"
    GroupLevel =0
    Expression ="CadResidencia.[Area violencia]"
    GroupLevel =0
    Expression ="CadResidencia.MotivoDeslResid"
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
Begin
    Begin
        dbText "Name" ="TbPessoa.MotivoDeslPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.MotivoDeslResid"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Apelido"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Parentesco"
        dbInteger "ColumnWidth" ="2400"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Abrigo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Nº pessoas/Dormitorio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Condição Ocupação]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Recebe programa social]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataCadPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Nome Encaminhador]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Domicilio Rural]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.SituaçãoRua"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Renda sem programas sociais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.LerEscrever"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Escolaridade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.FreqEscola"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[CRAS Origem]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Tel fixo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Domicilio Urbano]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.TelEncaminhador"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Nº Comodos]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Nº Dormitorios]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Area de risco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Area dif acesso geografico]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Area violencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DataDesligResid"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc outros]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Outros Programas Priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Unidades Proteção Basica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Sem energia eletrica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Resid Cedida]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Demanda espontanea]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Busca ativa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Unidades Proteção Especial]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Saude]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Educação]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Politicas Setoriais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Conselho Tutelar]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Poder Judiciario]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Defens Publica/MP/Delegacias]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Resid Propria]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Resid Alugada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Resid Ocupada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Alvenaria/madeira aparelhada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Madeira aproveitada/taipa/outros]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Medidor compart]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Sem Medidor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Medidor proprio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Agua canalizada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Abast Rede geral]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Poço/Nascente]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Cisterna/Captação]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Carro pipa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Outra forma abast]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Rede Coletora esgoto]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Fossa septica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Fossa rudimentar]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Vala Rio Lago]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Sem banheiro]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Coleta lixo direta]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Coleta lixo indireta]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Sem Coleta lixo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Domicilio tem acessib total]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Domicilio tem acessib interno]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Domicilio sem acessib]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.OutraEtnia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Qual DCronica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.MulherCF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Transt doença mental]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Sindrome down]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Surdez severa profunda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Surdez leve moderada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Baixa visão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Deficiencia fisica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Defic mental intelec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Quilombola"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Ribeirinha"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Cigana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.IndigenaResAldeia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.IndigenaNaoResidAldeia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.IndigenaEtnia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeDATA ATUALIZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.RendaFamiliar"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-29
    Top =38
    Right =1007
    Bottom =632
    Left =-1
    Top =-1
    Right =1012
    Bottom =226
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =420
        Top =23
        Right =579
        Bottom =204
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =632
        Top =23
        Right =757
        Bottom =204
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =279
        Top =0
        Name ="CadResidAtualizacao"
        Name =""
    End
End
