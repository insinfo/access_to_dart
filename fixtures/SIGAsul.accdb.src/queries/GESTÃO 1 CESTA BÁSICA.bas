Operation =1
Option =0
Where ="(((TbBeneficioEmergencial.DataBenef) Between [DATA INICIAL] And [DATA FINAL]) AN"
    "D ((TbBeneficioEmergencial.ApoioAlim)=Yes))"
Begin InputTables
    Name ="TbBeneficioEmergencial"
    Name ="TbPessoa"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="TbBeneficioEmergencial.CodBenef"
    Expression ="TbBeneficioEmergencial.DataBenef"
    Expression ="TbBeneficioEmergencial.CodTecnico"
    Expression ="TbBeneficioEmergencial.NomeTecnico"
    Expression ="TbBeneficioEmergencial.MatriculaTec"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.CodFam"
    Expression ="CadResidencia.Endereço"
    Expression ="CadResidencia.Bairro"
    Expression ="TbPessoa.CPF"
    Expression ="TbPessoa.RG"
    Expression ="TbPessoa.Celular"
    Expression ="CadResidencia.[Nº Cras]"
    Expression ="CadResidencia.[CRAS Origem]"
    Expression ="TbBeneficioEmergencial.NomeCras"
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
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="TbBeneficioEmergencial"
    Expression ="TbPessoa.CodPessoa = TbBeneficioEmergencial.Nome"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbBeneficioEmergencial"
    Expression ="TbPessoa.CodPessoa = TbBeneficioEmergencial.Nome"
    Flag =1
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
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
        dbText "Name" ="TbBeneficioEmergencial.DataBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Doação"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CodBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.RGRepresent"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.NomeTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CodTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.MatriculaTec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CPFPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.RGPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.TelPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CodCras"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.NomeCras"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.DescreverItem"
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
        dbText "Name" ="TbBeneficioEmergencial.OutroDescrever"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Proprio"
        dbLong "AggregateType" ="-1"
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
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodCras"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[CRAS Origem]"
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
        dbText "Name" ="TbPessoa.CPFPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Nº Cras]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1328
    Bottom =549
    Left =-1
    Top =-1
    Right =1304
    Bottom =237
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =306
        Top =16
        Right =568
        Bottom =251
        Top =0
        Name ="TbBeneficioEmergencial"
        Name =""
    End
    Begin
        Left =626
        Top =0
        Right =770
        Bottom =219
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =850
        Top =37
        Right =994
        Bottom =238
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
