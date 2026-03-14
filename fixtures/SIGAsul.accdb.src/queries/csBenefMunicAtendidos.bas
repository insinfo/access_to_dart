Operation =1
Option =0
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="csBenefMunicipais"
    Name ="TbAtend"
End
Begin OutputColumns
    Expression ="TbAtend.Data"
    Expression ="csBenefMunicipais.dataInsc"
    Expression ="csBenefMunicipais.DataDesl"
    Expression ="csBenefMunicipais.Nome"
    Expression ="csBenefMunicipais.CPFPessoa"
    Expression ="csBenefMunicipais.Celularpessoa"
    Expression ="csBenefMunicipais.Responsavel"
    Expression ="csBenefMunicipais.TipoBeneficio"
End
Begin Joins
    LeftTable ="csBenefMunicipais"
    RightTable ="TbAtend"
    Expression ="csBenefMunicipais.Nome = TbAtend.Nome"
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
        dbText "Name" ="csBenefMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBenefMunicipais.dataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBenefMunicipais.CPFPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBenefMunicipais.Nome"
        dbInteger "ColumnWidth" ="1830"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBenefMunicipais.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBenefMunicipais.Responsavel"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBenefMunicipais.Celularpessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =1
    Top =41
    Right =1151
    Bottom =539
    Left =-1
    Top =-1
    Right =1126
    Bottom =237
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =128
        Top =14
        Right =272
        Bottom =272
        Top =0
        Name ="csBenefMunicipais"
        Name =""
    End
    Begin
        Left =320
        Top =12
        Right =582
        Bottom =288
        Top =0
        Name ="TbAtend"
        Name =""
    End
End
