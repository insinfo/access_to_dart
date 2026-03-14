Operation =1
Option =0
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR"
    Name ="TbUnidade"
    Name ="PrincipalSCFVInterno"
End
Begin OutputColumns
    Expression ="PrincipalSCFVInterno.CodPessoa"
    Expression ="PrincipalSCFVInterno.CodFam"
    Expression ="PrincipalSCFVInterno.DataInsc"
    Expression ="PrincipalSCFVInterno.NomePessoa"
    Expression ="PrincipalSCFVInterno.DNasc"
    Expression ="PrincipalSCFVInterno.Idade"
    Expression ="PrincipalSCFVInterno.DataDesl"
    Expression ="PrincipalSCFVInterno.SituaçãoUsuario"
    Alias ="RESPONSAVEL"
    Expression ="[CS RESPONSAVEL FAMILIAR].Nome"
    Expression ="[CS RESPONSAVEL FAMILIAR].Parentesco"
    Expression ="[CS RESPONSAVEL FAMILIAR].CPF"
    Expression ="[CS RESPONSAVEL FAMILIAR].RG"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR"
    RightTable ="PrincipalSCFVInterno"
    Expression ="[CS RESPONSAVEL FAMILIAR].CodFam = PrincipalSCFVInterno.CodFam"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].Parentesco"
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
        dbText "Name" ="PrincipalSCFVInterno.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVInterno.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVInterno.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVInterno.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVInterno.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVInterno.DataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVInterno.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RESPONSAVEL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="INSCRITO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVInterno.NomePessoa"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1038
    Bottom =660
    Left =-1
    Top =-1
    Right =970
    Bottom =216
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =341
        Top =19
        Right =523
        Bottom =223
        Top =0
        Name ="CS RESPONSAVEL FAMILIAR"
        Name =""
    End
    Begin
        Left =571
        Top =12
        Right =715
        Bottom =238
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =98
        Top =26
        Right =296
        Bottom =285
        Top =0
        Name ="PrincipalSCFVInterno"
        Name =""
    End
End
