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
    Name ="csFamExtPbz"
End
Begin OutputColumns
    Expression ="csFamExtPbz.CodFam"
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
    LeftTable ="csFamExtPbz"
    RightTable ="csPessDemanEspec"
    Expression ="csFamExtPbz.CodFam = csPessDemanEspec.CodFam"
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
End
Begin
    State =0
    Left =0
    Top =40
    Right =1066
    Bottom =677
    Left =-1
    Top =-1
    Right =1042
    Bottom =304
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =573
        Top =25
        Right =717
        Bottom =263
        Top =0
        Name ="csPessDemanEspec"
        Name =""
    End
    Begin
        Left =277
        Top =16
        Right =421
        Bottom =160
        Top =0
        Name ="csFamExtPbz"
        Name =""
    End
End
