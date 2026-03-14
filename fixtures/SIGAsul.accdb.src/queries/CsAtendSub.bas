Operation =1
Option =0
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]) AND ((CadResidencia.Da"
    "taCad)<[Data]))"
Begin InputTables
    Name ="TbAtend"
    Name ="TbPessoa"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Data"
    Expression ="CadResidencia.DataCad"
    Expression ="TbPessoa.Nome"
    Expression ="TbAtend.NomeFunc"
    Expression ="TbAtend.FuncaoFuncionario"
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
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="-1"
dbMemo "OrderBy" ="[CsAtendSub].[FuncaoFuncionario], [CsAtendSub].[Nome], [CsAtendSub].[DataCad]"
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
        dbText "Name" ="TbAtend.MULTIDISCIPLINAR"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.OrientadorSoc"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.AtGestao"
        dbLong "AggregateType" ="2"
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
        dbText "Name" ="TbAtend.Administrativo"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.FuncaoFuncionario"
        dbInteger "ColumnWidth" ="2370"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.NomeFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1201
    Bottom =736
    Left =-1
    Top =-1
    Right =1177
    Bottom =144
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
        Left =933
        Top =8
        Right =1077
        Bottom =152
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
