Operation =1
Option =0
Having ="(((TbBeneficiosMunicipais.CodBenef)=[Formulários]![FrmBeneficios]![CodBenef]) AN"
    "D ((beneficiosMuncAtualizacao.DataDesligPes) Is Null))"
Begin InputTables
    Name ="TbUnidade"
    Name ="beneficiosMuncAtualizacao"
    Name ="TbBeneficiosMunicipais"
    Name ="TbBenfMunDet"
End
Begin OutputColumns
    Expression ="TbBeneficiosMunicipais.CodBenef"
    Alias ="MáxDeDATA ATUALIZ"
    Expression ="Max(beneficiosMuncAtualizacao.[DATA ATUALIZ])"
    Alias ="MáxDeData do Atendimento"
    Expression ="Max(TbBenfMunDet.[Data do Atendimento])"
    Expression ="beneficiosMuncAtualizacao.DataDesligPes"
    Expression ="TbBenfMunDet.[Tipo de Atendimento]"
    Expression ="TbBenfMunDet.[Situação Beneficio]"
    Expression ="TbUnidade.LOGO"
    Expression ="TbBeneficiosMunicipais.dataInsc"
    Expression ="TbBeneficiosMunicipais.Nome"
    Expression ="beneficiosMuncAtualizacao.NIS"
    Expression ="TbBeneficiosMunicipais.CPFPessoa"
    Expression ="TbBeneficiosMunicipais.Celularpessoa"
    Expression ="TbBeneficiosMunicipais.Responsavel"
    Expression ="TbBeneficiosMunicipais.[CPF Responsavel]"
    Expression ="TbBeneficiosMunicipais.TipoBeneficio"
    Expression ="beneficiosMuncAtualizacao.CodFam"
    Expression ="beneficiosMuncAtualizacao.[CRAS Origem]"
    Expression ="beneficiosMuncAtualizacao.CodPessoa"
    Alias ="NOMEPESSOA"
    Expression ="beneficiosMuncAtualizacao.Nome"
    Expression ="beneficiosMuncAtualizacao.DNasc"
    Expression ="beneficiosMuncAtualizacao.CPF"
    Expression ="beneficiosMuncAtualizacao.NomeMae"
    Expression ="beneficiosMuncAtualizacao.NomePai"
    Expression ="beneficiosMuncAtualizacao.RG"
    Expression ="beneficiosMuncAtualizacao.OrgaoRG"
    Expression ="beneficiosMuncAtualizacao.DEmisRG"
    Expression ="beneficiosMuncAtualizacao.Endereço"
    Expression ="beneficiosMuncAtualizacao.Bairro"
    Expression ="beneficiosMuncAtualizacao.Celular"
    Expression ="beneficiosMuncAtualizacao.Referencia"
    Expression ="beneficiosMuncAtualizacao.Sexo"
    Expression ="beneficiosMuncAtualizacao.Autismo"
    Expression ="beneficiosMuncAtualizacao.Cegueira"
    Expression ="beneficiosMuncAtualizacao.[Baixa visão]"
    Expression ="beneficiosMuncAtualizacao.[Surdez severa profunda]"
    Expression ="beneficiosMuncAtualizacao.[Surdez leve moderada]"
    Expression ="beneficiosMuncAtualizacao.[Deficiencia fisica]"
    Expression ="beneficiosMuncAtualizacao.[Defic mental intelec]"
    Expression ="beneficiosMuncAtualizacao.[Sindrome down]"
    Expression ="beneficiosMuncAtualizacao.[Transt doença mental]"
    Expression ="beneficiosMuncAtualizacao.DoencaCronica"
    Expression ="beneficiosMuncAtualizacao.[Qual DCronica]"
    Expression ="beneficiosMuncAtualizacao.Expr1030"
    Expression ="beneficiosMuncAtualizacao.Escolaridade"
    Expression ="beneficiosMuncAtualizacao.[Condição Ocupação]"
    Expression ="beneficiosMuncAtualizacao.[Renda sem programas sociais]"
End
Begin Joins
    LeftTable ="beneficiosMuncAtualizacao"
    RightTable ="TbBeneficiosMunicipais"
    Expression ="beneficiosMuncAtualizacao.CodPessoa = TbBeneficiosMunicipais.Nome"
    Flag =1
    LeftTable ="TbBeneficiosMunicipais"
    RightTable ="TbBenfMunDet"
    Expression ="TbBeneficiosMunicipais.CodBenef = TbBenfMunDet.CodBenef"
    Flag =1
End
Begin OrderBy
    Expression ="Max(beneficiosMuncAtualizacao.[DATA ATUALIZ])"
    Flag =1
