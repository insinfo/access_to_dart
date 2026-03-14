Operation =1
Option =0
Where ="(((TbAcompDet.DataDesl) Is Null Or (TbAcompDet.DataDesl)>=[DATA FINAL]))"
Begin InputTables
    Name ="BPC"
    Name ="TbPessoa"
    Name ="TbAcomp"
    Name ="TbAcompDet"
End
Begin OutputColumns
    Expression ="BPC.NomeTitular"
    Expression ="TbPessoa.Nome"
    Expression ="TbAcomp.Nome"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.DataDesl"
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
Begin
    Begin
        dbText "Name" ="TbPessoa.Nome"
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
        dbText "Name" ="BPC.NomeTitular"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-25
    Top =77
    Right =1101
    Bottom =561
    Left =-1
    Top =-1
    Right =1102
    Bottom =67
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =104
        Top =10
        Right =284
        Bottom =272
        Top =0
        Name ="BPC"
        Name =""
    End
    Begin
        Left =417
        Top =26
        Right =561
        Bottom =264
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =617
        Top =2
        Right =761
        Bottom =146
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =822
        Top =30
        Right =966
        Bottom =174
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
End
