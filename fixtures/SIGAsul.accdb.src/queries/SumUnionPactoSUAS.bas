Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionPactoSUAS"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.[Nº UNIDADE]"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Alias ="SomaDeCadTotal"
    Expression ="Sum(UnionPactoSUAS.CadTotal)"
    Alias ="SomaDeCadAco"
    Expression ="Sum(UnionPactoSUAS.CadAco)"
    Alias ="SomaDebpcTotal"
    Expression ="Sum(UnionPactoSUAS.bpcTotal)"
    Alias ="SomaDebpcAco"
    Expression ="Sum(UnionPactoSUAS.bpcAco)"
    Alias ="SomaDebpcCadUnico"
    Expression ="Sum(UnionPactoSUAS.bpcCadUnico)"
    Alias ="SomaDeSitPrioritSCFV"
    Expression ="Sum(UnionPactoSUAS.SitPrioritSCFV)"
    Alias ="SomaDeSitPrioritSCFVExterno"
    Expression ="Sum(UnionPactoSUAS.SitPrioritSCFVExterno)"
    Alias ="SomaDeRendaCadUnicMSal"
    Expression ="Sum(UnionPactoSUAS.RendaCadUnicMSal)"
    Alias ="SomaDeTotalCadFam"
    Expression ="Sum(UnionPactoSUAS.TotalCadFam)"
    Alias ="SomaDepbfTotal"
    Expression ="Sum(UnionPactoSUAS.pbfTotal)"
    Alias ="SomaDedescumpTotal"
    Expression ="Sum(UnionPactoSUAS.descumpTotal)"
End
Begin Groups
    Expression ="TbUnidade.[Nº UNIDADE]"
    GroupLevel =0
    Expression ="TbUnidade.CRAS"
    GroupLevel =0
    Expression ="TbUnidade.NOME"
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
        dbText "Name" ="SomaDeSitPrioritSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDebpcAco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDebpcTotal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTotalCadFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRendaCadUnicMSal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCadAco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSitPrioritSCFVExterno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDebpcCadUnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCadTotal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[Nº UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDepbfTotal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDedescumpTotal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-78
    Top =76
    Right =1096
    Bottom =643
    Left =-1
    Top =-1
    Right =1150
    Bottom =219
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =108
        Top =3
        Right =367
        Bottom =287
        Top =0
        Name ="UnionPactoSUAS"
        Name =""
    End
    Begin
        Left =423
        Top =14
        Right =567
        Bottom =253
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
