Operation =1
Option =0
Where ="(((TbOfSocioEduDetalhe.DataDesl) Is Null))"
Begin InputTables
    Name ="TbOfSocioEduDetalhe"
End
Begin OutputColumns
    Expression ="TbOfSocioEduDetalhe.CodOfSEDet"
    Expression ="TbOfSocioEduDetalhe.Volante"
    Expression ="TbOfSocioEduDetalhe.DataInsc"
    Expression ="TbOfSocioEduDetalhe.Nome"
    Expression ="TbOfSocioEduDetalhe.DNasPessoa"
    Expression ="TbOfSocioEduDetalhe.Idade"
    Expression ="TbOfSocioEduDetalhe.SituaçãoUsuario"
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    Expression ="TbOfSocioEduDetalhe.MotivoDesl"
    Expression ="TbOfSocioEduDetalhe.Encaminhado"
    Expression ="TbOfSocioEduDetalhe.Onde"
    Expression ="TbOfSocioEduDetalhe.Obs"
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
        dbText "Name" ="TbOfSocioEduDetalhe.MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.CodOfSEDet"
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
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Encaminhado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Onde"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-91
    Top =46
    Right =1108
    Bottom =666
    Left =-1
    Top =-1
    Right =1175
    Bottom =272
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =240
        Top =12
        Right =437
        Bottom =326
        Top =0
        Name ="TbOfSocioEduDetalhe"
        Name =""
    End
End
