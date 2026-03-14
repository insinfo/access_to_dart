Operation =1
Option =2
Where ="(((csPessDemanEspec.Autismo)=Yes) AND ((csPessDemanEspec.DataDesligPes) Is Null)"
    ") OR (((csPessDemanEspec.Cegueira)=Yes)) OR (((csPessDemanEspec.[Baixa visão])=Y"
    "es)) OR (((csPessDemanEspec.[Surdez severa profunda])=Yes)) OR (((csPessDemanEsp"
    "ec.[Surdez leve moderada])=Yes)) OR (((csPessDemanEspec.[Deficiencia fisica])=Ye"
    "s)) OR (((csPessDemanEspec.[Defic mental intelec])=Yes)) OR (((csPessDemanEspec."
    "[Sindrome down])=Yes)) OR (((csPessDemanEspec.[Transt doença mental])=Yes) AND ("
    "(csPessDemanEspec.DoencaCronica)=Yes))"
Begin InputTables
    Name ="csPessDemanEspec"
    Name ="csBSF"
End
Begin OutputColumns
    Expression ="csPessDemanEspec.CodFam"
    Expression ="csPessDemanEspec.Nome"
    Expression ="csPessDemanEspec.Autismo"
    Expression ="csPessDemanEspec.Cegueira"
    Expression ="csPessDemanEspec.[Baixa visão]"
    Expression ="csPessDemanEspec.[Surdez severa profunda]"
    Expression ="csPessDemanEspec.[Surdez leve moderada]"
    Expression ="csPessDemanEspec.[Deficiencia fisica]"
    Expression ="csPessDemanEspec.[Defic mental intelec]"
    Expression ="csPessDemanEspec.[Sindrome down]"
    Expression ="csPessDemanEspec.[Transt doença mental]"
    Expression ="csPessDemanEspec.DoencaCronica"
End
Begin Joins
    LeftTable ="csBSF"
    RightTable ="csPessDemanEspec"
    Expression ="csBSF.Nome = csPessDemanEspec.Nome"
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
        dbText "Name" ="csPessDemanEspec.Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.[Baixa visão]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.[Surdez severa profunda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.[Surdez leve moderada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.[Deficiencia fisica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.[Defic mental intelec]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.[Sindrome down]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.[Transt doença mental]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csFamExtPbz.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.Nome"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =11
    Top =30
    Right =785
    Bottom =667
    Left =-1
    Top =-1
    Right =1137
    Bottom =219
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =334
        Top =7
        Right =478
        Bottom =245
        Top =0
        Name ="csPessDemanEspec"
        Name =""
    End
    Begin
        Left =118
        Top =-3
        Right =262
        Bottom =141
        Top =0
        Name ="csBSF"
        Name =""
    End
End
