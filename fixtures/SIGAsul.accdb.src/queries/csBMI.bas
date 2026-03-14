Operation =1
Option =0
Where ="(((TbBeneficiosMunicipais.TipoBeneficio)=\"bmi\") AND ((TbBeneficiosMunicipais.D"
    "ataDesl) Is Null))"
Begin InputTables
    Name ="TbBeneficiosMunicipais"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbBeneficiosMunicipais.CodBenef"
    Expression ="TbPessoa.Nome"
    Expression ="TbBeneficiosMunicipais.TipoBeneficio"
    Expression ="TbBeneficiosMunicipais.DataDesl"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.CPF"
    Expression ="TbPessoa.RG"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="TbBeneficiosMunicipais"
    Expression ="TbPessoa.CodPessoa = TbBeneficiosMunicipais.Nome"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-196
    Top =41
    Right =979
    Bottom =661
    Left =-1
    Top =-1
    Right =1151
    Bottom =336
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =202
        Top =21
        Right =407
        Bottom =331
        Top =0
        Name ="TbBeneficiosMunicipais"
        Name =""
    End
    Begin
        Left =464
        Top =14
        Right =608
        Bottom =336
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
