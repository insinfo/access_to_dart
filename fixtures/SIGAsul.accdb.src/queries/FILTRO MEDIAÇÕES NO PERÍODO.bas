Operation =1
Option =0
Where ="(((TbCadFuncionario.Nome) Like [DIGITE O TECNICO]+\"*\"))"
Begin InputTables
    Name ="TbCadFuncionario"
    Name ="TbUnidade"
    Name ="TbPessoa"
    Name ="PrincipalMediacoesOk"
End
Begin OutputColumns
    Alias ="USUÁRIO"
    Expression ="TbPessoa.Nome"
    Alias ="TECNICO"
    Expression ="TbCadFuncionario.Nome"
    Expression ="PrincipalMediacoesOk.Compareceu"
    Expression ="PrincipalMediacoesOk.DataDesl"
    Expression ="PrincipalMediacoesOk.DataRetorno"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="PrincipalMediacoesOk"
    Expression ="TbPessoa.CodPessoa = PrincipalMediacoesOk.Nome"
    Flag =1
    LeftTable ="TbCadFuncionario"
    RightTable ="PrincipalMediacoesOk"
    Expression ="TbCadFuncionario.CodFunc = PrincipalMediacoesOk.CodTecnico"
    Flag =1
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
        dbText "Name" ="TbAcoRetorno.Compareceu"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcoRetorno.DataRetorno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.Nome"
        dbInteger "ColumnWidth" ="2430"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.NomeTec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
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
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TECNICO"
        dbInteger "ColumnWidth" ="2430"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="USUÁRIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalMediacoesOk.DataRetorno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalMediacoesOk.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalMediacoesOk.Compareceu"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-194
    Top =28
    Right =1192
    Bottom =620
    Left =-1
    Top =-1
    Right =1362
    Bottom =272
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =610
        Top =180
        Right =754
        Bottom =324
        Top =0
        Name ="TbCadFuncionario"
        Name =""
    End
    Begin
        Left =787
        Top =24
        Right =931
        Bottom =344
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =465
        Top =12
        Right =609
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =122
        Top =-5
        Right =426
        Bottom =273
        Top =0
        Name ="PrincipalMediacoesOk"
        Name =""
    End
End
