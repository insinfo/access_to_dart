Operation =1
Option =0
Begin InputTables
    Name ="TbAtColetivo"
    Name ="TbAtColetivoDet"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbAtColetivo.CodColetivo"
    Expression ="TbAtColetivoDet.Nome"
    Expression ="TbAtColetivo.DataCol"
    Expression ="TbAtColetivo.OfSESCFV"
    Expression ="TbAtColetivo.AtividadeSCFV"
    Expression ="TbAtColetivo.GruposPAIF"
    Expression ="TbAtColetivo.MediacoesPAIF"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
End
Begin Joins
    LeftTable ="TbAtColetivo"
    RightTable ="TbAtColetivoDet"
    Expression ="TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAtColetivoDet"
    Expression ="TbPessoa.CodPessoa = TbAtColetivoDet.Nome"
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
        dbText "Name" ="TbAtColetivoDet.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.CodColetivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.AtividadeSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.OfSESCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.DataCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.MediacoesPAIF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.GruposPAIF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
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
End
Begin
    State =0
    Left =0
    Top =40
    Right =1617
    Bottom =857
    Left =-1
    Top =-1
    Right =1593
    Bottom =455
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =476
        Top =66
        Right =620
        Bottom =272
        Top =0
        Name ="TbAtColetivo"
        Name =""
    End
    Begin
        Left =276
        Top =82
        Right =425
        Bottom =243
        Top =0
        Name ="TbAtColetivoDet"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =399
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
