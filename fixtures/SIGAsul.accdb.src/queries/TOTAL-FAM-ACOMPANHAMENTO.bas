Operation =1
Option =0
Where ="(((TbAcompDet.DataDesl) Is Null))"
Begin InputTables
    Name ="TbAcomp"
    Name ="TbAcompDet"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbAcomp.CodAcomp"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Nome"
    Expression ="TbAcomp.DataIncl"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.[PAF fim]"
    Expression ="TbAcompDet.DataDesl"
End
Begin Joins
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
        dbText "Name" ="TbAcomp.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.DataIncl"
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
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1175
    Bottom =660
    Left =-1
    Top =-1
    Right =1151
    Bottom =309
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =284
        Top =17
        Right =428
        Bottom =161
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =54
        Top =4
        Right =198
        Bottom =305
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
    Begin
        Left =550
        Top =-3
        Right =694
        Bottom =141
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
