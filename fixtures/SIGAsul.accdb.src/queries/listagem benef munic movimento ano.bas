Operation =1
Option =0
Where ="(((TbBeneficiosMunicipais.TipoBeneficio)=[DIGITE O BENEFÍCIO]) AND ((TbBenfMunDe"
    "t.[Ano de referencia])=[DIGITE O ANO]) AND ((TbBenfMunDet.[Situação Beneficio])="
    "\"ATIVO\"))"
Begin InputTables
    Name ="TbBeneficiosMunicipais"
    Name ="TbBenfMunDet"
    Name ="TbUnidade"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbBeneficiosMunicipais.TipoBeneficio"
    Expression ="TbBeneficiosMunicipais.CodBenef"
    Expression ="TbBeneficiosMunicipais.dataInsc"
    Expression ="TbBeneficiosMunicipais.DataDesl"
    Expression ="TbBeneficiosMunicipais.CodFunc"
    Expression ="TbBeneficiosMunicipais.NomeFunc"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.CPF"
    Expression ="TbPessoa.Celular"
    Expression ="TbBeneficiosMunicipais.Responsavel"
    Expression ="TbBeneficiosMunicipais.[CPF Responsavel]"
    Expression ="TbBeneficiosMunicipais.obs"
    Expression ="TbBeneficiosMunicipais.Anexo"
    Expression ="TbBenfMunDet.[Data do Atendimento]"
    Expression ="TbBenfMunDet.[Ano de referencia]"
    Expression ="TbBenfMunDet.CodFunc"
    Expression ="TbBenfMunDet.NomeFunc"
    Expression ="TbBenfMunDet.[Tipo de Atendimento]"
    Expression ="TbBenfMunDet.[Cras de Transferencia]"
    Expression ="TbBenfMunDet.[Situação Beneficio]"
    Expression ="TbBenfMunDet.[Motivo Desligamento]"
    Expression ="TbBenfMunDet.[Motivo Suspensão]"
    Expression ="TbBenfMunDet.Obs"
End
Begin Joins
    LeftTable ="TbBeneficiosMunicipais"
    RightTable ="TbBenfMunDet"
    Expression ="TbBeneficiosMunicipais.CodBenef = TbBenfMunDet.CodBenef"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbBeneficiosMunicipais"
    Expression ="TbPessoa.CodPessoa = TbBeneficiosMunicipais.Nome"
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
        dbInteger "ColumnWidth" ="1890"
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
        dbInteger "ColumnWidth" ="1875"
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
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1187
    Bottom =685
    Left =-1
    Top =-1
    Right =1163
    Bottom =257
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =251
        Top =70
        Right =395
        Bottom =214
        Top =0
        Name ="TbBeneficiosMunicipais"
        Name =""
    End
    Begin
        Left =475
        Top =17
        Right =624
        Bottom =159
        Top =0
        Name ="TbBenfMunDet"
        Name =""
    End
    Begin
        Left =671
        Top =10
        Right =815
        Bottom =304
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
