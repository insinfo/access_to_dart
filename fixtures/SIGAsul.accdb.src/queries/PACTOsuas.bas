Operation =1
Option =0
Where ="(((CADUNICO.CRAS) Like [DIGITE O CRAS]+\"*\"))"
Begin InputTables
    Name ="CADUNICO"
End
Begin OutputColumns
    Expression ="CADUNICO.CODFAM"
    Expression ="CADUNICO.Identificação"
    Expression ="CADUNICO.CRAS"
    Expression ="CADUNICO.NOMECADUNICO"
    Expression ="CADUNICO.NIS"
    Expression ="CADUNICO.DNASC"
    Expression ="CADUNICO.CPF"
    Expression ="CADUNICO.MAE"
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
        dbText "Name" ="CADUNICO.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.DNASC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.CODFAM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.NOMECADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.Identificação"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CADUNICO.MAE"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =67
    Top =124
    Right =985
    Bottom =601
    Left =-1
    Top =-1
    Right =894
    Bottom =123
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =192
        Top =0
        Name ="CADUNICO"
        Name =""
    End
End
