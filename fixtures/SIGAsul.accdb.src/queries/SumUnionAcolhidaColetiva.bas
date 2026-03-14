Operation =1
Option =0
Begin InputTables
    Name ="UnionAcolhidaColetiva"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Alias ="SomaDeTOTAL"
    Expression ="Sum(UnionAcolhidaColetiva.TOTAL)"
    Alias ="SomaDeSOCIAL"
    Expression ="Sum(UnionAcolhidaColetiva.SOCIAL)"
    Alias ="SomaDePSI"
    Expression ="Sum(UnionAcolhidaColetiva.PSI)"
    Alias ="SomaDeBPC"
    Expression ="Sum(UnionAcolhidaColetiva.BPC)"
    Alias ="SomaDeINSS"
    Expression ="Sum(UnionAcolhidaColetiva.INSS)"
    Alias ="SomaDeSCFV"
    Expression ="Sum(UnionAcolhidaColetiva.SCFV)"
    Alias ="SomaDeEDUC"
    Expression ="Sum(UnionAcolhidaColetiva.EDUC)"
    Alias ="SomaDeSAUDE"
    Expression ="Sum(UnionAcolhidaColetiva.SAUDE)"
    Alias ="SomaDeJUS"
    Expression ="Sum(UnionAcolhidaColetiva.JUS)"
    Alias ="SomaDeBENMUN"
    Expression ="Sum(UnionAcolhidaColetiva.BENMUN)"
    Alias ="SomaDeAUXNAT"
    Expression ="Sum(UnionAcolhidaColetiva.AUXNAT)"
    Alias ="SomaDeTRANSP"
    Expression ="Sum(UnionAcolhidaColetiva.TRANSP)"
    Alias ="SomaDeRECJUS"
    Expression ="Sum(UnionAcolhidaColetiva.RECJUS)"
    Alias ="SomaDeDOCIVIL"
    Expression ="Sum(UnionAcolhidaColetiva.DOCIVIL)"
    Alias ="SomaDeALIMEN"
    Expression ="Sum(UnionAcolhidaColetiva.ALIMEN)"
    Alias ="SomaDeOUTRADEM"
    Expression ="Sum(UnionAcolhidaColetiva.OUTRADEM)"
    Alias ="SomaDeENCREDESA"
    Expression ="Sum(UnionAcolhidaColetiva.ENCREDESA)"
    Alias ="SomaDeENCSAUDE"
    Expression ="Sum(UnionAcolhidaColetiva.ENCSAUDE)"
    Alias ="SomaDeENCEDUC"
    Expression ="Sum(UnionAcolhidaColetiva.ENCEDUC)"
    Alias ="SomaDeENCSEMFAZ"
    Expression ="Sum(UnionAcolhidaColetiva.ENCSEMFAZ)"
    Alias ="SomaDeENCENG"
    Expression ="Sum(UnionAcolhidaColetiva.ENCENG)"
    Alias ="SomaDeENCOP"
    Expression ="Sum(UnionAcolhidaColetiva.ENCOP)"
    Alias ="SomaDeENCCOMITE"
    Expression ="Sum(UnionAcolhidaColetiva.ENCCOMITE)"
End
Begin Groups
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
        dbText "Name" ="UnionAcolhidaColetiva.TRANSP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.SAUDE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.BPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeAUXNAT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeEDUC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePSI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.AUXNAT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.EDUC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.PSI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDOCIVIL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeBENMUN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSOCIAL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.DOCIVIL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.BENMUN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.SCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.SOCIAL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRECJUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeJUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeINSS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTOTAL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.RECJUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.JUS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.INSS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.TOTAL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTRANSP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSAUDE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.ENCCOMITE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENCCOMITE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.ENCEDUC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.ALIMEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENCEDUC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeALIMEN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.ENCSEMFAZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.OUTRADEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENCSEMFAZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeOUTRADEM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.ENCENG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.ENCREDESA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENCENG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENCREDESA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.ENCOP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionAcolhidaColetiva.ENCSAUDE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENCOP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeENCSAUDE"
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
        dbText "Name" ="RODAPE"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1070
    Bottom =660
    Left =-1
    Top =-1
    Right =1046
    Bottom =309
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =227
        Top =18
        Right =509
        Bottom =327
        Top =0
        Name ="UnionAcolhidaColetiva"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =319
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
