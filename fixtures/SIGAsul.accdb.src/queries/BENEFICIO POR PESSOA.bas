Operation =1
Option =0
Where ="(((TbPessoa.Nome) Like [DIGITE O NOME]+\"*\"))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbBeneficioEmergencial"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbBeneficioEmergencial.CodBenef"
    Expression ="TbBeneficioEmergencial.DataBenef"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.Nome"
    Expression ="TbBeneficioEmergencial.DescreverItem"
    Expression ="TbBeneficioEmergencial.CodItem"
    Expression ="TbBeneficioEmergencial.Qtd"
    Expression ="TbBeneficioEmergencial.ApoioAlim"
    Expression ="TbBeneficioEmergencial.AuxNatal"
    Expression ="TbBeneficioEmergencial.Cobertor"
    Expression ="TbBeneficioEmergencial.Colchonete"
    Expression ="TbBeneficioEmergencial.Outro"
    Expression ="TbBeneficioEmergencial.OutroDescrever"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="TbBeneficioEmergencial"
    Expression ="TbPessoa.CodPessoa = TbBeneficioEmergencial.Nome"
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
Begin
    Begin
        dbText "Name" ="TbEncaminhamento.ENG"
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
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.DataEnc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.CODENC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CodItem"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.DescreverItem"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.OutroDescrever"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.DataBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Qtd"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.ApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.AuxNatal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Cobertor"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Colchonete"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Outro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
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
End
Begin
    State =0
    Left =44
    Top =93
    Right =1105
    Bottom =636
    Left =-1
    Top =-1
    Right =1037
    Bottom =300
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =318
        Top =0
        Name ="TbBeneficioEmergencial"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =293
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
