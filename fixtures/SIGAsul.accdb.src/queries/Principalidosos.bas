Operation =1
Option =2
Where ="(((Int(DateDiff(\"d\",[TbPessoa].[DNasc],[DATA FINAL])/365.25))>=60))"
Begin InputTables
    Name ="TbPessoa"
    Name ="BPC"
End
Begin OutputColumns
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.BPCI"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],[DATA FINAL])/365.25)"
    Expression ="BPC.NomeTitular"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="BPC"
    Expression ="TbPessoa.Nome = BPC.NomeTitular"
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
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.BPCI"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.NomeTitular"
        dbInteger "ColumnWidth" ="3270"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
End
Begin
    State =0
    Left =52
    Top =16
    Right =1161
    Bottom =570
    Left =-1
    Top =-1
    Right =1085
    Bottom =351
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =124
        Top =17
        Right =258
        Bottom =349
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =437
        Top =4
        Right =581
        Bottom =338
        Top =0
        Name ="BPC"
        Name =""
    End
End
