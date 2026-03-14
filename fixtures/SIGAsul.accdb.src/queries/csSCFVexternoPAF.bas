Operation =1
Option =2
Where ="(((TbAcompDet.[PAF fim]) Is Not Null) AND ((TbAcompDet.DataDesl) Is Null))"
Begin InputTables
    Name ="SISC SCFV EXTERNO GRUPOS E RF"
    Name ="TbAcomp"
    Name ="TbAcompDet"
End
Begin OutputColumns
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].[SISC SCFV EXTERNO].NOME"
    Expression ="TbAcomp.CodAcomp"
    Expression ="TbAcomp.Nome"
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
    LeftTable ="SISC SCFV EXTERNO GRUPOS E RF"
    RightTable ="TbAcomp"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].CodPessoa = TbAcomp.Nome"
    Flag =1
End
Begin OrderBy
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].[SISC SCFV EXTERNO].NOME"
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
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="720"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF fim]"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1035"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2700"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].[SISC SCFV EXTERNO].NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.CodAcomp"
        dbInteger "ColumnWidth" ="915"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.NomeTec"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-108
    Top =28
    Right =1054
    Bottom =648
    Left =-1
    Top =-1
    Right =1138
    Bottom =272
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="SISC SCFV EXTERNO GRUPOS E RF"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
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
        Name ="TbAcompDet"
        Name =""
    End
End
