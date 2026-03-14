Operation =1
Option =2
Where ="(((csRMAD8.OfSESCFV)=Yes)) OR (((csRMAD8.AtividadeSCFV)=Yes))"
Begin InputTables
    Name ="csRMAD8"
End
Begin OutputColumns
    Expression ="csRMAD8.Nome"
    Expression ="csRMAD8.Idade"
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
        dbText "Name" ="csRMAD8.Nome"
        dbLong "AggregateType" ="-1"
    End
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
        dbText "Name" ="csRMAD8.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD8.OfSESCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csRMAD8.AtividadeSCFV"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1089
    Bottom =660
    Left =-1
    Top =-1
    Right =1021
    Bottom =208
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="csRMAD8"
        Name =""
    End
End
