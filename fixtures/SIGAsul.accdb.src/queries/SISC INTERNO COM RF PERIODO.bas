Operation =1
Option =1
Begin InputTables
    Name ="CS RESPONSAVEL FAMILIAR SISC"
    Name ="SISC INTERNO SCFV GRUPOS POR PERIODO"
End
Begin OutputColumns
    Alias ="NOMERESPONS"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].Nome"
    Alias ="RESPONSPARENTESCO"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].Parentesco"
    Alias ="DNASCRESPONS"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].DNasc"
    Alias ="CELULARRESPON"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].Celular"
    Alias ="NISRESPONS"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].NIS"
    Alias ="CPFRESPONS"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].CPF"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbGrupo.Grupo"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbGrupo.FxEtaria"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbGrupo.DiaSemana"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbGrupo.Horario"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbGrupo.Tipo"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].CodFam"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].NomeUsuario"
    Alias ="DNASCUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].[SISC INTERNO SCFV].DNasc"
    Alias ="IDADEUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].Idade"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].NomeMae"
    Alias ="SEXUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].Sexo"
    Alias ="RACAUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].[Raça/Cor]"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].SituaçãoUsuario"
    Alias ="MUNICNASCUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].MunicNasc"
    Alias ="UFNASCUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].UFNasc"
    Alias ="NISUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].NIS"
    Alias ="CPFUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].CPF"
    Alias ="RGUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].RG"
    Alias ="OEMISSUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].OrgaoRG"
    Alias ="DEMISUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].DEmisRG"
    Alias ="ENDUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].Endereço"
    Alias ="BAIRROUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].Bairro"
    Alias ="UFUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].UF"
    Alias ="CEPUSUARIO"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].CEP"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].Municipio"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].Complemento"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].Referencia"
    Alias ="Expr2"
    Expression ="[SISC INTERNO SCFV GRUPOS POR PERIODO].MáxDeDataAtual"
End
Begin Joins
    LeftTable ="CS RESPONSAVEL FAMILIAR SISC"
    RightTable ="SISC INTERNO SCFV GRUPOS POR PERIODO"
    Expression ="[CS RESPONSAVEL FAMILIAR SISC].CodFam = [SISC INTERNO SCFV GRUPOS POR PERIODO].C"
        "odFam"
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
        dbText "Name" ="NOMERESPONS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbDiarioDet.CodDiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbGrupo.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].NomeUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbGrupo.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbGrupo.DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbGrupo.Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbGrupo.Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbDiario.CodDiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbDiario.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbDiario.Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbDiario.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbDiario.Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbDiario.DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].TbDiarioDet.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbDiario.CodDiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbDiario.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbDiarioDet.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.TbPessoa.[CERT LIVRO/FOLHA/TERMO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.TbPessoa.[TITULO/ZONA/SEÇAO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CS RESPONSAVEL FAMILIAR SISC.TbPessoa.[Estado Civil]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.SISC INTERNO SCFV.TbOfSocioEduDetalhe.CodOf"
            "SEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.SISC INTERNO SCFV.TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbDiario.Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbDiario.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbDiario.Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbDiario.DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbDiario.CodFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbDiario.NomeOficineiro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbDiarioDet.CodDiarioDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbDiarioDet.CodDiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbDiarioDet.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbGrupo.CodGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DEMISUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OEMISSUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RGUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CPFUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CPFRESPONS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NISUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NISRESPONS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UFUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BAIRROUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ENDUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RACAUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RESPONSPARENTESCO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DNASCRESPONS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CELULARRESPON"
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
        dbText "Name" ="SEXUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MUNICNASCUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UFNASCUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CEPUSUARIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC INTERNO SCFV GRUPOS POR PERIODO].MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.SISC INTERNO SCFV.TbOfSocioEduDetalhe.DataD"
            "esl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeDataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nº UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.Nome"
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
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodUnidade"
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
        dbText "Name" ="ENDEREÇO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MUNICIPIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TELEFONEUNID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.CodDiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NomeOficineiro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiario.Volante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodDiarioDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDiarioDet.CodDiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupo.Volante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbDiario.Volante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SISC INTERNO SCFV GRUPOS POR PERIODO.TbGrupo.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =10
    Top =41
    Right =1137
    Bottom =639
    Left =-1
    Top =-1
    Right =1103
    Bottom =222
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =274
        Top =0
        Name ="CS RESPONSAVEL FAMILIAR SISC"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =553
        Bottom =274
        Top =0
        Name ="SISC INTERNO SCFV GRUPOS POR PERIODO"
        Name =""
    End
End
