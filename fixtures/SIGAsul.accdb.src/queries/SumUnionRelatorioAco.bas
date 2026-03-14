Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionRelatorioAco"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Alias ="SomaDeACOINSER"
    Expression ="Sum(UnionRelatorioAco.ACOINSER)"
    Alias ="SomaDeACOATE"
    Expression ="Sum(UnionRelatorioAco.ACOATE)"
    Alias ="SomaDePERFILACO"
    Expression ="Sum(UnionRelatorioAco.PERFILACO)"
    Alias ="SomaDeEXTPBZ"
    Expression ="Sum(UnionRelatorioAco.EXTPBZ)"
    Alias ="SomaDePBFAM"
    Expression ="Sum(UnionRelatorioAco.PBFAM)"
    Alias ="SomaDeDESCUM"
    Expression ="Sum(UnionRelatorioAco.DESCUM)"
    Alias ="SomaDePESSOABPC"
    Expression ="Sum(UnionRelatorioAco.PESSOABPC)"
    Alias ="SomaDeFAMATIVAS"
    Expression ="Sum(UnionRelatorioAco.FAMATIVAS)"
    Alias ="SomaDePAFATENDIDA"
    Expression ="Sum(UnionRelatorioAco.PAFATENDIDA)"
    Alias ="SomaDeFAMMEDI"
    Expression ="Sum(UnionRelatorioAco.FAMMEDI)"
    Alias ="SomaDeTRABINF"
    Expression ="Sum(UnionRelatorioAco.TRABINF)"
    Alias ="SomaDeSERVACO"
    Expression ="Sum(UnionRelatorioAco.SERVACO)"
    Alias ="SomaDeBMIACO"
    Expression ="Sum(UnionRelatorioAco.BMIACO)"
    Alias ="SomaDeBMDACO"
    Expression ="Sum(UnionRelatorioAco.BMDACO)"
    Alias ="SomaDeBSFACO"
    Expression ="Sum(UnionRelatorioAco.BSFACO)"
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
        dbText "Name" ="SomaDeTRABINF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePESSOABPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePERFILACO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeBMDACO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFAMMEDI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDESCUM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeACOATE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeBMIACO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePAFATENDIDA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePBFAM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeACOINSER"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSERVACO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFAMATIVAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeEXTPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeBSFACO"
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
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
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
        dbText "Name" ="LOGO"
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
    Left =44
    Top =93
    Right =831
    Bottom =660
    Left =-1
    Top =-1
    Right =763
    Bottom =272
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =240
        Top =13
        Right =384
        Bottom =176
        Top =0
        Name ="UnionRelatorioAco"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =186
        Bottom =287
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
