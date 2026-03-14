dbMemo "SQL" ="SELECT TbUnidade.NOME, TbUnidade.CRAS, TbUnidade.[DIRETOR(A)], TbUnidade.FUNÇÃO,"
    " TbUnidade.MATRICULA, TbUnidade.LOGO, Sum(UnionEncamMonitTESTE.ENGOVgeral) AS So"
    "maDeENGOVgeral, Sum(UnionEncamMonitTESTE.RSASSISgeral) AS SomaDeRSASSISgeral, Su"
    "m(UnionEncamMonitTESTE.REDUgeral) AS SomaDeREDUgeral, Sum(UnionEncamMonitTESTE.R"
    "SAUDgeral) AS SomaDeRSAUDgeral, Sum(UnionEncamMonitTESTE.SFAZgeral) AS SomaDeSFA"
    "Zgeral, Sum(UnionEncamMonitTESTE.OPOLgeral) AS SomaDeOPOLgeral, Sum(UnionEncamMo"
    "nitTESTE.ENGOV) AS SomaDeENGOV, Sum(UnionEncamMonitTESTE.RSASSIS) AS SomaDeRSASS"
    "IS, Sum(UnionEncamMonitTESTE.REDU) AS SomaDeREDU, Sum(UnionEncamMonitTESTE.RSAUD"
    ") AS SomaDeRSAUD, Sum(UnionEncamMonitTESTE.SFAZ) AS SomaDeSFAZ, Sum(UnionEncamMo"
    "nitTESTE.OPOL) AS SomaDeOPOL, Sum(UnionEncamMonitTESTE.ENGMON) AS SomaDeENGMON, "
    "Sum(UnionEncamMonitTESTE.RSAMON) AS SomaDeRSAMON, Sum(UnionEncamMonitTESTE.REMON"
    ") AS SomaDeREMON, Sum(UnionEncamMonitTESTE.RSMON) AS SomaDeRSMON, Sum(UnionEncam"
    "MonitTESTE.SFMON) AS SomaDeSFMON, Sum(UnionEncamMonitTESTE.OPMON) AS SomaDeOPMON"
    ", Sum(UnionEncamMonitTESTE.ENGSEM) AS SomaDeENGSEM, Sum(UnionEncamMonitTESTE.RSA"
    "SEM) AS SomaDeRSASEM, Sum(UnionEncamMonitTESTE.RESEM) AS SomaDeRESEM, Sum(UnionE"
    "ncamMonitTESTE.RSSEM) AS SomaDeRSSEM, Sum(UnionEncamMonitTESTE.SFSEM) AS SomaDeS"
    "FSEM, Sum(UnionEncamMonitTESTE.OPSEM) AS SomaDeOPSEM, Sum(UnionEncamMonitTESTE.E"
    "NGATEN) AS SomaDeENGATEN, Sum(UnionEncamMonitTESTE.RSAATEN) AS SomaDeRSAATEN, Su"
    "m(UnionEncamMonitTESTE.REATEN) AS SomaDeREATEN, Sum(UnionEncamMonitTESTE.RSATEN)"
    " AS SomaDeRSATEN, Sum(UnionEncamMonitTESTE.SFATEN) AS SomaDeSFATEN, Sum(UnionEnc"
    "amMonitTESTE.OPATEN) AS SomaDeOPATEN, Sum(UnionEncamMonitTESTE.ENGNAO) AS SomaDe"
    "ENGNAO, Sum(UnionEncamMonitTESTE.RSANAO) AS SomaDeRSANAO, Sum(UnionEncamMonitTES"
    "TE.RENAO) AS SomaDeRENAO, Sum(UnionEncamMonitTESTE.RSNAO) AS SomaDeRSNAO, Sum(Un"
    "ionEncamMonitTESTE.SFNAO) AS SomaDeSFNAO, Sum(UnionEncamMonitTESTE.OPNAO) AS Som"
    "aDeOPNAO\015\012FROM UnionEncamMonitTESTE, TbUnidade\015\012GROUP BY TbUnidade.N"
    "OME, TbUnidade.CRAS, TbUnidade.[DIRETOR(A)], TbUnidade.FUNÇÃO, TbUnidade.MATRICU"
    "LA\015\012HAVING (((TbUnidade.CRAS)=Yes));\015\012"
dbMemo "Connect" =""
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
        dbText "Name" ="UnionEncamMonitTESTE.OPMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.RSAMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.RSAUD"
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
        dbText "Name" ="SomaDeREDU"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.SFMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.ENGMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.REDU"
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
        dbText "Name" ="SomaDeOPOL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSASSIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.RSASEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.RSMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.OPOL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.RSASSIS"
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
        dbText "Name" ="SomaDeSFAZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENGOV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.ENGSEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.REMON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.SFAZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.ENGOV"
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
        dbText "Name" ="SomaDeRSAUD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.OPNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.RENAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.SFATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.ENGATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.RESEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRENAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSFATEN"
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
        dbText "Name" ="UnionEncamMonitTESTE.RSNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.OPATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.RSAATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.RSSEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeOPATEN"
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
        dbText "Name" ="UnionEncamMonitTESTE.SFNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.ENGNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.REATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.SFSEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSFNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENGNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeREATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSFSEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeOPNAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.RSANAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.RSATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.OPSEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSANAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSATEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeOPSEM"
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
        dbText "Name" ="TbUnidade.MATRICULA"
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
        dbText "Name" ="FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.SFAZgeral"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.OPOLgeral"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.ENGOVgeral"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENGOVgeral"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.RSASSISgeral"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSASSISgeral"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.REDUgeral"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeREDUgeral"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionEncamMonitTESTE.RSAUDgeral"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRSAUDgeral"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSFAZgeral"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeOPOLgeral"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CRAS"
        dbLong "AggregateType" ="-1"
    End
End
