Operation =1
Option =0
Where ="(((TbOfSocioEduDetalhe.DataDesl) Is Null) AND ((TbOfSocioEduDetalhe.SituaçãoUsua"
    "rio)<>\"Não está em situação de prioridade\"))"
Begin InputTables
    Name ="TbOfSocioEduDetalhe"
End
Begin OutputColumns
    Expression ="TbOfSocioEduDetalhe.CodOfSEDet"
    Expression ="TbOfSocioEduDetalhe.Nome"
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    Expression ="TbOfSocioEduDetalhe.SituaçãoUsuario"
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
        dbText "Name" ="TbOfSocioEduDetalhe.CodOfSEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Nome"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-214
    Top =86
    Right =942
    Bottom =653
    Left =-1
    Top =-1
    Right =1132
    Bottom =185
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =85
        Top =14
        Right =374
        Bottom =288
        Top =0
        Name ="TbOfSocioEduDetalhe"
        Name =""
    End
End
