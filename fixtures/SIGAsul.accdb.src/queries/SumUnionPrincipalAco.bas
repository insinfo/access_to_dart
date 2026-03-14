Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionPrincipalAco"
    Name ="TbUnidade"
End
Begin OutputColumns
    Alias ="SomaDeTotFichas"
    Expression ="Sum(UnionPrincipalAco.TotFichas)"
    Alias ="SomaDeComPAF"
    Expression ="Sum(UnionPrincipalAco.ComPAF)"
    Alias ="SomaDeSemPAF"
    Expression ="Sum(UnionPrincipalAco.SemPAF)"
    Alias ="SomaDedesligPAF"
    Expression ="Sum(UnionPrincipalAco.desligPAF)"
    Alias ="SomaDeAcoAtend"
    Expression ="Sum(UnionPrincipalAco.AcoAtend)"
    Alias ="SomaDeTotMediacoes"
    Expression ="Sum(UnionPrincipalAco.TotMediacoes)"
    Alias ="SomaDeAcoInserPAF"
    Expression ="Sum(UnionPrincipalAco.AcoInserPAF)"
    Alias ="SomaDeTotFamSCFVInt"
    Expression ="Sum(UnionPrincipalAco.TotFamSCFVInt)"
    Alias ="SomaDeTotFamSCFVExt"
    Expression ="Sum(UnionPrincipalAco.TotFamSCFVExt)"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.CRAS"
End
Begin Groups
    Expression ="TbUnidade.NOME"
    GroupLevel =0
    Expression ="TbUnidade.[DIRETOR(A)]"
    GroupLevel =0
    Expression ="TbUnidade.MATRICULA"
    GroupLevel =0
    Expression ="TbUnidade.FUNÇÃO"
    GroupLevel =0
    Expression ="TbUnidade.CRAS"
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
        dbText "Name" ="SomaDeAcoAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTotFichas"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalAco.AcoAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalAco.TotFichas"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDedesligPAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalAco.desligPAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeSemPAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeAcoInserPAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalAco.SemPAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTotMediacoes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeComPAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalAco.TotMediacoes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalAco.ComPAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalAco.AcoInserPAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[18a29insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[60pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[60pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.ate5insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[6a11insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[12a17insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[30a59naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.ate5naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[12a17priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[30a59insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[60naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[6a11naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[18a29priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[60insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.ate5pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[12a17naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[30a59priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.ate5priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[6a11pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[18a29naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[60priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[6a11priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[12a17pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[18a29pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[30a59pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.ate5insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5insc1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[6a11insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11insc1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[12a17insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17insc1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[18a29insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29insc1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[30a59insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59insc1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[60insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60insc1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.ate5priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5priori1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[6a11priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11priori1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[12a17priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17priori1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[18a29priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29priori1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[30a59priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59priori1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[60priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60priori1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.ate5naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5naopriori1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[6a11naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11naopriori1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[12a17naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17naopriori1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[18a29naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29naopriori1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[30a59naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59naopriori1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[60naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60naopriori1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.ate5pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5pres1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[6a11pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11pres1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[12a17pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17pres1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[18a29pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29pres1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVInterno.[30a59pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59pres1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60pres1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[LOGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[RODAPE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[NOME]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[MATRICULA]"
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
        dbText "Name" ="MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalAco.TotFamSCFVExt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalAco.TotFamSCFVInt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTotFamSCFVInt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeTotFamSCFVExt"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =45
    Top =70
    Right =892
    Bottom =587
    Left =-1
    Top =-1
    Right =823
    Bottom =207
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =225
        Top =0
        Name ="UnionPrincipalAco"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
