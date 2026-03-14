Operation =1
Option =2
Begin InputTables
    Name ="csRMAD3"
End
Begin OutputColumns
    Expression ="csRMAD3.Nome"
    Expression ="csRMAD3.Idade"
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
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataCadPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.DataCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.CodColetivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD3.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD3.Idade"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1113
    Bottom =660
    Left =-1
    Top =-1
    Right =1045
    Bottom =169
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =225
        Top =-3
        Right =369
        Bottom =170
        Top =0
        Name ="csRMAD3"
        Name =""
    End
End
