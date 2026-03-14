Operation =1
Option =0
Where ="(((CADUNICO.Identificação)=[Forms]![BASE MUNICIPAL COMPLETA]![identificação]))"
Begin InputTables
    Name ="CADUNICO"
End
Begin OutputColumns
    Expression ="CADUNICO.Identificação"
    Expression ="CADUNICO.DATA_CAD"
    Expression ="CADUNICO.DATA_ATUAL"
    Expression ="CADUNICO.RENDA_MEDIA"
    Expression ="CADUNICO.RENDA_FAM"
    Expression ="CADUNICO.MES_REF"
    Expression ="CADUNICO.PBF"
    Expression ="CADUNICO.REF_PBF"
    Expression ="CADUNICO.BAIRRO"
    Expression ="CADUNICO.TIPO_LOGRAD"
    Expression ="CADUNICO.TITULO_LOGRAD"
    Expression ="CADUNICO.NOME_LOGR"
    Expression ="CADUNICO.NUM_LOGR"
    Expression ="CADUNICO.COMPLEMENTO"
    Expression ="CADUNICO.COMPLEMENTO1"
    Expression ="CADUNICO.CEP"
    Expression ="CADUNICO.REFERENCIA"
    Expression ="CADUNICO.ENTREVISTADOR"
    Expression ="CADUNICO.QTD_PESS_FAM"
    Expression ="CADUNICO.CRAS"
    Expression ="CADUNICO.DDD1"
    Expression ="CADUNICO.TEL1"
    Expression ="CADUNICO.DDD2"
    Expression ="CADUNICO.TEL2"
    Expression ="CADUNICO.TRAB_INF"
    Expression ="CADUNICO.nom_pessoa"
    Expression ="CADUNICO.NIS"
    Expression ="CADUNICO.SEXO"
    Expression ="CADUNICO.DNASC"
    Expression ="CADUNICO.PARENTESCO"
    Expression ="CADUNICO.RAÇA"
    Expression ="CADUNICO.MAE"
    Expression ="CADUNICO.PAI"
    Expression ="CADUNICO.UF_NASC"
    Expression ="CADUNICO.MUN_NASC"
    Expression ="CADUNICO.livro_certid_pessoa"
    Expression ="CADUNICO.FOLHA_certid_pessoa"
    Expression ="CADUNICO.TERMO_certid_pessoa"
    Expression ="CADUNICO.munic_certid_pessoa"
    Expression ="CADUNICO.CPF"
    Expression ="CADUNICO.identidade_pessoa"
    Expression ="CADUNICO.EMISSAO_RG"
    Expression ="CADUNICO.UF_RG"
    Expression ="CADUNICO.ORG_EMISSOR_RG"
    Expression ="CADUNICO.CTPS"
    Expression ="CADUNICO.SERIE_CTPS"
    Expression ="CADUNICO.EMISSÃO_CTPS"
    Expression ="CADUNICO.UF_CTPS"
    Expression ="CADUNICO.TITULO_E"
    Expression ="CADUNICO.ZONA"
    Expression ="CADUNICO.SEÇÃO"
    Expression ="CADUNICO.DEFICIENCIA"
    Expression ="CADUNICO.CEGUEIRA"
    Expression ="CADUNICO.BAIXA_VISAO"
    Expression ="CADUNICO.SURDEZ_PROF"
    Expression ="CADUNICO.SURDEZ_LEVE"
    Expression ="CADUNICO.DEF_FISICA"
    Expression ="CADUNICO.DEF_MENTAL"
    Expression ="CADUNICO.SDOWN"
    Expression ="CADUNICO.TRANST_MENTAL"
    Expression ="CADUNICO.AJUDA_DEFIC"
    Expression ="CADUNICO.LER_ESCREVER"
    Expression ="CADUNICO.FREQ_ESCOLA"
    Expression ="CADUNICO.NOME_ESCOLA"
    Expression ="CADUNICO.UF_ESCOLA"
    Expression ="CADUNICO.MUNIC_ESCOLA"
    Expression ="CADUNICO.SERIE_ESCOLA"
    Expression ="CADUNICO.CONCLUIU_ESTUDOS"
    Expression ="CADUNICO.GRAUS_INSTR"
    Expression ="CADUNICO.RENDA_APOS"
    Expression ="CADUNICO.RENDA_PENSAO"
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
        dbText "Name" ="CADUNICO.CTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.TERMO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.TEL2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CODCADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[TITULO LOGRAD]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.ESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CODFAM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.SEXO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DNASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DDD1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DATAATUALIZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.TEL1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DATAENTREV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[TIPO LOGR]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.NUMERO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.COMPLEM1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.COMPLEM2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.REFERENC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[RENDA MEDIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[RENDA FAMILIAR]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.MÃE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.PAI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.FOLHA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.TITULO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.ZONA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DDD2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.ESCOLARIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[CRAS REGIÃO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.NOMECADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.REFCAD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DATACAD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.BAIRRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.LOGRADOURO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.UFNASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CIDADENASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.LIVRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.MUNIC_CERT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DATAEMISRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.UFRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.ORGEMISSOR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[SERIE CTPS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DATAEMISSAOCTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.UFCTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.SEÇAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.UFESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.MUNICESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.PARENTESCO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.RACA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[PAIS DE ORIGEM]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DEFICIENCIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="APOSENT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[UF RG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[NOME LOGRAD]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MUNIC ESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.LOCALIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[ESTADO NASC]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.APOSENT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.SERIE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[MUNIC NASC]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ESTADO NASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[DT EMISS CTPS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[UF CTPS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[LIVRO CERTID]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NOME LOGRAD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.SEÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[UF ESCOLA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[DT EMISS RG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOCALIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[MUNIC ESCOLA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.[ORG EMISSOR]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MUNIC NASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LIVRO CERTID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DT EMISS RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UF RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ORG EMISSOR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SERIE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DT EMISS CTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UF CTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SEÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UF ESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.PAI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.NOMECADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.BAIXA_VISAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.PARENTESCO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.CODFAM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.CONCLUIU_ESTUDOS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.RAÇA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.COMPLEMENTO1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.NUM_LOGR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.DDD1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.ZONA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.RENDA_APOS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.SERIE_ESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.CODCADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.Identificação"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.[CRAS REGIÃO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.REFCAD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.SEXO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.DNASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.DATAATUALIZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.UF_ESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.DATACAD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.RENDA_PENSAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.identidade_pessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.DATA_CAD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.DATA_ATUAL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.RENDA_MEDIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.RENDA_FAM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.MES_REF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.PBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.EMISSÃO_CTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.REF_PBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.BAIRRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.TIPO_LOGRAD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.TITULO_LOGRAD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.NOME_LOGR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.COMPLEMENTO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.REFERENCIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.ENTREVISTADOR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.QTD_PESS_FAM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.TEL1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.DDD2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.TEL2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.TRAB_INF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.nom_pessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.MAE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.UF_NASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.MUN_NASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.livro_certid_pessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.FOLHA_certid_pessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.TERMO_certid_pessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.DEF_MENTAL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.munic_certid_pessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.EMISSAO_RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.UF_RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.ORG_EMISSOR_RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.CTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.SERIE_CTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.UF_CTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.TITULO_E"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.SEÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.DEFICIENCIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.CEGUEIRA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.SURDEZ_PROF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.SURDEZ_LEVE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.DEF_FISICA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.SDOWN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.TRANST_MENTAL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.AJUDA_DEFIC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.LER_ESCREVER"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.FREQ_ESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.NOME_ESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.MUNIC_ESCOLA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.GRAUS_INSTR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Section"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.Identificação"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1021
    Bottom =857
    Left =-1
    Top =-1
    Right =997
    Bottom =370
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =335
        Top =0
        Name ="CADUNICO"
        Name =""
    End
End
