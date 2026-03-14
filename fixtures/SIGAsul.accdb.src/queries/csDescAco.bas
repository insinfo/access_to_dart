Operation =1
Option =0
Where ="(((TbAcompDet.DataDesl) Is Null Or (TbAcompDet.DataDesl)>=[DATA FINAL]))"
Begin InputTables
    Name ="csDescumprim"
    Name ="TbPessoa"
    Name ="TbAcomp"
    Name ="TbAcompDet"
End
Begin OutputColumns
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbPessoa.Nome"
    Expression ="TbAcomp.Nome"
    Expression ="csDescumprim.nomeDesc"
    Expression ="csDescumprim.nomeresp"
    Expression ="TbAcompDet.DataDesl"
End
Begin Joins
    LeftTable ="csDescumprim"
    RightTable ="TbPessoa"
    Expression ="csDescumprim.nomeDesc = TbPessoa.Nome"
    Flag =1
    LeftTable ="TbAcomp"
    RightTable ="TbAcompDet"
    Expression ="TbAcomp.CodAcomp = TbAcompDet.CodAcomp"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAcomp"
    Expression ="TbPessoa.CodPessoa = TbAcomp.Nome"
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
        dbText "Name" ="csDescumprim.nomeDesc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDescumprim.nomeresp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcodet.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcodet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcodet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1074
    Bottom =524
    Left =-1
    Top =-1
    Right =1006
    Bottom =195
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =141
        Top =2
        Right =285
        Bottom =253
        Top =0
        Name ="csDescumprim"
        Name =""
    End
    Begin
        Left =339
        Top =34
        Right =483
        Bottom =238
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =549
        Top =20
        Right =693
        Bottom =164
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =788
        Top =16
        Right =932
        Bottom =160
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
End
