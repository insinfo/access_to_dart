dbMemo "SQL" ="SELECT [DEMANDA E ATEND POR PESSOA].CodAtend, [DEMANDA E ATEND POR PESSOA].Data,"
    " [DEMANDA E ATEND POR PESSOA].CSATENDIMENTOBASICO.Nome, [DEMANDA E ATEND POR PES"
    "SOA].CodFam, [DEMANDA E ATEND POR PESSOA].CodPessoa, [DEMANDA E ATEND POR PESSOA"
    "].DataBenef, [DEMANDA E ATEND POR PESSOA].TbBeneficioEmergencial.Nome, [DEMANDA "
    "E ATEND POR PESSOA].Administrativo, [DEMANDA E ATEND POR PESSOA].Social, [DEMAND"
    "A E ATEND POR PESSOA].Psicologico, [DEMANDA E ATEND POR PESSOA].MULTIDISCIPLINAR"
    ", [DEMANDA E ATEND POR PESSOA].OrientadorSoc, [DEMANDA E ATEND POR PESSOA].AtGes"
    "tao, [DEMANDA E ATEND POR PESSOA].DemandaBPC, [DEMANDA E ATEND POR PESSOA].Deman"
    "daINSS, [DEMANDA E ATEND POR PESSOA].DemandaSCFV, [DEMANDA E ATEND POR PESSOA].D"
    "emandaEduc, [DEMANDA E ATEND POR PESSOA].DemandaSaude, [DEMANDA E ATEND POR PESS"
    "OA].DemandaJustiça, [DEMANDA E ATEND POR PESSOA].DemandaBenefMun, [DEMANDA E ATE"
    "ND POR PESSOA].DemandaAuxNatal, [DEMANDA E ATEND POR PESSOA].DemandaGratTransp, "
    "[DEMANDA E ATEND POR PESSOA].DemandaDocCivil, [DEMANDA E ATEND POR PESSOA].Deman"
    "daApoioAlim, [DEMANDA E ATEND POR PESSOA].[Outra Demanda], [DEMANDA E ATEND POR "
    "PESSOA].DescreverItem, [DEMANDA E ATEND POR PESSOA].CodItem, [DEMANDA E ATEND PO"
    "R PESSOA].Qtd, [DEMANDA E ATEND POR PESSOA].ApoioAlim, [DEMANDA E ATEND POR PESS"
    "OA].AuxNatal, [DEMANDA E ATEND POR PESSOA].Cobertor, [DEMANDA E ATEND POR PESSOA"
    "].Colchonete, [DEMANDA E ATEND POR PESSOA].Outro, [DEMANDA E ATEND POR PESSOA].O"
    "utroDescrever, [DEMANDA E ATEND POR PESSOA].Proprio, [DEMANDA E ATEND POR PESSOA"
    "].Doação, TbEncaminhamento.DataMonit, TbEncaminhamento.ATENDIDO, TbEncaminhament"
    "o.ENG, TbEncaminhamento.RSA, TbEncaminhamento.RS, TbEncaminhamento.RE, TbEncamin"
    "hamento.SF, TbEncaminhamento.OP\015\012FROM [DEMANDA E ATEND POR PESSOA] LEFT JO"
    "IN TbEncaminhamento ON [DEMANDA E ATEND POR PESSOA].CodPessoa = TbEncaminhamento"
    ".Nome;\015\012"
dbMemo "Connect" =""
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
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].Proprio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.SF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].OutroDescrever"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.ENG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.ATENDIDO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.DataMonit"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].Doação"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].Cobertor"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].CSATENDIMENTOBASICO.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].Colchonete"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].DataBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].TbBeneficioEmergencial.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].DescreverItem"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].Administrativo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].CodItem"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].Social"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].DemandaApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].Psicologico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].MULTIDISCIPLINAR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].OrientadorSoc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].AtGestao"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].DemandaBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].DemandaINSS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].DemandaSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].DemandaSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].DemandaJustiça"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].DemandaEduc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].DemandaBenefMun"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].DemandaAuxNatal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].DemandaGratTransp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].DemandaDocCivil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].[Outra Demanda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].Qtd"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].ApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].AuxNatal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DEMANDA E ATEND POR PESSOA].Outro"
        dbLong "AggregateType" ="-1"
    End
End
