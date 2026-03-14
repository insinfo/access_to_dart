Operation =1
Option =0
Where ="(((TbBeneficiosMunicipais.TipoBeneficio)=\"BMI\") AND ((TbOfSocioEduDetalhe.Data"
    "Desl) Is Null))"
Begin InputTables
    Name ="TbBeneficiosMunicipais"
    Name ="TbOfSocioEduDetalhe"
End
Begin OutputColumns
    Expression ="TbBeneficiosMunicipais.Nome"
    Expression ="TbBeneficiosMunicipais.CPFPessoa"
    Expression ="TbBeneficiosMunicipais.TipoBeneficio"
    Expression ="TbOfSocioEduDetalhe.Nome"
    Expression ="TbOfSocioEduDetalhe.DNasPessoa"
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    Expression ="TbBeneficiosMunicipais.Volante"
End
Begin Joins
    LeftTable ="TbOfSocioEduDetalhe"
    RightTable ="TbBeneficiosMunicipais"
    Expression ="TbOfSocioEduDetalhe.Nome = TbBeneficiosMunicipais.Nome"
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
        dbText "Name" ="TbBeneficiosMunicipais.CPFPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1127
    Bottom =660
    Left =-1
    Top =-1
    Right =1103
    Bottom =272
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =624
        Top =12
        Right =768
        Bottom =312
        Top =0
        Name ="TbBeneficiosMunicipais"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =243
        Bottom =307
        Top =0
        Name ="TbOfSocioEduDetalhe"
        Name =""
    End
End
