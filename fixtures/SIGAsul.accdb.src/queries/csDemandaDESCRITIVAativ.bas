Operation =1
Option =0
Where ="(((TbDemandaReprimida.data)<=[DATA FINAL]) AND ((TbDemandaReprimida.[Data saída]"
    ") Is Null) AND ((TbPessoa.DataDesligPes) Is Null))"
Begin InputTables
    Name ="TbDemandaReprimida"
    Name ="TbUnidade"
    Name ="TbPessoa"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="TbDemandaReprimida.CodDemanda"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="CadResidencia.CodFam"
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
    Expression ="TbDemandaReprimida.[Demanda scfv atividade]"
    Expression ="TbDemandaReprimida.[0a5]"
    Expression ="TbDemandaReprimida.[6a11]"
    Expression ="TbDemandaReprimida.[12a14]"
    Expression ="TbDemandaReprimida.[15a17]"
    Expression ="TbDemandaReprimida.[18a29]"
    Expression ="TbDemandaReprimida.[30a59]"
    Expression ="TbDemandaReprimida.[60mais]"
    Expression ="TbDemandaReprimida.data"
End
Begin Joins
    LeftTable ="TbUnidade"
    RightTable ="CadResidencia"
    Expression ="TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]"
    Flag =1
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
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbDemandaReprimida.[60mais]"
        dbInteger "ColumnWidth" ="825"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[30a59]"
        dbInteger "ColumnWidth" ="705"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[18a29]"
        dbInteger "ColumnWidth" ="810"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.Nome"
        dbInteger "ColumnWidth" ="3165"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[6a11]"
        dbInteger "ColumnWidth" ="705"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[0a5]"
        dbInteger "ColumnWidth" ="765"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[12a14]"
        dbInteger "ColumnWidth" ="825"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[15a17]"
        dbInteger "ColumnWidth" ="705"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.CelularPessoa"
        dbInteger "ColumnWidth" ="1380"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
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
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Demanda scfv atividade]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Fam Extrema Pb]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.MulherCF"
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
        dbText "Name" ="TbDemandaReprimida.CodDemanda"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
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
    Left =-131
    Top =90
    Right =1063
    Bottom =657
    Left =-1
    Top =-1
    Right =1170
    Bottom =204
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =27
        Top =4
        Right =224
        Bottom =236
        Top =0
        Name ="TbDemandaReprimida"
        Name =""
    End
    Begin
        Left =849
        Top =11
        Right =993
        Bottom =148
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =274
        Top =15
        Right =491
        Bottom =210
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =554
        Top =19
        Right =802
        Bottom =310
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
