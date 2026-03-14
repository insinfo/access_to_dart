Operation =1
Option =2
Begin InputTables
    Name ="csPessDemanEspec"
    Name ="TbPBF08"
End
Begin OutputColumns
    Expression ="csPessDemanEspec.Nome"
    Expression ="csPessDemanEspec.CodPessoa"
    Expression ="csPessDemanEspec.CodFam"
    Expression ="csPessDemanEspec.DataDesligPes"
    Expression ="csPessDemanEspec.DNasc"
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
    LeftTable ="csPessDemanEspec"
    RightTable ="TbPBF08"
    Expression ="csPessDemanEspec.Nome = TbPBF08.TITULAR"
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
        dbText "Name" ="csPessDemanEspec.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csPessDemanEspec.DataDesligPes"
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
    Bottom =185
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =118
        Top =13
        Right =262
        Bottom =251
        Top =0
        Name ="csPessDemanEspec"
        Name =""
    End
    Begin
        Left =322
        Top =-7
        Right =466
        Bottom =254
        Top =0
        Name ="TbPBF08"
        Name =""
    End
End
