Operation =1
Option =0
Where ="(((Int(DateDiff(\"d\",[CS PESSOA PARA FICHA SCFV].[DNasc],Date())/365.25)) Betwe"
    "en 15 And 17))"
Begin InputTables
    Name ="CS PESSOA PARA FICHA SCFV"
    Name ="csACOatualizado"
End
Begin OutputColumns
    Expression ="[CS PESSOA PARA FICHA SCFV].TbPessoa.CodFam"
    Expression ="[CS PESSOA PARA FICHA SCFV].Nome"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[CS PESSOA PARA FICHA SCFV].[DNasc],Date())/365.25)"
    Expression ="csACOatualizado.[PAF inicio]"
End
Begin Joins
    LeftTable ="CS PESSOA PARA FICHA SCFV"
    RightTable ="csACOatualizado"
    Expression ="[CS PESSOA PARA FICHA SCFV].TbPessoa.CodFam = csACOatualizado.CodFam"
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
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS PESSOA PARA FICHA SCFV].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS PESSOA PARA FICHA SCFV].TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csACOatualizado.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1127
    Bottom =660
    Left =-1
    Top =-1
    Right =1103
    Bottom =309
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =477
        Top =18
        Right =700
        Bottom =347
        Top =0
        Name ="CS PESSOA PARA FICHA SCFV"
        Name =""
    End
    Begin
        Left =113
        Top =24
        Right =377
        Bottom =327
        Top =0
        Name ="csACOatualizado"
        Name =""
    End
End
