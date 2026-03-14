Operation =1
Option =0
Where ="(((csBenefMunicipais.TipoBeneficio)=\"BMD\"))"
Begin InputTables
    Name ="csGestantes"
    Name ="csBenefMunicipais"
End
Begin OutputColumns
    Expression ="csGestantes.Nome"
    Expression ="csBenefMunicipais.TipoBeneficio"
End
Begin Joins
    LeftTable ="csGestantes"
    RightTable ="csBenefMunicipais"
    Expression ="csGestantes.CodPessoa = csBenefMunicipais.Nome"
    Flag =1
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
        dbText "Name" ="csGestantes.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBenefMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =295
    Top =73
    Right =1443
    Bottom =640
    Left =-1
    Top =-1
    Right =1124
    Bottom =287
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =164
        Top =23
        Right =308
        Bottom =232
        Top =0
        Name ="csGestantes"
        Name =""
    End
    Begin
        Left =371
        Top =8
        Right =515
        Bottom =285
        Top =0
        Name ="csBenefMunicipais"
        Name =""
    End
End
