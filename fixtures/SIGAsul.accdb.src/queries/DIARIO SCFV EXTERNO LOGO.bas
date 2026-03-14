Operation =1
Option =0
Where ="((([DIARIO SCFV EXTERNO].NomeGrupo) Like [DIGITE O GRUPO]+\"*\") AND (([DIARIO S"
    "CFV EXTERNO].DataDesl) Is Null))"
Begin InputTables
    Name ="DIARIO SCFV EXTERNO"
    Name ="TbUnidade"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="[DIARIO SCFV EXTERNO].NomeGrupo"
    Expression ="[DIARIO SCFV EXTERNO].FxEtariaGr"
    Expression ="[DIARIO SCFV EXTERNO].Turno"
    Expression ="[DIARIO SCFV EXTERNO].CodSCFVEDet"
    Expression ="[DIARIO SCFV EXTERNO].DATAINSCR"
    Expression ="[DIARIO SCFV EXTERNO].UNIDADE"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Expression ="[DIARIO SCFV EXTERNO].IdadePessoa"
    Expression ="[DIARIO SCFV EXTERNO].SituaçãoUsuario"
    Expression ="[DIARIO SCFV EXTERNO].DataDesl"
    Expression ="[DIARIO SCFV EXTERNO].MotivoDesl"
    Expression ="[DIARIO SCFV EXTERNO].Encaminhado"
    Expression ="[DIARIO SCFV EXTERNO].Obs"
    Expression ="[DIARIO SCFV EXTERNO].BeneficioMunic"
    Expression ="[DIARIO SCFV EXTERNO].BPC"
    Expression ="[DIARIO SCFV EXTERNO].PBF"
    Expression ="[DIARIO SCFV EXTERNO].CADUNICO"
    Expression ="[DIARIO SCFV EXTERNO].[Nome Respons Criança]"
    Expression ="[DIARIO SCFV EXTERNO].[CPF Resp]"
    Expression ="[DIARIO SCFV EXTERNO].[Cel Resp]"
    Expression ="[DIARIO SCFV EXTERNO].[Parentesco Resp]"
    Expression ="[DIARIO SCFV EXTERNO].Aco"
    Expression ="[DIARIO SCFV EXTERNO].PAF"
    Expression ="[DIARIO SCFV EXTERNO].[Motivo busca serviço]"
    Expression ="[DIARIO SCFV EXTERNO].[Qual politica encaminhou]"
    Expression ="[DIARIO SCFV EXTERNO].[Cuidador exclusivo]"
    Expression ="[DIARIO SCFV EXTERNO].[Cuidador exclusivo trabalha]"
    Expression ="[DIARIO SCFV EXTERNO].VacinaEmDia"
    Expression ="[DIARIO SCFV EXTERNO].Medicamentos"
    Expression ="[DIARIO SCFV EXTERNO].QuaisMedicamentos"
    Expression ="[DIARIO SCFV EXTERNO].TratamentoSaude"
    Expression ="[DIARIO SCFV EXTERNO].QualTratamento"
    Expression ="[DIARIO SCFV EXTERNO].Alergia"
    Expression ="[DIARIO SCFV EXTERNO].QualAlergia"
    Expression ="[DIARIO SCFV EXTERNO].Pediatra"
    Expression ="[DIARIO SCFV EXTERNO].[Autorizado a sair sozinho]"
    Expression ="[DIARIO SCFV EXTERNO].QuemBusca"
    Expression ="[DIARIO SCFV EXTERNO].PessoaEmergencia"
    Expression ="[DIARIO SCFV EXTERNO].TelEmergencia"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="DIARIO SCFV EXTERNO"
    Expression ="TbPessoa.CodPessoa = [DIARIO SCFV EXTERNO].Nome"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].QuemBusca"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].[Autorizado a sair sozinho]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].TelEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].[Cuidador exclusivo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].[CPF Resp]"
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
        dbText "Name" ="[DIARIO SCFV EXTERNO].QualAlergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].TratamentoSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].CodSCFVEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].NomeGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].QualTratamento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].Encaminhado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].BeneficioMunic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].[Motivo busca serviço]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].BPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].QuaisMedicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].PBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].CADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].VacinaEmDia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].Pediatra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].Aco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].PAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].[Qual politica encaminhou]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].[Cuidador exclusivo trabalha]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].Medicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].Alergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].PessoaEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].FxEtariaGr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].Turno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DIARIO SCFV EXTERNO].IdadePessoa"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1089
    Bottom =660
    Left =-1
    Top =-1
    Right =1065
    Bottom =233
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =306
        Top =12
        Right =552
        Bottom =290
        Top =0
        Name ="DIARIO SCFV EXTERNO"
        Name =""
    End
    Begin
        Left =603
        Top =10
        Right =747
        Bottom =325
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =41
        Top =12
        Right =185
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
