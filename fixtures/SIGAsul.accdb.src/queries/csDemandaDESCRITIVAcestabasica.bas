Operation =1
Option =0
Where ="(((TbDemandaReprimida.cestabasica)=Yes) AND ((TbDemandaReprimida.data)<=[DATA FI"
    "NAL]) AND ((TbDemandaReprimida.[Data saída]) Is Null) AND ((TbPessoa.DataDesligP"
    "es) Is Null))"
Begin InputTables
    Name ="TbUnidade"
    Name ="CadResidencia"
    Name ="TbPessoa"
    Name ="TbDemandaReprimida"
    Name ="csBenefMunicipais"
End
Begin OutputColumns
    Expression ="TbDemandaReprimida.CodDemanda"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbDemandaReprimida.Nome"
    Expression ="TbDemandaReprimida.CelularPessoa"
    Expression ="CadResidencia.MulherCF"
    Expression ="CadResidencia.[PBF FAMILIA]"
    Expression ="CadResidencia.[Fam Extrema Pb]"
    Expression ="TbPessoa.[Renda per capita]"
    Expression ="TbPessoa.[Aposentado/pensionista]"
    Expression ="CadResidencia.[Area violencia]"
    Expression ="CadResidencia.[Area de risco]"
    Expression ="TbDemandaReprimida.cestabasica"
    Expression ="TbDemandaReprimida.data"
    Expression ="csBenefMunicipais.TipoBeneficio"
    Expression ="TbDemandaReprimida.[Data saída]"
    Expression ="TbDemandaReprimida.[Motivo saída]"
End
Begin Joins
    LeftTable ="TbUnidade"
    RightTable ="CadResidencia"
    Expression ="TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="csBenefMunicipais"
    Expression ="TbPessoa.CodPessoa = csBenefMunicipais.Nome"
    Flag =2
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbDemandaReprimida"
    Expression ="TbPessoa.CodPessoa = TbDemandaReprimida.Nome"
    Flag =1
End
Begin OrderBy
    Expression ="TbDemandaReprimida.data"
    Flag =0
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
        dbText "Name" ="TbDemandaReprimida.CodDemanda"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.cestabasica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.CelularPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.MulherCF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Fam Extrema Pb]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Area violencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Area de risco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csBenefMunicipais.TipoBeneficio"
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
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.[Area de risco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDemandaDESCRITIVAativ.data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Demanda scfv atividade]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[0a5]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Data saída]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Motivo saída]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1402
    Bottom =685
    Left =-1
    Top =-1
    Right =1378
    Bottom =331
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =622
        Top =14
        Right =766
        Bottom =273
        Top =0
        Name ="TbDemandaReprimida"
        Name =""
    End
    Begin
        Left =781
        Top =1
        Right =925
        Bottom =242
        Top =0
        Name ="csBenefMunicipais"
        Name =""
    End
End
