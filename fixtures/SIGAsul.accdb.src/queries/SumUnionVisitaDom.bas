Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionVisitaDom"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Alias ="SomaDeLFR"
    Expression ="Sum(UnionVisitaDom.LFR)"
    Alias ="SomaDeCDL"
    Expression ="Sum(UnionVisitaDom.CDL)"
    Alias ="SomaDeDCP"
    Expression ="Sum(UnionVisitaDom.DCP)"
    Alias ="SomaDeDPAF"
    Expression ="Sum(UnionVisitaDom.DPAF)"
    Alias ="SomaDeAMF"
    Expression ="Sum(UnionVisitaDom.AMF)"
    Alias ="SomaDeFVI"
    Expression ="Sum(UnionVisitaDom.FVI)"
    Alias ="SomaDeAMD"
    Expression ="Sum(UnionVisitaDom.AMD)"
    Alias ="SomaDeASD"
    Expression ="Sum(UnionVisitaDom.ASD)"
    Alias ="SomaDePBF"
    Expression ="Sum(UnionVisitaDom.PBF)"
    Alias ="SomaDeSCFV"
    Expression ="Sum(UnionVisitaDom.SCFV)"
    Alias ="SomaDeOUT"
    Expression ="Sum(UnionVisitaDom.OUT)"
    Alias ="SomaDeVDNAOLOC"
    Expression ="Sum(UnionVisitaDom.VDNAOLOC)"
    Alias ="SomaDeBA"
    Expression ="Sum(UnionVisitaDom.BA)"
    Alias ="SomaDeBANAOLOC"
    Expression ="Sum(UnionVisitaDom.BANAOLOC)"
    Alias ="SomaDeVISITA"
    Expression ="Sum(UnionVisitaDom.VISITA)"
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
        dbText "Name" ="SomaDeOUT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeAMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDCP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFVI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCDL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeBANAOLOC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeBA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeAMF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeLFR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeVDNAOLOC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeASD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDPAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeVISITA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DIRETOR(A)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
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
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =6
    Top =19
    Right =1198
    Bottom =639
    Left =-1
    Top =-1
    Right =1168
    Bottom =255
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =310
        Top =15
        Right =433
        Bottom =177
        Top =0
        Name ="UnionVisitaDom"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =307
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
