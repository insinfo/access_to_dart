Operation =1
Option =0
Where ="(((TbBeneficiosMunicipais.CodBenef)=[Formulários]![FrmBeneficios]![CodBenef]))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbBeneficiosMunicipais"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbBeneficiosMunicipais.CodBenef"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.CPF"
    Expression ="TbPessoa.RG"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
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
Begin
    Begin
        dbText "Name" ="TbPessoa.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1105
    Bottom =660
    Left =-1
    Top =-1
    Right =1081
    Bottom =309
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =286
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =323
        Top =0
        Name ="TbBeneficiosMunicipais"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =310
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
