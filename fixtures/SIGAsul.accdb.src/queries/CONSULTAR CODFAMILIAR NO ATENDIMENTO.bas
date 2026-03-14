Operation =1
Option =0
Begin InputTables
    Name ="TbAtend"
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Data"
    Expression ="TbAtend.Nome"
    Expression ="CadResidencia.CodFam"
    Expression ="CadResidencia.Volante"
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
dbBoolean "TotalsRow" ="0"
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbInteger "ColumnWidth" ="3990"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =72
    Top =26
    Right =858
    Bottom =646
    Left =-1
    Top =-1
    Right =1173
    Bottom =292
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =281
        Bottom =324
        Top =0
        Name ="TbAtend"
        Name =""
    End
    Begin
        Left =695
        Top =22
        Right =839
        Bottom =166
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =360
        Top =16
        Right =504
        Bottom =160
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
