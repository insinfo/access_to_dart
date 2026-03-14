Operation =1
Option =2
Begin InputTables
    Name ="PRESENCA SCFV"
End
Begin OutputColumns
    Expression ="[PRESENCA SCFV].TbAtColetivoDet.Nome"
    Expression ="[PRESENCA SCFV].Idade"
    Expression ="[PRESENCA SCFV].DataDesl"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbSingle "ECLScaleFactor" ="1"
dbByte "RecordsetType" ="0"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="[PRESENCA SCFV].TbAtColetivoDet.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PRESENCA SCFV].Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PRESENCA SCFV].DataDesl"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1088
    Bottom =660
    Left =-1
    Top =-1
    Right =1064
    Bottom =173
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =258
        Top =0
        Name ="PRESENCA SCFV"
        Name =""
    End
End
