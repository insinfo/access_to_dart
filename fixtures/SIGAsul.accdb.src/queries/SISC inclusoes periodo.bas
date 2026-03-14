Operation =1
Option =0
Where ="(((TbOfSocioEduDetalhe.DataInsc) Between [DATA INICIAL] And [DATA FINAL]) AND (("
    "TbPessoa.DataDesligPes) Is Null))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbOfSocioEduDetalhe"
End
Begin OutputColumns
    Expression ="TbOfSocioEduDetalhe.CodOfSEDet"
    Expression ="TbOfSocioEduDetalhe.DataInsc"
    Expression ="TbPessoa.Nome"
    Expression ="TbOfSocioEduDetalhe.DNasPessoa"
    Expression ="TbOfSocioEduDetalhe.Idade"
    Expression ="TbOfSocioEduDetalhe.SituaçãoUsuario"
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    Expression ="TbOfSocioEduDetalhe.MotivoDesl"
    Expression ="TbOfSocioEduDetalhe.Encaminhado"
    Expression ="TbOfSocioEduDetalhe.Onde"
    Expression ="TbOfSocioEduDetalhe.[Nome Respons Criança]"
    Expression ="TbOfSocioEduDetalhe.[CPF Resp]"
    Expression ="TbOfSocioEduDetalhe.[Cel Resp]"
    Expression ="TbOfSocioEduDetalhe.[Parentesco Resp]"
    Expression ="TbPessoa.DataDesligPes"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DNasPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
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
        dbText "Name" ="TbOfSocioEduDetalhe.MotivoDesl"
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
        dbText "Name" ="TbOfSocioEduDetalhe.Encaminhado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Onde"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[Nome Respons Criança]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[CPF Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[Cel Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.[Parentesco Resp]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1124
    Bottom =660
    Left =-1
    Top =-1
    Right =1056
    Bottom =362
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =213
        Bottom =323
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =304
        Top =3
        Right =499
        Bottom =358
        Top =0
        Name ="TbOfSocioEduDetalhe"
        Name =""
    End
End
