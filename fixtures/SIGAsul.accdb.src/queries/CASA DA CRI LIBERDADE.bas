Operation =1
Option =0
Where ="(((TbSCFVExtDetalhe.UNIDADE)=\"CASA DA CRIANÇA LIBERDADE\"))"
Begin InputTables
    Name ="TbSCFVExtDetalhe"
    Name ="TbGrupoExterno"
End
Begin OutputColumns
    Expression ="TbSCFVExtDetalhe.CodSCFVEDet"
    Expression ="TbSCFVExtDetalhe.DATAINSCR"
    Expression ="TbGrupoExterno.NomeGrupo"
    Expression ="TbGrupoExterno.FxEtariaGr"
    Expression ="TbGrupoExterno.Turno"
    Expression ="TbSCFVExtDetalhe.UNIDADE"
    Expression ="TbSCFVExtDetalhe.Nome"
    Expression ="TbGrupoExterno.Volante"
End
Begin Joins
    LeftTable ="TbGrupoExterno"
    RightTable ="TbSCFVExtDetalhe"
    Expression ="TbGrupoExterno.CodGrupo = TbSCFVExtDetalhe.GRUPOEXT"
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
Begin
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.UNIDADE"
        dbInteger "ColumnWidth" ="3150"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.CodSCFVEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.Nome"
        dbInteger "ColumnWidth" ="4425"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DATAINSCR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.NomeGrupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.FxEtariaGr"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.Turno"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbGrupoExterno.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-79
    Top =33
    Right =1056
    Bottom =594
    Left =-1
    Top =-1
    Right =1111
    Bottom =234
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =240
        Top =0
        Name ="TbSCFVExtDetalhe"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =156
        Top =0
        Name ="TbGrupoExterno"
        Name =""
    End
End
