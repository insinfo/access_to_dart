Operation =1
Option =0
Where ="(((TbAcompDet.[PAF inicio]) Is Not Null) AND ((TbAcompDet.DataDesl) Is Null))"
Begin InputTables
    Name ="csPBFDistinct"
    Name ="TbPessoa"
    Name ="TbAcomp"
    Name ="TbAcompDet"
End
Begin OutputColumns
    Expression ="TbAcomp.Nome"
    Expression ="csPBFDistinct.TITULAR"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.DataDesl"
End
Begin Joins
    LeftTable ="csPBFDistinct"
    RightTable ="TbPessoa"
    Expression ="csPBFDistinct.TITULAR = TbPessoa.Nome"
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
        dbText "Name" ="csPBFDistinct.TITULAR"
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
    Begin
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =95
    Top =26
    Right =979
    Bottom =422
    Left =-1
    Top =-1
    Right =860
    Bottom =174
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =22
        Top =41
        Right =166
        Bottom =185
        Top =0
        Name ="csPBFDistinct"
        Name =""
    End
    Begin
        Left =202
        Top =36
        Right =346
        Bottom =242
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =529
        Top =25
        Right =673
        Bottom =169
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =713
        Top =28
        Right =857
        Bottom =172
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
End
