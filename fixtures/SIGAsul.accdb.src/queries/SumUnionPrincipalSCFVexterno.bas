Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="TbUnidade"
    Name ="UnionPrincipalSCFVExterno"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Alias ="SomaDeate5inscE"
    Expression ="Sum(UnionPrincipalSCFVExterno.ate5inscE)"
    Alias ="SomaDe6a11inscE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[6a11inscE])"
    Alias ="SomaDe12a17inscE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[12a17inscE])"
    Alias ="SomaDe18a29inscE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[18a29inscE])"
    Alias ="SomaDe30a59inscE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[30a59inscE])"
    Alias ="SomaDe60inscE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[60inscE])"
    Alias ="SomaDeate5prioriE"
    Expression ="Sum(UnionPrincipalSCFVExterno.ate5prioriE)"
    Alias ="SomaDe6a11prioriE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[6a11prioriE])"
    Alias ="SomaDe12a17prioriE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[12a17prioriE])"
    Alias ="SomaDe18a29prioriE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[18a29prioriE])"
    Alias ="SomaDe30a59prioriE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[30a59prioriE])"
    Alias ="SomaDe60prioriE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[60prioriE])"
    Alias ="SomaDeate5naoprioriE"
    Expression ="Sum(UnionPrincipalSCFVExterno.ate5naoprioriE)"
    Alias ="SomaDe6a11naoprioriE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[6a11naoprioriE])"
    Alias ="SomaDe12a17naoprioriE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[12a17naoprioriE])"
    Alias ="SomaDe18a29naoprioriE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[18a29naoprioriE])"
    Alias ="SomaDe30a59naoprioriE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[30a59naoprioriE])"
    Alias ="SomaDe60naoprioriE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[60naoprioriE])"
    Alias ="SomaDeate5presE"
    Expression ="Sum(UnionPrincipalSCFVExterno.ate5presE)"
    Alias ="SomaDe6a11presE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[6a11presE])"
    Alias ="SomaDe12a17presE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[12a17presE])"
    Alias ="SomaDe18a29presE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[18a29presE])"
    Alias ="SomaDe30a59presE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[30a59presE])"
    Alias ="SomaDe60presE"
    Expression ="Sum(UnionPrincipalSCFVExterno.[60presE])"
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
        dbText "Name" ="SomaDe12a17inscE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29inscE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59inscE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5inscE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60inscE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11inscE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5prioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11prioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17prioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29prioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59prioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60prioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5naoprioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11naoprioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17naoprioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29naoprioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59naoprioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60naoprioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5presE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11presE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17presE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29presE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59presE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60presE"
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
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[6a11priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[30a59priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[18a29naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.ate5pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[60pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[6a11inscE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5insc"
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
        dbText "Name" ="SomaDe18a29insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29pres"
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
        dbText "Name" ="SomaDe30a59pres"
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
        dbText "Name" ="SomaDe60pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.ate5inscE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[12a17priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[30a59inscE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.ate5naoprioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[30a59naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[12a17pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[18a29pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.ate5naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[6a11naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[30a59insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[60insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[60inscE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[12a17inscE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.ate5insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[18a29presE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[30a59pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[6a11pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[60naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[60priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[18a29priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[18a29insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[18a29inscE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[12a17insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[12a17naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[60presE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DIRETOR(A)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.ate5priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[6a11insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.ate5prioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeMATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[6a11prioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[12a17prioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[18a29prioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[30a59insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[30a59prioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[60pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[60prioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.ate5presE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[6a11naoprioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[12a17naoprioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[18a29naoprioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[30a59naoprioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[60naoprioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[6a11presE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[12a17presE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[60prioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[18a29presE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[12a17presE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVGeral.[30a59presE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NOME"
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
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[6a11pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[18a29pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeNOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeDIRETOR(A)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeFUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeLOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeRODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.ate5insc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[6a11insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[12a17insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[18a29insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[60insc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.ate5priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[6a11priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[12a17priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[18a29priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[30a59priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[60priori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.ate5naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[6a11naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[12a17naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[18a29naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[30a59naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[60naopriori]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.ate5pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[12a17pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[30a59pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[60presE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.ate5inscE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[6a11inscE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[12a17inscE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[18a29inscE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[30a59inscE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[60inscE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.ate5prioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[6a11prioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[12a17prioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[18a29prioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[30a59prioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.ate5naoprioriE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[6a11naoprioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[12a17naoprioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[18a29naoprioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[30a59naoprioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[60naoprioriE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.ate5presE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[6a11presE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalSCFVExterno.[30a59presE]"
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
    Right =1175
    Bottom =660
    Left =-1
    Top =-1
    Right =1151
    Bottom =224
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =350
        Top =1
        Right =494
        Bottom =214
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =161
        Top =-7
        Right =318
        Bottom =213
        Top =0
        Name ="UnionPrincipalSCFVExterno"
        Name =""
    End
End
