Operation =1
Option =0
Where ="(((CadResidencia.CodFam)=[Formulários]![FormProntuario]![CodFamTxt]) AND ((TbPes"
    "soa.DataDesligPes) Is Null))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.DataDesligPes"
    Expression ="TbPessoa.MotivoDeslPes"
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.DataCadPes"
    Expression ="TbPessoa.Parentesco"
    Expression ="TbPessoa.Nome"
    Expression ="CadResidencia.DataCad"
    Expression ="TbPessoa.Autismo"
    Expression ="TbPessoa.[Baixa visão]"
    Expression ="TbPessoa.Cegueira"
    Expression ="TbPessoa.[Deficiencia fisica]"
    Expression ="TbPessoa.[Defic mental intelec]"
    Expression ="TbPessoa.DoencaCronica"
    Expression ="TbPessoa.[Qual DCronica]"
    Expression ="TbPessoa.[Sindrome down]"
    Expression ="TbPessoa.[Surdez severa profunda]"
    Expression ="TbPessoa.[Surdez leve moderada]"
    Expression ="TbPessoa.[Transt doença mental]"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.[CodFam] = TbPessoa.[CodFam]"
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
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataCadPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Surdez severa profunda]"
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
        dbText "Name" ="TbPessoa.[Defic mental intelec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Deficiencia fisica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Baixa visão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Surdez leve moderada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.MotivoDeslPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Qual DCronica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Qual doença cronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Deficiencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Qual doença cronica]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1066
    Bottom =524
    Left =-1
    Top =-1
    Right =1042
    Bottom =210
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =87
        Top =19
        Right =265
        Bottom =256
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =373
        Top =5
        Right =589
        Bottom =328
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
