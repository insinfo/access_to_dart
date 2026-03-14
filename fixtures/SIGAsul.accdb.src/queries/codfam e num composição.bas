Operation =1
Option =16
RowCount ="60"
Begin InputTables
    Name ="filtro composição casa da criança"
End
Begin OutputColumns
    Expression ="[filtro composição casa da criança].CodFam"
    Expression ="[filtro composição casa da criança].ContarDeNome"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbMemo "OrderBy" ="[codfam e num composição].[ContarDeNome] DESC"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbByte "RecordsetType" ="0"
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="[filtro composição casa da criança].ContarDeNome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[filtro composição casa da criança].CodFam"
        dbLong "AggregateType" ="2"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1617
    Bottom =857
    Left =-1
    Top =-1
    Right =1593
    Bottom =472
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =163
        Top =21
        Right =577
        Bottom =396
        Top =0
        Name ="filtro composição casa da criança"
        Name =""
    End
End
