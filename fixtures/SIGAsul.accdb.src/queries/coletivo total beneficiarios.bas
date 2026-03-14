Operation =1
Option =0
Begin InputTables
    Name ="coletivo total"
    Name ="LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS"
End
Begin OutputColumns
    Expression ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].Nome"
    Expression ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].TipoBeneficio"
    Expression ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].CodFam"
    Alias ="MáxDeDataCol"
    Expression ="Max([coletivo total].DataCol)"
    Expression ="[coletivo total].Nome"
    Expression ="[coletivo total].CodFam"
End
Begin Joins
    LeftTable ="coletivo total"
    RightTable ="LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS"
    Expression ="[coletivo total].CodPessoa = [LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].Nome"
    Flag =1
End
Begin Groups
    Expression ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].Nome"
    GroupLevel =0
    Expression ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].TipoBeneficio"
    GroupLevel =0
    Expression ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].CodFam"
    GroupLevel =0
    Expression ="[coletivo total].Nome"
    GroupLevel =0
    Expression ="[coletivo total].CodFam"
    GroupLevel =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
dbMemo "OrderBy" ="[Lookup_LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS_Nome].[Nome]"
Begin
    Begin
        dbText "Name" ="[coletivo total].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[coletivo total].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeDataCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[LISTAGEM DE BEBEFICIARIOS MUNICIPAIS].TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[LISTAGEM DE BEBEFICIARIOS MUNICIPAIS].CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BENEFICIARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ÚltimoDeDataCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS.TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS].CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS.TbBeneficiosMunicipais.CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[coletivo total].DataCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS.TbBeneficiosMunicipais.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS.TbBeneficiosMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS.TbBeneficiosMunicipais.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS.TbBeneficiosMunicipais.DataTransf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS.TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =158
    Top =15
    Right =974
    Bottom =832
    Left =-1
    Top =-1
    Right =792
    Bottom =438
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =518
        Top =78
        Right =662
        Bottom =438
        Top =0
        Name ="coletivo total"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =368
        Bottom =355
        Top =0
        Name ="LISTAGEM TOTAL BENEFICIARIOS MUNICIPAIS"
        Name =""
    End
End
