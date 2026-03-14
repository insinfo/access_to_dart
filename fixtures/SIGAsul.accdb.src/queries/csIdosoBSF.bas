Operation =1
Option =0
Where ="(((csBenefMunicipais.TipoBeneficio)=\"BSF\"))"
Begin InputTables
    Name ="csIdosos"
    Name ="csBenefMunicipais"
End
Begin OutputColumns
    Expression ="csIdosos.Nome"
    Expression ="csBenefMunicipais.TipoBeneficio"
End
Begin Joins
    LeftTable ="csIdosos"
    RightTable ="csBenefMunicipais"
    Expression ="csIdosos.CodPessoa = csBenefMunicipais.Nome"
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
        dbText "Name" ="csIdosos.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBenefMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csIdosos.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =0
    Right =1161
    Bottom =660
    Left =-1
    Top =-1
    Right =1093
    Bottom =117
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =78
        Top =34
        Right =222
        Bottom =190
        Top =0
        Name ="csIdosos"
        Name =""
    End
    Begin
        Left =305
        Top =18
        Right =449
        Bottom =189
        Top =0
        Name ="csBenefMunicipais"
        Name =""
    End
End
