Operation =1
Option =0
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbAtend.Social)="
    "Yes)) OR (((TbAtend.Psicologico)=Yes)) OR (((TbAtend.Multidisciplinar)=Yes)) OR "
    "(((TbAtend.OrientadorSoc)=Yes)) OR (((TbAtend.Administrativo)=Yes))"
Begin InputTables
    Name ="TbAtend"
    Name ="TbCadFuncionario"
End
Begin OutputColumns
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Data"
    Expression ="TbAtend.Nome"
    Alias ="Funcionario"
    Expression ="TbCadFuncionario.Nome"
    Expression ="TbAtend.FuncaoFuncionario"
    Expression ="TbAtend.Social"
    Expression ="TbAtend.Psicologico"
    Expression ="TbAtend.Multidisciplinar"
    Expression ="TbAtend.OrientadorSoc"
    Expression ="TbAtend.Administrativo"
    Expression ="TbAtend.AtGestao"
End
Begin Joins
    LeftTable ="TbAtend"
    RightTable ="TbCadFuncionario"
    Expression ="TbAtend.CodFunc = TbCadFuncionario.CodFunc"
    Flag =1
End
Begin OrderBy
    Expression ="TbCadFuncionario.Nome"
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
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbAtend.Psicologico"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1155"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAtend.Social"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1215"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAtend.AtGestao"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.FuncaoFuncionario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.OrientadorSoc"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1365"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAtend.Multidisciplinar"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="915"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="Funcionario"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2580"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAtend.Administrativo"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1375
    Bottom =660
    Left =-1
    Top =-1
    Right =1351
    Bottom =292
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =74
        Top =13
        Right =268
        Bottom =293
        Top =0
        Name ="TbAtend"
        Name =""
    End
    Begin
        Left =316
        Top =12
        Right =460
        Bottom =156
        Top =0
        Name ="TbCadFuncionario"
        Name =""
    End
End
