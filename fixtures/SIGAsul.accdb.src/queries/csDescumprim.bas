Operation =1
Option =0
Begin InputTables
    Name ="DESCUMPRIMENTO"
End
Begin OutputColumns
    Expression ="DESCUMPRIMENTO.Identificação"
    Expression ="DESCUMPRIMENTO.CRAS"
    Expression ="DESCUMPRIMENTO.nomeresp"
    Expression ="DESCUMPRIMENTO.nomeDesc"
    Expression ="DESCUMPRIMENTO.nis"
    Expression ="DESCUMPRIMENTO.bairro"
    Expression ="DESCUMPRIMENTO.codfamili"
End
Begin OrderBy
    Expression ="DESCUMPRIMENTO.nomeresp"
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
        dbText "Name" ="DESCUMPRIMENTO.Identificação"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DESCUMPRIMENTO.codfamili"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DESCUMPRIMENTO.nomeDesc"
        dbInteger "ColumnWidth" ="3600"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DESCUMPRIMENTO.nis"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DESCUMPRIMENTO.bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DESCUMPRIMENTO.nomeresp"
        dbInteger "ColumnWidth" ="3330"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DESCUMPRIMENTO.CRAS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1126
    Bottom =524
    Left =-1
    Top =-1
    Right =1102
    Bottom =243
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =380
        Top =7
        Right =739
        Bottom =272
        Top =0
        Name ="DESCUMPRIMENTO"
        Name =""
    End
End
