Operation =1
Option =0
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbAtend"
    Name ="CadResidencia"
    Name ="TbPessoa"
    Name ="TbCadFuncionario"
End
Begin OutputColumns
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Data"
    Expression ="CadResidencia.DataCad"
    Expression ="TbAtend.Nome"
    Expression ="TbCadFuncionario.Nome"
    Expression ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
    Expression ="TbAtend.FuncaoFuncionario"
    Expression ="TbAtend.Administrativo"
    Expression ="TbAtend.Social"
    Expression ="TbAtend.Psicologico"
    Expression ="TbAtend.MULTIDISCIPLINAR"
    Expression ="TbAtend.OrientadorSoc"
    Expression ="TbAtend.AtGestao"
    Expression ="TbAtend.[Acolhida Coletiva]"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
    LeftTable ="TbCadFuncionario"
    RightTable ="TbAtend"
    Expression ="TbCadFuncionario.CodFunc = TbAtend.CodFunc"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAtend"
    Expression ="TbPessoa.CodPessoa = TbAtend.Nome"
    Flag =1
End
Begin OrderBy
    Expression ="TbAtend.Nome"
    Flag =0
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
dbMemo "OrderBy" ="[csAtendPeriodo].[FuncaoFuncionario]"
Begin
    Begin
        dbText "Name" ="TbAtend.AtGestao"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="3945"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
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
        dbText "Name" ="TbAtend.OrientadorSoc"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.MULTIDISCIPLINAR"
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
    Begin
        dbText "Name" ="TbAtend.FuncaoFuncionario"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1995"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.Nome"
        dbInteger "ColumnWidth" ="2250"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
        dbInteger "ColumnWidth" ="1890"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[Acolhida Coletiva]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-117
    Top =20
    Right =1084
    Bottom =716
    Left =-1
    Top =-1
    Right =1177
    Bottom =133
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =263
        Top =10
        Right =519
        Bottom =266
        Top =0
        Name ="TbAtend"
        Name =""
    End
    Begin
        Left =783
        Top =29
        Right =927
        Bottom =173
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =544
        Top =12
        Right =688
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =45
        Top =45
        Right =189
        Bottom =189
        Top =0
        Name ="TbCadFuncionario"
        Name =""
    End
End
