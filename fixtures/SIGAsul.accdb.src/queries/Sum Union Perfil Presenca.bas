Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="Union Perfil Presenca"
    Name ="TbUnidade"
End
Begin OutputColumns
    Alias ="SomaDe0a5inc"
    Expression ="Sum([Union Perfil Presenca].[0a5inc])"
    Alias ="SomaDe6a11inc"
    Expression ="Sum([Union Perfil Presenca].[6a11inc])"
    Alias ="SomaDe12a14inc"
    Expression ="Sum([Union Perfil Presenca].[12a14inc])"
    Alias ="SomaDe15a17inc"
    Expression ="Sum([Union Perfil Presenca].[15a17inc])"
    Alias ="SomaDe18a29inc"
    Expression ="Sum([Union Perfil Presenca].[18a29inc])"
    Alias ="SomaDe30a59inc"
    Expression ="Sum([Union Perfil Presenca].[30a59inc])"
    Alias ="SomaDe60inc"
    Expression ="Sum([Union Perfil Presenca].[60inc])"
    Alias ="SomaDe0a5ins"
    Expression ="Sum([Union Perfil Presenca].[0a5ins])"
    Alias ="SomaDe6a11ins"
    Expression ="Sum([Union Perfil Presenca].[6a11ins])"
    Alias ="SomaDe12a14ins"
    Expression ="Sum([Union Perfil Presenca].[12a14ins])"
    Alias ="SomaDe15a17ins"
    Expression ="Sum([Union Perfil Presenca].[15a17ins])"
    Alias ="SomaDe18a29ins"
    Expression ="Sum([Union Perfil Presenca].[18a29ins])"
    Alias ="SomaDe30a59ins"
    Expression ="Sum([Union Perfil Presenca].[30a59ins])"
    Alias ="SomaDe60isc"
    Expression ="Sum([Union Perfil Presenca].[60isc])"
    Alias ="SomaDe0a5exc"
    Expression ="Sum([Union Perfil Presenca].[0a5exc])"
    Alias ="SomaDe6a11exc"
    Expression ="Sum([Union Perfil Presenca].[6a11exc])"
    Alias ="SomaDe12a14exc"
    Expression ="Sum([Union Perfil Presenca].[12a14exc])"
    Alias ="SomaDe15a17exc"
    Expression ="Sum([Union Perfil Presenca].[15a17exc])"
    Alias ="SomaDe18a29exc"
    Expression ="Sum([Union Perfil Presenca].[18a29exc])"
    Alias ="SomaDe30a59exc"
    Expression ="Sum([Union Perfil Presenca].[30a59exc])"
    Alias ="SomaDe60exc"
    Expression ="Sum([Union Perfil Presenca].[60exc])"
    Alias ="SomaDe0a5pri"
    Expression ="Sum([Union Perfil Presenca].[0a5pri])"
    Alias ="SomaDe6a11pri"
    Expression ="Sum([Union Perfil Presenca].[6a11pri])"
    Alias ="SomaDe12a14pri"
    Expression ="Sum([Union Perfil Presenca].[12a14pri])"
    Alias ="SomaDe15a17pri"
    Expression ="Sum([Union Perfil Presenca].[15a17pri])"
    Alias ="SomaDe18a29pri"
    Expression ="Sum([Union Perfil Presenca].[18a29pri])"
    Alias ="SomaDe30a59pri"
    Expression ="Sum([Union Perfil Presenca].[30a59pri])"
    Alias ="SomaDe60pri"
    Expression ="Sum([Union Perfil Presenca].[60pri])"
    Alias ="SomaDe0a5npri"
    Expression ="Sum([Union Perfil Presenca].[0a5npri])"
    Alias ="SomaDe6a11npri"
    Expression ="Sum([Union Perfil Presenca].[6a11npri])"
    Alias ="SomaDe12a14npri"
    Expression ="Sum([Union Perfil Presenca].[12a14npri])"
    Alias ="SomaDe15a17npri"
    Expression ="Sum([Union Perfil Presenca].[15a17npri])"
    Alias ="SomaDe18a29npri"
    Expression ="Sum([Union Perfil Presenca].[18a29npri])"
    Alias ="SomaDe30a59npri"
    Expression ="Sum([Union Perfil Presenca].[30a59npri])"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Alias ="SomaDe60npri"
    Expression ="Sum([Union Perfil Presenca].[60npri])"
    Alias ="SomaDe0a5pres"
    Expression ="Sum([Union Perfil Presenca].[0a5pres])"
    Alias ="SomaDe6a11pres"
    Expression ="Sum([Union Perfil Presenca].[6a11pres])"
    Alias ="SomaDe12a14pres"
    Expression ="Sum([Union Perfil Presenca].[12a14pres])"
    Alias ="SomaDe15a17pres"
    Expression ="Sum([Union Perfil Presenca].[15a17pres])"
    Alias ="SomaDe18a29pres"
    Expression ="Sum([Union Perfil Presenca].[18a29pres])"
    Alias ="SomaDe30a59pres"
    Expression ="Sum([Union Perfil Presenca].[30a59pres])"
    Alias ="SomaDe60pres"
    Expression ="Sum([Union Perfil Presenca].[60pres])"
End
Begin Groups
    Expression ="TbUnidade.CRAS"
    GroupLevel =0
    Expression ="TbUnidade.NOME"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="[Union Perfil Presenca].[18a29ins]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[0a5ins]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[15a17inc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe15a17ins"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60inc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a14inc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[15a17ins]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[60inc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[12a14inc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60isc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a14ins"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59inc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11inc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[60isc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[12a14ins]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[30a59inc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[6a11inc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59ins"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11ins"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29inc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe0a5inc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[30a59ins]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[6a11ins]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[18a29inc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[0a5inc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29ins"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe0a5ins"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe15a17inc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[60pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[30a59pri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[6a11pri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[18a29exc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[0a5exc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59pri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11pri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29exc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe0a5exc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[60pri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[12a14pri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[30a59exc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[6a11exc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60pri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a14pri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59exc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11exc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[0a5npri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[15a17pri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[60exc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[12a14exc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe0a5npri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe15a17pri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60exc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a14exc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[6a11npri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[18a29pri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[0a5pri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[15a17exc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11npri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29pri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe0a5pri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe15a17exc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[12a14npri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a14npri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[NOME]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[15a17npri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe15a17npri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[18a29npri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29npri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[30a59npri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe30a59npri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[60npri]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe60npri"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[0a5pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe0a5pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[6a11pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe6a11pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[12a14pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe12a14pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[15a17pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe15a17pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[18a29pres]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDe18a29pres"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[Union Perfil Presenca].[30a59pres]"
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
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
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
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[FUNÇÃO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
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
        dbText "Name" ="[TbUnidade].[LOGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[RODAPE]"
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
    Begin
        dbText "Name" ="CRAS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1088
    Bottom =660
    Left =-1
    Top =-1
    Right =1064
    Bottom =292
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =513
        Top =27
        Right =680
        Bottom =189
        Top =0
        Name ="Union Perfil Presenca"
        Name =""
    End
    Begin
        Left =79
        Top =21
        Right =302
        Bottom =295
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
