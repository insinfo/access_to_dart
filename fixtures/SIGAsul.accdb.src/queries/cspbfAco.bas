Operation =1
Option =0
Where ="(((TbAcompDet.DataDesl) Is Null Or (TbAcompDet.DataDesl)>=[DATA FINAL]))"
Begin InputTables
    Name ="cs distinct pbf cras"
    Name ="TbPessoa"
    Name ="TbAcompDet"
    Name ="TbAcomp"
End
Begin OutputColumns
    Expression ="TbAcomp.Nome"
    Expression ="[cs distinct pbf cras].TITULAR"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.DataDesl"
End
Begin Joins
    LeftTable ="cs distinct pbf cras"
    RightTable ="TbPessoa"
    Expression ="[cs distinct pbf cras].Nome = TbPessoa.Nome"
    Flag =1
    LeftTable ="TbAcompDet"
    RightTable ="TbAcomp"
    Expression ="TbAcompDet.CodAcomp = TbAcomp.CodAcomp"
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
        dbText "Name" ="[cs distinct pbf cras].TITULAR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcodet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcodet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcodet.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.DataDesl"
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
        dbText "Name" ="TbAcompDet.Nome"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =88
    Top =146
    Right =1074
    Bottom =541
    Left =-1
    Top =-1
    Right =962
    Bottom =137
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =650
        Top =5
        Right =794
        Bottom =149
        Top =0
        Name ="cs distinct pbf cras"
        Name =""
    End
    Begin
        Left =469
        Top =-3
        Right =613
        Bottom =185
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =79
        Top =47
        Right =223
        Bottom =191
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
    Begin
        Left =286
        Top =17
        Right =430
        Bottom =161
        Top =0
        Name ="TbAcomp"
        Name =""
    End
End
