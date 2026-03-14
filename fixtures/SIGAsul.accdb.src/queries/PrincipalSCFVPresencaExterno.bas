Operation =1
Option =0
Where ="(((TbAtColetivo.DataCol) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbAtColetivoDet"
    Name ="TbAtColetivo"
    Name ="PrincipalSCFVExterno"
End
Begin OutputColumns
    Expression ="TbAtColetivoDet.Nome"
    Expression ="TbAtColetivo.DataCol"
    Expression ="PrincipalSCFVExterno.DNasc"
    Expression ="PrincipalSCFVExterno.Idade"
    Expression ="PrincipalSCFVExterno.Nome"
End
Begin Joins
    LeftTable ="TbAtColetivoDet"
    RightTable ="TbAtColetivo"
    Expression ="TbAtColetivoDet.CodColetivo = TbAtColetivo.CodColetivo"
    Flag =1
    LeftTable ="PrincipalSCFVExterno"
    RightTable ="TbAtColetivoDet"
    Expression ="PrincipalSCFVExterno.CodPessoa = TbAtColetivoDet.Nome"
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
        dbText "Name" ="PrincipalSCFVInterno.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVInterno.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVInterno.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivoDet.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.DataCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVExterno.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVExterno.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PrincipalSCFVExterno.DNasc"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-121
    Top =158
    Right =1054
    Bottom =778
    Left =-1
    Top =-1
    Right =1151
    Bottom =275
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =248
        Top =20
        Right =392
        Bottom =161
        Top =0
        Name ="TbAtColetivoDet"
        Name =""
    End
    Begin
        Left =57
        Top =18
        Right =220
        Bottom =259
        Top =0
        Name ="TbAtColetivo"
        Name =""
    End
    Begin
        Left =630
        Top =8
        Right =774
        Bottom =275
        Top =0
        Name ="PrincipalSCFVExterno"
        Name =""
    End
End
