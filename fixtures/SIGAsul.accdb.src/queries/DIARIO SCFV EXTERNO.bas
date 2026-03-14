Operation =1
Option =0
Begin InputTables
    Name ="TbSCFVExtDetalhe"
    Name ="TbGrupoExterno"
End
Begin OutputColumns
    Expression ="TbGrupoExterno.NomeGrupo"
    Expression ="TbGrupoExterno.FxEtariaGr"
    Expression ="TbGrupoExterno.Turno"
    Expression ="TbSCFVExtDetalhe.CodSCFVEDet"
    Expression ="TbSCFVExtDetalhe.DATAINSCR"
    Expression ="TbSCFVExtDetalhe.UNIDADE"
    Expression ="TbSCFVExtDetalhe.Nome"
    Expression ="TbSCFVExtDetalhe.DNasPessoa"
    Alias ="IdadePessoa"
    Expression ="Int(DateDiff(\"d\",[DNasPessoa],Date())/365.25)"
    Expression ="TbSCFVExtDetalhe.SituaçãoUsuario"
    Expression ="TbSCFVExtDetalhe.DataDesl"
    Expression ="TbSCFVExtDetalhe.MotivoDesl"
    Expression ="TbSCFVExtDetalhe.Encaminhado"
    Expression ="TbSCFVExtDetalhe.Obs"
    Expression ="TbSCFVExtDetalhe.BeneficioMunic"
    Expression ="TbSCFVExtDetalhe.BPC"
    Expression ="TbSCFVExtDetalhe.PBF"
    Expression ="TbSCFVExtDetalhe.CADUNICO"
    Expression ="TbSCFVExtDetalhe.[Nome Respons Criança]"
    Expression ="TbSCFVExtDetalhe.[CPF Resp]"
    Expression ="TbSCFVExtDetalhe.[Cel Resp]"
    Expression ="TbSCFVExtDetalhe.[Parentesco Resp]"
    Expression ="TbSCFVExtDetalhe.Aco"
    Expression ="TbSCFVExtDetalhe.PAF"
    Expression ="TbSCFVExtDetalhe.[Motivo busca serviço]"
    Expression ="TbSCFVExtDetalhe.[Qual politica encaminhou]"
    Expression ="TbSCFVExtDetalhe.[Cuidador exclusivo]"
    Expression ="TbSCFVExtDetalhe.[Cuidador exclusivo trabalha]"
    Expression ="TbSCFVExtDetalhe.VacinaEmDia"
    Expression ="TbSCFVExtDetalhe.Medicamentos"
    Expression ="TbSCFVExtDetalhe.QuaisMedicamentos"
    Expression ="TbSCFVExtDetalhe.TratamentoSaude"
    Expression ="TbSCFVExtDetalhe.QualTratamento"
    Expression ="TbSCFVExtDetalhe.Alergia"
    Expression ="TbSCFVExtDetalhe.QualAlergia"
    Expression ="TbSCFVExtDetalhe.Pediatra"
    Expression ="TbSCFVExtDetalhe.[Autorizado a sair sozinho]"
    Expression ="TbSCFVExtDetalhe.QuemBusca"
    Expression ="TbSCFVExtDetalhe.PessoaEmergencia"
    Expression ="TbSCFVExtDetalhe.TelEmergencia"
End
Begin Joins
    LeftTable ="TbGrupoExterno"
    RightTable ="TbSCFVExtDetalhe"
    Expression ="TbGrupoExterno.CodGrupo = TbSCFVExtDetalhe.GRUPOEXT"
    Flag =3
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
        dbText "Name" ="TbSCFVExtDetalhe.QualTratamento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.TratamentoSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.NomeGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.PAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.FxEtariaGr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.Turno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.TelEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.CodSCFVEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[CPF Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Encaminhado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Cuidador exclusivo trabalha]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.PBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Nome"
        dbInteger "ColumnWidth" ="2355"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.BeneficioMunic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.BPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.CADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Qual politica encaminhou]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Aco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Motivo busca serviço]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Cuidador exclusivo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.VacinaEmDia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Medicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.QuaisMedicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Alergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.QualAlergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Pediatra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Autorizado a sair sozinho]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.QuemBusca"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.PessoaEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="IdadePessoa"
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
    Bottom =168
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =338
        Top =25
        Right =493
        Bottom =236
        Top =0
        Name ="TbSCFVExtDetalhe"
        Name =""
    End
    Begin
        Left =92
        Top =17
        Right =236
        Bottom =161
        Top =0
        Name ="TbGrupoExterno"
        Name =""
    End
End
