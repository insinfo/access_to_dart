Operation =1
Option =0
Begin InputTables
    Name ="atendimento total"
    Name ="LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS"
End
Begin OutputColumns
    Alias ="MáxDeData"
    Expression ="Max([atendimento total].Data)"
    Expression ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].CodFam"
    Expression ="[atendimento total].CodFam"
    Expression ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].TipoBeneficio"
    Expression ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].Nome"
    Expression ="[atendimento total].Idade"
End
Begin Joins
    LeftTable ="LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS"
    RightTable ="atendimento total"
    Expression ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].CodPessoa = [atendimento total].Nome"
    Flag =1
End
Begin Groups
    Expression ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].CodFam"
    GroupLevel =0
    Expression ="[atendimento total].CodFam"
    GroupLevel =0
    Expression ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].TipoBeneficio"
    GroupLevel =0
    Expression ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].Nome"
    GroupLevel =0
    Expression ="[atendimento total].Idade"
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
        dbText "Name" ="[atendimento total].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeData"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ÚltimoDeData"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Beneficiario"
        dbInteger "ColumnWidth" ="3345"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[atendimento total].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[atendimento total].Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[atendimento total].CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[LISTAGEM DE BEBEFICIARIOS MUNICIPAIS].TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[atendimento total].DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[LISTAGEM DE BEBEFICIARIOS MUNICIPAIS].CodFam"
        dbInteger "ColumnWidth" ="1185"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[atendimento total].Data"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =13
    Top =33
    Right =1630
    Bottom =850
    Left =-1
    Top =-1
    Right =1593
    Bottom =296
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =128
        Top =13
        Right =295
        Bottom =304
        Top =0
        Name ="atendimento total"
        Name =""
    End
    Begin
        Left =343
        Top =12
        Right =501
        Bottom =297
        Top =0
        Name ="LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS"
        Name =""
    End
End
