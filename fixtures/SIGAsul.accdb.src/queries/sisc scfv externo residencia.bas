Operation =1
Option =0
Begin InputTables
    Name ="CadResidencia"
    Name ="SISC SCFV EXTERNO"
End
Begin OutputColumns
    Expression ="[SISC SCFV EXTERNO].CodPessoa"
    Expression ="[SISC SCFV EXTERNO].MáxDeDataAtual"
    Expression ="[SISC SCFV EXTERNO].CodFam"
    Expression ="[SISC SCFV EXTERNO].CodSCFVEDet"
    Expression ="[SISC SCFV EXTERNO].DATAINSCR"
    Expression ="[SISC SCFV EXTERNO].GRUPOEXT"
    Expression ="[SISC SCFV EXTERNO].FXETARIA"
    Expression ="[SISC SCFV EXTERNO].TURNO"
    Expression ="[SISC SCFV EXTERNO].UNIDADE"
    Expression ="[SISC SCFV EXTERNO].nomeusuario"
    Expression ="[SISC SCFV EXTERNO].dnascusuario"
    Expression ="[SISC SCFV EXTERNO].IdadeUsuario"
    Expression ="[SISC SCFV EXTERNO].Sexo"
    Expression ="[SISC SCFV EXTERNO].[Raça/Cor]"
    Expression ="[SISC SCFV EXTERNO].MunicNasc"
    Expression ="[SISC SCFV EXTERNO].UFNasc"
    Expression ="[SISC SCFV EXTERNO].RG"
    Expression ="[SISC SCFV EXTERNO].OrgaoRG"
    Expression ="[SISC SCFV EXTERNO].DEmisRG"
    Expression ="[SISC SCFV EXTERNO].NomeMae"
    Expression ="[SISC SCFV EXTERNO].[Nome Respons Criança]"
    Expression ="[SISC SCFV EXTERNO].[CPF Resp]"
    Expression ="[SISC SCFV EXTERNO].[Cel Resp]"
    Expression ="[SISC SCFV EXTERNO].[Parentesco Resp]"
    Expression ="[SISC SCFV EXTERNO].SituaçãoUsuario"
    Expression ="[SISC SCFV EXTERNO].DataDesl"
    Expression ="[SISC SCFV EXTERNO].MotivoDesl"
    Expression ="CadResidencia.Endereço"
    Expression ="CadResidencia.Bairro"
    Expression ="CadResidencia.UF"
    Expression ="CadResidencia.CEP"
    Expression ="CadResidencia.Municipio"
    Expression ="CadResidencia.Complemento"
    Expression ="CadResidencia.Referencia"
    Expression ="[SISC SCFV EXTERNO].nisusuario"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="SISC SCFV EXTERNO"
    Expression ="CadResidencia.CodFam = [SISC SCFV EXTERNO].CodFam"
    Flag =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
dbSingle "ECLScaleFactor" ="1"
dbMemo "OrderBy" ="[sisc scfv externo residencia].[nomeusuario]"
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
        dbText "Name" ="[SISC SCFV EXTERNO].MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].[CPF Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].CodSCFVEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].GRUPOEXT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].FXETARIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].TURNO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].nomeusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].dnascusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].IdadeUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="IdadeUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].nisusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO].MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-108
    Top =56
    Right =1089
    Bottom =676
    Left =-1
    Top =-1
    Right =1173
    Bottom =298
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =595
        Top =9
        Right =739
        Bottom =314
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =312
        Top =10
        Right =516
        Bottom =270
        Top =0
        Name ="SISC SCFV EXTERNO"
        Name =""
    End
End