End
Begin Groups
    Expression ="TbBeneficiosMunicipais.CodBenef"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.DataDesligPes"
    GroupLevel =0
    Expression ="TbBenfMunDet.[Tipo de Atendimento]"
    GroupLevel =0
    Expression ="TbBenfMunDet.[Situação Beneficio]"
    GroupLevel =0
    Expression ="TbBeneficiosMunicipais.dataInsc"
    GroupLevel =0
    Expression ="TbBeneficiosMunicipais.Nome"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.NIS"
    GroupLevel =0
    Expression ="TbBeneficiosMunicipais.CPFPessoa"
    GroupLevel =0
    Expression ="TbBeneficiosMunicipais.Celularpessoa"
    GroupLevel =0
    Expression ="TbBeneficiosMunicipais.Responsavel"
    GroupLevel =0
    Expression ="TbBeneficiosMunicipais.[CPF Responsavel]"
    GroupLevel =0
    Expression ="TbBeneficiosMunicipais.TipoBeneficio"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.CodFam"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.[CRAS Origem]"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.CodPessoa"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.Nome"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.DNasc"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.CPF"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.NomeMae"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.NomePai"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.RG"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.OrgaoRG"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.DEmisRG"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.Endereço"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.Bairro"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.Celular"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.Referencia"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.Sexo"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.Autismo"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.Cegueira"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.[Baixa visão]"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.[Surdez severa profunda]"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.[Surdez leve moderada]"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.[Deficiencia fisica]"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.[Defic mental intelec]"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.[Sindrome down]"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.[Transt doença mental]"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.DoencaCronica"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.[Qual DCronica]"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.Expr1030"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.Escolaridade"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.[Condição Ocupação]"
    GroupLevel =0
    Expression ="beneficiosMuncAtualizacao.[Renda sem programas sociais]"
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
        dbText "Name" ="TbBeneficiosMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.[CPF Responsavel]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.Responsavel"
        dbInteger "ColumnWidth" ="3630"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.Celularpessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.CPFPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.Nome"
        dbInteger "ColumnWidth" ="3885"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.dataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.[Renda sem programas sociais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.[CRAS Origem]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.Escolaridade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.NomePai"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.[Baixa visão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.[Surdez severa profunda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.[Surdez leve moderada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.[Deficiencia fisica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.[Defic mental intelec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.[Sindrome down]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.[Transt doença mental]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.[Qual DCronica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.Expr1027"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.[Condição Ocupação]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NOMEPESSOA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.[DATA ATUALIZ]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ÚltimoDeDATA ATUALIZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="dataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CPFPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Celularpessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Responsavel"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CPF Responsavel"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CRAS Origem"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CPF"
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
        dbText "Name" ="Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Sexo"
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
        dbText "Name" ="Expr1029"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Escolaridade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Condição Ocupação"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Renda sem programas sociais"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[Celularpessoa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[CPFPessoa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[LOGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Cegueira]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Sindrome down]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Deficiencia fisica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.[Data do Atendimento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Referencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.[Tipo de Atendimento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.[Situação Beneficio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[CodBenef]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBenfMunDet].[Data do Atendimento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Celular]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBenfMunDet].[Tipo de Atendimento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBenfMunDet].[Situação Beneficio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[dataInsc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[NIS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[Responsavel]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Condição Ocupação]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[CPF Responsavel]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[TipoBeneficio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[CodFam]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[CRAS Origem]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[CodPessoa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[DNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[CPF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Defic mental intelec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[NomeMae]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[NomePai]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[RG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[OrgaoRG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[DEmisRG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Endereço]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Bairro]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Sexo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Autismo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Baixa visão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Surdez severa profunda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Surdez leve moderada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Transt doença mental]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[DoencaCronica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Qual DCronica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Expr1029]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Escolaridade]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[beneficiosMuncAtualizacao].[Renda sem programas sociais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ÚltimoDeData do Atendimento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeData do Atendimento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Tipo de Atendimento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Situação Beneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeDATA ATUALIZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficiosMuncAtualizacao.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =942
    Bottom =521
    Left =-1
    Top =-1
    Right =874
    Bottom =214
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =-6
        Top =15
        Right =113
        Bottom =227
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =149
        Top =16
        Right =323
        Bottom =192
        Top =0
        Name ="beneficiosMuncAtualizacao"
        Name =""
    End
    Begin
        Left =376
        Top =17
        Right =529
        Bottom =201
        Top =0
        Name ="TbBeneficiosMunicipais"
        Name =""
    End
    Begin
        Left =600
        Top =19
        Right =805
        Bottom =263
        Top =0
        Name ="TbBenfMunDet"
        Name =""
    End
End
