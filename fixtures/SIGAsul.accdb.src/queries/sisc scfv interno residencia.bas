Operation =1
Option =0
Begin InputTables
    Name ="SISC INTERNO SCFV"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="[SISC INTERNO SCFV].CodOfSEDet"
    Expression ="[SISC INTERNO SCFV].DataAtual"
    Expression ="CadResidencia.CodFam"
    Expression ="[SISC INTERNO SCFV].CodPessoa"
    Expression ="[SISC INTERNO SCFV].Nome"
    Expression ="[SISC INTERNO SCFV].DNasc"
    Expression ="[SISC INTERNO SCFV].Idade"
    Expression ="[SISC INTERNO SCFV].NomeMae"
    Expression ="[SISC INTERNO SCFV].Sexo"
    Expression ="[SISC INTERNO SCFV].[Raça/Cor]"
    Expression ="[SISC INTERNO SCFV].SituaçãoUsuario"
    Expression ="[SISC INTERNO SCFV].MunicNasc"
    Expression ="[SISC INTERNO SCFV].UFNasc"
    Expression ="[SISC INTERNO SCFV].NIS"
    Expression ="[SISC INTERNO SCFV].CPF"
    Expression ="[SISC INTERNO SCFV].RG"
    Expression ="[SISC INTERNO SCFV].OrgaoRG"
    Expression ="[SISC INTERNO SCFV].DEmisRG"
    Expression ="[SISC INTERNO SCFV].CodFam"
    Expression ="CadResidencia.Endereço"
    Expression ="CadResidencia.Bairro"
    Expression ="CadResidencia.UF"
    Expression ="CadResidencia.CEP"
    Expression ="CadResidencia.Municipio"
    Expression ="CadResidencia.Complemento"
    Expression ="CadResidencia.Referencia"
End
Begin Joins
    LeftTable ="SISC INTERNO SCFV"
    RightTable ="CadResidencia"
    Expression ="[SISC INTERNO SCFV].CodFam = CadResidencia.CodFam"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="CadResidencia.Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].CodOfSEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].DataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV].DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =88
    Top =146
    Right =1074
    Bottom =660
    Left =-1
    Top =-1
    Right =962
    Bottom =220
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =59
        Top =1
        Right =367
        Bottom =272
        Top =0
        Name ="SISC INTERNO SCFV"
        Name =""
    End
    Begin
        Left =415
        Top =12
        Right =559
        Bottom =266
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
