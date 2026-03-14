Operation =1
Option =0
Begin InputTables
    Name ="CADUNICO"
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="CADUNICO.CODFAM"
    Expression ="CADUNICO.CRAS"
    Expression ="CADUNICO.NOME"
    Expression ="CADUNICO.NIS"
    Expression ="CADUNICO.SEXO"
    Expression ="CADUNICO.DNASC"
    Expression ="TbPessoa.DNasc"
    Expression ="TbPessoa.CPF"
    Expression ="CADUNICO.CPF"
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
        dbText "Name" ="CADUNICO.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.SEXO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.NOME"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2520"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="CADUNICO.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CODFAM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DNASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1109
    Bottom =677
    Left =-1
    Top =-1
    Right =1085
    Bottom =283
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =157
        Top =18
        Right =301
        Bottom =248
        Top =0
        Name ="CADUNICO"
        Name =""
    End
    Begin
        Left =697
        Top =27
        Right =841
        Bottom =268
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =385
        Top =12
        Right =529
        Bottom =288
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
