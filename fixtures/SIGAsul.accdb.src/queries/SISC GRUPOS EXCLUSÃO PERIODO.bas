Operation =1
Option =0
Where ="(((TbOfSocioEduDetalhe.DataDesl) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbOfSocioEduDetalhe"
    Name ="SISC GRUPOS GERAL"
End
Begin OutputColumns
    Expression ="TbOfSocioEduDetalhe.DataInsc"
    Expression ="TbOfSocioEduDetalhe.Nome"
    Expression ="TbOfSocioEduDetalhe.DNasPessoa"
    Expression ="TbOfSocioEduDetalhe.SituaçãoUsuario"
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    Expression ="TbOfSocioEduDetalhe.MotivoDesl"
    Expression ="TbOfSocioEduDetalhe.Encaminhado"
    Expression ="TbOfSocioEduDetalhe.Onde"
End
Begin Joins
    LeftTable ="TbOfSocioEduDetalhe"
    RightTable ="SISC GRUPOS GERAL"
    Expression ="TbOfSocioEduDetalhe.CodOfSEduc = [SISC GRUPOS GERAL].CodDiario"
    Flag =2
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
        dbText "Name" ="TbOfSocioEduDetalhe.Encaminhado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Onde"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =3
    Top =31
    Right =1216
    Bottom =636
    Left =-1
    Top =-1
    Right =1189
    Bottom =332
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =37
        Top =16
        Right =214
        Bottom =241
        Top =0
        Name ="TbOfSocioEduDetalhe"
        Name =""
    End
    Begin
        Left =318
        Top =9
        Right =620
        Bottom =313
        Top =0
        Name ="SISC GRUPOS GERAL"
        Name =""
    End
End
