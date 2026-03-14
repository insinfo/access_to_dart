Operation =1
Option =0
Where ="(((TbAcompDet.[PAF fim]) Is Null Or (TbAcompDet.[PAF fim])>[DATA FINAL]))"
Begin InputTables
    Name ="TbAcompDet"
    Name ="TbAcomp"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Nome"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.DataDesl"
    Expression ="TbAcompDet.[PAF fim]"
End
Begin Joins
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
        dbText "Name" ="TbAcompDet.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FILTRO DEMANDA ATENDIMENTO].USUÁRIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.DataIncl"
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
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1106
    Bottom =660
    Left =-1
    Top =-1
    Right =1082
    Bottom =309
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =278
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =296
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
