Operation =1
Option =0
Where ="(((historicoPessoa.Nome) Like [DIGITE O NOME]+\"*\"))"
Begin InputTables
    Name ="TbBeneficioEmergencial"
    Name ="TbEncaminhamento"
    Name ="historicoPessoa"
End
Begin OutputColumns
    Expression ="historicoPessoa.Data"
    Expression ="historicoPessoa.CodPessoa"
    Expression ="historicoPessoa.Nome"
    Expression ="historicoPessoa.Administrativo"
    Expression ="historicoPessoa.Social"
    Expression ="historicoPessoa.Psicologico"
    Expression ="historicoPessoa.Multidisciplinar"
    Expression ="historicoPessoa.OrientadorSoc"
    Expression ="historicoPessoa.AtGestao"
    Expression ="historicoPessoa.DemandaBPC"
    Expression ="historicoPessoa.DemandaINSS"
    Expression ="historicoPessoa.DemandaSCFV"
    Expression ="historicoPessoa.DemandaEduc"
    Expression ="historicoPessoa.DemandaSaude"
    Expression ="historicoPessoa.DemandaJustiça"
    Expression ="historicoPessoa.DemandaBenefMun"
    Expression ="historicoPessoa.DemandaAuxNatal"
    Expression ="historicoPessoa.DemandaGratTransp"
    Expression ="historicoPessoa.DemandaRecJus"
    Expression ="historicoPessoa.DemandaDocCivil"
    Expression ="historicoPessoa.DemandaApoioAlim"
    Expression ="historicoPessoa.[Outra Demanda]"
    Expression ="historicoPessoa.[Especif Outra]"
    Expression ="TbBeneficioEmergencial.DataBenef"
    Expression ="TbBeneficioEmergencial.DescreverItem"
    Expression ="TbBeneficioEmergencial.Qtd"
    Expression ="TbBeneficioEmergencial.ApoioAlim"
    Expression ="TbBeneficioEmergencial.AuxNatal"
    Expression ="TbBeneficioEmergencial.Cobertor"
    Expression ="TbBeneficioEmergencial.Colchonete"
    Expression ="TbBeneficioEmergencial.Outro"
    Expression ="TbBeneficioEmergencial.OutroDescrever"
    Expression ="TbEncaminhamento.ENG"
    Expression ="TbEncaminhamento.ATENDIDO"
    Expression ="TbEncaminhamento.DataMonit"
    Expression ="TbEncaminhamento.RSA"
    Expression ="TbEncaminhamento.RS"
    Expression ="TbEncaminhamento.RE"
    Expression ="TbEncaminhamento.OP"
End
Begin Joins
    LeftTable ="historicoPessoa"
    RightTable ="TbBeneficioEmergencial"
    Expression ="historicoPessoa.CodPessoa = TbBeneficioEmergencial.Nome"
    Flag =2
    LeftTable ="historicoPessoa"
    RightTable ="TbEncaminhamento"
    Expression ="historicoPessoa.CodPessoa = TbEncaminhamento.Nome"
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
        dbText "Name" ="historicoPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.[Especif Outra]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.[Outra Demanda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.AtGestao"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.Social"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.Administrativo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.Psicologico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.Multidisciplinar"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.OrientadorSoc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.DemandaBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.DemandaINSS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.DemandaSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.DemandaEduc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.DemandaSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.DemandaJustiça"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.DemandaBenefMun"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.DemandaAuxNatal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.DemandaGratTransp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.DemandaRecJus"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.DemandaDocCivil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="historicoPessoa.DemandaApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.DataBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.ENG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.OutroDescrever"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Qtd"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.DescreverItem"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.ATENDIDO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.DataMonit"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-105
    Top =93
    Right =1227
    Bottom =625
    Left =-1
    Top =-1
    Right =1308
    Bottom =284
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =898
        Top =49
        Right =1042
        Bottom =285
        Top =0
        Name ="TbBeneficioEmergencial"
        Name =""
    End
    Begin
        Left =368
        Top =-2
        Right =512
        Bottom =242
        Top =0
        Name ="TbEncaminhamento"
        Name =""
    End
    Begin
        Left =537
        Top =17
        Right =752
        Bottom =274
        Top =0
        Name ="historicoPessoa"
        Name =""
    End
End
