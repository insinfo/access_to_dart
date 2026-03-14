Operation =1
Option =0
Where ="(((TbBeneficioEmergencial.DataBenef) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbBeneficioEmergencial"
    Name ="TbPessoa"
    Name ="CadResidencia"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbBeneficioEmergencial.CodBenef"
    Expression ="TbBeneficioEmergencial.DataBenef"
    Expression ="CadResidencia.CodFam"
    Expression ="TbBeneficioEmergencial.Volante"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.CPF"
    Expression ="TbBeneficioEmergencial.DescreverItem"
    Expression ="TbBeneficioEmergencial.Qtd"
    Expression ="TbBeneficioEmergencial.ApoioAlim"
    Expression ="TbBeneficioEmergencial.AuxNatal"
    Expression ="TbBeneficioEmergencial.Cobertor"
    Expression ="TbBeneficioEmergencial.Colchonete"
    Expression ="TbBeneficioEmergencial.Outro"
    Expression ="TbBeneficioEmergencial.OutroDescrever"
    Expression ="TbBeneficioEmergencial.Proprio"
    Expression ="TbBeneficioEmergencial.Doação"
    Expression ="TbBeneficioEmergencial.NomeRepresent"
    Expression ="TbBeneficioEmergencial.TelRepresent"
    Expression ="TbBeneficioEmergencial.CPFRepresent"
    Expression ="TbBeneficioEmergencial.RGRepresent"
    Expression ="CadResidencia.[CRAS Origem]"
    Expression ="CadResidencia.[Nº Cras]"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
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
    RightTable ="TbBeneficioEmergencial"
    Expression ="TbPessoa.CodPessoa = TbBeneficioEmergencial.Nome"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbBeneficioEmergencial"
    Expression ="TbPessoa.CodPessoa = TbBeneficioEmergencial.Nome"
    Flag =1
End
Begin OrderBy
    Expression ="TbBeneficioEmergencial.DataBenef"
    Flag =0
    Expression ="TbPessoa.Nome"
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
        dbText "Name" ="TbBeneficioEmergencial.RGRepresent"
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
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.DataBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.AuxNatal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.ApoioAlim"
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
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.OutroDescrever"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Proprio"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Doação"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.NomeRepresent"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.TelRepresent"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CPFRepresent"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[CRAS Origem]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Nº Cras]"
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
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CodBenef"
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
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Volante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1577
    Bottom =645
    Left =-1
    Top =-1
    Right =1509
    Bottom =211
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =57
        Top =-8
        Right =201
        Bottom =321
        Top =0
        Name ="TbBeneficioEmergencial"
        Name =""
    End
    Begin
        Left =250
        Top =0
        Right =398
        Bottom =329
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =447
        Top =-4
        Right =591
        Bottom =315
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =632
        Top =4
        Right =825
        Bottom =225
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
