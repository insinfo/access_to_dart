Operation =1
Option =3
Where ="((([SISC INTERNO SCFV GRUPOS].TbGrupo.Tipo)=\"OFICINA SOCIOEDUCATIVA\"))"
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR SISC"
    Name ="SISC INTERNO SCFV GRUPOS"
End
Begin OutputColumns
    Expression ="[SISC INTERNO SCFV GRUPOS].NomeUsuario"
    Alias ="DNASCUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS].DNasc"
    Alias ="IDADEUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS].Idade"
    Alias ="NOMERESPONS"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].Nome"
    Alias ="PARENTESCORESPONS"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].Parentesco"
    Alias ="DNASCRESPON"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].DNasc"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].Celular"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].NIS"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].CPF"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].[CERT LIVRO/FOLHA/TERMO]"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].[TITULO/ZONA/SEÇAO]"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].[Estado Civil]"
    Expression ="[SISC INTERNO SCFV GRUPOS].TbGrupo.Grupo"
    Expression ="[SISC INTERNO SCFV GRUPOS].TbGrupo.FxEtaria"
    Expression ="[SISC INTERNO SCFV GRUPOS].TbGrupo.DiaSemana"
    Expression ="[SISC INTERNO SCFV GRUPOS].TbGrupo.Horario"
    Expression ="[SISC INTERNO SCFV GRUPOS].TbGrupo.Tipo"
    Expression ="[SISC INTERNO SCFV GRUPOS].CodFam"
    Expression ="[SISC INTERNO SCFV GRUPOS].CodOfSEDet"
    Expression ="[SISC INTERNO SCFV GRUPOS].NomeMae"
    Alias ="SexoUsuario"
    Expression ="[SISC INTERNO SCFV GRUPOS].Sexo"
    Alias ="RacaUsuario"
    Expression ="[SISC INTERNO SCFV GRUPOS].[Raça/Cor]"
    Expression ="[SISC INTERNO SCFV GRUPOS].SituaçãoUsuario"
    Alias ="MunicNascUsuario"
    Expression ="[SISC INTERNO SCFV GRUPOS].MunicNasc"
    Alias ="UfNascUsuario"
    Expression ="[SISC INTERNO SCFV GRUPOS].UFNasc"
    Alias ="nisusuario"
    Expression ="[SISC INTERNO SCFV GRUPOS].NIS"
    Alias ="cpfusuario"
    Expression ="[SISC INTERNO SCFV GRUPOS].CPF"
    Alias ="rgusuario"
    Expression ="[SISC INTERNO SCFV GRUPOS].RG"
    Alias ="oemissusuario"
    Expression ="[SISC INTERNO SCFV GRUPOS].OrgaoRG"
    Alias ="demissusuario"
    Expression ="[SISC INTERNO SCFV GRUPOS].DEmisRG"
    Alias ="endUsuario"
    Expression ="[SISC INTERNO SCFV GRUPOS].Endereço"
    Expression ="[SISC INTERNO SCFV GRUPOS].Bairro"
    Expression ="[SISC INTERNO SCFV GRUPOS].UF"
    Expression ="[SISC INTERNO SCFV GRUPOS].CEP"
    Expression ="[SISC INTERNO SCFV GRUPOS].Municipio"
    Expression ="[SISC INTERNO SCFV GRUPOS].Complemento"
    Expression ="[SISC INTERNO SCFV GRUPOS].Referencia"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR SISC"
    RightTable ="SISC INTERNO SCFV GRUPOS"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].CodFam = [SISC INTERNO SCFV GRUPOS].CodFam"
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
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR SISC].CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR SISC].Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS.TbGrupo.DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS.TbGrupo.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS.TbGrupo.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS.TbGrupo.Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS.TbGrupo.TIPO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].TbGrupo.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].TbGrupo.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].TbGrupo.DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].TbGrupo.Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].TbGrupo.Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.TbPessoa.DataCadPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.TbPessoa.Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.TbPessoa.[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.TbPessoa.MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.TbPessoa.UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR SISC].NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR SISC].[Estado Civil]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR SISC].[TITULO/ZONA/SEÇAO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].NomeUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[CS RESPONSAVEL FAMILIAR SISC].[CERT LIVRO/FOLHA/TERMO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DNASCUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="IDADEUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="rgusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NOMERESPONS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="oemissusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PARENTESCORESPONS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="demissusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DNASCRESPON"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="nisusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cpfusuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UfNascUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SexoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RacaUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MunicNascUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[Nº UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
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
        dbText "Name" ="TbUnidade.CodUnidade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CODBARRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CARGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.ENDEREÇO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.TELEFONEUNID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="municUnid"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ufUnid"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="nomeUnida"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="endUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].CodOfSEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS].MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CERT LIVRO/FOLHA/TERMO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TITULO/ZONA/SEÇAO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Estado Civil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nº UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DIRETOR(A)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DataCadPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Raça/Cor"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodUnidade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CODBARRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CARGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TELEFONEUNID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS.[SISC INTERNO SCFV].DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Volante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.CadResidencia.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =24
    Top =19
    Right =1151
    Bottom =603
    Left =-1
    Top =-1
    Right =1103
    Bottom =228
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =352
        Top =11
        Right =605
        Bottom =350
        Top =0
        Name ="CS RESPONSAVEL FAMILIAR SISC"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =250
        Bottom =249
        Top =0
        Name ="SISC INTERNO SCFV GRUPOS"
        Name =""
    End
End
