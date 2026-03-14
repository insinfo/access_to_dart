Operation =1
Option =0
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
    Name ="CadResidAtualizacao"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="CadResidAtualizacao.[DATA ATUALIZ]"
    Expression ="TbPessoa.DataDesligPes"
    Expression ="CadResidencia.[CRAS Origem]"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.NIS"
    Expression ="TbPessoa.DNasc"
    Expression ="TbPessoa.CPF"
    Expression ="TbPessoa.NomeMae"
    Expression ="TbPessoa.NomePai"
    Expression ="TbPessoa.RG"
    Expression ="TbPessoa.OrgaoRG"
    Expression ="TbPessoa.DEmisRG"
    Expression ="CadResidencia.Endereço"
    Expression ="CadResidencia.Bairro"
    Expression ="TbPessoa.Celular"
    Expression ="CadResidencia.Referencia"
    Expression ="TbPessoa.Sexo"
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
    Expression ="TbPessoa.Escolaridade"
    Expression ="TbPessoa.[Condição Ocupação]"
    Expression ="TbPessoa.[Renda sem programas sociais]"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
    LeftTable ="CadResidencia"
    RightTable ="CadResidAtualizacao"
    Expression ="CadResidencia.CodFam = CadResidAtualizacao.CodCadResd"
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
        dbText "Name" ="TbPessoa.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NomePai"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Renda sem programas sociais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Condição Ocupação]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[CRAS Origem]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Escolaridade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Qual DCronica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidAtualizacao.[DATA ATUALIZ]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1029"
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
        dbText "Name" ="TbPessoa.[Transt doença mental]"
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
        dbText "Name" ="TbPessoa.DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-5
    Top =68
    Right =958
    Bottom =650
    Left =-1
    Top =-1
    Right =939
    Bottom =341
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =196
        Bottom =303
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =243
        Top =35
        Right =451
        Bottom =288
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =496
        Top =12
        Right =640
        Bottom =263
        Top =0
        Name ="CadResidAtualizacao"
        Name =""
    End
End
