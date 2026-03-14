Operation =1
Option =0
Where ="(((TbBeneficioEmergencial.DataBenef) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbBeneficioEmergencial"
End
Begin OutputColumns
    Expression ="TbBeneficioEmergencial.CodBenef"
    Expression ="TbBeneficioEmergencial.DataBenef"
    Expression ="TbBeneficioEmergencial.CodTecnico"
    Expression ="TbBeneficioEmergencial.NomeTecnico"
    Expression ="TbBeneficioEmergencial.MatriculaTec"
    Expression ="TbBeneficioEmergencial.Nome"
    Expression ="TbBeneficioEmergencial.CodFam"
    Expression ="TbBeneficioEmergencial.Endereço"
    Expression ="TbBeneficioEmergencial.Bairro"
    Expression ="TbBeneficioEmergencial.CPFPessoa"
    Expression ="TbBeneficioEmergencial.RGPessoa"
    Expression ="TbBeneficioEmergencial.TelPessoa"
    Expression ="TbBeneficioEmergencial.CodCras"
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
        dbText "Name" ="TbBeneficioEmergencial.DataBenef"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Proprio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CodBenef"
        dbInteger "ColumnWidth" ="840"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.NomeTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.NomeRepresent"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CodTecnico"
        dbInteger "ColumnWidth" ="810"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CodFam"
        dbInteger "ColumnWidth" ="1080"
        dbBoolean "ColumnHidden" ="0"
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
        dbLong "AggregateType" ="2"
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
        dbText "Name" ="TbBeneficioEmergencial.Doação"
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
        dbText "Name" ="TbBeneficioEmergencial.Nome"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1203
    Bottom =677
    Left =-1
    Top =-1
    Right =1179
    Bottom =286
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =182
        Top =12
        Right =386
        Bottom =286
        Top =0
        Name ="TbBeneficioEmergencial"
        Name =""
    End
End
