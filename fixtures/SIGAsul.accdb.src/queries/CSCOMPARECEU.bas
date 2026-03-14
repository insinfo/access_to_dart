Operation =1
Option =0
Begin InputTables
    Name ="TbAcomp"
    Name ="TbAcoRetorno"
End
Begin OutputColumns
    Expression ="TbAcomp.CodAcomp"
    Expression ="TbAcomp.DataIncl"
    Expression ="TbAcomp.Nome"
    Expression ="TbAcomp.CodFamilia"
    Expression ="TbAcomp.Volante"
    Expression ="TbAcoRetorno.DataRetorno"
    Expression ="TbAcoRetorno.Historico"
    Expression ="TbAcoRetorno.Compareceu"
End
Begin Joins
    LeftTable ="TbAcomp"
    RightTable ="TbAcoRetorno"
    Expression ="TbAcomp.CodAcomp = TbAcoRetorno.CodAcomp"
    Flag =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbMemo "OrderBy" ="[Consulta1].[DataRetorno]"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="TbAcoRetorno.Compareceu"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcoRetorno.Historico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcoRetorno.DataRetorno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Volante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.DataIncl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.CodFamilia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1617
    Bottom =857
    Left =-1
    Top =-1
    Right =1593
    Bottom =523
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =271
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =278
        Top =0
        Name ="TbAcoRetorno"
        Name =""
    End
End
