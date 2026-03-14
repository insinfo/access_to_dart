Operation =1
Option =0
Having ="(((TbBeneficiosMunicipais.TipoBeneficio)=[DIGITE O BENEFÍCIO]) AND ((TbBeneficio"
    "sMunicipais.DataDesl) Is Null) AND ((TbBeneficiosMunicipais.DataSusp) Is Null) A"
    "ND ((TbBeneficiosMunicipais.DataTransf) Is Null))"
Begin InputTables
    Name ="TbBeneficiosMunicipais"
    Name ="TbUnidade"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbPessoa.Nome"
    Expression ="TbBeneficiosMunicipais.TipoBeneficio"
    Expression ="TbBeneficiosMunicipais.DataDesl"
    Expression ="TbBeneficiosMunicipais.DataSusp"
    Expression ="TbBeneficiosMunicipais.DataTransf"
    Expression ="TbPessoa.CPF"
    Expression ="TbPessoa.Celular"
    Expression ="TbBeneficiosMunicipais.Responsavel"
    Expression ="TbBeneficiosMunicipais.[CPF Responsavel]"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="TbBeneficiosMunicipais"
    Expression ="TbPessoa.CodPessoa = TbBeneficiosMunicipais.Nome"
    Flag =1
End
Begin OrderBy
    Expression ="TbPessoa.Nome"
    Flag =0
End
Begin Groups
    Expression ="TbPessoa.Nome"
    GroupLevel =0
    Expression ="TbBeneficiosMunicipais.TipoBeneficio"
    GroupLevel =0
    Expression ="TbBeneficiosMunicipais.DataDesl"
    GroupLevel =0
    Expression ="TbBeneficiosMunicipais.DataSusp"
    GroupLevel =0
    Expression ="TbBeneficiosMunicipais.DataTransf"
    GroupLevel =0
    Expression ="TbPessoa.CPF"
    GroupLevel =0
    Expression ="TbPessoa.Celular"
    GroupLevel =0
    Expression ="TbBeneficiosMunicipais.Responsavel"
    GroupLevel =0
    Expression ="TbBeneficiosMunicipais.[CPF Responsavel]"
    GroupLevel =0
    Expression ="TbUnidade.NOME"
    GroupLevel =0
    Expression ="TbUnidade.[DIRETOR(A)]"
    GroupLevel =0
    Expression ="TbUnidade.FUNÇÃO"
    GroupLevel =0
    Expression ="TbUnidade.MATRICULA"
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
        dbText "Name" ="TbBeneficiosMunicipais.dataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.Anexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.CodFunc"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="765"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.DataDesl"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1200"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.NomeFunc"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3555"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.Responsavel"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.[CPF Responsavel]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="810"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.obs"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="975"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.[Data do Atendimento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.[Ano de referencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.CodFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.NomeFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.[Tipo de Atendimento]"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2940"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.[Cras de Transferencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.[Situação Beneficio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.[Motivo Desligamento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.[Motivo Suspensão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbInteger "ColumnWidth" ="3585"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeData do Atendimento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ÚltimoDeData do Atendimento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBenfMunDet].[Motivo Desligamento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[CodFunc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[DataDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[dataInsc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBenfMunDet].[Motivo Suspensão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBenfMunDet].[Ano de referencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[NOME]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBenfMunDet].[NomeFunc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[FUNÇÃO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[MATRICULA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBenfMunDet].[Situação Beneficio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[LOGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[RODAPE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[CodBenef]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[NomeFunc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[Nome]"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3810"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[TbPessoa].[CPF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[Celular]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[Responsavel]"
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
        dbText "Name" ="[TbBeneficiosMunicipais].[obs]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBenfMunDet].[CodFunc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBenfMunDet].[Tipo de Atendimento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBenfMunDet].[Cras de Transferencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBenfMunDet].[Obs]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ÚltimoDeAno de referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeAno de referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.DataSusp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[DataSusp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DataSusp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Celular"
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
        dbText "Name" ="DIRETOR(A)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.DataTransf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DataTransf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbBeneficiosMunicipais].[DataTransf]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1069
    Bottom =660
    Left =-1
    Top =-1
    Right =1045
    Bottom =373
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =243
        Top =15
        Right =442
        Bottom =357
        Top =0
        Name ="TbBeneficiosMunicipais"
        Name =""
    End
    Begin
        Left =813
        Top =2
        Right =957
        Bottom =296
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =28
        Top =21
        Right =172
        Bottom =165
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
