Operation =1
Option =0
Where ="(((TbSCFVExtDetalhe.SituaçãoUsuario)<>\"Não está em situação de prioridade\") AN"
    "D ((TbSCFVExtDetalhe.DataDesl) Is Null))"
Begin InputTables
    Name ="TbSCFVExtDetalhe"
End
Begin OutputColumns
    Expression ="TbSCFVExtDetalhe.CodSCFVEDet"
    Expression ="TbSCFVExtDetalhe.Nome"
    Expression ="TbSCFVExtDetalhe.SituaçãoUsuario"
    Expression ="TbSCFVExtDetalhe.DataDesl"
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
        dbText "Name" ="TbSCFVExtDetalhe.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.CodSCFVEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[TbSCFVExtDetalhe].[DataExcl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.[TbSCFVExtDetalhe].[SitUsuario]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.CodSCDVEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.SitUsuario"
        dbInteger "ColumnWidth" ="3450"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSCFVExtDetalhe.DataExcl"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-27
    Top =88
    Right =1129
    Bottom =655
    Left =-1
    Top =-1
    Right =1132
    Bottom =290
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =422
        Top =12
        Right =566
        Bottom =308
        Top =0
        Name ="TbSCFVExtDetalhe"
        Name =""
    End
End
