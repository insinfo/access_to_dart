Operation =1
Option =0
Begin InputTables
    Name ="PrincipalSCFVExterno"
    Name ="CS RESPONSAVEL FAMILIAR"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="PrincipalSCFVExterno.UNIDADE"
    Expression ="PrincipalSCFVExterno.TURNO"
    Expression ="PrincipalSCFVExterno.Nome"
    Expression ="PrincipalSCFVExterno.DNasc"
    Expression ="PrincipalSCFVExterno.Idade"
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
    LeftTable ="PrincipalSCFVExterno"
    RightTable ="CS RESPONSAVEL FAMILIAR"
    Expression ="PrincipalSCFVExterno.CodFam = [CS RESPONSAVEL FAMILIAR].CodFam"
    Flag =1
End
Begin OrderBy
    Expression ="PrincipalSCFVExterno.Nome"
    Flag =0
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
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVExterno.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVExterno.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1395"
        dbBoolean "ColumnHidden" ="0"
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
        dbText "Name" ="PrincipalSCFVExterno.Idade"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="855"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="PrincipalSCFVExterno.TURNO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVExterno.UNIDADE"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2475"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1089
    Bottom =660
    Left =-1
    Top =-1
    Right =1065
    Bottom =250
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =140
        Top =15
        Right =296
        Bottom =223
        Top =0
        Name ="PrincipalSCFVExterno"
        Name =""
    End
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
End
