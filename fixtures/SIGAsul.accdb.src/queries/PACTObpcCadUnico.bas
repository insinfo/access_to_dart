Operation =1
Option =0
Where ="(((BPC.CRAS) Like [DIGITE O CRAS]+\"*\") AND ((BPC.Cadunico)=\"sim\"))"
Begin InputTables
    Name ="BPC"
End
Begin OutputColumns
    Expression ="BPC.CODBPC"
    Expression ="BPC.CRAS"
    Expression ="BPC.Cadunico"
    Expression ="BPC.[Numero Beneficio]"
    Expression ="BPC.NomeTitular"
    Expression ="BPC.[Data Nasc]"
    Expression ="BPC.Endereco"
    Expression ="BPC.Bairro"
    Expression ="BPC.CEP"
    Expression ="BPC.Mae"
    Expression ="BPC.Situacao"
    Expression ="BPC.[Especie Ben]"
    Expression ="BPC.Municipio"
    Expression ="BPC.UF"
    Expression ="BPC.NIS"
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
        dbText "Name" ="BPC.UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.[Numero Beneficio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.CODBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.Endereco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.[Data Nasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.Mae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.Situacao"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.[Especie Ben]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.Cadunico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.NomeTitular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.[Nome Titular]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-156
    Top =89
    Right =956
    Bottom =603
    Left =-1
    Top =-1
    Right =1088
    Bottom =167
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =282
        Bottom =236
        Top =0
        Name ="BPC"
        Name =""
    End
End
