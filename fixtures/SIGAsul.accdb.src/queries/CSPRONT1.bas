Operation =1
Option =0
Where ="(((CadResidencia.CodFam)=[Formulários]![FormProntuario]![CodFamTxt]) AND ((CadRe"
    "sidencia.DataDesligResid) Is Null) AND ((TbPessoa.DataDesligPes) Is Null) AND (("
    "TbPessoa.Parentesco)=\"Pessoa de Referencia\"))"
Begin InputTables
    Name ="TbPessoa"
    Name ="CadResidencia"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="CadResidencia.DataDesligResid"
    Expression ="TbPessoa.DataDesligPes"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.DataCadPes"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.Parentesco"
    Expression ="TbUnidade.CodUnidade"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.[Nº UNIDADE]"
    Expression ="TbUnidade.NOME"
    Expression ="TbPessoa.CPF"
    Expression ="TbPessoa.Apelido"
    Expression ="TbPessoa.NomeMae"
    Expression ="TbPessoa.NomePai"
    Expression ="TbPessoa.Celular"
    Expression ="TbPessoa.[Tel recado detalhes]"
    Expression ="TbPessoa.NIS"
    Expression ="TbPessoa.PROVICN"
    Expression ="TbPessoa.PROVIRG"
    Expression ="TbPessoa.PROVICTPS"
    Expression ="TbPessoa.PROVICPF"
    Expression ="TbPessoa.PROVITE"
    Expression ="TbPessoa.RG"
    Expression ="TbPessoa.OrgaoRG"
    Expression ="TbPessoa.DEmisRG"
    Expression ="TbPessoa.[CERT LIVRO/FOLHA/TERMO]"
    Expression ="TbPessoa.[TITULO/ZONA/SEÇAO]"
    Expression ="TbPessoa.Sexo"
    Expression ="TbPessoa.[Raça/Cor]"
    Expression ="TbPessoa.DNasc"
    Expression ="TbPessoa.MunicNasc"
    Expression ="TbPessoa.UFNasc"
    Expression ="TbPessoa.[Estado Civil]"
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
    Expression ="TbPessoa.ServAco"
    Expression ="TbPessoa.LerEscrever"
    Expression ="TbPessoa.FreqEscola"
    Expression ="TbPessoa.Escolaridade"
    Expression ="TbPessoa.[NOME ESCOLA]"
    Expression ="TbPessoa.Turno"
    Expression ="TbPessoa.CTPS"
    Expression ="TbPessoa.[Nº CTPS]"
    Expression ="TbPessoa.[Condição Ocupação]"
    Expression ="TbPessoa.BPCD"
    Expression ="TbPessoa.BPCI"
    Expression ="TbPessoa.[Renda sem programas sociais]"
    Expression ="TbPessoa.[Renda per capita]"
    Expression ="TbPessoa.[Recebe programa social]"
    Expression ="TbPessoa.[Aposentado/pensionista]"
    Expression ="CadResidencia.CodCREAS"
    Expression ="CadResidencia.CodCEAM"
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
    Expression ="CadResidencia.MulherCF"
    Expression ="CadResidencia.RendaFamiliar"
    Expression ="CadResidencia.[PBF FAMILIA]"
    Expression ="CadResidencia.CADUNICO"
    Expression ="CadResidencia.DATAATCAD"
    Expression ="CadResidencia.[Outros Programas Priori]"
    Expression ="CadResidencia.[Fam Extrema Pb]"
    Expression ="CadResidencia.Quilombola"
    Expression ="CadResidencia.Ribeirinha"
    Expression ="CadResidencia.Cigana"
    Expression ="CadResidencia.IndigenaResAldeia"
    Expression ="CadResidencia.IndigenaNaoResidAldeia"
    Expression ="CadResidencia.IndigenaEtnia"
    Expression ="CadResidencia.OutraEtnia"
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
End
Begin Joins
    LeftTable ="TbUnidade"
    RightTable ="CadResidencia"
    Expression ="TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]"
    Flag =1
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
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
Begin
    Begin
        dbText "Name" ="TbUnidade.[Nº UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CodUnidade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbInteger "ColumnWidth" ="3090"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.MunicNasc"
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
        dbText "Name" ="TbPessoa.DataCadPes"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-107
    Top =100
    Right =959
    Bottom =584
    Left =-1
    Top =-1
    Right =1042
    Bottom =184
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =444
        Top =6
        Right =631
        Bottom =317
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =209
        Top =6
        Right =353
        Bottom =299
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =3
        Top =28
        Right =147
        Bottom =172
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
