Operation =1
Option =0
Where ="(((TbPessoa.CodFam)=[DIGITE O CODIGO FAMILIAR]) AND ((TbPessoa.DataDesligPes) Is"
    " Null))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbBeneficiosMunicipais"
End
Begin OutputColumns
    Expression ="TbBeneficiosMunicipais.CodBenef"
    Expression ="TbPessoa.CodFam"
    Expression ="TbBeneficiosMunicipais.TipoBeneficio"
    Alias ="BENEFICIARIO"
    Expression ="TbBeneficiosMunicipais.Nome"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.Sexo"
    Expression ="TbPessoa.DNasc"
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
    Expression ="TbPessoa.Escolaridade"
    Expression ="TbPessoa.[Condição Ocupação]"
    Expression ="TbPessoa.[Renda sem programas sociais]"
    Expression ="TbPessoa.DataDesligPes"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="TbBeneficiosMunicipais"
    Expression ="TbPessoa.CodPessoa = TbBeneficiosMunicipais.Nome"
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
        dbText "Name" ="TbBeneficiosMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
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
    Bottom =190
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =361
        Top =3
        Right =522
        Bottom =179
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =74
        Top =14
        Right =251
        Bottom =189
        Top =0
        Name ="TbBeneficiosMunicipais"
        Name =""
    End
End
