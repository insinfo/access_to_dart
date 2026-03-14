Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionTipoAtend"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.[Nº UNIDADE]"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.CARGO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.FUNÇÃO"
    Alias ="SomaDeACOPART"
    Expression ="Sum(UnionTipoAtend.ACOPART)"
    Alias ="SomaDeATENDREM"
    Expression ="Sum(UnionTipoAtend.ATENDREM)"
    Alias ="SomaDeACOMPREM"
    Expression ="Sum(UnionTipoAtend.ACOMPREM)"
    Alias ="SomaDeESTUDOSOC"
    Expression ="Sum(UnionTipoAtend.ESTUDOSOC)"
    Alias ="SomaDeRELAT"
    Expression ="Sum(UnionTipoAtend.RELAT)"
    Alias ="SomaDeACOCOLET"
    Expression ="Sum(UnionTipoAtend.ACOCOLET)"
    Alias ="SomaDeATTICINST"
    Expression ="Sum(UnionTipoAtend.ATTICINST)"
    Alias ="SomaDeDEMBPC"
    Expression ="Sum(UnionTipoAtend.DEMBPC)"
    Alias ="SomaDeDEMINSS"
    Expression ="Sum(UnionTipoAtend.DEMINSS)"
    Alias ="SomaDeDEMSCFV"
    Expression ="Sum(UnionTipoAtend.DEMSCFV)"
    Alias ="SomaDeDEMEDUC"
    Expression ="Sum(UnionTipoAtend.DEMEDUC)"
    Alias ="SomaDeDEMDOCCIV"
    Expression ="Sum(UnionTipoAtend.DEMDOCCIV)"
    Alias ="SomaDeDEMAPOIOALI"
    Expression ="Sum(UnionTipoAtend.DEMAPOIOALI)"
    Alias ="SomaDeDEMSAUD"
    Expression ="Sum(UnionTipoAtend.DEMSAUD)"
    Alias ="SomaDeDEMJUST"
    Expression ="Sum(UnionTipoAtend.DEMJUST)"
    Alias ="SomaDeDEMBENMUNIC"
    Expression ="Sum(UnionTipoAtend.DEMBENMUNIC)"
    Alias ="SomaDeDEMAUXNAT"
    Expression ="Sum(UnionTipoAtend.DEMAUXNAT)"
    Alias ="SomaDeDEMTRANSP"
    Expression ="Sum(UnionTipoAtend.DEMTRANSP)"
    Alias ="SomaDeDEMOUTRA"
    Expression ="Sum(UnionTipoAtend.DEMOUTRA)"
    Alias ="SomaDeFORMADE"
    Expression ="Sum(UnionTipoAtend.FORMADE)"
    Alias ="SomaDeFORMABA"
    Expression ="Sum(UnionTipoAtend.FORMABA)"
    Alias ="SomaDeFORMAEUPB"
    Expression ="Sum(UnionTipoAtend.FORMAEUPB)"
    Alias ="SomaDeFORMAEUPE"
    Expression ="Sum(UnionTipoAtend.FORMAEUPE)"
    Alias ="SomaDeFORMAES"
    Expression ="Sum(UnionTipoAtend.FORMAES)"
    Alias ="SomaDeFORMAEE"
    Expression ="Sum(UnionTipoAtend.FORMAEE)"
    Alias ="SomaDeFORMAEPS"
    Expression ="Sum(UnionTipoAtend.FORMAEPS)"
    Alias ="SomaDeFORMAECT"
    Expression ="Sum(UnionTipoAtend.FORMAECT)"
    Alias ="SomaDeFORMAEPJ"
    Expression ="Sum(UnionTipoAtend.FORMAEPJ)"
    Alias ="SomaDeFORMAEDP"
    Expression ="Sum(UnionTipoAtend.FORMAEDP)"
    Alias ="SomaDeFORMAOUTRO"
    Expression ="Sum(UnionTipoAtend.FORMAOUTRO)"
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
    Expression ="TbUnidade.CARGO"
    GroupLevel =0
    Expression ="TbUnidade.MATRICULA"
    GroupLevel =0
    Expression ="TbUnidade.FUNÇÃO"
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
        dbText "Name" ="SomaDeDEMEDUC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATTICINST"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeACOMPREM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEMSAUD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEMSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeACOCOLET"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATENDREM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEMAPOIOALI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEMINSS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRELAT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeACOPART"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEMDOCCIV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEMBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeESTUDOSOC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEMOUTRA"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1515"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="SomaDeDEMJUST"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEMBENMUNIC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEMAUXNAT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDEMTRANSP"
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
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CARGO"
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
        dbText "Name" ="Nº UNIDADE"
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
        dbText "Name" ="DIRETOR(A)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CARGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFORMAEDP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFORMAEE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFORMABA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionTipoAtend.FORMAEPJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionTipoAtend.FORMAES"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionTipoAtend.FORMADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFORMAEPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFORMAEUPB"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionTipoAtend.FORMAEDP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionTipoAtend.FORMAEE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionTipoAtend.FORMABA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFORMAECT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFORMAEUPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionTipoAtend.FORMAOUTRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFORMAEPJ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFORMAES"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1725"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="SomaDeFORMADE"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2160"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="SomaDeFORMAOUTRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionTipoAtend.FORMAEPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionTipoAtend.FORMAEUPB"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionTipoAtend.FORMAECT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionTipoAtend.FORMAEUPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[MATRICULA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[CARGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[Nº UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[NOME]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[LOGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[FUNÇÃO]"
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
Begin
    State =0
    Left =44
    Top =93
    Right =974
    Bottom =619
    Left =-1
    Top =-1
    Right =906
    Bottom =273
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =54
        Top =12
        Right =198
        Bottom =304
        Top =0
        Name ="UnionTipoAtend"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =341
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
