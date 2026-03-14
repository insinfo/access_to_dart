Operation =1
Option =0
Having ="(((TbSCFVExtDetalhe.DataDesl) Is Null) AND ((Int(DateDiff(\"d\",[TbPessoa].[DNas"
    "c],Date())/365.25))>=60))"
Begin InputTables
    Name ="TbSCFVExtDetalhe"
    Name ="TbPessoa"
    Name ="TbSCFVExtAtualiz"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="TbPessoa.Nome"
    Expression ="CadResidencia.CodFam"
    Expression ="TbSCFVExtDetalhe.DataDesl"
    Expression ="TbSCFVExtDetalhe.MotivoDesl"
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
    LeftTable ="TbPessoa"
    RightTable ="CadResidencia"
    Expression ="TbPessoa.CodFam = CadResidencia.CodFam"
    Flag =1
End
Begin Groups
    Expression ="TbPessoa.Nome"
    GroupLevel =0
    Expression ="CadResidencia.CodFam"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.DataDesl"
    GroupLevel =0
    Expression ="TbSCFVExtDetalhe.MotivoDesl"
    GroupLevel =0
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
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
        dbText "Name" ="TbSCFVExtDetalhe.MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbInteger "ColumnWidth" ="2895"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[CPF Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="nomeusuario"
        dbInteger "ColumnWidth" ="2895"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.UNIDADE"
        dbInteger "ColumnWidth" ="1875"
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
        dbText "Name" ="TbPessoa.MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.FXETARIA"
        dbInteger "ColumnWidth" ="1185"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.GRUPOEXT"
        dbInteger "ColumnWidth" ="2475"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.CodSCFVEDet"
        dbInteger "ColumnWidth" ="1050"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.TURNO"
        dbInteger "ColumnWidth" ="1005"
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
        dbText "Name" ="TbPessoa.OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DataDesl"
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
    Right =593
    Bottom =660
    Left =-1
    Top =-1
    Right =1339
    Bottom =235
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
    Begin
        Left =792
        Top =12
        Right =936
        Bottom =156
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
