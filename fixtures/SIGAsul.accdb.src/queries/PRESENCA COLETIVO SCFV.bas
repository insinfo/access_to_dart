Operation =1
Option =0
Where ="(((TbAtColetivo.AtividadeSCFV)=Yes)) OR (((TbAtColetivo.OfSESCFV)=Yes))"
Begin InputTables
    Name ="TbAtColetivo"
    Name ="TbAtColetivoDet"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbAtColetivo.CodColetivo"
    Expression ="TbAtColetivoDet.CodAtColetDet"
    Expression ="TbAtColetivo.DataCol"
    Expression ="TbAtColetivo.GRUPOSCFV"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbAtColetivo.OFICINEIRO"
    Expression ="TbAtColetivo.horario"
    Expression ="TbAtColetivo.fxetariadoscfv"
    Expression ="TbAtColetivo.AtividadeSCFV"
    Expression ="TbAtColetivo.OfSESCFV"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbAtColetivo.DataCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.GRUPOSCFV"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2490"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAtColetivo.CodColetivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.OFICINEIRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.fxetariadoscfv"
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
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivoDet.CodAtColetDet"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =59
    Top =57
    Right =1103
    Bottom =624
    Left =-1
    Top =-1
    Right =1020
    Bottom =195
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =91
        Top =14
        Right =235
        Bottom =291
        Top =0
        Name ="TbAtColetivo"
        Name =""
    End
    Begin
        Left =313
        Top =20
        Right =457
        Bottom =260
        Top =0
        Name ="TbAtColetivoDet"
        Name =""
    End
    Begin
        Left =505
        Top =12
        Right =649
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
