Operation =1
Option =2
Where ="(((DESCUMPRIMENTO.CRAS) Like [DIGITE O CRAS]+\"*\"))"
Begin InputTables
    Name ="DESCUMPRIMENTO"
End
Begin OutputColumns
    Expression ="DESCUMPRIMENTO.codfamili"
    Expression ="DESCUMPRIMENTO.CRAS"
    Expression ="DESCUMPRIMENTO.nomeresp"
    Expression ="DESCUMPRIMENTO.bairro"
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
        dbText "Name" ="DESCUMPRIMENTO.codfamili"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DESCUMPRIMENTO.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DESCUMPRIMENTO.bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DESCUMPRIMENTO.nomeresp"
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
    Bottom =188
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
