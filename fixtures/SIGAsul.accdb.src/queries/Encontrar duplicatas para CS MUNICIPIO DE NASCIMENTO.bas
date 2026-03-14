Operation =1
Option =0
Having ="(((Count([CS MUNICIPIO DE NASCIMENTO].MunicNasc))>1))"
Begin InputTables
    Name ="CS MUNICIPIO DE NASCIMENTO"
End
Begin OutputColumns
    Alias ="MunicNasc Campo"
    Expression ="First([CS MUNICIPIO DE NASCIMENTO].MunicNasc)"
    Alias ="NúmeroDeDupls"
    Expression ="Count([CS MUNICIPIO DE NASCIMENTO].MunicNasc)"
    Expression ="[CS MUNICIPIO DE NASCIMENTO].UFNasc"
End
Begin Groups
    Expression ="[CS MUNICIPIO DE NASCIMENTO].MunicNasc"
    GroupLevel =0
    Expression ="[CS MUNICIPIO DE NASCIMENTO].UFNasc"
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
        dbText "Name" ="NúmeroDeDupls"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MunicNasc Campo"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2160"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[CS MUNICIPIO DE NASCIMENTO].UFNasc"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1103
    Bottom =660
    Left =-1
    Top =-1
    Right =1079
    Bottom =254
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="CS MUNICIPIO DE NASCIMENTO"
        Name =""
    End
End
