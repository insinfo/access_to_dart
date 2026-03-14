Operation =1
Option =0
Where ="(((TbBeneficiosMunicipais.DataDesl) Is Null Or (TbBeneficiosMunicipais.DataDesl)"
    ">=[DATA FINAL]))"
Begin InputTables
    Name ="TbOfSocioEduDetalhe"
    Name ="TbBeneficiosMunicipais"
End
Begin OutputColumns
    Expression ="TbBeneficiosMunicipais.Nome"
    Expression ="TbBeneficiosMunicipais.DataDesl"
    Expression ="TbOfSocioEduDetalhe.Volante"
    Expression ="TbOfSocioEduDetalhe.BeneficioMunic"
    Expression ="TbOfSocioEduDetalhe.BPC"
    Expression ="TbOfSocioEduDetalhe.PBF"
    Expression ="TbOfSocioEduDetalhe.CADUNICO"
    Expression ="TbBeneficiosMunicipais.TipoBeneficio"
    Expression ="TbOfSocioEduDetalhe.CodOfSEDet"
    Expression ="TbOfSocioEduDetalhe.DataInsc"
    Expression ="TbOfSocioEduDetalhe.Nome"
    Expression ="TbOfSocioEduDetalhe.DNasPessoa"
    Expression ="TbOfSocioEduDetalhe.Idade"
    Expression ="TbOfSocioEduDetalhe.SituaçãoUsuario"
    Expression ="TbOfSocioEduDetalhe.[Nome Respons Criança]"
    Expression ="TbOfSocioEduDetalhe.[CPF Resp]"
    Expression ="TbOfSocioEduDetalhe.[Cel Resp]"
    Expression ="TbOfSocioEduDetalhe.[Parentesco Resp]"
    Expression ="TbOfSocioEduDetalhe.Aco"
    Expression ="TbOfSocioEduDetalhe.PAF"
    Expression ="TbOfSocioEduDetalhe.Obs"
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    Expression ="TbOfSocioEduDetalhe.MotivoDesl"
    Expression ="TbOfSocioEduDetalhe.Encaminhado"
    Expression ="TbOfSocioEduDetalhe.Onde"
    Expression ="TbOfSocioEduDetalhe.[Motivo busca serviço]"
    Expression ="TbOfSocioEduDetalhe.[Qual politica encaminhou]"
    Expression ="TbOfSocioEduDetalhe.[Cuidador exclusivo]"
    Expression ="TbOfSocioEduDetalhe.[Cuidador exclusivo trabalha]"
    Expression ="TbOfSocioEduDetalhe.VacinaEmDia"
    Expression ="TbOfSocioEduDetalhe.Medicamentos"
    Expression ="TbOfSocioEduDetalhe.QuaisMedicamentos"
    Expression ="TbOfSocioEduDetalhe.TratamentoSaude"
    Expression ="TbOfSocioEduDetalhe.QualTratamento"
    Expression ="TbOfSocioEduDetalhe.Alergia"
    Expression ="TbOfSocioEduDetalhe.QualAlergia"
    Expression ="TbOfSocioEduDetalhe.Pediatra"
    Expression ="TbOfSocioEduDetalhe.[Autorizado a sair sozinho]"
    Expression ="TbOfSocioEduDetalhe.QuemBusca"
    Expression ="TbOfSocioEduDetalhe.PessoaEmergencia"
    Expression ="TbOfSocioEduDetalhe.TelEmergencia"
End
Begin Joins
    LeftTable ="TbOfSocioEduDetalhe"
    RightTable ="TbBeneficiosMunicipais"
    Expression ="TbOfSocioEduDetalhe.Nome = TbBeneficiosMunicipais.Nome"
    Flag =2
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
        dbText "Name" ="TbBeneficiosMunicipais.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Nome"
        dbInteger "ColumnWidth" ="2115"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.CodOfSEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.TelEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.PAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[Autorizado a sair sozinho]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Encaminhado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[CPF Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.QuemBusca"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Aco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Onde"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Pediatra"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[Motivo busca serviço]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[Qual politica encaminhou]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[Cuidador exclusivo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[Cuidador exclusivo trabalha]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.VacinaEmDia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Medicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.QuaisMedicamentos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.TratamentoSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.QualTratamento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Alergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.QualAlergia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.PessoaEmergencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.DataDesl"
        dbInteger "ColumnWidth" ="3045"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.BPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.PBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.CADUNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.BeneficioMunic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficiosMunicipais.obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Beneficiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBenfMunDet.[Situação Beneficio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[Familia dentro perfil]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =17
    Top =35
    Right =1183
    Bottom =610
    Left =-1
    Top =-1
    Right =1142
    Bottom =333
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =224
        Bottom =314
        Top =0
        Name ="TbOfSocioEduDetalhe"
        Name =""
    End
    Begin
        Left =339
        Top =9
        Right =483
        Bottom =304
        Top =0
        Name ="TbBeneficiosMunicipais"
        Name =""
    End
End
