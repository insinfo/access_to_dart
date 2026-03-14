Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionDemandaAteMesAtual"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Alias ="SomaDeDEM0A5"
    Expression ="Sum(UnionDemandaAteMesAtual.DEM0A5)"
    Alias ="SomaDeDEM6A11"
    Expression ="Sum(UnionDemandaAteMesAtual.DEM6A11)"
    Alias ="SomaDeDEM12A14"
    Expression ="Sum(UnionDemandaAteMesAtual.DEM12A14)"
    Alias ="SomaDeDEM15A17"
    Expression ="Sum(UnionDemandaAteMesAtual.DEM15A17)"
    Alias ="SomaDeDEM18A29"
    Expression ="Sum(UnionDemandaAteMesAtual.DEM18A29)"
    Alias ="SomaDeDEM30A59"
    Expression ="Sum(UnionDemandaAteMesAtual.DEM30A59)"
    Alias ="SomaDeDEM60M"
    Expression ="Sum(UnionDemandaAteMesAtual.DEM60M)"
    Alias ="SomaDeCIC6A12"
    Expression ="Sum(UnionDemandaAteMesAtual.CIC6A12)"
    Alias ="SomaDeCIC13A17"
    Expression ="Sum(UnionDemandaAteMesAtual.CIC13A17)"
    Alias ="SomaDeCACRI1A6"
    Expression ="Sum(UnionDemandaAteMesAtual.CACRI1A6)"
    Alias ="SomaDeDEMBMD"
    Expression ="Sum(UnionDemandaAteMesAtual.DEMBMD)"
    Alias ="SomaDeDEMBMI"
    Expression ="Sum(UnionDemandaAteMesAtual.DEMBMI)"
    Alias ="SomaDeCBAS"
    Expression ="Sum(UnionDemandaAteMesAtual.CBAS)"
    Alias ="SomaDeCOB"
    Expression ="Sum(UnionDemandaAteMesAtual.COB)"
    Alias ="SomaDeCOLCH"
    Expression ="Sum(UnionDemandaAteMesAtual.COLCH)"
    Alias ="SomaDeFILT"
    Expression ="Sum(UnionDemandaAteMesAtual.FILT)"
    Alias ="SomaDeKITM"
    Expression ="Sum(UnionDemandaAteMesAtual.KITM)"
    Alias ="SomaDeKITF"
    Expression ="Sum(UnionDemandaAteMesAtual.KITF)"
    Alias ="SomaDeOUT"
    Expression ="Sum(UnionDemandaAteMesAtual.OUT)"
End
Begin Groups
    Expression ="TbUnidade.NOME"
    GroupLevel =0
    Expression ="TbUnidade.CRAS"
    GroupLevel =0
    Expression ="TbUnidade.[DIRETOR(A)]"
    GroupLevel =0
    Expression ="TbUnidade.FUNÇÃO"
    GroupLevel =0
    Expression ="TbUnidade.MATRICULA"
    GroupLevel =0
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
        dbText "Name" ="SomaDeDEMBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEMBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEM60M"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEM12A14"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCACRI1A6"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEM30A59"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEM6A11"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCIC13A17"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEM18A29"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEM0A5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCIC6A12"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEM15A17"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeKITF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCOB"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCOLCH"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFILT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeKITM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCBAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeOUT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DIRETOR(A)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =53
    Top =43
    Right =872
    Bottom =616
    Left =-1
    Top =-1
    Right =795
    Bottom =272
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =242
        Top =12
        Right =420
        Bottom =218
        Top =0
        Name ="UnionDemandaAteMesAtual"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =296
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
