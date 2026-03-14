Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionBenefEvent"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.CRAS"
    Alias ="SomaDeAPOALIMP"
    Expression ="Sum(UnionBenefEvent.APOALIMP)"
    Alias ="SomaDeAUXNATP"
    Expression ="Sum(UnionBenefEvent.AUXNATP)"
    Alias ="SomaDeCOBERP"
    Expression ="Sum(UnionBenefEvent.COBERP)"
    Alias ="SomaDeCOLCHP"
    Expression ="Sum(UnionBenefEvent.COLCHP)"
    Alias ="SomaDeOUTROBENP"
    Expression ="Sum(UnionBenefEvent.OUTROBENP)"
    Alias ="SomaDeAPOALIMD"
    Expression ="Sum(UnionBenefEvent.APOALIMD)"
    Alias ="SomaDeAUXNATD"
    Expression ="Sum(UnionBenefEvent.AUXNATD)"
    Alias ="SomaDeCOBERD"
    Expression ="Sum(UnionBenefEvent.COBERD)"
    Alias ="SomaDeCOLCHD"
    Expression ="Sum(UnionBenefEvent.COLCHD)"
    Alias ="SomaDeOUTROBEND"
    Expression ="Sum(UnionBenefEvent.OUTROBEND)"
    Alias ="SomaDeCBASICANAT"
    Expression ="Sum(UnionBenefEvent.CBASICANAT)"
    Alias ="SomaDeCOBERNAT"
    Expression ="Sum(UnionBenefEvent.COBERNAT)"
    Alias ="SomaDeCOLCHONAT"
    Expression ="Sum(UnionBenefEvent.COLCHONAT)"
    Alias ="SomaDeFILTNAT"
    Expression ="Sum(UnionBenefEvent.FILTNAT)"
    Alias ="SomaDeKITMASNAT"
    Expression ="Sum(UnionBenefEvent.KITMASNAT)"
    Alias ="SomaDeKITFEMNAT"
    Expression ="Sum(UnionBenefEvent.KITFEMNAT)"
    Alias ="SomaDeapAliFam"
    Expression ="Sum(UnionBenefEvent.apAliFam)"
    Alias ="SomaDeauxNatFam"
    Expression ="Sum(UnionBenefEvent.auxNatFam)"
    Alias ="SomaDecolchFam"
    Expression ="Sum(UnionBenefEvent.colchFam)"
    Alias ="SomaDecobFam"
    Expression ="Sum(UnionBenefEvent.cobFam)"
    Alias ="SomaDeoutrosFam"
    Expression ="Sum(UnionBenefEvent.outrosFam)"
    Alias ="SomaDeTotFam"
    Expression ="Sum(UnionBenefEvent.TotFam)"
    Alias ="SomaDeFamAtend"
    Expression ="Sum(UnionBenefEvent.FamAtend)"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
End
Begin Groups
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
        dbText "Name" ="SomaDeOUTROBEND"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1950"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="SomaDeAPOALIMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeAUXNATP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCOLCHD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeOUTROBENP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeAPOALIMP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCOBERNAT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCOBERD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCOLCHP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCBASICANAT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeAUXNATD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCOBERP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCOLCHONAT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFILTNAT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeKITMASNAT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeKITFEMNAT"
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
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
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
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionBenefEvent.TotFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionBenefEvent.auxNatFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeoutrosFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeapAliFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionBenefEvent.outrosFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionBenefEvent.apAliFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionBenefEvent.FamAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTotFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeauxNatFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFamAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionBenefEvent.colchFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDecolchFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionBenefEvent.cobFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDecobFam"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =10
    Top =66
    Right =1559
    Bottom =745
    Left =-1
    Top =-1
    Right =1525
    Bottom =416
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =311
        Top =19
        Right =455
        Bottom =314
        Top =0
        Name ="UnionBenefEvent"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =295
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
