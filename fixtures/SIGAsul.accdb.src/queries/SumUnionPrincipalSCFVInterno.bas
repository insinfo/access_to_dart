Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionPrincipalSCFVInterno"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Alias ="SomaDeate5insc"
    Expression ="Sum(UnionPrincipalSCFVInterno.ate5insc)"
    Alias ="SomaDe6a11insc"
    Expression ="Sum(UnionPrincipalSCFVInterno.[6a11insc])"
    Alias ="SomaDe12a17insc"
    Expression ="Sum(UnionPrincipalSCFVInterno.[12a17insc])"
    Alias ="SomaDe18a29insc"
    Expression ="Sum(UnionPrincipalSCFVInterno.[18a29insc])"
    Alias ="SomaDe30a59insc"
    Expression ="Sum(UnionPrincipalSCFVInterno.[30a59insc])"
    Alias ="SomaDe60insc"
    Expression ="Sum(UnionPrincipalSCFVInterno.[60insc])"
    Alias ="SomaDeate5priori"
    Expression ="Sum(UnionPrincipalSCFVInterno.ate5priori)"
    Alias ="SomaDe6a11priori"
    Expression ="Sum(UnionPrincipalSCFVInterno.[6a11priori])"
    Alias ="SomaDe12a17priori"
    Expression ="Sum(UnionPrincipalSCFVInterno.[12a17priori])"
    Alias ="SomaDe18a29priori"
    Expression ="Sum(UnionPrincipalSCFVInterno.[18a29priori])"
    Alias ="SomaDe30a59priori"
    Expression ="Sum(UnionPrincipalSCFVInterno.[30a59priori])"
    Alias ="SomaDe60priori"
    Expression ="Sum(UnionPrincipalSCFVInterno.[60priori])"
    Alias ="SomaDeate5naopriori"
    Expression ="Sum(UnionPrincipalSCFVInterno.ate5naopriori)"
    Alias ="SomaDe6a11naopriori"
    Expression ="Sum(UnionPrincipalSCFVInterno.[6a11naopriori])"
    Alias ="SomaDe12a17naopriori"
    Expression ="Sum(UnionPrincipalSCFVInterno.[12a17naopriori])"
    Alias ="SomaDe18a29naopriori"
    Expression ="Sum(UnionPrincipalSCFVInterno.[18a29naopriori])"
    Alias ="SomaDe30a59naopriori"
    Expression ="Sum(UnionPrincipalSCFVInterno.[30a59naopriori])"
    Alias ="SomaDe60naopriori"
    Expression ="Sum(UnionPrincipalSCFVInterno.[60naopriori])"
    Alias ="SomaDeate5pres"
    Expression ="Sum(UnionPrincipalSCFVInterno.ate5pres)"
    Alias ="SomaDe6a11pres"
    Expression ="Sum(UnionPrincipalSCFVInterno.[6a11pres])"
    Alias ="SomaDe12a17pres"
    Expression ="Sum(UnionPrincipalSCFVInterno.[12a17pres])"
    Alias ="SomaDe18a29pres"
    Expression ="Sum(UnionPrincipalSCFVInterno.[18a29pres])"
    Alias ="SomaDe30a59pres"
    Expression ="Sum(UnionPrincipalSCFVInterno.[30a59pres])"
    Alias ="SomaDe60pres"
    Expression ="Sum(UnionPrincipalSCFVInterno.[60pres])"
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
        dbText "Name" ="SomaDe30a59priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeate5priori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17insc"
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
        dbText "Name" ="SomaDe6a11insc"
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
        dbText "Name" ="SomaDe18a29naopriori"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a17pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59naopriori"
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
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
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
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
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
    Bottom =292
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =159
        Top =26
        Right =322
        Bottom =205
        Top =0
        Name ="UnionPrincipalSCFVInterno"
        Name =""
    End
    Begin
        Left =370
        Top =12
        Right =514
        Bottom =283
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
