Operation =1
Option =0
Having ="(((TbOfSocioEduDetalhe.DataDesl) Is Null) AND ((Int(DateDiff(\"d\",[TbPessoa].[D"
    "Nasc],Date())/365.25))>=60))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbOfSocioEduDetalhe"
    Name ="CadResidencia"
    Name ="TbOfSocioEduAtualiz"
End
Begin OutputColumns
    Expression ="TbPessoa.Nome"
    Expression ="CadResidencia.CodFam"
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    Expression ="TbOfSocioEduDetalhe.MotivoDesl"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbOfSocioEduDetalhe"
    Expression ="TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome"
    Flag =1
    LeftTable ="TbOfSocioEduDetalhe"
    RightTable ="TbOfSocioEduAtualiz"
    Expression ="TbOfSocioEduDetalhe.CodOfSEDet = TbOfSocioEduAtualiz.CodOfSEDet"
    Flag =1
End
Begin Groups
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    GroupLevel =0
    Expression ="TbPessoa.Nome"
    GroupLevel =0
    Expression ="CadResidencia.CodFam"
    GroupLevel =0
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    GroupLevel =0
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    GroupLevel =0
    Expression ="TbOfSocioEduDetalhe.MotivoDesl"
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
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3060"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[TbPessoa].[Nome]"
        dbInteger "ColumnWidth" ="3615"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbOfSocioEduDetalhe].[DataDesl]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1620"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.MotivoDesl"
        dbInteger "ColumnWidth" ="1890"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1402
    Bottom =685
    Left =-1
    Top =-1
    Right =1378
    Bottom =317
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =413
        Top =5
        Right =557
        Bottom =214
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =584
        Top =11
        Right =755
        Bottom =358
        Top =0
        Name ="TbOfSocioEduDetalhe"
        Name =""
    End
    Begin
        Left =236
        Top =8
        Right =380
        Bottom =270
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =821
        Top =28
        Right =965
        Bottom =172
        Top =0
        Name ="TbOfSocioEduAtualiz"
        Name =""
    End
End
