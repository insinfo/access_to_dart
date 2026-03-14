Operation =1
Option =0
Having ="(((csUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionRMA"
    Name ="csUnidade"
End
Begin OutputColumns
    Expression ="csUnidade.CodUnidade"
    Expression ="csUnidade.CRAS"
    Expression ="csUnidade.RMA1"
    Expression ="csUnidade.[Nº UNIDADE]"
    Expression ="csUnidade.NOME"
    Expression ="csUnidade.[DIRETOR(A)]"
    Expression ="csUnidade.CARGO"
    Expression ="csUnidade.FUNÇÃO"
    Expression ="csUnidade.MATRICULA"
    Expression ="csUnidade.ENDEREÇO"
    Expression ="csUnidade.MUNICIPIO"
    Expression ="csUnidade.UF"
    Alias ="SomaDeA2"
    Expression ="Sum(UnionRMA.A2)"
    Alias ="SomaDeB1"
    Expression ="Sum(UnionRMA.B1)"
    Alias ="SomaDeB2"
    Expression ="Sum(UnionRMA.B2)"
    Alias ="SomaDeB3"
    Expression ="Sum(UnionRMA.B3)"
    Alias ="SomaDeB4"
    Expression ="Sum(UnionRMA.B4)"
    Alias ="SomaDeB5"
    Expression ="Sum(UnionRMA.B5)"
    Alias ="SomaDeB6"
    Expression ="Sum(UnionRMA.B6)"
    Alias ="SomaDeC1"
    Expression ="Sum(UnionRMA.C1)"
    Alias ="SomaDeC2"
    Expression ="Sum(UnionRMA.C2)"
    Alias ="SomaDeC3"
    Expression ="Sum(UnionRMA.C3)"
    Alias ="SomaDeC4"
    Expression ="Sum(UnionRMA.C4)"
    Alias ="SomaDeC5"
    Expression ="Sum(UnionRMA.C5)"
    Alias ="SomaDeC6"
    Expression ="Sum(UnionRMA.C6)"
    Alias ="SomaDeC7"
    Expression ="Sum(UnionRMA.C7)"
    Alias ="SomaDeC9"
    Expression ="Sum(UnionRMA.C9)"
    Alias ="SomaDeD1"
    Expression ="Sum(UnionRMA.D1)"
    Alias ="SomaDeD2"
    Expression ="Sum(UnionRMA.D2)"
    Alias ="SomaDeD3"
    Expression ="Sum(UnionRMA.D3)"
    Alias ="SomaDeD4"
    Expression ="Sum(UnionRMA.D4)"
    Alias ="SomaDeD5"
    Expression ="Sum(UnionRMA.D5)"
    Alias ="SomaDeD6"
    Expression ="Sum(UnionRMA.D6)"
    Alias ="SomaDeD7"
    Expression ="Sum(UnionRMA.D7)"
    Alias ="SomaDeD8"
    Expression ="Sum(UnionRMA.D8)"
    Alias ="SomaDeA1"
    Expression ="Sum(UnionRMA.A1)"
    Alias ="SomaDeC1A"
    Expression ="Sum(UnionRMA.C1A)"
End
Begin Groups
    Expression ="csUnidade.CodUnidade"
    GroupLevel =0
    Expression ="csUnidade.CRAS"
    GroupLevel =0
    Expression ="csUnidade.[Nº UNIDADE]"
    GroupLevel =0
    Expression ="csUnidade.NOME"
    GroupLevel =0
    Expression ="csUnidade.[DIRETOR(A)]"
    GroupLevel =0
    Expression ="csUnidade.CARGO"
    GroupLevel =0
    Expression ="csUnidade.FUNÇÃO"
    GroupLevel =0
    Expression ="csUnidade.MATRICULA"
    GroupLevel =0
    Expression ="csUnidade.ENDEREÇO"
    GroupLevel =0
    Expression ="csUnidade.MUNICIPIO"
    GroupLevel =0
    Expression ="csUnidade.UF"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="SomaDeB1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeD7"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeD5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeB2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeA2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeD6"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeB3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeB4"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeB5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeB6"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeC2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeC3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeC4"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeC5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeA1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeC6"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeC7"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeC9"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeD1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeD2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeD3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeD4"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeD8"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csUnidade.UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csUnidade.CodUnidade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csUnidade.ENDEREÇO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csUnidade.[Nº UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csUnidade.MUNICIPIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csUnidade.CARGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeC1A"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeC1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csUnidade.RMA1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodUnidade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RMA1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nº UNIDADE"
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
        dbText "Name" ="CARGO"
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
        dbText "Name" ="ENDEREÇO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MUNICIPIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csUnidade].[NOME]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csUnidade].[Nº UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csUnidade].[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csUnidade].[RMA1]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csUnidade].[CRAS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csUnidade].[CodUnidade]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csUnidade].[UF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csUnidade].[MUNICIPIO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csUnidade].[ENDEREÇO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csUnidade].[CARGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csUnidade].[FUNÇÃO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[csUnidade].[MATRICULA]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1132
    Bottom =660
    Left =-1
    Top =-1
    Right =1108
    Bottom =352
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =398
        Top =5
        Right =560
        Bottom =331
        Top =0
        Name ="UnionRMA"
        Name =""
    End
    Begin
        Left =150
        Top =9
        Right =312
        Bottom =331
        Top =0
        Name ="csUnidade"
        Name =""
    End
End
