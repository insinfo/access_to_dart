Operation =1
Option =0
Where ="(((CadResidencia.DataCad)=[Data]) AND ((TbAtend.Data) Between [DATA INICIAL] And"
    " [DATA FINAL]))"
Begin InputTables
    Name ="TbAtend"
    Name ="TbPessoa"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="TbAtend.CodAtend"
    Expression ="CadResidencia.DataCad"
    Expression ="TbPessoa.Nome"
    Expression ="TbAtend.Data"
    Expression ="TbAtend.Administrativo"
    Expression ="TbAtend.Social"
    Expression ="TbAtend.Psicologico"
    Expression ="TbAtend.MULTIDISCIPLINAR"
    Expression ="TbAtend.OrientadorSoc"
    Expression ="TbAtend.AtGestao"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAtend"
    Expression ="TbPessoa.CodPessoa = TbAtend.Nome"
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
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.OrientadorSoc"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="3015"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAtend.AtGestao"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.Administrativo"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="2160"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAtend.MULTIDISCIPLINAR"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1200"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAtend.Psicologico"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.Social"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =42
    Top =60
    Right =1184
    Bottom =627
    Left =-1
    Top =-1
    Right =1118
    Bottom =-1
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =277
        Top =14
        Right =490
        Bottom =272
        Top =0
        Name ="TbAtend"
        Name =""
    End
    Begin
        Left =729
        Top =0
        Right =873
        Bottom =184
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =911
        Top =12
        Right =1055
        Bottom =156
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
