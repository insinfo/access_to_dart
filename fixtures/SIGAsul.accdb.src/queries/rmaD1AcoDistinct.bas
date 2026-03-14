Operation =1
Option =0
Where ="(((TbAcompDet.DataDesl) Is Null Or (TbAcompDet.DataDesl)>[DATA FINAL]))"
Begin InputTables
    Name ="csRMAD1distinct"
    Name ="TbAcomp"
    Name ="TbAcompDet"
End
Begin OutputColumns
    Expression ="TbAcomp.Nome"
    Expression ="TbAcompDet.DataDesl"
End
Begin Joins
    LeftTable ="csRMAD1distinct"
    RightTable ="TbAcomp"
    Expression ="csRMAD1distinct.Nome = TbAcomp.Nome"
    Flag =1
    LeftTable ="TbAcomp"
    RightTable ="TbAcompDet"
    Expression ="TbAcomp.CodAcomp = TbAcompDet.CodAcomp"
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
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1088
    Bottom =660
    Left =-1
    Top =-1
    Right =1020
    Bottom =239
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =73
        Top =6
        Right =276
        Bottom =202
        Top =0
        Name ="csRMAD1distinct"
        Name =""
    End
    Begin
        Left =324
        Top =12
        Right =468
        Bottom =156
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =516
        Top =12
        Right =660
        Bottom =240
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
End
