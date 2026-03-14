Operation =1
Option =0
Where ="(((Int(DateDiff(\"d\",TbPessoa.DNasc,Date())/365.25)) Between 6 And 12) And ((Tb"
    "SCFVExtDetalhe.DataDesl) Is Null))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbGrupoExterno"
    Name ="TbSCFVExtDetalhe"
End
Begin OutputColumns
    Expression ="TbGrupoExterno.NomeGrupo"
    Expression ="TbGrupoExterno.FxEtariaGr"
    Expression ="TbGrupoExterno.Turno"
    Expression ="TbSCFVExtDetalhe.CodSCFVEDet"
    Expression ="TbSCFVExtDetalhe.UNIDADE"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Expression ="TbSCFVExtDetalhe.BPC"
    Expression ="TbSCFVExtDetalhe.PBF"
    Expression ="TbSCFVExtDetalhe.CADUNICO"
    Expression ="TbSCFVExtDetalhe.[Nome Respons Criança]"
    Expression ="TbSCFVExtDetalhe.[Cel Resp]"
    Expression ="TbSCFVExtDetalhe.[Parentesco Resp]"
    Expression ="TbSCFVExtDetalhe.DataDesl"
    Expression ="TbSCFVExtDetalhe.MotivoDesl"
End
Begin Joins
    LeftTable ="TbGrupoExterno"
    RightTable ="TbSCFVExtDetalhe"
    Expression ="TbGrupoExterno.CodGrupo = TbSCFVExtDetalhe.GRUPOEXT"
    Flag =3
    LeftTable ="TbPessoa"
    RightTable ="TbSCFVExtDetalhe"
    Expression ="TbPessoa.CodPessoa = TbSCFVExtDetalhe.Nome"
    Flag =1
End
Begin OrderBy
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Flag =0
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
        dbInteger "ColumnWidth" ="2670"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.FxEtariaGr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.Turno"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="765"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.CodSCFVEDet"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="825"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.PBF"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1155"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="900"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.BPC"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1155"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.CADUNICO"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1125"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbText "Format" ="Standard"
        dbByte "DecimalPlaces" ="1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbInteger "ColumnWidth" ="3195"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1089
    Bottom =660
    Left =-1
    Top =-1
    Right =1065
    Bottom =257
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =541
        Top =12
        Right =685
        Bottom =274
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =92
        Top =17
        Right =236
        Bottom =161
        Top =0
        Name ="TbGrupoExterno"
        Name =""
    End
    Begin
        Left =338
        Top =25
        Right =493
        Bottom =292
        Top =0
        Name ="TbSCFVExtDetalhe"
        Name =""
    End
End
