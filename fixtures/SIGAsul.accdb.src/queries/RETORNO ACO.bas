Operation =1
Option =0
Where ="(((TbAcoRetorno.Compareceu)=No) AND ((Month([DataRetorno]))=Month(Date())) AND ("
    "(TbAcompDet.DataDesl) Is Null))"
Begin InputTables
    Name ="TbAcomp"
    Name ="TbAcompDet"
    Name ="TbAcoRetorno"
End
Begin OutputColumns
    Expression ="TbAcomp.Nome"
    Expression ="TbAcompDet.NomeTec"
    Expression ="TbAcoRetorno.DataRetorno"
    Expression ="TbAcoRetorno.Compareceu"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.[PAF fim]"
    Expression ="TbAcoRetorno.Historico"
    Expression ="TbAcoRetorno.Obs"
End
Begin Joins
    LeftTable ="TbAcomp"
    RightTable ="TbAcompDet"
    Expression ="TbAcomp.CodAcomp = TbAcompDet.CodAcomp"
    Flag =1
    LeftTable ="TbAcomp"
    RightTable ="TbAcoRetorno"
    Expression ="TbAcomp.CodAcomp = TbAcoRetorno.CodAcomp"
    Flag =1
End
Begin OrderBy
    Expression ="TbAcoRetorno.DataRetorno"
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
        dbText "Name" ="TbAcompDet.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcoRetorno.Compareceu"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcoRetorno.DataRetorno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.NomeTec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcoRetorno.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcoRetorno.Historico"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1303
    Bottom =648
    Left =-1
    Top =-1
    Right =1279
    Bottom =390
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =267
        Top =26
        Right =411
        Bottom =170
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =60
        Top =48
        Right =268
        Bottom =391
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
    Begin
        Left =470
        Top =46
        Right =614
        Bottom =272
        Top =0
        Name ="TbAcoRetorno"
        Name =""
    End
End
