Operation =1
Option =0
Begin InputTables
    Name ="TbOfSocioEduDetalhe"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbOfSocioEduDetalhe.CodOfSEDet"
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[DNasC],Date())/365.25)"
    Expression ="TbOfSocioEduDetalhe.SituaçãoUsuario"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="TbOfSocioEduDetalhe"
    Expression ="TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome"
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
        dbText "Name" ="TbOfSocioEduDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.CodOfSEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1064
    Bottom =524
    Left =-1
    Top =-1
    Right =1040
    Bottom =254
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =245
        Top =12
        Right =424
        Bottom =272
        Top =0
        Name ="TbOfSocioEduDetalhe"
        Name =""
    End
    Begin
        Left =548
        Top =8
        Right =692
        Bottom =268
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
