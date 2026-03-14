Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionEncamMonit"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Alias ="SomaDeENGOV"
    Expression ="Sum(UnionEncamMonit.ENGOV)"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Alias ="SomaDeENGOV1"
    Expression ="Sum(UnionEncamMonit.ENGOV)"
    Alias ="SomaDeRSASSIS"
    Expression ="Sum(UnionEncamMonit.RSASSIS)"
    Alias ="SomaDeREDU"
    Expression ="Sum(UnionEncamMonit.REDU)"
    Alias ="SomaDeRSAUD"
    Expression ="Sum(UnionEncamMonit.RSAUD)"
    Alias ="SomaDeSFAZ"
    Expression ="Sum(UnionEncamMonit.SFAZ)"
    Alias ="SomaDeOPOL"
    Expression ="Sum(UnionEncamMonit.OPOL)"
    Alias ="SomaDeENGMON"
    Expression ="Sum(UnionEncamMonit.ENGMON)"
    Alias ="SomaDeRSAMON"
    Expression ="Sum(UnionEncamMonit.RSAMON)"
    Alias ="SomaDeREMON"
    Expression ="Sum(UnionEncamMonit.REMON)"
    Alias ="SomaDeRSMON"
    Expression ="Sum(UnionEncamMonit.RSMON)"
    Alias ="SomaDeSFMON"
    Expression ="Sum(UnionEncamMonit.SFMON)"
    Alias ="SomaDeOPMON"
    Expression ="Sum(UnionEncamMonit.OPMON)"
    Alias ="SomaDeENGSEM"
    Expression ="Sum(UnionEncamMonit.ENGSEM)"
    Alias ="SomaDeRSASEM"
    Expression ="Sum(UnionEncamMonit.RSASEM)"
    Alias ="SomaDeRESEM"
    Expression ="Sum(UnionEncamMonit.RESEM)"
    Alias ="SomaDeRSSEM"
    Expression ="Sum(UnionEncamMonit.RSSEM)"
    Alias ="SomaDeSFSEM"
    Expression ="Sum(UnionEncamMonit.SFSEM)"
    Alias ="SomaDeOPSEM"
    Expression ="Sum(UnionEncamMonit.OPSEM)"
    Alias ="SomaDeENGATEN"
    Expression ="Sum(UnionEncamMonit.ENGATEN)"
    Alias ="SomaDeRSAATEN"
    Expression ="Sum(UnionEncamMonit.RSAATEN)"
    Alias ="SomaDeREATEN"
    Expression ="Sum(UnionEncamMonit.REATEN)"
    Alias ="SomaDeRSATEN"
    Expression ="Sum(UnionEncamMonit.RSATEN)"
    Alias ="SomaDeSFATEN"
    Expression ="Sum(UnionEncamMonit.SFATEN)"
    Alias ="SomaDeOPATEN"
    Expression ="Sum(UnionEncamMonit.OPATEN)"
    Alias ="SomaDeENGNAO"
    Expression ="Sum(UnionEncamMonit.ENGNAO)"
    Alias ="SomaDeRSANAO"
    Expression ="Sum(UnionEncamMonit.RSANAO)"
    Alias ="SomaDeRENAO"
    Expression ="Sum(UnionEncamMonit.RENAO)"
    Alias ="SomaDeRSNAO"
    Expression ="Sum(UnionEncamMonit.RSNAO)"
    Alias ="SomaDeSFNAO"
    Expression ="Sum(UnionEncamMonit.SFNAO)"
    Alias ="SomaDeOPNAO"
    Expression ="Sum(UnionEncamMonit.OPNAO)"
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
        dbText "Name" ="SomaDeREMONI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSFAZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENGOV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSAMONI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSAUD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeOPMONI"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1875"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSFMONI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENGMONI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeREDU"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSMONI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeOPOL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSASSIS"
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
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RODAPE"
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
        dbText "Name" ="FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.OPNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.ENGOV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENGOV1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.REDU"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.RSASSIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSFSEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENGSEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeREMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.RSAUD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.OPSEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.RSASEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.RSMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.SFAZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeOPSEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSASEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.OPOL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.ENGATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.RESEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.SFMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.ENGMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENGATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRESEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSFMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENGMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.RSAATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.RSSEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.OPMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.RSAMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSAATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSSEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeOPMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSAMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.REATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.SFSEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.ENGSEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.REMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeREATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.RSATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.SFATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSFATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.OPATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeOPATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.ENGNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENGNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.RSANAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSANAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.RENAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRENAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.RSNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonit.SFNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSFNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeOPNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1001"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1182
    Bottom =660
    Left =-1
    Top =-1
    Right =1158
    Bottom =272
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =314
        Top =35
        Right =535
        Bottom =231
        Top =0
        Name ="UnionEncamMonit"
        Name =""
    End
    Begin
        Left =64
        Top =22
        Right =208
        Bottom =290
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
