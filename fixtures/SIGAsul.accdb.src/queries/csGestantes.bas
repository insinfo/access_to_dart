Operation =1
Option =0
Where ="(((TbGestDet.DataDesl) Is Null))"
Begin InputTables
    Name ="TbGestDet"
    Name ="TbGestante"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbPessoa.Nome"
    Expression ="TbGestDet.DataCad"
    Expression ="TbGestDet.DataDesl"
    Expression ="TbPessoa.CodPessoa"
End
Begin Joins
    LeftTable ="TbGestante"
    RightTable ="TbGestDet"
    Expression ="TbGestante.CodGestante = TbGestDet.CodGestante"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbGestante"
    Expression ="TbPessoa.CodPessoa = TbGestante.Nome"
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
    Left =44
    Top =93
    Right =1115
    Bottom =660
    Left =-1
    Top =-1
    Right =1047
    Bottom =253
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =537
        Top =30
        Right =681
        Bottom =193
        Top =0
        Name ="TbGestDet"
        Name =""
    End
    Begin
        Left =327
        Top =14
        Right =471
        Bottom =158
        Top =0
        Name ="TbGestante"
        Name =""
    End
    Begin
        Left =100
        Top =21
        Right =244
        Bottom =165
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
