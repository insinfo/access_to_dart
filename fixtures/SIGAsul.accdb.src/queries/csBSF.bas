Operation =1
Option =0
Where ="(((TbBeneficiosMunicipais.TipoBeneficio)=\"bsf\") AND ((TbBeneficiosMunicipais.D"
    "ataDesl) Is Null Or (TbBeneficiosMunicipais.DataDesl)>=[DATA FINAL]))"
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
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
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
    Left =-130
    Top =47
    Right =1045
    Bottom =667
    Left =-1
    Top =-1
    Right =1151
    Bottom =221
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =244
        Bottom =322
        Top =0
        Name ="TbBeneficiosMunicipais"
        Name =""
    End
    Begin
        Left =292
        Top =12
        Right =436
        Bottom =222
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
