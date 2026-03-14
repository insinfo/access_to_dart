Operation =1
Option =0
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbAtend"
End
Begin OutputColumns
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Data"
    Expression ="TbAtend.NomeFunc"
    Expression ="TbAtend.FuncaoFuncionario"
    Expression ="TbAtend.Nome"
    Expression ="TbAtend.VD"
    Expression ="TbAtend.VDLFR"
    Expression ="TbAtend.VDCDL"
    Expression ="TbAtend.VDDCP"
    Expression ="TbAtend.VDDPAF"
    Expression ="TbAtend.VDAMF"
    Expression ="TbAtend.VDFVI"
    Expression ="TbAtend.VDAMD"
    Expression ="TbAtend.VDASF"
    Expression ="TbAtend.VDPBF"
    Expression ="TbAtend.VDSCFV"
    Expression ="TbAtend.VDOUT"
    Expression ="TbAtend.[QUAL VD]"
    Expression ="TbAtend.[VD NAO LOCALIZADA]"
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
        dbText "Name" ="TbAtend.[VD NAO LOCALIZADA]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.FuncaoFuncionario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.NomeFunc"
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
        dbText "Name" ="TbAtend.VDCDL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDLFR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDDCP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDDPAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDAMF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDFVI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDAMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDASF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDOUT"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.[QUAL VD]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VD"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-197
    Top =39
    Right =995
    Bottom =659
    Left =-1
    Top =-1
    Right =1168
    Bottom =272
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =387
        Bottom =341
        Top =0
        Name ="TbAtend"
        Name =""
    End
End
