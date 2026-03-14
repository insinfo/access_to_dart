Operation =1
Option =0
Begin InputTables
    Name ="csBenefEmergFamilia"
End
Begin OutputColumns
    Alias ="CodFam Campo"
    Expression ="csBenefEmergFamilia.CodFam"
    Alias ="ContarDeCodFam"
    Expression ="Count(csBenefEmergFamilia.CodFam)"
End
Begin OrderBy
    Expression ="Count(csBenefEmergFamilia.CodFam)"
    Flag =1
End
Begin Groups
    Expression ="csBenefEmergFamilia.CodFam"
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
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="CodFam Campo"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="ContarDeCodFam"
        dbLong "AggregateType" ="-1"
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
    Bottom =220
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =391
        Bottom =272
        Top =0
        Name ="csBenefEmergFamilia"
        Name =""
    End
End
