Operation =1
Option =0
Begin InputTables
    Name ="TbPessoa"
    Name ="CADUNICO"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="CADUNICO.NOME"
    Expression ="CadResidencia.Volante"
    Expression ="TbPessoa.Nome"
    Expression ="CADUNICO.DNASC"
    Expression ="CADUNICO.DATAATUALIZ"
    Expression ="TbPessoa.CodFam"
    Expression ="CadResidencia.CodFam"
    Expression ="CadResidencia.CADUNICO"
    Expression ="CadResidencia.DATAATCAD"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="CADUNICO"
    Expression ="TbPessoa.Nome = CADUNICO.NOME"
    Flag =1
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
End
Begin OrderBy
    Expression ="CADUNICO.NOME"
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
        dbText "Name" ="CADUNICO.DATAATUALIZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DNASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.Nome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2700"
        dbBoolean "ColumnHidden" ="0"
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
        dbText "Name" ="CadResidencia.CADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DATAATCAD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =21
    Top =20
    Right =1029
    Bottom =504
    Left =-1
    Top =-1
    Right =984
    Bottom =188
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =405
        Top =12
        Right =549
        Bottom =247
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =76
        Top =18
        Right =333
        Bottom =277
        Top =0
        Name ="CADUNICO"
        Name =""
    End
    Begin
        Left =607
        Top =13
        Right =751
        Bottom =255
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
