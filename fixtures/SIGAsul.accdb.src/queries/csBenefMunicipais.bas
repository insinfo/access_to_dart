Operation =1
Option =0
Where ="(((TbBeneficiosMunicipais.DataDesl) Is Null Or (TbBeneficiosMunicipais.DataDesl)"
    ">=[DATA FINAL]))"
Begin InputTables
    Name ="TbBeneficiosMunicipais"
End
Begin OutputColumns
    Expression ="TbBeneficiosMunicipais.CodBenef"
    Expression ="TbBeneficiosMunicipais.dataInsc"
    Expression ="TbBeneficiosMunicipais.DataDesl"
    Expression ="TbBeneficiosMunicipais.Nome"
    Expression ="TbBeneficiosMunicipais.CPFPessoa"
    Expression ="TbBeneficiosMunicipais.Celularpessoa"
    Expression ="TbBeneficiosMunicipais.Responsavel"
    Expression ="TbBeneficiosMunicipais.TipoBeneficio"
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
        dbText "Name" ="TbBeneficiosMunicipais.Responsavel"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.Celularpessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.CPFPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.Nome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3930"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.dataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.CodBenef"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1175
    Bottom =660
    Left =-1
    Top =-1
    Right =1151
    Bottom =202
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =294
        Bottom =272
        Top =0
        Name ="TbBeneficiosMunicipais"
        Name =""
    End
End
