Operation =1
Option =0
Begin InputTables
    Name ="csIdosos"
    Name ="BPC"
End
Begin OutputColumns
    Expression ="csIdosos.Nome"
End
Begin Joins
    LeftTable ="csIdosos"
    RightTable ="BPC"
    Expression ="csIdosos.Nome = BPC.NomeTitular"
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
        dbText "Name" ="csIdosos.Nome"
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
        dbText "Name" ="csIdosos.Idade"
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
    Bottom =219
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =78
        Top =34
        Right =222
        Bottom =190
        Top =0
        Name ="csIdosos"
        Name =""
    End
    Begin
        Left =248
        Top =35
        Right =392
        Bottom =191
        Top =0
        Name ="BPC"
        Name =""
    End
End
