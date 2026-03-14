Operation =1
Option =0
Where ="(((BPC.CRAS) Like [DIGITE O CRAS]+\"*\"))"
Begin InputTables
    Name ="BPC"
    Name ="TbPessoa"
    Name ="TbAcomp"
    Name ="TbAcompDet"
End
Begin OutputColumns
    Expression ="BPC.NomeTitular"
    Expression ="TbAcomp.Nome"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.DataDesl"
    Expression ="BPC.CRAS"
End
Begin Joins
    LeftTable ="BPC"
    RightTable ="TbPessoa"
    Expression ="BPC.[NomeTitular] = TbPessoa.Nome"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="BPC.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
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
        dbText "Name" ="BPC.[NomeTitular]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.NomeTitular"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =7
    Top =33
    Right =1133
    Bottom =517
    Left =-1
    Top =-1
    Right =1102
    Bottom =182
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="BPC"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =156
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =624
        Top =12
        Right =768
        Bottom =156
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
End
