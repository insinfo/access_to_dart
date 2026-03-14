Operation =1
Option =0
Begin InputTables
    Name ="csGestantes"
    Name ="BPC"
End
Begin OutputColumns
    Expression ="csGestantes.Nome"
End
Begin Joins
    LeftTable ="csGestantes"
    RightTable ="BPC"
    Expression ="csGestantes.Nome = BPC.NomeTitular"
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
Begin
    Begin
        dbText "Name" ="csGestantes.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGestDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGestDet.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =88
    Top =146
    Right =1192
    Bottom =660
    Left =-1
    Top =-1
    Right =1080
    Bottom =219
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =100
        Top =20
        Right =244
        Bottom =237
        Top =0
        Name ="csGestantes"
        Name =""
    End
    Begin
        Left =327
        Top =17
        Right =471
        Bottom =237
        Top =0
        Name ="BPC"
        Name =""
    End
End
