Operation =1
Option =0
Where ="(((TbSCFVExtDetalhe.CodSCFVEDet)=[Formulários]![FrmSCFVExterno]![CodSCFVEDet]) A"
    "ND ((TbSCFVExtDetalhe.DataDesl) Is Null))"
Begin InputTables
    Name ="TbSCFVExtAtualiz"
    Name ="TbSCFVExtDetalhe"
    Name ="TbGrupoExterno"
End
Begin OutputColumns
    Expression ="TbSCFVExtDetalhe.CodSCFVEDet"
    Expression ="TbSCFVExtAtualiz.CodSCFVExtAtual"
    Expression ="TbSCFVExtAtualiz.CodSCFVEDet"
    Expression ="TbSCFVExtDetalhe.DATAINSCR"
    Expression ="TbSCFVExtAtualiz.DataAtual"
    Expression ="TbSCFVExtDetalhe.GRUPOEXT"
    Expression ="TbGrupoExterno.NomeGrupo"
    Expression ="TbSCFVExtDetalhe.FXETARIA"
    Expression ="TbSCFVExtDetalhe.TURNO"
    Expression ="TbSCFVExtDetalhe.UNIDADE"
    Expression ="TbSCFVExtDetalhe.Nome"
    Expression ="TbSCFVExtDetalhe.SituaçãoUsuario"
    Expression ="TbSCFVExtDetalhe.DataDesl"
    Expression ="TbSCFVExtDetalhe.MotivoDesl"
    Expression ="TbSCFVExtDetalhe.Encaminhado"
    Expression ="TbSCFVExtDetalhe.Onde"
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
    LeftTable ="TbSCFVExtDetalhe"
    RightTable ="TbSCFVExtAtualiz"
    Expression ="TbSCFVExtDetalhe.CodSCFVEDet = TbSCFVExtAtualiz.CodSCFVEDet"
    Flag =2
    LeftTable ="TbGrupoExterno"
    RightTable ="TbSCFVExtDetalhe"
    Expression ="TbGrupoExterno.CodGrupo = TbSCFVExtDetalhe.GRUPOEXT"
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
        dbText "Name" ="TbSCFVExtDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.NomePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtAtualiz.DataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.TelEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Nome"
        dbInteger "ColumnWidth" ="3525"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.VacinaEmDia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.CodSCFVEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Encaminhado"
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
        dbText "Name" ="TbSCFVExtDetalhe.QualAlergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Onde"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Alergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.QualTratamento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.BeneficioMunic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.TratamentoSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.BPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.PBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Medicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.CADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[CPF Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Aco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Cuidador exclusivo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.PAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Motivo busca serviço]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Qual politica encaminhou]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Cuidador exclusivo trabalha]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.QuaisMedicamentos"
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
        dbText "Name" ="TbSCFVExtDetalhe.TURNO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.PessoaEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtAtualiz.CodSCFVExtAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtAtualiz.CodSCFVEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.GRUPOEXT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.FXETARIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.NomeGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DNascPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DNascPessoa"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1094
    Bottom =660
    Left =-1
    Top =-1
    Right =1026
    Bottom =252
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =594
        Top =14
        Right =738
        Bottom =158
        Top =0
        Name ="TbSCFVExtAtualiz"
        Name =""
    End
    Begin
        Left =243
        Top =1
        Right =440
        Bottom =271
        Top =0
        Name ="TbSCFVExtDetalhe"
        Name =""
    End
    Begin
        Left =11
        Top =13
        Right =155
        Bottom =157
        Top =0
        Name ="TbGrupoExterno"
        Name =""
    End
End
