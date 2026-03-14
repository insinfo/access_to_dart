Operation =1
Option =1
Where ="((([SISC INTERNO SCFV].MáxDeDataAtual) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="SISC INTERNO SCFV"
    Name ="TbDiario"
    Name ="TbDiarioDet"
    Name ="TbGrupo"
End
Begin OutputColumns
    Expression ="[SISC INTERNO SCFV].MáxDeDataAtual"
    Expression ="TbGrupo.Grupo"
    Expression ="TbGrupo.FxEtaria"
    Expression ="TbGrupo.DiaSemana"
    Expression ="TbGrupo.Horario"
    Expression ="TbGrupo.TIPO"
    Expression ="[SISC INTERNO SCFV].CodFam"
    Alias ="NomeUsuario"
    Expression ="[SISC INTERNO SCFV].TbPessoa.Nome"
    Expression ="[SISC INTERNO SCFV].DNasc"
    Expression ="[SISC INTERNO SCFV].Idade"
    Expression ="[SISC INTERNO SCFV].NomeMae"
    Expression ="[SISC INTERNO SCFV].Sexo"
    Expression ="[SISC INTERNO SCFV].[Raça/Cor]"
    Expression ="[SISC INTERNO SCFV].SituaçãoUsuario"
    Expression ="[SISC INTERNO SCFV].MunicNasc"
    Expression ="[SISC INTERNO SCFV].UFNasc"
    Expression ="[SISC INTERNO SCFV].NIS"
    Expression ="[SISC INTERNO SCFV].CPF"
    Expression ="[SISC INTERNO SCFV].RG"
    Expression ="[SISC INTERNO SCFV].OrgaoRG"
    Expression ="[SISC INTERNO SCFV].DEmisRG"
    Expression ="[SISC INTERNO SCFV].Endereço"
    Expression ="[SISC INTERNO SCFV].Bairro"
    Expression ="[SISC INTERNO SCFV].UF"
    Expression ="[SISC INTERNO SCFV].CEP"
    Expression ="[SISC INTERNO SCFV].Municipio"
    Expression ="[SISC INTERNO SCFV].Complemento"
    Expression ="[SISC INTERNO SCFV].Referencia"
End
Begin Joins
    LeftTable ="TbDiario"
    RightTable ="TbDiarioDet"
    Expression ="TbDiario.CodDiario = TbDiarioDet.CodDiario"
    Flag =1
    LeftTable ="SISC INTERNO SCFV"
    RightTable ="TbDiarioDet"
    Expression ="[SISC INTERNO SCFV].CodPessoa = TbDiarioDet.Nome"
    Flag =1
    LeftTable ="TbGrupo"
    RightTable ="TbDiario"
    Expression ="TbGrupo.CodGrupo = TbDiario.Grupo"
    Flag =1
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
dbSingle "ECLScaleFactor" ="1"
dbMemo "OrderBy" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].[NomeUsuario]"
Begin
    Begin
        dbText "Name" ="TbDiarioDet.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiarioDet.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.CodFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiarioDet.CodDiarioDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiarioDet.CodDiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.NomeOficineiro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.CodDiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.TIPO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV.TbOfSocioEduDetalhe.CodOfSEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.CodGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].ENDEREÇO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NomeUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].MUNICIPIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV.TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV.MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV.TbOfSocioEduDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Volante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1074
    Bottom =660
    Left =-1
    Top =-1
    Right =1006
    Bottom =222
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =640
        Top =9
        Right =908
        Bottom =272
        Top =0
        Name ="SISC INTERNO SCFV"
        Name =""
    End
    Begin
        Left =235
        Top =11
        Right =379
        Bottom =242
        Top =0
        Name ="TbDiario"
        Name =""
    End
    Begin
        Left =438
        Top =12
        Right =582
        Bottom =156
        Top =0
        Name ="TbDiarioDet"
        Name =""
    End
    Begin
        Left =41
        Top =22
        Right =185
        Bottom =281
        Top =0
        Name ="TbGrupo"
        Name =""
    End
End
