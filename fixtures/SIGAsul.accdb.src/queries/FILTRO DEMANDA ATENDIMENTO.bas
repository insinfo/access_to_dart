Operation =1
Option =0
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbAtend.DemandaA"
    "poioAlim)=Yes))"
Begin InputTables
    Name ="TbAtend"
    Name ="TbCadFuncionario"
    Name ="TbPessoa"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbAtend.Data"
    Expression ="TbAtend.CodAtend"
    Alias ="TECNICO"
    Expression ="TbCadFuncionario.Nome"
    Expression ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
    Alias ="USUÁRIO"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbAtend.DemandaApoioAlim"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
End
Begin Joins
    LeftTable ="TbAtend"
    RightTable ="TbCadFuncionario"
    Expression ="TbAtend.CodFunc = TbCadFuncionario.CodFunc"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAtend"
    Expression ="TbPessoa.CodPessoa = TbAtend.Nome"
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
        dbText "Name" ="TbAtend.DemandaApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TECNICO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="USUÁRIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
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
        dbText "Name" ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-257
    Top =50
    Right =993
    Bottom =670
    Left =-1
    Top =-1
    Right =1226
    Bottom =224
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =218
        Bottom =303
        Top =0
        Name ="TbAtend"
        Name =""
    End
    Begin
        Left =450
        Top =16
        Right =594
        Bottom =276
        Top =0
        Name ="TbCadFuncionario"
        Name =""
    End
    Begin
        Left =267
        Top =122
        Right =411
        Bottom =266
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =642
        Top =12
        Right =786
        Bottom =310
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
