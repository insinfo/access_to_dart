Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionNumPessoas"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.RODAPE"
    Alias ="SomaDeNumpessMes"
    Expression ="Sum(UnionNumPessoas.NumpessMes)"
    Alias ="SomaDeNumPessAteMes"
    Expression ="Sum(UnionNumPessoas.NumPessAteMes)"
    Alias ="SomaDeNumFamNoMes"
    Expression ="Sum(UnionNumPessoas.NumFamNoMes)"
    Alias ="SomaDeNumFamAteMes"
    Expression ="Sum(UnionNumPessoas.NumFamAteMes)"
    Alias ="SomaDe0a5noMes"
    Expression ="Sum(UnionNumPessoas.[0a5noMes])"
    Alias ="SomaDe0a5ateMes"
    Expression ="Sum(UnionNumPessoas.[0a5ateMes])"
    Alias ="SomaDe6a11noMes"
    Expression ="Sum(UnionNumPessoas.[6a11noMes])"
    Alias ="SomaDe6a11ateMes"
    Expression ="Sum(UnionNumPessoas.[6a11ateMes])"
    Alias ="SomaDe12a14noMes"
    Expression ="Sum(UnionNumPessoas.[12a14noMes])"
    Alias ="SomaDe12a14ateMes"
    Expression ="Sum(UnionNumPessoas.[12a14ateMes])"
    Alias ="SomaDe15a17noMes"
    Expression ="Sum(UnionNumPessoas.[15a17noMes])"
    Alias ="SomaDe15a17ateMes"
    Expression ="Sum(UnionNumPessoas.[15a17ateMes])"
    Alias ="SomaDe18a29noMes"
    Expression ="Sum(UnionNumPessoas.[18a29noMes])"
    Alias ="SomaDe18a29ateMes"
    Expression ="Sum(UnionNumPessoas.[18a29ateMes])"
    Alias ="SomaDe30a59noMes"
    Expression ="Sum(UnionNumPessoas.[30a59noMes])"
    Alias ="SomaDe30a59ateMes"
    Expression ="Sum(UnionNumPessoas.[30a59ateMes])"
    Alias ="SomaDe60noMes"
    Expression ="Sum(UnionNumPessoas.[60noMes])"
    Alias ="SomaDe60ateMes"
    Expression ="Sum(UnionNumPessoas.[60ateMes])"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.FUNÇÃO"
End
Begin Groups
    Expression ="TbUnidade.CRAS"
    GroupLevel =0
    Expression ="TbUnidade.NOME"
    GroupLevel =0
    Expression ="TbUnidade.[DIRETOR(A)]"
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
        dbText "Name" ="SomaDeNumFamAteMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeNumPessAteMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeNumpessMes"
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
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeNumFamNoMes"
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
        dbText "Name" ="FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11ateMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[60ateMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[12a14noMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[0a5noMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a14noMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe0a5noMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[6a11ateMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a14ateMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe0a5ateMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11noMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[12a14ateMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[0a5ateMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[6a11noMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[30a59noMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[15a17noMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59noMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe15a17noMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[30a59ateMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[15a17ateMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59ateMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe15a17ateMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[60noMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[18a29noMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60noMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29noMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60ateMes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionNumPessoas.[18a29ateMes]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29ateMes"
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
    Left =-53
    Top =16
    Right =1055
    Bottom =636
    Left =-1
    Top =-1
    Right =1084
    Bottom =291
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =172
        Top =51
        Right =316
        Bottom =195
        Top =0
        Name ="UnionNumPessoas"
        Name =""
    End
    Begin
        Left =369
        Top =30
        Right =513
        Bottom =179
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
