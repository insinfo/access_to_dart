Operation =1
Option =2
Where ="(((TbPessoa.Autismo)=Yes)) OR (((TbPessoa.Cegueira)=Yes)) OR (((TbPessoa.[Baixa "
    "visão])=Yes)) OR (((TbPessoa.[Surdez severa profunda])=Yes)) OR (((TbPessoa.[Sur"
    "dez leve moderada])=Yes)) OR (((TbPessoa.[Deficiencia fisica])=Yes)) OR (((TbPes"
    "soa.[Defic mental intelec])=Yes))"
Begin InputTables
    Name ="TbPessoa"
    Name ="BPC"
End
Begin OutputColumns
    Expression ="BPC.NomeTitular"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.BPCD"
    Expression ="TbPessoa.BPCI"
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
        dbText "Name" ="TbPessoa.BPCD"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="BPC.NomeTitular"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.Cegueira"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Defic mental intelec]"
        dbInteger "ColumnWidth" ="2010"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Deficiencia fisica]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Surdez leve moderada]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Surdez severa profunda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Baixa visão]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =62
    Top =18
    Right =1171
    Bottom =582
    Left =-1
    Top =-1
    Right =1085
    Bottom =251
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =308
        Bottom =299
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =356
        Top =12
        Right =500
        Bottom =269
        Top =0
        Name ="BPC"
        Name =""
    End
End
