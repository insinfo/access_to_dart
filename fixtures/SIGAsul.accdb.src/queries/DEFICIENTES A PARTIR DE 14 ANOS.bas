Operation =1
Option =0
Where ="(((Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25))>=14) AND ((TbPessoa.Au"
    "tismo)=Yes)) OR (((TbPessoa.Cegueira)=Yes)) OR (((TbPessoa.[Baixa visão])=Yes)) "
    "OR (((TbPessoa.[Surdez severa profunda])=Yes)) OR (((TbPessoa.[Surdez leve moder"
    "ada])=Yes)) OR (((TbPessoa.[Deficiencia fisica])=Yes)) OR (((TbPessoa.[Defic men"
    "tal intelec])=Yes)) OR (((TbPessoa.[Sindrome down])=Yes)) OR (((TbPessoa.[Transt"
    " doença mental])=Yes))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="CadResidencia.DataCad"
    Expression ="CadResidencia.[CRAS Origem]"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Expression ="TbPessoa.Autismo"
    Expression ="TbPessoa.Cegueira"
    Expression ="TbPessoa.[Baixa visão]"
    Expression ="TbPessoa.[Surdez severa profunda]"
    Expression ="TbPessoa.[Surdez leve moderada]"
    Expression ="TbPessoa.[Deficiencia fisica]"
    Expression ="TbPessoa.[Defic mental intelec]"
    Expression ="TbPessoa.[Sindrome down]"
    Expression ="TbPessoa.[Transt doença mental]"
End
Begin Joins
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
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbPessoa.[Surdez severa profunda]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.[Baixa visão]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.Cegueira"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.[Transt doença mental]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.Autismo"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.[Sindrome down]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1710"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.[Defic mental intelec]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[CRAS Origem]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Deficiencia fisica]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Surdez leve moderada]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="600"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-381
    Top =0
    Right =1071
    Bottom =634
    Left =-1
    Top =-1
    Right =1428
    Bottom =170
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =245
        Bottom =266
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =470
        Top =-11
        Right =716
        Bottom =262
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
