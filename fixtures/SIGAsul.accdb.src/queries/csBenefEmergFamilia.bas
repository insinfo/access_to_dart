Operation =1
Option =2
Having ="(((TbBeneficioEmergencial.DataBenef) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbBeneficioEmergencial"
End
Begin OutputColumns
    Expression ="TbBeneficioEmergencial.CodFam"
    Expression ="TbBeneficioEmergencial.ApoioAlim"
    Expression ="TbBeneficioEmergencial.AuxNatal"
    Expression ="TbBeneficioEmergencial.Cobertor"
    Expression ="TbBeneficioEmergencial.Colchonete"
    Expression ="TbBeneficioEmergencial.Outro"
    Expression ="TbBeneficioEmergencial.Proprio"
    Expression ="TbBeneficioEmergencial.Doação"
End
Begin OrderBy
    Expression ="TbBeneficioEmergencial.CodFam"
    Flag =0
End
Begin Groups
    Expression ="TbBeneficioEmergencial.CodFam"
    GroupLevel =0
    Expression ="TbBeneficioEmergencial.ApoioAlim"
    GroupLevel =0
    Expression ="TbBeneficioEmergencial.AuxNatal"
    GroupLevel =0
    Expression ="TbBeneficioEmergencial.Cobertor"
    GroupLevel =0
    Expression ="TbBeneficioEmergencial.Colchonete"
    GroupLevel =0
    Expression ="TbBeneficioEmergencial.Outro"
    GroupLevel =0
    Expression ="TbBeneficioEmergencial.Proprio"
    GroupLevel =0
    Expression ="TbBeneficioEmergencial.Doação"
    GroupLevel =0
    Expression ="TbBeneficioEmergencial.DataBenef"
    GroupLevel =0
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
        dbText "Name" ="TbBeneficioEmergencial.Doação"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.ApoioAlim"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CodFam"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.AuxNatal"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Cobertor"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Colchonete"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Outro"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbBeneficioEmergencial.Proprio"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =39
    Top =22
    Right =1359
    Bottom =309
    Left =-1
    Top =-1
    Right =1296
    Bottom =69
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =197
        Bottom =183
        Top =0
        Name ="TbBeneficioEmergencial"
        Name =""
    End
End
