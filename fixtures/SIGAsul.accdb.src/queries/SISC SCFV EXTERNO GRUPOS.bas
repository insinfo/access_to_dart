Operation =1
Option =0
Begin InputTables
    Name ="TbGrupoExterno"
    Name ="sisc scfv externo residencia"
End
Begin OutputColumns
    Expression ="TbGrupoExterno.CodGrupo"
    Expression ="[sisc scfv externo residencia].MáxDeDataAtual"
    Expression ="TbGrupoExterno.NomeGrupo"
    Expression ="TbGrupoExterno.FxEtariaGr"
    Expression ="TbGrupoExterno.Turno"
    Expression ="[sisc scfv externo residencia].CodFam"
    Expression ="[sisc scfv externo residencia].CodSCFVEDet"
    Expression ="[sisc scfv externo residencia].DATAINSCR"
    Expression ="[sisc scfv externo residencia].GRUPOEXT"
    Expression ="[sisc scfv externo residencia].FXETARIA"
    Expression ="[sisc scfv externo residencia].TURNO"
    Expression ="[sisc scfv externo residencia].UNIDADE"
    Expression ="[sisc scfv externo residencia].nomeusuario"
    Expression ="[sisc scfv externo residencia].dnascusuario"
    Expression ="[sisc scfv externo residencia].IdadeUsuario"
    Expression ="[sisc scfv externo residencia].Sexo"
    Expression ="[sisc scfv externo residencia].[Raça/Cor]"
    Expression ="[sisc scfv externo residencia].MunicNasc"
    Expression ="[sisc scfv externo residencia].UFNasc"
    Expression ="[sisc scfv externo residencia].RG"
    Expression ="[sisc scfv externo residencia].OrgaoRG"
    Expression ="[sisc scfv externo residencia].DEmisRG"
    Expression ="[sisc scfv externo residencia].NomeMae"
    Expression ="[sisc scfv externo residencia].[Nome Respons Criança]"
    Expression ="[sisc scfv externo residencia].[CPF Resp]"
    Expression ="[sisc scfv externo residencia].[Cel Resp]"
    Expression ="[sisc scfv externo residencia].[Parentesco Resp]"
    Expression ="[sisc scfv externo residencia].SituaçãoUsuario"
    Expression ="[sisc scfv externo residencia].DataDesl"
    Expression ="[sisc scfv externo residencia].MotivoDesl"
    Expression ="[sisc scfv externo residencia].Endereço"
    Expression ="[sisc scfv externo residencia].Bairro"
    Expression ="[sisc scfv externo residencia].UF"
    Expression ="[sisc scfv externo residencia].CEP"
    Expression ="[sisc scfv externo residencia].Municipio"
    Expression ="[sisc scfv externo residencia].Complemento"
    Expression ="[sisc scfv externo residencia].Referencia"
    Expression ="[sisc scfv externo residencia].nisusuario"
End
Begin Joins
    LeftTable ="TbGrupoExterno"
    RightTable ="sisc scfv externo residencia"
    Expression ="TbGrupoExterno.CodGrupo = [sisc scfv externo residencia].GRUPOEXT"
    Flag =1
End
Begin Groups
    Expression ="TbGrupoExterno.CodGrupo"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].MáxDeDataAtual"
    GroupLevel =0
    Expression ="TbGrupoExterno.NomeGrupo"
    GroupLevel =0
    Expression ="TbGrupoExterno.FxEtariaGr"
    GroupLevel =0
    Expression ="TbGrupoExterno.Turno"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].CodFam"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].CodSCFVEDet"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].DATAINSCR"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].GRUPOEXT"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].FXETARIA"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].TURNO"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].UNIDADE"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].nomeusuario"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].dnascusuario"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].IdadeUsuario"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].Sexo"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].[Raça/Cor]"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].MunicNasc"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].UFNasc"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].RG"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].OrgaoRG"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].DEmisRG"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].NomeMae"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].[Nome Respons Criança]"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].[CPF Resp]"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].[Cel Resp]"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].[Parentesco Resp]"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].SituaçãoUsuario"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].DataDesl"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].MotivoDesl"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].Endereço"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].Bairro"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].UF"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].CEP"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].Municipio"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].Complemento"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].Referencia"
    GroupLevel =0
    Expression ="[sisc scfv externo residencia].nisusuario"
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
dbBoolean "TotalsRow" ="0"
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbGrupoExterno.NomeGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.FxEtariaGr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.CodGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.Turno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ÚltimoDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].dnascusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].IdadeUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].CodSCFVEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].CodSCFVExtAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].GRUPOEXT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].FXETARIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].TURNO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].nomeusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].[CPF Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="IdadeUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodSCFVExtAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].nisusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[sisc scfv externo residencia].MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-84
    Top =39
    Right =1078
    Bottom =659
    Left =-1
    Top =-1
    Right =1138
    Bottom =275
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =716
        Top =40
        Right =860
        Bottom =184
        Top =0
        Name ="TbGrupoExterno"
        Name =""
    End
    Begin
        Left =285
        Top =17
        Right =546
        Bottom =225
        Top =0
        Name ="sisc scfv externo residencia"
        Name =""
    End
End
