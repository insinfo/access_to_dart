Operation =1
Option =0
Begin InputTables
    Name ="TbAtend"
    Name ="csACOultimaAtualização"
End
Begin OutputColumns
    Expression ="TbAtend.Data"
    Expression ="TbAtend.Nome"
    Expression ="csACOultimaAtualização.[MáxDeDATA ATUALIZ]"
    Expression ="TbAtend.Volante"
End
Begin Joins
    LeftTable ="csACOultimaAtualização"
    RightTable ="TbAtend"
    Expression ="csACOultimaAtualização.CodPessoa = TbAtend.Nome"
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
        dbText "Name" ="csACOultimaAtualização.[MáxDeDATA ATUALIZ]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =198
    Top =63
    Right =835
    Bottom =642
    Left =-1
    Top =-1
    Right =613
    Bottom =241
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =319
        Bottom =316
        Top =0
        Name ="TbAtend"
        Name =""
    End
    Begin
        Left =405
        Top =6
        Right =642
        Bottom =316
        Top =0
        Name ="csACOultimaAtualização"
        Name =""
    End
End
