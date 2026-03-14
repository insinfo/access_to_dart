Operation =1
Option =0
Where ="(((TbBeneficiosMunicipais.DataDesl) Is Null Or (TbBeneficiosMunicipais.DataDesl)"
    ">=[DATA FINAL]))"
Begin InputTables
    Name ="TbBeneficiosMunicipais"
End
Begin OutputColumns
    Expression ="TbBeneficiosMunicipais.CodBenef"
    Expression ="TbBeneficiosMunicipais.TipoBeneficio"
    Expression ="TbBeneficiosMunicipais.DataDesl"
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
        dbText "Name" ="TbBenfMunDet.[Situação Beneficio]"
        dbInteger "ColumnWidth" ="2220"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.TipoBeneficio"
        dbInteger "ColumnWidth" ="2235"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.DataDesl"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =46
    Top =109
    Right =1165
    Bottom =647
    Left =-1
    Top =-1
    Right =1095
    Bottom =249
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =227
        Top =17
        Right =398
        Bottom =222
        Top =0
        Name ="TbBeneficiosMunicipais"
        Name =""
    End
End
