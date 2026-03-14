Operation =1
Option =0
Begin InputTables
    Name ="TbAcomp"
    Name ="TbAcompDet"
    Name ="TbAcoRetorno"
End
Begin OutputColumns
    Expression ="TbAcoRetorno.CodAcoRetorno"
    Expression ="TbAcoRetorno.CodAcomp"
    Expression ="TbAcoRetorno.DataRetorno"
    Expression ="TbAcoRetorno.Historico"
    Expression ="TbAcoRetorno.Obs"
    Expression ="TbAcoRetorno.Compareceu"
    Expression ="TbAcomp.CodAcomp"
    Expression ="TbAcomp.DataIncl"
    Expression ="TbAcomp.Nome"
    Expression ="TbAcomp.CodFamilia"
    Expression ="TbAcompDet.CodAcompDet"
    Expression ="TbAcompDet.CodAcomp"
    Expression ="TbAcompDet.CodTecnico"
    Expression ="TbAcompDet.NomeTec"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.[PAF fim]"
    Expression ="TbAcompDet.Particular"
    Expression ="TbAcompDet.Coletivo"
    Expression ="TbAcompDet.Grupo"
    Expression ="TbAcompDet.Defic"
    Expression ="TbAcompDet.Idoso"
    Expression ="TbAcompDet.Gest"
    Expression ="TbAcompDet.Criança"
    Expression ="TbAcompDet.Adol"
    Expression ="TbAcompDet.[Alcool/Drogas]"
    Expression ="TbAcompDet.ConflitoFam"
    Expression ="TbAcompDet.FragilSocioEcon"
    Expression ="TbAcompDet.DataDesl"
    Expression ="TbAcompDet.[Motivo Deslig]"
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
        dbText "Name" ="TbAcoRetorno.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcoRetorno.Compareceu"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcoRetorno.CodAcoRetorno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[Motivo Deslig]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Adol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.CodFamilia"
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
        dbText "Name" ="TbAcoRetorno.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.DataIncl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.CodAcompDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.CodTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.NomeTec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Particular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Coletivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Defic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Idoso"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Gest"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Criança"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[Alcool/Drogas]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.ConflitoFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.FragilSocioEcon"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1192
    Bottom =660
    Left =-1
    Top =-1
    Right =1168
    Bottom =340
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =255
        Top =93
        Right =399
        Bottom =237
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =55
        Top =102
        Right =199
        Bottom =321
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
    Begin
        Left =559
        Top =43
        Right =703
        Bottom =324
        Top =0
        Name ="TbAcoRetorno"
        Name =""
    End
End
