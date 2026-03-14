Operation =1
Option =0
Begin InputTables
    Name ="beneficioaMunicComposicao"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="beneficioaMunicComposicao.CodBenef"
    Expression ="TbUnidade.LOGO"
    Expression ="beneficioaMunicComposicao.TipoBeneficio"
    Expression ="beneficioaMunicComposicao.CodFam"
    Expression ="beneficioaMunicComposicao.BENEFICIARIO"
    Expression ="beneficioaMunicComposicao.CodPessoa"
    Expression ="beneficioaMunicComposicao.Nome"
    Expression ="beneficioaMunicComposicao.Sexo"
    Expression ="beneficioaMunicComposicao.DNasc"
    Expression ="beneficioaMunicComposicao.DoencaCronica"
    Expression ="beneficioaMunicComposicao.[Qual DCronica]"
    Expression ="beneficioaMunicComposicao.Escolaridade"
    Expression ="beneficioaMunicComposicao.[Condição Ocupação]"
    Expression ="beneficioaMunicComposicao.[Renda sem programas sociais]"
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
        dbText "Name" ="TbPessoa.Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Renda sem programas sociais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Condição Ocupação]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Escolaridade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Qual DCronica]"
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
        dbText "Name" ="TbPessoa.[Surdez severa profunda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Surdez leve moderada]"
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
        dbText "Name" ="TbPessoa.[Sindrome down]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Transt doença mental]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BENEFICIARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade_1.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficioaMunicComposicao.[Renda sem programas sociais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficioaMunicComposicao.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="beneficioaMunicComposicao.CodBenef"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1106
    Bottom =660
    Left =-1
    Top =-1
    Right =1038
    Bottom =407
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =127
        Top =19
        Right =271
        Bottom =425
        Top =0
        Name ="beneficioaMunicComposicao"
        Name =""
    End
    Begin
        Left =319
        Top =12
        Right =463
        Bottom =336
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
