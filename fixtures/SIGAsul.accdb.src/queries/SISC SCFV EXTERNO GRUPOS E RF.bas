Operation =1
Option =0
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR SISC"
    Name ="SISC SCFV EXTERNO GRUPOS"
End
Begin OutputColumns
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].Nome"
    Expression ="[SISC SCFV EXTERNO GRUPOS].MáxDeDataAtual"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].CodPessoa"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].CodFam"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].Parentesco"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].CPF"
    Expression ="[SISC SCFV EXTERNO GRUPOS].DATAINSCR"
    Expression ="[SISC SCFV EXTERNO GRUPOS].GRUPOEXT"
    Expression ="[SISC SCFV EXTERNO GRUPOS].FXETARIA"
    Expression ="[SISC SCFV EXTERNO GRUPOS].TbGrupoExterno.TURNO"
    Expression ="[SISC SCFV EXTERNO GRUPOS].UNIDADE"
    Expression ="[SISC SCFV EXTERNO GRUPOS].nomeusuario"
    Expression ="[SISC SCFV EXTERNO GRUPOS].dnascusuario"
    Expression ="[SISC SCFV EXTERNO GRUPOS].IdadeUsuario"
    Expression ="[SISC SCFV EXTERNO GRUPOS].Sexo"
    Expression ="[SISC SCFV EXTERNO GRUPOS].[Raça/Cor]"
    Expression ="[SISC SCFV EXTERNO GRUPOS].MunicNasc"
    Expression ="[SISC SCFV EXTERNO GRUPOS].UFNasc"
    Expression ="[SISC SCFV EXTERNO GRUPOS].RG"
    Expression ="[SISC SCFV EXTERNO GRUPOS].DEmisRG"
    Expression ="[SISC SCFV EXTERNO GRUPOS].OrgaoRG"
    Expression ="[SISC SCFV EXTERNO GRUPOS].Complemento"
    Expression ="[SISC SCFV EXTERNO GRUPOS].Endereço"
    Expression ="[SISC SCFV EXTERNO GRUPOS].Bairro"
    Expression ="[SISC SCFV EXTERNO GRUPOS].CEP"
    Expression ="[SISC SCFV EXTERNO GRUPOS].UF"
    Expression ="[SISC SCFV EXTERNO GRUPOS].Municipio"
    Expression ="[SISC SCFV EXTERNO GRUPOS].NomeMae"
    Expression ="[SISC SCFV EXTERNO GRUPOS].[Nome Respons Criança]"
    Expression ="[SISC SCFV EXTERNO GRUPOS].[CPF Resp]"
    Expression ="[SISC SCFV EXTERNO GRUPOS].[Cel Resp]"
    Expression ="[SISC SCFV EXTERNO GRUPOS].[Parentesco Resp]"
    Expression ="[SISC SCFV EXTERNO GRUPOS].SituaçãoUsuario"
    Expression ="[SISC SCFV EXTERNO GRUPOS].DataDesl"
    Expression ="[SISC SCFV EXTERNO GRUPOS].MotivoDesl"
    Expression ="[SISC SCFV EXTERNO GRUPOS].nisusuario"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR SISC"
    RightTable ="SISC SCFV EXTERNO GRUPOS"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].CodFam = [SISC SCFV EXTERNO GRUPOS].CodFam"
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
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].GRUPOEXT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].FXETARIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].RG"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1350"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].[CPF Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].Municipio"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2010"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].TbGrupoExterno.TURNO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR SISC].CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR SISC].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR SISC].CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR SISC].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR SISC].Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].dnascusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].nomeusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].IdadeUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="IdadeUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].nisusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC SCFV EXTERNO GRUPOS].MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1181
    Bottom =685
    Left =-1
    Top =-1
    Right =1157
    Bottom =289
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =724
        Top =26
        Right =995
        Bottom =269
        Top =0
        Name ="CS RESPONSAVEL FAMILIAR SISC"
        Name =""
    End
    Begin
        Left =233
        Top =-3
        Right =481
        Bottom =265
        Top =0
        Name ="SISC SCFV EXTERNO GRUPOS"
        Name =""
    End
End
