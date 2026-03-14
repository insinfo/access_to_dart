Operation =1
Option =0
Where ="(((Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)) Between 4 And 6))"
Begin InputTables
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Expression ="TbPessoa.[Renda per capita]"
End
Begin OrderBy
    Expression ="TbPessoa.[Renda per capita]"
    Flag =0
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
        dbText "Name" ="TbPessoa.[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
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
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =113
    Top =47
    Right =1225
    Bottom =707
    Left =-1
    Top =-1
    Right =1088
    Bottom =239
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =636
        Top =14
        Right =921
        Bottom =405
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
