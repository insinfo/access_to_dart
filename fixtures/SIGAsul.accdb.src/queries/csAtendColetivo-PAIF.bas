Operation =1
Option =0
Begin InputTables
    Name ="TbAtColetivo"
    Name ="TbAtColetivoDet"
End
Begin OutputColumns
    Expression ="TbAtColetivoDet.CodColetivo"
    Expression ="TbAtColetivoDet.Nome"
    Expression ="TbAtColetivo.CodColetivo"
    Expression ="TbAtColetivo.DataCol"
    Expression ="TbAtColetivo.Tema"
    Expression ="TbAtColetivo.GruposPAIF"
    Expression ="TbAtColetivo.OfSESCFV"
    Expression ="TbAtColetivo.MediacoesPAIF"
    Expression ="TbAtColetivo.[0a5interno]"
    Expression ="TbAtColetivo.[6a11interno]"
    Expression ="TbAtColetivo.[12a14interno]"
    Expression ="TbAtColetivo.[15a17interno]"
    Expression ="TbAtColetivo.[18a29interno]"
    Expression ="TbAtColetivo.[30a59interno]"
    Expression ="TbAtColetivo.[60maisinterno]"
    Expression ="TbAtColetivo.[0a5externo]"
    Expression ="TbAtColetivo.[6a11externo]"
    Expression ="TbAtColetivo.[12a14externo]"
    Expression ="TbAtColetivo.[15a17externo]"
    Expression ="TbAtColetivo.[18a29externo]"
    Expression ="TbAtColetivo.[30a59externo]"
    Expression ="TbAtColetivo.[60maisexterno]"
End
Begin Joins
    LeftTable ="TbAtColetivo"
    RightTable ="TbAtColetivoDet"
    Expression ="TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo"
    Flag =1
    LeftTable ="TbAtColetivo"
    RightTable ="TbAtColetivoDet"
    Expression ="TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo"
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
        dbText "Name" ="TbAtColetivo.[18a29externo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.Tema"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.[60maisexterno]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.[12a14interno]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.GruposPAIF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivoDet.CodColetivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivoDet.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.MediacoesPAIF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.CodColetivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.DataCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.[15a17interno]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.OfSESCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.[0a5interno]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.[6a11interno]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.[18a29interno]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.[30a59interno]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.[60maisinterno]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.[0a5externo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.[6a11externo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.[12a14externo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.[15a17externo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.[30a59externo]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =140
    Top =9
    Right =1398
    Bottom =551
    Left =-1
    Top =-1
    Right =1234
    Bottom =220
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =64
        Top =14
        Right =208
        Bottom =266
        Top =0
        Name ="TbAtColetivo"
        Name =""
    End
    Begin
        Left =267
        Top =17
        Right =576
        Bottom =273
        Top =0
        Name ="TbAtColetivoDet"
        Name =""
    End
End
