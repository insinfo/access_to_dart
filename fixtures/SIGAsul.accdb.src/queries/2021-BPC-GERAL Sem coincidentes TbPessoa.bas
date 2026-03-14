Operation =1
Option =0
Where ="((([2021-BPC-GERAL].CRAS) Like [DGITE O CRAS]+\"*\") AND (([2021-BPC-GERAL].NOME"
    "_CRAS)=[Nome Titular]) AND ((TbPessoa.Nome) Is Null))"
Begin InputTables
    Name ="2021-BPC-GERAL"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="[2021-BPC-GERAL].CRAS"
    Expression ="[2021-BPC-GERAL].[Nome Titular]"
    Expression ="[2021-BPC-GERAL].NOME_CRAS"
    Expression ="[2021-BPC-GERAL].[Data Nasc]"
    Expression ="[2021-BPC-GERAL].Endereco"
    Expression ="[2021-BPC-GERAL].Bairro"
    Expression ="[2021-BPC-GERAL].CEP"
    Expression ="[2021-BPC-GERAL].Mae"
    Expression ="[2021-BPC-GERAL].Situacao"
    Expression ="[2021-BPC-GERAL].[Especie Ben]"
    Expression ="[2021-BPC-GERAL].[TEM CAD]"
    Expression ="[2021-BPC-GERAL].NIS"
End
Begin Joins
    LeftTable ="2021-BPC-GERAL"
    RightTable ="TbPessoa"
    Expression ="[2021-BPC-GERAL].[Nome Titular] = TbPessoa.[Nome]"
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
        dbText "Name" ="[2021-BPC-GERAL].[Data Nasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].[NOME_CRAS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].[Nome Titular]"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1935"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].[CEP]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].[Bairro]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].[Endereco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].[Situacao]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].[Mae]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].[Especie Ben]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].[TEM CAD]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].[NIS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].[CRAS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].CRAS"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1305"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].NOME_CRAS"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1830"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].Endereco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].Mae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].Situacao"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1035"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[2021-BPC-GERAL].NIS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =649
    Bottom =660
    Left =-1
    Top =-1
    Right =625
    Bottom =218
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="2021-BPC-GERAL"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
