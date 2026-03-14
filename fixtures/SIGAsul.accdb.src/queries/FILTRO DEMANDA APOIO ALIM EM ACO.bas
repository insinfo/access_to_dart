Operation =1
Option =0
Begin InputTables
    Name ="FILTRO DEMANDA ATENDIMENTO"
    Name ="FILTRO PARA ACO"
End
Begin OutputColumns
    Expression ="[FILTRO DEMANDA ATENDIMENTO].CodAtend"
    Alias ="EM ACO"
    Expression ="[FILTRO PARA ACO].Nome"
    Expression ="[FILTRO PARA ACO].[PAF inicio]"
    Expression ="[FILTRO DEMANDA ATENDIMENTO].Data"
    Expression ="[FILTRO DEMANDA ATENDIMENTO].TECNICO"
    Expression ="[FILTRO DEMANDA ATENDIMENTO].[FUNÇÃO NO SISTEMA]"
    Expression ="[FILTRO DEMANDA ATENDIMENTO].USUÁRIO"
    Expression ="[FILTRO DEMANDA ATENDIMENTO].CodPessoa"
    Expression ="[FILTRO DEMANDA ATENDIMENTO].DemandaApoioAlim"
    Expression ="[FILTRO DEMANDA ATENDIMENTO].NOME"
    Expression ="[FILTRO DEMANDA ATENDIMENTO].[DIRETOR(A)]"
    Expression ="[FILTRO DEMANDA ATENDIMENTO].FUNÇÃO"
    Expression ="[FILTRO DEMANDA ATENDIMENTO].MATRICULA"
    Expression ="[FILTRO DEMANDA ATENDIMENTO].LOGO"
End
Begin Joins
    LeftTable ="FILTRO PARA ACO"
    RightTable ="FILTRO DEMANDA ATENDIMENTO"
    Expression ="[FILTRO PARA ACO].CodPessoa = [FILTRO DEMANDA ATENDIMENTO].CodPessoa"
    Flag =3
End
Begin OrderBy
    Expression ="[FILTRO PARA ACO].Nome"
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
Begin
    Begin
        dbText "Name" ="[FILTRO DEMANDA ATENDIMENTO].DemandaApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FILTRO DEMANDA ATENDIMENTO].CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FILTRO DEMANDA ATENDIMENTO].LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FILTRO DEMANDA ATENDIMENTO].Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FILTRO DEMANDA ATENDIMENTO].USUÁRIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FILTRO DEMANDA ATENDIMENTO].[FUNÇÃO NO SISTEMA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FILTRO DEMANDA ATENDIMENTO].TECNICO"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1605"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[FILTRO DEMANDA ATENDIMENTO].NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FILTRO DEMANDA ATENDIMENTO].[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FILTRO DEMANDA ATENDIMENTO].FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FILTRO DEMANDA ATENDIMENTO].MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="EM ACO"
        dbInteger "ColumnWidth" ="2250"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FILTRO PARA ACO].[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[FILTRO DEMANDA ATENDIMENTO].CodAtend"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1106
    Bottom =660
    Left =-1
    Top =-1
    Right =1082
    Bottom =292
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =135
        Top =17
        Right =343
        Bottom =296
        Top =0
        Name ="FILTRO DEMANDA ATENDIMENTO"
        Name =""
    End
    Begin
        Left =477
        Top =22
        Right =621
        Bottom =241
        Top =0
        Name ="FILTRO PARA ACO"
        Name =""
    End
End
