Operation =1
Option =0
Where ="(((TbAcoRetorno.Compareceu)=Yes))"
Begin InputTables
    Name ="TbAcomp"
    Name ="TbAcoRetorno"
End
Begin OutputColumns
    Expression ="TbAcoRetorno.CodAcoRetorno"
    Expression ="TbAcoRetorno.DataRetorno"
    Expression ="TbAcoRetorno.Compareceu"
End
Begin Joins
    LeftTable ="TbAcomp"
    RightTable ="TbAcoRetorno"
    Expression ="TbAcomp.CodAcomp = TbAcoRetorno.CodAcomp"
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
        dbText "Name" ="TbAcoRetorno.Compareceu"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcoRetorno.DataRetorno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcoRetorno.CodAcoRetorno"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1180
    Bottom =660
    Left =-1
    Top =-1
    Right =1156
    Bottom =255
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =337
        Top =75
        Right =481
        Bottom =219
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =594
        Top =60
        Right =738
        Bottom =328
        Top =0
        Name ="TbAcoRetorno"
        Name =""
    End
End
