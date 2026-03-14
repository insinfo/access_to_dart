Operation =1
Option =0
Having ="(((TbSCFVExtDetalhe.DataDesl) Is Null))"
Begin InputTables
    Name ="TbSCFVExtDetalhe"
    Name ="TbPessoa"
    Name ="TbSCFVExtAtualiz"
End
Begin OutputColumns
    Expression ="TbPessoa.CodPessoa"
    Alias ="MáxDeDataAtual"
    Expression ="Max(TbSCFVExtAtualiz.DataAtual)"
    Expression ="TbPessoa.CodFam"
    Expression ="TbSCFVExtDetalhe.DATAINSCR"
    Expression ="TbSCFVExtDetalhe.CodSCFVEDet"
    Expression ="TbSCFVExtDetalhe.GRUPOEXT"
    Expression ="TbSCFVExtDetalhe.FXETARIA"
    Expression ="TbSCFVExtDetalhe.TURNO"
    Expression ="TbSCFVExtDetalhe.UNIDADE"
    Alias ="nomeusuario"
    Expression ="TbPessoa.Nome"
    Alias ="dnascusuario"
    Expression ="TbPessoa.DNasc"
    Alias ="IdadeUsuario"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Expression ="TbPessoa.Sexo"
    Expression ="TbPessoa.[Raça/Cor]"
    Expression ="TbPessoa.MunicNasc"
    Expression ="TbPessoa.UFNasc"
    Expression ="TbPessoa.RG"
    Expression ="TbPessoa.OrgaoRG"
    Expression ="TbPessoa.DEmisRG"
    Expression ="TbPessoa.NomeMae"
    Expression ="TbSCFVExtDetalhe.[Nome Respons Criança]"
    Expression ="TbSCFVExtDetalhe.[CPF Resp]"
    Expression ="TbSCFVExtDetalhe.[Cel Resp]"
    Expression ="TbSCFVExtDetalhe.[Parentesco Resp]"
    Expression ="TbSCFVExtDetalhe.SituaçãoUsuario"
    Expression ="TbSCFVExtDetalhe.DataDesl"
    Expression ="TbSCFVExtDetalhe.MotivoDesl"
    Alias ="nisusuario"
    Expression ="TbPessoa.NIS"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="TbSCFVExtDetalhe"
    Expression ="TbPessoa.CodPessoa = TbSCFVExtDetalhe.Nome"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbSCFVExtDetalhe"
    Expression ="TbPessoa.CodPessoa = TbSCFVExtDetalhe.Nome"
    Flag =1
    LeftTable ="TbSCFVExtDetalhe"
    RightTable ="TbSCFVExtAtualiz"
    Expression ="TbSCFVExtDetalhe.CodSCFVEDet = TbSCFVExtAtualiz.CodSCFVEDet"
    Flag =1
End
Begin Groups
    Expression ="TbPessoa.CodPessoa"
    GroupLevel =0
    Expression ="TbPessoa.CodFam"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.DATAINSCR"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.CodSCFVEDet"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.GRUPOEXT"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.FXETARIA"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.TURNO"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.UNIDADE"
    GroupLevel =0
    Expression ="TbPessoa.Nome"
    GroupLevel =0
    Expression ="TbPessoa.DNasc"
    GroupLevel =0
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    GroupLevel =0
    Expression ="TbPessoa.Sexo"
    GroupLevel =0
    Expression ="TbPessoa.[Raça/Cor]"
    GroupLevel =0
    Expression ="TbPessoa.MunicNasc"
    GroupLevel =0
    Expression ="TbPessoa.UFNasc"
    GroupLevel =0
    Expression ="TbPessoa.RG"
    GroupLevel =0
    Expression ="TbPessoa.OrgaoRG"
    GroupLevel =0
    Expression ="TbPessoa.DEmisRG"
    GroupLevel =0
    Expression ="TbPessoa.NomeMae"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.[Nome Respons Criança]"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.[CPF Resp]"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.[Cel Resp]"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.[Parentesco Resp]"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.SituaçãoUsuario"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.DataDesl"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.MotivoDesl"
    GroupLevel =0
    Expression ="TbPessoa.NIS"
    GroupLevel =0
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
dbMemo "OrderBy" ="[SISC SCFV EXTERNO].[nomeusuario]"
Begin
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.CodSCFVEDet"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1050"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.UNIDADE"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1875"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[CPF Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.TURNO"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1005"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.GRUPOEXT"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2475"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.FXETARIA"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1185"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="nomeusuario"
        dbInteger "ColumnWidth" ="2895"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="dnascusuario"
        dbInteger "ColumnWidth" ="1200"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="IdadeUsuario"
        dbInteger "ColumnWidth" ="1200"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeDataAtual"
        dbInteger "ColumnWidth" ="1170"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="nisusuario"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1155
    Bottom =660
    Left =-1
    Top =-1
    Right =1131
    Bottom =269
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =356
        Top =13
        Right =552
        Bottom =193
        Top =0
        Name ="TbSCFVExtDetalhe"
        Name =""
    End
    Begin
        Left =111
        Top =18
        Right =272
        Bottom =163
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =600
        Top =12
        Right =744
        Bottom =156
        Top =0
        Name ="TbSCFVExtAtualiz"
        Name =""
    End
End
