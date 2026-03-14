Operation =1
Option =0
Where ="(((TbAcompDet.[PAF inicio]) Is Not Null))"
Begin InputTables
    Name ="csNumFamiliasAtend"
    Name ="TbAcomp"
    Name ="TbAcompDet"
End
Begin OutputColumns
    Expression ="csNumFamiliasAtend.CodFam"
    Expression ="TbAcomp.Nome"
    Expression ="TbAcompDet.[PAF inicio]"
End
Begin Joins
    LeftTable ="csNumFamiliasAtend"
    RightTable ="TbAcomp"
    Expression ="csNumFamiliasAtend.Nome = TbAcomp.Nome"
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
Begin
    Begin
        dbText "Name" ="csNumFamiliasAtend.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =108
    Right =1160
    Bottom =537
    Left =-1
    Top =-1
    Right =1092
    Bottom =112
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =75
        Top =17
        Right =219
        Bottom =161
        Top =0
        Name ="csNumFamiliasAtend"
        Name =""
    End
    Begin
        Left =290
        Top =12
        Right =434
        Bottom =156
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =492
        Top =9
        Right =636
        Bottom =245
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
End
