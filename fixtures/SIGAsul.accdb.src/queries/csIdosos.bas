Operation =1
Option =0
Where ="(((Int(DateDiff(\"d\",[DNasc],Date())/365.25))>=60))"
Begin InputTables
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[DNasc],Date())/365.25)"
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
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1161
    Bottom =660
    Left =-1
    Top =-1
    Right =1093
    Bottom =270
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =173
        Top =41
        Right =418
        Bottom =280
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
