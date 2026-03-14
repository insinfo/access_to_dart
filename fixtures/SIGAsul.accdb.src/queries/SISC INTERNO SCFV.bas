Operation =1
Option =0
Having ="(((TbOfSocioEduDetalhe.DataDesl) Is Null))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbOfSocioEduDetalhe"
    Name ="CadResidencia"
    Name ="TbOfSocioEduAtualiz"
End
Begin OutputColumns
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    Alias ="MáxDeDataAtual"
    Expression ="Max(TbOfSocioEduAtualiz.DataAtual)"
    Expression ="TbOfSocioEduDetalhe.CodOfSEDet"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Expression ="TbPessoa.NIS"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Expression ="TbPessoa.NomeMae"
    Expression ="TbPessoa.Sexo"
    Expression ="TbPessoa.[Raça/Cor]"
    Expression ="TbOfSocioEduDetalhe.SituaçãoUsuario"
    Expression ="TbPessoa.MunicNasc"
    Expression ="TbPessoa.UFNasc"
    Expression ="TbPessoa.CPF"
    Expression ="TbPessoa.RG"
    Expression ="TbPessoa.OrgaoRG"
    Expression ="TbPessoa.DEmisRG"
    Expression ="TbPessoa.CodFam"
    Expression ="CadResidencia.Endereço"
    Expression ="CadResidencia.Bairro"
    Expression ="CadResidencia.UF"
    Expression ="CadResidencia.CEP"
    Expression ="CadResidencia.Municipio"
    Expression ="CadResidencia.Complemento"
    Expression ="CadResidencia.Referencia"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbOfSocioEduDetalhe"
    Expression ="TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome"
    Flag =1
    LeftTable ="TbOfSocioEduDetalhe"
    RightTable ="TbOfSocioEduAtualiz"
    Expression ="TbOfSocioEduDetalhe.CodOfSEDet = TbOfSocioEduAtualiz.CodOfSEDet"
    Flag =1
End
Begin Groups
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    GroupLevel =0
    Expression ="TbOfSocioEduDetalhe.CodOfSEDet"
    GroupLevel =0
    Expression ="TbPessoa.CodPessoa"
    GroupLevel =0
    Expression ="TbPessoa.Nome"
    GroupLevel =0
    Expression ="TbPessoa.DNasc"
    GroupLevel =0
    Expression ="TbPessoa.NIS"
    GroupLevel =0
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    GroupLevel =0
    Expression ="TbPessoa.NomeMae"
    GroupLevel =0
    Expression ="TbPessoa.Sexo"
    GroupLevel =0
    Expression ="TbPessoa.[Raça/Cor]"
    GroupLevel =0
    Expression ="TbOfSocioEduDetalhe.SituaçãoUsuario"
    GroupLevel =0
    Expression ="TbPessoa.MunicNasc"
    GroupLevel =0
    Expression ="TbPessoa.UFNasc"
    GroupLevel =0
    Expression ="TbPessoa.CPF"
    GroupLevel =0
    Expression ="TbPessoa.RG"
    GroupLevel =0
    Expression ="TbPessoa.OrgaoRG"
    GroupLevel =0
    Expression ="TbPessoa.DEmisRG"
    GroupLevel =0
    Expression ="TbPessoa.CodFam"
    GroupLevel =0
    Expression ="CadResidencia.Endereço"
    GroupLevel =0
    Expression ="CadResidencia.Bairro"
    GroupLevel =0
    Expression ="CadResidencia.UF"
    GroupLevel =0
    Expression ="CadResidencia.CEP"
    GroupLevel =0
    Expression ="CadResidencia.Municipio"
    GroupLevel =0
    Expression ="CadResidencia.Complemento"
    GroupLevel =0
    Expression ="CadResidencia.Referencia"
    GroupLevel =0
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
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.CodOfSEDet"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="795"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="810"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3165"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[NIS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[Nome]"
        dbInteger "ColumnWidth" ="3615"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[DNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbOfSocioEduDetalhe].[CodOfSEDet]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CadResidencia].[Endereço]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CadResidencia].[Referencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[CodPessoa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[NomeMae]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[Sexo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbOfSocioEduDetalhe].[SituaçãoUsuario]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[MunicNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[UFNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[CPF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[RG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[OrgaoRG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[DEmisRG]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[CodFam]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CadResidencia].[Bairro]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CadResidencia].[UF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CadResidencia].[CEP]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CadResidencia].[Municipio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CadResidencia].[Complemento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbOfSocioEduDetalhe].[DataDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1080"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1110"
        dbBoolean "ColumnHidden" ="0"
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
    Bottom =222
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =413
        Top =5
        Right =557
        Bottom =214
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =584
        Top =11
        Right =755
        Bottom =358
        Top =0
        Name ="TbOfSocioEduDetalhe"
        Name =""
    End
    Begin
        Left =236
        Top =8
        Right =380
        Bottom =270
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =821
        Top =28
        Right =965
        Bottom =172
        Top =0
        Name ="TbOfSocioEduAtualiz"
        Name =""
    End
End
