Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionRelatorioGestao"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Alias ="SomaDeATS1V"
    Expression ="Sum(UnionRelatorioGestao.ATS1V)"
    Alias ="SomaDeATPSI1V"
    Expression ="Sum(UnionRelatorioGestao.ATPSI1V)"
    Alias ="SomaDeATMULT1V"
    Expression ="Sum(UnionRelatorioGestao.ATMULT1V)"
    Alias ="SomaDeATADM1V"
    Expression ="Sum(UnionRelatorioGestao.ATADM1V)"
    Alias ="SomaDeCAD1V"
    Expression ="Sum(UnionRelatorioGestao.CAD1V)"
    Alias ="SomaDeCADSUB"
    Expression ="Sum(UnionRelatorioGestao.CADSUB)"
    Alias ="SomaDeCADORI"
    Expression ="Sum(UnionRelatorioGestao.CADORI)"
    Alias ="SomaDeACOREM"
    Expression ="Sum(UnionRelatorioGestao.ACOREM)"
    Alias ="SomaDeATREM"
    Expression ="Sum(UnionRelatorioGestao.ATREM)"
    Alias ="SomaDeATRECEP"
    Expression ="Sum(UnionRelatorioGestao.ATRECEP)"
    Alias ="SomaDeATGEST"
    Expression ="Sum(UnionRelatorioGestao.ATGEST)"
    Alias ="SomaDeFAMATIVAS"
    Expression ="Sum(UnionRelatorioGestao.FAMATIVAS)"
    Alias ="SomaDePAFATENDIDA"
    Expression ="Sum(UnionRelatorioGestao.PAFATENDIDA)"
    Alias ="SomaDeATORI1V"
    Expression ="Sum(UnionRelatorioGestao.ATORI1V)"
    Alias ="SomaDeGESTRECEP"
    Expression ="Sum(UnionRelatorioGestao.GESTRECEP)"
    Alias ="SomaDeEQUITEC"
    Expression ="Sum(UnionRelatorioGestao.EQUITEC)"
    Alias ="SomaDeADMIN"
    Expression ="Sum(UnionRelatorioGestao.ADMIN)"
    Alias ="SomaDeADMSUB"
    Expression ="Sum(UnionRelatorioGestao.ADMSUB)"
    Alias ="SomaDeSOCSUB"
    Expression ="Sum(UnionRelatorioGestao.SOCSUB)"
    Alias ="SomaDePSISUB"
    Expression ="Sum(UnionRelatorioGestao.PSISUB)"
    Alias ="SomaDeMULTISUB"
    Expression ="Sum(UnionRelatorioGestao.MULTISUB)"
    Alias ="SomaDeORISUB"
    Expression ="Sum(UnionRelatorioGestao.ORISUB)"
    Alias ="SomaDeGESTSUB"
    Expression ="Sum(UnionRelatorioGestao.GESTSUB)"
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
        dbText "Name" ="SomaDeATGEST"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFAMATIVAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeACOREM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCAD1V"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATREM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCADSUB"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATRECEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeCADORI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeGESTRECEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATMULT1V"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeMULTISUB"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATORI1V"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSOCSUB"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeADMSUB"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATS1V"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATPSI1V"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePSISUB"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATADM1V"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeORISUB"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeGESTSUB"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeACOCOLET"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeADMIN"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePAFATENDIDA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
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
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
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
        dbText "Name" ="SomaDeEQUITEC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionRelatorioGestao.EQUITEC"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =763
    Bottom =685
    Left =-1
    Top =-1
    Right =739
    Bottom =282
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =533
        Top =14
        Right =723
        Bottom =270
        Top =0
        Name ="UnionRelatorioGestao"
        Name =""
    End
    Begin
        Left =242
        Top =11
        Right =386
        Bottom =231
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
