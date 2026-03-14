Operation =1
Option =0
Where ="(((TbBeneficiosMunicipais.DataDesl) Is Null) AND ((TbBeneficiosMunicipais.DataTr"
    "ansf) Is Null))"
Begin InputTables
    Name ="TbBeneficiosMunicipais"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbBeneficiosMunicipais.CodBenef"
    Expression ="TbBeneficiosMunicipais.Nome"
    Expression ="TbBeneficiosMunicipais.TipoBeneficio"
    Expression ="TbBeneficiosMunicipais.DataDesl"
    Expression ="TbBeneficiosMunicipais.DataTransf"
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.CodPessoa"
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
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.DataTransf"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.DataDesl"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.Nome"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="3420"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.CodBenef"
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
End
Begin
    State =0
    Left =88
    Top =146
    Right =1617
    Bottom =857
    Left =-1
    Top =-1
    Right =1505
    Bottom =315
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =416
        Top =17
        Right =670
        Bottom =354
        Top =0
        Name ="TbBeneficiosMunicipais"
        Name =""
    End
    Begin
        Left =891
        Top =50
        Right =1035
        Bottom =194
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
