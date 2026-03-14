Operation =1
Option =0
Having ="(((TbSCFVExtAtualiz.DataAtual) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbSCFVExtDetalhe"
    Name ="TbSCFVExtAtualiz"
    Name ="TbPessoa"
    Name ="TbUnidade"
    Name ="TbGrupoExterno"
End
Begin OutputColumns
    Alias ="UNIDADE DE ORIGEM"
    Expression ="TbUnidade.NOME"
    Alias ="UNIDADE EXTERNA"
    Expression ="TbSCFVExtDetalhe.UNIDADE"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbSCFVExtAtualiz.DataAtual"
    Expression ="TbSCFVExtDetalhe.CodSCFVEDet"
    Expression ="TbSCFVExtDetalhe.DATAINSCR"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[DNasc],Date())/365.25)"
    Expression ="TbGrupoExterno.NomeGrupo"
    Expression ="TbGrupoExterno.FxEtariaGr"
    Expression ="TbGrupoExterno.Turno"
    Expression ="TbSCFVExtDetalhe.UNIDADE"
    Expression ="TbSCFVExtDetalhe.SituaçãoUsuario"
    Expression ="TbSCFVExtDetalhe.SituaçãoMunicipal"
    Expression ="TbSCFVExtDetalhe.DataDesl"
    Expression ="TbSCFVExtDetalhe.MotivoDesl"
    Expression ="TbSCFVExtDetalhe.UNIDADE"
End
Begin Joins
    LeftTable ="TbSCFVExtDetalhe"
    RightTable ="TbSCFVExtAtualiz"
    Expression ="TbSCFVExtDetalhe.CodSCFVEDet = TbSCFVExtAtualiz.CodSCFVEDet"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbSCFVExtDetalhe"
    Expression ="TbPessoa.CodPessoa = TbSCFVExtDetalhe.Nome"
    Flag =1
    LeftTable ="TbGrupoExterno"
    RightTable ="TbSCFVExtDetalhe"
    Expression ="TbGrupoExterno.CodGrupo = TbSCFVExtDetalhe.GRUPOEXT"
    Flag =1
End
Begin Groups
    Expression ="TbUnidade.NOME"
    GroupLevel =0
    Expression ="TbUnidade.[DIRETOR(A)]"
    GroupLevel =0
    Expression ="TbUnidade.FUNÇÃO"
    GroupLevel =0
    Expression ="TbUnidade.MATRICULA"
    GroupLevel =0
    Expression ="TbSCFVExtAtualiz.DataAtual"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.CodSCFVEDet"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.DATAINSCR"
    GroupLevel =0
    Expression ="TbPessoa.Nome"
    GroupLevel =0
    Expression ="TbPessoa.DNasc"
    GroupLevel =0
    Expression ="TbGrupoExterno.NomeGrupo"
    GroupLevel =0
    Expression ="TbGrupoExterno.FxEtariaGr"
    GroupLevel =0
    Expression ="TbGrupoExterno.Turno"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.SituaçãoUsuario"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.SituaçãoMunicipal"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.DataDesl"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.MotivoDesl"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.UNIDADE"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.UNIDADE"
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
Begin
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.TURNO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.FXETARIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.GRUPOEXT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.SituaçãoMunicipal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Nome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="4320"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.CodSCFVEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1035"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="UNIDADE DE ORIGEM"
        dbInteger "ColumnWidth" ="1590"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UNIDADE EXTERNA"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2340"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbSCFVExtAtualiz.DataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
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
        dbText "Name" ="DataAtual"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CodSCFVEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="GRUPOEXT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FXETARIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TURNO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1016"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SituaçãoMunicipal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbInteger "ColumnWidth" ="4320"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbSCFVExtDetalhe].[UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbSCFVExtAtualiz].[DataAtual]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbSCFVExtDetalhe].[CodSCFVEDet]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[FUNÇÃO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbSCFVExtDetalhe].[DataDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[LOGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[RODAPE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[MATRICULA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbSCFVExtDetalhe].[DATAINSCR]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbPessoa].[DNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbSCFVExtDetalhe].[GRUPOEXT]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbSCFVExtDetalhe].[FXETARIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbSCFVExtDetalhe].[TURNO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbSCFVExtDetalhe].[SituaçãoUsuario]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbSCFVExtDetalhe].[SituaçãoMunicipal]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbSCFVExtDetalhe].[MotivoDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.NomeGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.GRUPOEXT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.FXETARIA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.FxEtariaGr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.TURNO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbGrupoExterno].[NomeGrupo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbGrupoExterno].[FxEtariaGr]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbGrupoExterno].[Turno]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1105
    Bottom =660
    Left =-1
    Top =-1
    Right =1081
    Bottom =241
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =343
        Top =0
        Name ="TbSCFVExtDetalhe"
        Name =""
    End
    Begin
        Left =427
        Top =15
        Right =571
        Bottom =133
        Top =0
        Name ="TbSCFVExtAtualiz"
        Name =""
    End
    Begin
        Left =396
        Top =176
        Right =540
        Bottom =342
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =654
        Top =29
        Right =798
        Bottom =291
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
        Top =0
        Name ="TbGrupoExterno"
        Name =""
    End
End
