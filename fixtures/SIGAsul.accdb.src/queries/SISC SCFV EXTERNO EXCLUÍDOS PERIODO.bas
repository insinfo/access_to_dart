Operation =1
Option =0
Where ="((([SISC SCFV EXTERNO GRUPOS E RF].DataDesl) Between [DATA INICIAL] And [DATA FI"
    "NAL]))"
Begin InputTables
    Name ="SISC SCFV EXTERNO GRUPOS E RF"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.LOGO"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].MáxDeDataAtual"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].DataDesl"
    Expression ="TbUnidade.MUNICIPIO"
    Expression ="TbUnidade.UF"
    Expression ="TbUnidade.[Nº UNIDADE]"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].DATAINSCR"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].Nome"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].CodPessoa"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].CodFam"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].Parentesco"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].CPF"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].GRUPOEXT"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].FXETARIA"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].TURNO"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].UNIDADE"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].nomeusuario"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].dnascusuario"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].IdadeUsuario"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].Sexo"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].[Raça/Cor]"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].MunicNasc"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].UFNasc"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].RG"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].DEmisRG"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].OrgaoRG"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].Complemento"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].Endereço"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].Bairro"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].CEP"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].UF"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].Municipio"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].NomeMae"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].[Nome Respons Criança]"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].[CPF Resp]"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].[Cel Resp]"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].[Parentesco Resp]"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].SituaçãoUsuario"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].MotivoDesl"
    Expression ="[SISC SCFV EXTERNO GRUPOS E RF].nisusuario"
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
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].GRUPOEXT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].MotivoDesl"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3180"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].FXETARIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].TURNO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].nomeusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].dnascusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].IdadeUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].[CPF Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MUNICIPIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[Nº UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].nisusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS E RF].MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =80
    Top =107
    Right =914
    Bottom =653
    Left =-1
    Top =-1
    Right =810
    Bottom =198
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =116
        Top =31
        Right =308
        Bottom =223
        Top =0
        Name ="SISC SCFV EXTERNO GRUPOS E RF"
        Name =""
    End
    Begin
        Left =348
        Top =12
        Right =589
        Bottom =276
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
