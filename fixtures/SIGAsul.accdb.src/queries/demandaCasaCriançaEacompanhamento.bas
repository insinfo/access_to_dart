Operation =1
Option =2
Where ="(((TbAcompDet.DataDesl) Is Null Or (TbAcompDet.DataDesl)>[DATA FINAL]))"
Begin InputTables
    Name ="TbAcomp"
    Name ="TbAcompDet"
    Name ="csDemandaCasaCriança"
End
Begin OutputColumns
    Expression ="TbAcomp.CodAcomp"
    Expression ="TbAcomp.Nome"
    Expression ="csDemandaCasaCriança.Nome"
    Expression ="TbAcompDet.NomeTec"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.[PAF fim]"
    Expression ="TbAcompDet.DataDesl"
End
Begin Joins
    LeftTable ="TbAcomp"
    RightTable ="TbAcompDet"
    Expression ="TbAcomp.CodAcomp = TbAcompDet.CodAcomp"
    Flag =1
    LeftTable ="csDemandaCasaCriança"
    RightTable ="TbAcomp"
    Expression ="csDemandaCasaCriança.Nome = TbAcomp.Nome"
    Flag =3
End
Begin OrderBy
    Expression ="TbAcompDet.DataDesl"
    Flag =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="3210"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcompDet.NomeTec"
        dbInteger "ColumnWidth" ="2235"
        dbBoolean "ColumnHidden" ="0"
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
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1200"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcomp.CodAcomp"
        dbInteger "ColumnWidth" ="720"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaCasaCriança.Nome"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="2850"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="csDemandaCasaCriança.[CRAS Origem]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaCasaCriança.CodFam"
        dbInteger "ColumnWidth" ="1110"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.CodAcompDet"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =36
    Top =24
    Right =986
    Bottom =661
    Left =-1
    Top =-1
    Right =1476
    Bottom =348
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =83
        Top =23
        Right =227
        Bottom =257
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =517
        Top =-4
        Right =661
        Bottom =211
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
    Begin
        Left =327
        Top =95
        Right =471
        Bottom =239
        Top =0
        Name ="csDemandaCasaCriança"
        Name =""
    End
End
